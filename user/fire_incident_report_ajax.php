<?php
include('connection.php');
include('auth_check.php');

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$search = isset($_GET['search']) ? $_GET['search'] : '';
$username = $_SESSION['username'];

$where_clauses = ["deleted_at IS NULL", "uploader = ?"];
$params = [$username];
$param_types = 's';

if (!empty($search)) {
    $where_clauses[] = "(
        report_id LIKE ? OR
        report_title LIKE ? OR
        fire_location LIKE ? OR
        establishment LIKE ? OR
        incident_date LIKE ? OR
        department LIKE ? OR
        caller_name LIKE ? OR
        responding_team LIKE ? OR
        alarm_status LIKE ? OR
        occupancy_type LIKE ? OR
        property_damage LIKE ? OR
        fire_types LIKE ?
    )";
    $search_param = '%' . $search . '%';
    // 12 columns
    $params = array_merge($params, array_fill(0, 12, $search_param));
    $param_types .= str_repeat('s', 12);
}

$where_sql = 'WHERE ' . implode(' AND ', $where_clauses);

$query = "SELECT 
    report_id, 
    report_title, 
    CONCAT(street, ', ', purok, ', ', fire_location, ', ', municipality) AS fire_location_combined, 
    incident_date, 
    establishment, 
    victims, 
    firefighters,
    property_damage, 
    fire_types, 
    uploader, 
    department,
    caller_name,
    responding_team,
    arrival_time,
    fireout_time,
    alarm_status,
    occupancy_type, documentation_photos, narrative_report, progress_report, final_investigation_report
FROM fire_incident_reports 
$where_sql
ORDER BY incident_date DESC
LIMIT 20";

$stmt = $conn->prepare($query);
$stmt->bind_param($param_types, ...$params);
$stmt->execute();
$result = $stmt->get_result();
$reports = $result->fetch_all(MYSQLI_ASSOC);
$stmt->close();
mysqli_close($conn);

if (count($reports) === 0) {
    echo '<tr><td colspan="11" style="text-align:center;">No reports found.</td></tr>';
} else {
    foreach ($reports as $row) {
        // Calculate casualties
        $victims_count = empty($row['victims']) ? 0 : substr_count($row['victims'], ',') + 1;
        $firefighters_count = empty($row['firefighters']) ? 0 : substr_count($row['firefighters'], ',') + 1;
        $casualties = $victims_count + $firefighters_count;

        // Status check
        $required_fields = [
            $row['report_title'],
            $row['caller_name'],
            $row['responding_team'],
            $row['fire_location_combined'],
            $row['incident_date'],
            $row['arrival_time'],
            $row['fireout_time'],
            $row['establishment'],
            $row['alarm_status'],
            $row['occupancy_type'],
            $row['property_damage'],
            $row['fire_types'],
            $row['documentation_photos'],
            $row['narrative_report'],
            $row['progress_report'],
            $row['final_investigation_report']
        ];
        $is_complete = true;
        foreach ($required_fields as $field) {
            if (!isset($field) || trim($field) === '' || $field === ', , , ') {
                $is_complete = false;
                break;
            }
        }
        $status = $is_complete ? '<span style="color:green;">Complete</span>' : '<span style="color:orange;">In Progress</span>';

        echo '<tr id="report-row' . htmlspecialchars($row['report_id']) . '">';
        echo '<td class="select-checkbox-cell" style="display:none;"><input type="checkbox" class="select-item" value="' . htmlspecialchars($row['report_id']) . '"></td>';
        echo '<td>' . htmlspecialchars($row['report_id']) . '</td>';
        echo '<td>' . htmlspecialchars($row['report_title']) . '</td>';
        echo '<td>' . htmlspecialchars($row['fire_location_combined']) . '</td>';
        echo '<td>' . htmlspecialchars($row['incident_date']) . '</td>';
        echo '<td>' . htmlspecialchars($row['establishment']) . '</td>';
        echo '<td>' . $casualties . '</td>';
        echo '<td>' . htmlspecialchars("₱" . $row['property_damage']) . '</td>';
        echo '<td>' . htmlspecialchars($row['fire_types']) . '</td>';
        echo '<td>' . $status . '</td>';
        echo '<td class="action-button-container">
            <button class="view-btn" onclick="window.location.href=\'view_report.php?report_id=' . htmlspecialchars($row['report_id']) . '\'">
                <i class="fa-solid fa-eye"></i>
            </button>
            <button class="delete-btn" onclick="deleteReport(' . htmlspecialchars(json_encode($row['report_id'])) . ')">
                <i class="fa-solid fa-trash"></i>
            </button>
            <button class="download-btn" onclick="window.location.href=\'generate_pdf.php?report_id=' . htmlspecialchars($row['report_id']) . '\'">
                <i class="fa-solid fa-download"></i>
            </button>
        </td>';
        echo '</tr>';
    }
}
?>