<?php
session_start();

// Ensure the user is logged in
if (!isset($_SESSION['username'])) {
    header("Location: adminlogin.php");
    exit;
}

require_once('../vendor/tecnickcom/tcpdf/tcpdf.php'); 
require_once('../FPDF/vendor/autoload.php'); // Ensure FPDI autoload is also included


// Include namespaces for FPDI and TCPDF
use setasign\Fpdi\Fpdi;
use setasign\Fpdi\Tcpdf\Fpdi as PdfWithFpdi;

include('connection.php');

// Get the report ID from the URL
$report_id = $_GET['report_id'];

// Fetch the report data
$query = "SELECT * FROM fire_incident_reports WHERE report_id = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $report_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$report = mysqli_fetch_assoc($result);

if (!$report) {
    die("Report not found.");
}

$username = isset($_SESSION['username']) ? $_SESSION['username'] : 'unknown';
$log_stmt = $conn->prepare("INSERT INTO activity_logs (username, action, report_id, details) VALUES (?, 'download', ?, ?)");
$details = "Downloaded: " . $report['report_title'];
$log_stmt->bind_param('sis', $username, $report_id, $details);
$log_stmt->execute();
$log_stmt->close();


// Create a new PDF document using TCPDF with FPDI extension
$pdf = new PdfWithFpdi();
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Bureau of Fire Protection');
$pdf->SetTitle($report['report_title']);
$pdf->SetMargins(15, 15, 15);
$pdf->AddPage();

// Set header
$pdf->SetFont('helvetica', 'B', 20);
$pdf->Cell(0, 10, 'Fire Incident Report', 0, 1, 'C');

// Add basic information
$pdf->SetFont('helvetica', '', 12);
$html = <<<EOD
<h3>{$report['report_title']}</h3>
<p><strong>Reported By:</strong> {$report['caller_name']}</p>
<p><strong>Responding Team:</strong> {$report['responding_team']}</p>
<h4> Fire Location </h4>
<hr>
<p><strong>Establishment Name:</strong> {$report['establishment']}</p>
<p><strong>Location:</strong> {$report['street']}, {$report['purok']}, {$report['fire_location']}</p>
<h4> Time and Date </h4>
<hr>
<p><strong>Date and Time Reported:</strong> {$report['incident_date']}</p>
<p><strong>Time of Arrival:</strong> {$report['arrival_time']}</p>
<p><strong>Time of Fireout:</strong> {$report['fireout_time']}</p>
<h4> Injured/Casualties </h4>
<hr>
<p><strong>Casualties (Civilians):</strong><br> {$report['victims']}</p>
<p><strong>Casualties (Firefighters):</strong><br> {$report['firefighters']}</p>

<p><strong>Estimated Damage to Property:</strong> PHP {$report['property_damage']}</p>
<p><strong>Alarm Status:</strong> {$report['alarm_status']}</p>
<p><strong>Type of Occupancy:</strong> {$report['occupancy_type']}</p>
<p><strong>Cause of Fire:</strong> {$report['fire_types']}</p>

EOD;
$pdf->writeHTML($html, true, false, true, false, '');

// Add documentation photos
if (!empty($report['documentation_photos'])) {
    $pdf->AddPage();
    $pdf->SetFont('helvetica', 'B', 14);
    $pdf->Cell(0, 10, 'Documentation Photos', 0, 1, 'L');
    $pdf->SetFont('helvetica', '', 12);

    $photos = explode(',', $report['documentation_photos']);
    foreach ($photos as $photo) {
        if (file_exists($photo)) {
            $pdf->Image($photo, '', '', 80, 60, '', '', 'T', true);
            $pdf->Ln(70);
        }
    }
}

// Function to import PDF pages using FPDI
function importPdfPages($pdf, $filePath, $useCurrentPageForFirst = false) {
    if (file_exists($filePath) && strtolower(pathinfo($filePath, PATHINFO_EXTENSION)) === 'pdf') {
        $pageCount = $pdf->setSourceFile($filePath);
        for ($pageNo = 1; $pageNo <= $pageCount; $pageNo++) {
            $templateId = $pdf->importPage($pageNo);
            if ($pageNo == 1 && $useCurrentPageForFirst) {
                // Use the current page for the first imported page
                $pdf->useTemplate($templateId);
            } else {
                $pdf->AddPage();
                $pdf->useTemplate($templateId);
            }
        }
    } else {
        $pdf->Write(0, 'File not found or invalid format.', '', 0, '', false);
    }
}
// Import additional reports if available
$reports = [
    'Spot Investigation Report' => $report['narrative_report'] ?? '',
    'Progress Investigation Report' => $report['progress_report'] ?? '',
    'Final Investigation Report' => $report['final_investigation_report'] ?? ''
];
foreach ($reports as $title => $filePath) {
    if (!empty($filePath) && file_exists($filePath)) {
        $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
       if ($ext === 'pdf') {
            // For PDFs, import all pages (no need to add a page or title here)
            importPdfPages($pdf, $filePath);
        } else {
            $pdf->AddPage();
            $pdf->SetFont('helvetica', 'B', 14);
            $pdf->Cell(0, 10, $title, 0, 1, 'L');
            $pdf->SetFont('helvetica', '', 12);

            if (in_array($ext, ['jpg', 'jpeg', 'png', 'gif'])) {
                $pdf->Image($filePath, '', '', 120, 90, '', '', 'T', true);
                $pdf->Ln(95);
            } elseif (in_array($ext, ['txt', 'csv'])) {
                $content = file_get_contents($filePath);
                $pdf->MultiCell(0, 8, $content);
            } else {
                $pdf->Write(0, "Attached file: " . basename($filePath) . " (Cannot display this file type in PDF)", '', 0, '', false);
            }
        }
    } else {
        $pdf->AddPage();
        $pdf->Write(0, "No $title available or file not found.", '', 0, '', false);
    }
}
// Output the PDF
$pdf->Output("Fire_Incident_Report_{$report_id}.pdf", 'D');
?>
