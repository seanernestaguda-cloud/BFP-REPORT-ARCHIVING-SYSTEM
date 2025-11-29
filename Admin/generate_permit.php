<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: adminlogin.php");
    exit;
}

require_once('../vendor/tecnickcom/tcpdf/tcpdf.php');
require_once('../FPDF/vendor/autoload.php'); // For FPDI

use setasign\Fpdi\Tcpdf\Fpdi as PdfWithFpdi;

include('connection.php');

// Get permit ID
$permit_id = $_GET['id'] ?? null;
if (!$permit_id) {
    die("No permit ID provided.");
}

// Fetch permit data
$stmt = $conn->prepare("SELECT * FROM fire_safety_inspection_certificate WHERE id = ?");
$stmt->bind_param("i", $permit_id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
if (!$row) {
    die("Permit not found.");
}

$username = isset($_SESSION['username']) ? $_SESSION['username'] : 'unknown';
$log_stmt = $conn->prepare("INSERT INTO activity_logs (username, action, report_id, details) VALUES (?, 'download', ?, ?)");
$details = "Download: " . $row['permit_name'];
$log_stmt->bind_param('sis', $username, $permit_id, $details);
$log_stmt->execute();
$log_stmt->close();


// Create PDF
$pdf = new PdfWithFpdi('P', 'mm', 'Legal', true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Bureau of Fire Protection');
$pdf->SetTitle($row['permit_name']);
$pdf->SetMargins(15, 15, 15);
$pdf->AddPage();

// Header
$pdf->SetFont('helvetica', 'B', 20);
$pdf->Cell(0, 10, 'Fire Safety Inspection Certificate', 0, 1, 'C');

// Main info
$pdf->SetFont('helvetica', '', 12);
$html = <<<EOD
<h3>{$row['permit_name']}</h3>
<p><strong>Establishment Name:</strong> {$row['inspection_establishment']}</p>
<p><strong>Owner:</strong> {$row['owner']}</p>
<p><strong>Contact Person:</strong> {$row['contact_person']}</p>
<p><strong>Contact Number:</strong> {$row['contact_number']}</p>
<p><strong>Address:</strong> {$row['inspection_address']}</p>
<p><strong>Date of Inspection:</strong> {$row['inspection_date']}</p>
<p><strong>Establishment Type:</strong> {$row['establishment_type']}</p>
<p><strong>Purpose of Inspection:</strong> {$row['inspection_purpose']}</p>
<p><strong>Number of Occupants:</strong> {$row['number_of_occupants']}</p>
<p><strong>Nature of Business:</strong> {$row['nature_of_business']}</p>
<p><strong>Number of Floors:</strong> {$row['number_of_floors']}</p>
<p><strong>Floor Area:</strong> {$row['floor_area']}</p>
<p><strong>Classification of Hazards:</strong> {$row['classification_of_hazards']}</p>
<p><strong>Building Construction:</strong> {$row['building_construction']}</p>
<p><strong>Possible Problems during Fire:</strong> {$row['possible_problems']}</p>
<p><strong>Hazardous/Flammable Materials:</strong> {$row['hazardous_materials']}</p>
<p><strong>Inspected By:</strong> {$row['inspected_by']}</p>
EOD;
$pdf->writeHTML($html, true, false, true, false, '');

$attachments = [
    'Application Form' => $row['application_form'],
    'Proof of Ownership' => $row['proof_of_ownership'],
    'Affidavit of Undertaking' => $row['affidavit_of_undertaking'],
    'Fire Safety Inspection Checklist' => $row['fire_safety_inspection_checklist'],
    'Fire Insurance Policy' => $row['fire_insurance_policy'],
    'Occupancy Permit' => $row['occupancy_permit'],
    'Business Permit' => $row['business_permit'],
];
function importAllPdfPages($pdf, $filePath, $title) {
    try {
        if (file_exists($filePath) && strtolower(pathinfo($filePath, PATHINFO_EXTENSION)) === 'pdf') {
            $pageCount = $pdf->setSourceFile($filePath);
            for ($pageNo = 1; $pageNo <= $pageCount; $pageNo++) {
                $pdf->AddPage();
                $pdf->SetFont('helvetica', 'B', 14);
                // Only show the title on the first page
                if ($pageNo === 1) {
                    $pdf->Cell(0, 10, $title, 0, 1, 'L');
                }
                $templateId = $pdf->importPage($pageNo);
                $pdf->useTemplate($templateId);
            }
            return true;
        }
    } catch (Exception $e) {
        return false;
    }
    return false;
}

foreach ($attachments as $title => $filePath) {
    if (!empty($filePath) && file_exists($filePath)) {
        $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
        if (in_array($ext, ['jpg', 'jpeg', 'png', 'gif'])) {
            $pdf->AddPage();
            $pdf->SetFont('helvetica', 'B', 14);
            $pdf->Cell(0, 10, $title, 0, 1, 'L');
            $pdf->SetFont('helvetica', '', 12);
            $pdf->Image($filePath, '', '', 120, 90, '', '', 'T', true);
            $pdf->Ln(95);
        } elseif ($ext === 'pdf') {
            if (!importAllPdfPages($pdf, $filePath, $title)) {
                $pdf->AddPage();
                $pdf->SetFont('helvetica', 'B', 14);
                $pdf->Cell(0, 10, $title, 0, 1, 'L');
                $pdf->SetFont('helvetica', '', 12);
                $pdf->Write(0, "Cannot display PDF attachment: " . basename($filePath) . ". This PDF uses a compression method not supported by the free FPDI parser.", '', 0, '', false);
            }
        } else {
            $pdf->AddPage();
            $pdf->SetFont('helvetica', 'B', 14);
            $pdf->Cell(0, 10, $title, 0, 1, 'L');
            $pdf->SetFont('helvetica', '', 12);
            $pdf->Write(0, "Attached file: " . basename($filePath) . " (Cannot display this file type in PDF)", '', 0, '', false);
        }
    }
}
// Output PDF
$pdf->Output("Fire_Safety_Inspection_Certificate_{$permit_id}.pdf", 'D');
?>