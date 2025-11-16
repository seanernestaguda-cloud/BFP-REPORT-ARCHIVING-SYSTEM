<?php
include('connection.php');
$per_page = 10;
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$offset = ($page - 1) * $per_page;
$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$search_sql = '';
$params = [];
$types = '';

if ($search !== '') {
    $search_sql = "WHERE username LIKE ? OR action LIKE ? OR details LIKE ? OR id LIKE ? OR report_id LIKE ?";
    $search_param = '%' . $search . '%';
    $params = [$search_param, $search_param, $search_param, $search_param, $search_param];
    $types = 'sssss';

    $query = "SELECT * FROM activity_logs $search_sql ORDER BY timestamp DESC LIMIT ? OFFSET ?";
    $params[] = $per_page;
    $params[] = $offset;
    $types .= 'ii';
    $stmt_logs = $conn->prepare($query);
    $stmt_logs->bind_param($types, ...$params);
    $stmt_logs->execute();
    $result = $stmt_logs->get_result();
    $stmt_logs->close();
} else {
    $query = "SELECT * FROM activity_logs ORDER BY timestamp DESC LIMIT $per_page OFFSET $offset";
    $result = mysqli_query($conn, $query);
}

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<tr>
            <td>' . htmlspecialchars($row['timestamp']) . '</td>
            <td>' . htmlspecialchars($row['username']) . '</td>
            <td class="' . (
                strtolower($row['action']) === 'delete' ? 'action-delete' :
                (strtolower($row['action']) === 'update' ? 'action-update' :
                (strtolower($row['action']) === 'create' ? 'action-create' :
                (strtolower($row['action']) === 'download' ? 'action-download' :
                (strtolower($row['action']) === 'restore' ? 'action-restore' : ''))))) . '">' .
                htmlspecialchars($row['action']) . '</td>
            <td>' . (!empty($row['id']) ? htmlspecialchars($row['id']) : (!empty($row['report_id']) ? htmlspecialchars($row['report_id']) : '')) . '</td>
            <td>' . htmlspecialchars($row['details']) . '</td>
        </tr>';
    }
} else {
    echo '<tr><td colspan="5" style="text-align:center;">No records found.</td></tr>';
}
?>