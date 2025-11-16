<?php
session_start();
include('connection.php');

$search = isset($_GET['search']) ? trim($_GET['search']) : '';

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
FROM fire_incident_reports ";

$params = [];
$param_types = '';

if ($search !== '') {
    $query .= "WHERE (report_id LIKE ? OR report_title LIKE ? OR fire_location LIKE ? OR establishment LIKE ?) ";
    $search_param = '%' . $search . '%';
    $params = [$search_param, $search_param, $search_param, $search_param];
    $param_types = 'ssss';
}

$query .= "ORDER BY incident_date DESC LIMIT 20";

$stmt = $conn->prepare($query);
if ($params) {
    $stmt->bind_param($param_types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()):
?>
<tr id="report-row<?php echo $row['report_id']; ?>">
    <td class="select-checkbox-cell" style="display:none;">
        <input type="checkbox" class="select-item" value="<?php echo htmlspecialchars($row['report_id']); ?>">
    </td>
    <td><?php echo htmlspecialchars($row['report_id']); ?></td>
    <td><?php echo htmlspecialchars($row['report_title']); ?></td>
    <td><?php echo htmlspecialchars($row['fire_location_combined']); ?></td>
    <td><?php echo htmlspecialchars($row['incident_date']); ?></td>
    <td><?php echo htmlspecialchars($row['establishment']); ?></td>
    <td>
        <?php
        $victims_count = empty($row['victims']) ? 0 : substr_count($row['victims'], ',') + 1;
        $firefighters_count = empty($row['firefighters']) ? 0 : substr_count($row['firefighters'], ',') + 1;
        echo $victims_count + $firefighters_count;
        ?>
    </td>
    <td><?php echo htmlspecialchars("₱" . $row['property_damage']); ?></td>
    <td><?php echo htmlspecialchars($row['fire_types']); ?></td>
    <td>
        <?php
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
        echo $is_complete ? '<span style="color:green;">Complete</span>' : '<span style="color:orange;">In Progress</span>';
        ?>
    </td>
    <td class="action-button-container">
        <button class="view-btn" onclick="window.location.href='view_report.php?report_id=<?php echo $row['report_id']; ?>'">
            <i class="fa-solid fa-eye"></i>
        </button>
        <button class="delete-btn" onclick="deleteReport(<?php echo $row['report_id']; ?>)">
            <i class="fa-solid fa-trash"></i>
        </button>
        <button class="download-btn" onclick="window.location.href='generate_pdf.php?report_id=<?php echo $row['report_id']; ?>'">
            <i class="fa-solid fa-download"></i>
        </button>
    </td>
</tr>
<?php
endwhile;
$stmt->close();
mysqli_close($conn);
?>