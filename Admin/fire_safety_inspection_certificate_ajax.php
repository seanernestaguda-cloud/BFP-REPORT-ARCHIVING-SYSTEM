<?php
session_start();
include('connection.php');

$search = isset($_GET['search']) ? mysqli_real_escape_string($conn, $_GET['search']) : '';


$where = [];
$where[] = "deleted_at IS NULL";
if ($search !== '') {
    $like = "'%$search%'";
    $where[] = "(
        id LIKE $like OR
        permit_name LIKE $like OR
        inspection_establishment LIKE $like OR
        establishment_type LIKE $like OR
        owner LIKE $like OR
        inspection_purpose LIKE $like OR
        inspection_address LIKE $like OR
        inspection_date LIKE $like OR
        uploader LIKE $like OR
        department LIKE $like
    )";
}
$where_sql = $where ? 'WHERE ' . implode(' AND ', $where) : '';

$query = "SELECT * FROM fire_safety_inspection_certificate $where_sql ORDER BY id DESC LIMIT 50";
$result = mysqli_query($conn, $query);
$permits = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach ($permits as $row): ?>
<tr id="report-row<?php echo $row['id']; ?>">
    <td class="select-checkbox-cell" style="display:none;">
        <input type="checkbox" class="select-item" value="<?php echo htmlspecialchars($row['id']); ?>">
    </td>
    <td><?php echo htmlspecialchars($row['id']); ?></td>
    <td><?php echo htmlspecialchars($row['permit_name']); ?></td>
    <td><?php echo htmlspecialchars($row['inspection_establishment']); ?></td>
    <td><?php echo htmlspecialchars($row['establishment_type']); ?></td>
    <td><?php echo htmlspecialchars($row['owner']); ?></td>
    <td><?php echo htmlspecialchars($row['inspection_purpose']); ?></td>
    <td><?php echo htmlspecialchars($row['inspection_address']); ?></td>
    <td><?php echo htmlspecialchars(date("Y-m-d", strtotime($row['inspection_date']))) ?></td>
      <td><?php echo htmlspecialchars($row['uploader']); ?></td>
      <td><?php echo htmlspecialchars($row['department']); ?></td>
    <td>
        <?php
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
        echo $is_complete ? '<span style="color:green;">Complete</span>' : '<span style="color:orange;">In Progress</span>';
        ?>
    </td>
    <td class="action-button-container">
        <button class="view-btn" onclick="window.location.href='permit_details.php?id=<?php echo $row['id']; ?>'">
            <i class="fa-solid fa-eye"></i>
        </button>
        <button class="delete-btn" onclick="deletePermit(<?php echo $row['id']; ?>)">
            <i class="fa-solid fa-trash"></i>
        </button>
        <button class="download-btn" onclick="window.location.href='generate_permit.php?id=<?php echo $row['id']; ?>'">
            <i class="fa-solid fa-download"></i>
        </button>
    </td>
</tr>
<?php endforeach;
mysqli_close($conn);
?>