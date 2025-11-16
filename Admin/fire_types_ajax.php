<?php
include('connection.php');

$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$where = '';
$params = [];
$param_types = '';

if ($search !== '') {
    $where = "WHERE fire_types LIKE ? OR description LIKE ?";
    $params[] = "%$search%";
    $params[] = "%$search%";
    $param_types = 'ss';
}

$query = "SELECT * FROM fire_types $where ORDER BY fire_types";
$stmt = $conn->prepare($query);

if ($where) {
    $stmt->bind_param($param_types, ...$params);
}

$stmt->execute();
$result = $stmt->get_result();

while ($fire_type = $result->fetch_assoc()): ?>
<tr>
    <td><?php echo htmlspecialchars($fire_type['fire_types']); ?></td>
    <td><?php echo htmlspecialchars($fire_type['description']); ?></td>
    <td class="action-button-container">
        <form action="fire_types.php" method="POST" style="display:flex;">
            <input type="hidden" name="fire_types_id" value="<?php echo $fire_type['fire_types_id']; ?>">
            <button type="button" onclick="confirmDelete(<?php echo $fire_type['fire_types_id']; ?>)" class="delete-btn"><i class="fa-solid fa-trash"></i></button>
            <button type="button" onclick="openEditModal(<?php echo $fire_type['fire_types_id']; ?>, '<?php echo htmlspecialchars($fire_type['fire_types'], ENT_QUOTES); ?>', '<?php echo htmlspecialchars($fire_type['description'], ENT_QUOTES); ?>')" class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></button>
        </form>
    </td>
</tr>
<?php endwhile;
$stmt->close();
$conn->close();
?>