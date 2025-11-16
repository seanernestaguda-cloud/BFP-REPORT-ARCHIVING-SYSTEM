<?php
include('connection.php');

$search = isset($_GET['search']) ? trim($_GET['search']) : '';

$query = "SELECT * FROM departments";
if ($search !== '') {
    $query .= " WHERE departments LIKE ?";
}

$query .= " ORDER BY departments ASC";
$stmt = $conn->prepare($query);

if ($search !== '') {
    $searchParam = "%{$search}%";
    $stmt->bind_param('s', $searchParam);
}

$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    ?>
    <tr>
        <td><?php echo htmlspecialchars($row['departments']); ?></td>
        <td>
            <form action="departments.php" method="POST" style="display:inline;">
                <input type="hidden" name="departments" value="<?php echo $row['departments_id']; ?>">
                <button type="button" onclick="confirmDelete(<?php echo $row['departments_id']; ?>)" class="delete-btn"><i class="fa-solid fa-trash"></i></button>
                <button type="button" onclick="openEditModal(<?php echo $row['departments_id']; ?>, '<?php echo htmlspecialchars($row['departments']); ?>')" class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></button>
            </form>
        </td>
    </tr>
    <?php
}

$stmt->close();
$conn->close();
?>