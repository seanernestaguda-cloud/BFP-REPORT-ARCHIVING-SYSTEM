<?php
session_start();
include('connection.php');
$username = $_SESSION['username'];

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$search = isset($_GET['search']) ? mysqli_real_escape_string($conn, $_GET['search']) : '';

$where_clauses[] = "deleted_at IS NULL";
$query_search = $search;
$where_sql = $where_clauses ? 'WHERE ' . implode(' AND ', $where_clauses) : '';


// Pagination for AJAX search
$per_page = 10;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int) $_GET['page'] : 1;
if ($page < 1)
    $page = 1;
$offset = ($page - 1) * $per_page;

$query = "SELECT * FROM fire_safety_inspection_certificate $where_sql ORDER BY id ASC LIMIT $per_page OFFSET $offset";
$result = mysqli_query($conn, $query);
$permits = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach ($permits as $row) {
    $required_fields = [
        $row['permit_name'],
        $row['inspection_establishment'],
        $row['owner'],
        $row['inspection_address'],
        $row['inspection_date'],
        $row['establishment_type'],
        $row['inspection_purpose'],
        $row['fire_alarms'],
        $row['fire_extinguishers'],
        $row['emergency_exits'],
        $row['sprinkler_systems'],
        $row['fire_drills'],
        $row['exit_signs'],
        $row['electrical_wiring'],
        $row['emergency_evacuations'],
        $row['inspected_by'],
        $row['contact_person'],
        $row['contact_number'],
        $row['number_of_occupants'],
        $row['nature_of_business'],
        $row['number_of_floors'],
        $row['floor_area'],
        $row['classification_of_hazards'],
        $row['building_construction'],
        $row['possible_problems'],
        $row['hazardous_materials'],
        $row['application_form'],
        $row['proof_of_ownership'],
        $row['building_plans'],
        $row['fire_safety_inspection_certificate'],
        $row['fire_safety_inspection_checklist'],
        $row['occupancy_permit'],
        $row['business_permit'],
    ];
    $is_complete = true;
    foreach ($required_fields as $field) {
        if (!isset($field) || trim($field) === '' || $field === ', , , ') {
            $is_complete = false;
            break;
        }
    }
    $status = $is_complete ? 'Complete' : 'In Progress';

    $search_fields = array(
        $row['id'],
        $row['permit_name'],
        $row['inspection_establishment'],
        $row['establishment_type'],
        $row['owner'],
        $row['inspection_purpose'],
        $row['inspection_address'],
        $row['inspection_date'],
        $row['uploader'],
        $row['department'],
        $status
    );

    $show_row = true;
    if ($query_search !== '') {
        $search_lower = strtolower($query_search);
        $match = false;
        foreach ($search_fields as $field) {
            if (strpos(strtolower((string) $field), $search_lower) !== false) {
                $match = true;
                break;
            }
        }
        if (!$match) {
            $show_row = false;
        }
    }
    if ($show_row) {
        echo '<tr id="permit-row' . htmlspecialchars($row['id']) . '">';
        echo '<td class="select-checkbox-cell" style="display:none;"><input type="checkbox" class="select-item" value="' . htmlspecialchars($row['id']) . '"></td>';
        echo '<td>' . htmlspecialchars($row['id']) . '</td>';
        echo '<td>' . htmlspecialchars($row['permit_name']) . '</td>';
        echo '<td>' . htmlspecialchars($row['inspection_establishment']) . '</td>';
        echo '<td>' . htmlspecialchars($row['establishment_type']) . '</td>';
        echo '<td>' . htmlspecialchars($row['owner']) . '</td>';
        echo '<td>' . htmlspecialchars($row['inspection_purpose']) . '</td>';
        echo '<td>' . htmlspecialchars($row['inspection_address']) . '</td>';
        echo '<td>' . htmlspecialchars($row['inspection_date']) . '</td>';
        echo '<td>' . htmlspecialchars($row['uploader']) . '</td>';
        echo '<td>' . (isset($row['department']) && trim($row['department']) !== '' ? htmlspecialchars($row['department']) : 'N/A') . '</td>';
        echo '<td>' . ($status === 'Complete' ? '<span style="color:green;">Complete</span>' : '<span style="color:orange;">In Progress</span>') . '</td>';
        echo '<td class="action-button-container">';
        echo '<button class="view-btn" onclick="window.location.href=\'view_permit.php?id=' . htmlspecialchars($row['id']) . '\'">';
        echo '<i class="fa-solid fa-eye"></i>';
        echo '</button>';
        echo '<button class="delete-btn" onclick="deletePermit(' . htmlspecialchars(json_encode($row['id'])) . ')">';
        echo '<i class="fa-solid fa-trash"></i>';
        echo '</button>';
        echo '<button class="download-btn" onclick="window.location.href=\'generate_permit.php?id=' . htmlspecialchars($row['id']) . '\'">';
        echo '<i class="fa-solid fa-download"></i>';
        echo '</button>';
        echo '</td>';
        echo '</tr>';
    }
}
mysqli_close($conn);
?>