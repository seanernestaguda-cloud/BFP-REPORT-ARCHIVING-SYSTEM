<?php
include('connection.php');

$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$where = '';
$params = [];
$param_types = '';

if ($search !== '') {
    $where = "WHERE barangay_name LIKE ?";
    $params[] = "%$search%";
    $param_types = 's';
}

$query = "SELECT * FROM barangays $where ORDER BY barangay_name";
$stmt = $conn->prepare($query);

if ($where) {
    $stmt->bind_param($param_types, ...$params);
}

$stmt->execute();
$result = $stmt->get_result();

while ($barangay = $result->fetch_assoc()): ?>
<tr>
    <td><?php echo htmlspecialchars($barangay['barangay_name']); ?></td>
    <td class="action-button-container">
        <form action="barangay_list.php" method="POST" style="display:flex;">
            <input type="hidden" name="barangay_id" value="<?php echo $barangay['barangay_id']; ?>">
            <button type="button" onclick="confirmDelete(<?php echo $barangay['barangay_id']; ?>)" class="delete-btn"><i class="fa-solid fa-trash"></i></button>
            <button type="button" onclick="openEditModal(<?php echo $barangay['barangay_id']; ?>, '<?php echo htmlspecialchars($barangay['barangay_name'], ENT_QUOTES); ?>')" class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></button>
        </form>
    </td>
</tr>
<?php endwhile;
$stmt->close();
$conn->close();
?>