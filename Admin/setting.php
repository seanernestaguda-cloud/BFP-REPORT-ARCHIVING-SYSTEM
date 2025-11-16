<?php
// session_start(); // Start the session

// // Check if the user is logged in as an admin
// if (!isset($_SESSION['username'])) {
//     header("Location: adminlogin.php"); // Redirect to login if not logged in
//     exit();
// }

// Include database connection
include 'connection.php';
include 'auth_check.php';

$system_name = 'BUREAU OF FIRE PROTECTION ARCHIVING SYSTEM'; // Default value
$sql = "SELECT system_name, welcome_content, logo, cover FROM system_settings WHERE id=1 LIMIT 1";
$result = $conn->query($sql);
if ($result && $row = $result->fetch_assoc()) {
    $system_name = $row['system_name'];
    $welcome_content = $row['welcome_content'];
    $logo_path = $row['logo'];
    $cover_path = $row['cover'];
} else {
    $welcome_content = '';
    $logo_path = '';
    $cover_path = '';
}

$username = $_SESSION['username'];
$sql_user = "SELECT avatar FROM users WHERE username = ? LIMIT 1";
$stmt_user = $conn->prepare($sql_user);
$stmt_user->bind_param("s", $username);
$stmt_user->execute();
$result_user = $stmt_user->get_result();
$avatar = '../avatars/default_avatar.png';
if ($result_user && $row_user = $result_user->fetch_assoc()) {
    if (!empty($row_user['avatar']) && file_exists('../avatars/' . $row_user['avatar'])) {
        $avatar = '../avatars/' . $row_user['avatar'];
    }
}
$stmt_user->close();

if ($_SERVER['REQUEST_METHOD'] === 'POST' ){

    $system_name = $_POST['system_name'] ?? '';
    $welcome_content = $_POST['content']['welcome'] ?? '';

    // Handle logo upload
    if (isset($_FILES['img']) && $_FILES['img']['error'] === UPLOAD_ERR_OK) {
        $logo_tmp = $_FILES['img']['tmp_name'];
        $logo_name = basename($_FILES['img']['name']);
        $logo_path = '../uploads/' . $logo_name;
        move_uploaded_file($logo_tmp, $logo_path);
    }

    // Handle cover upload
    if (isset($_FILES['cover']) && $_FILES['cover']['error'] === UPLOAD_ERR_OK) {
        $cover_tmp = $_FILES['cover']['tmp_name'];
        $cover_name = basename($_FILES['cover']['name']);
        $cover_path = '../uploads/' . $cover_name;
        move_uploaded_file($cover_tmp, $cover_path);
    }

    // Use previous logo/cover if not uploaded
    $sql = "UPDATE system_settings SET system_name=?, welcome_content=?, logo=?, cover=? WHERE id=1";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssss", $system_name, $welcome_content, $logo_path, $cover_path);
    $stmt->execute();
    $stmt->close();

    echo "<script>alert('Settings updated successfully!');</script>";
}

// Fetch user data from the database
$query = "SELECT id, avatar, first_name, last_name, username, department, user_type, status FROM users";
$result = mysqli_query($conn, $query);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="reportstyle.css">
    <link rel="stylesheet" href="view_report.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/fontawesome.min.css">
    <link rel="icon" type="image/png" href="../REPORT.png">
    <title> Settings </title>
</head>
<body>

<aside class="sidebar">
        <nav>
            <ul>
<li class = "archive-text"><h4><?php echo htmlspecialchars($system_name); ?></h4></li>                <li><a href="admindashboard.php"><i class="fa-solid fa-gauge"></i> <span>Dashboard</span></a></li>
                <li class = "archive-text"><p>Archives</p></li>
                <li><a href="fire_types.php"><i class="fa-solid fa-fire-flame-curved"></i><span> Causes of Fire </span></a></li>
                <li><a href="barangay_list.php"><i class="fa-solid fa-building"></i><span> Barangay List </span></a></li>
                <li><a href="archives.php"><i class="fa-solid fa-fire"></i><span> Archives </span></a></li>
            
                <li class="report-dropdown">
                    <a href="#" class="report-dropdown-toggle">
                        <i class="fa-solid fa-box-archive"></i>
                        <span>Reports</span>
                        <i class="fa-solid fa-chevron-right"></i>
                    </a>
                    <ul class="report-dropdown-content">
                        <li><a href="reports_per_barangay.php"><i class="fa-solid fa-chart-column"></i> Reports per Barangay</a></li>
                        <li><a href="monthly_reports_chart.php"><i class="fa-solid fa-chart-column"></i> Reports per Month </a></li>
                        <li><a href="year_to_year_comparison.php"><i class="fa-regular fa-calendar-days"></i> Year to Year Comparison </a></li>
                    </ul>
                </li>
                
                <li class="archive-text"><span>Maintenance</span></li>
                <li><a href="activity_logs.php"><i class="fa-solid fa-file-invoice"></i><span> Activity Logs </span></a></li>
                <li><a href="departments.php"><i class="fas fa-users"></i><span> Department List </span></a></li>
                <li><a href="manageuser.php"><i class="fas fa-users"></i><span> Manage Users </span></a></li>
                <li><a href="setting.php"><i class="fa-solid fa-gear"></i> <span>Settings</span></a></li>
            </ul>
        </nav>
    </aside>
    <div class="main-content">
   <header class="header">
    <button id="toggleSidebar" class="toggle-sidebar-btn">
        <i class="fa-solid fa-bars"></i>
    </button>
    <h2><?php echo htmlspecialchars($system_name); ?></h2>
    <div class="header-right">
        <div class="dropdown">
            <a href="#" class="user-icon" onclick="toggleProfileDropdown(event)">
                <!-- Add avatar image here -->
                <img src="<?php echo htmlspecialchars($avatar); ?>" alt="Avatar" style="width:40px;height:40px;border-radius:50%;object-fit:cover;vertical-align:middle;margin-right:0px;">
                <p><?php echo htmlspecialchars($_SESSION['username']); ?><i class="fa-solid fa-caret-down"></i></p>
            </a>
            <div id="profileDropdown" class="dropdown-content">
                <a href="myprofile.php"><i class="fa-solid fa-user"></i> View Profile</a>
                <a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </div>
        </div>
    </div>
</header>
        <br>
           <div class="card">
               <div class="form-header">
    <h3> System Information </h3>
    <hr>
    </div>
    <!--System Info Card--->
    <form method="POST" enctype="multipart/form-data">
        <div class = "form-group-container">
        <div class="form-group">
            <label for="name" class="control-label">System Name</label>
            <input type="text" class="form-control form-control-sm" name="name" id="name" value="<?php echo htmlspecialchars($system_name); ?>">
        </div>
        <div class="form-group">
            <label for="content[about_us]" class="control-label">Welcome Content</label>
<textarea type="text" class="form-control form-control-sm summernote" name="content[welcome]" id="welcome"><?php echo htmlspecialchars($welcome_content); ?></textarea>        </div>
        <div class="form-group">
            <label for="logo" class="control-label">System Logo</label>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="logo" name="img" accept="image/*">
                <label for="logo" class="custom-file-label">Choose Logo</label>
            </div>
<img id="logoPreview" src="<?php echo htmlspecialchars($logo_path); ?>" alt="Logo Preview" style="margin-top: 10px; max-width: 200px;<?php echo empty($logo_path) ? 'display:none;' : ''; ?>"/>        </div>
        <div class="form-group">
            <label for="cover" class="control-label">Cover</label>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="cover" name="cover" accept="image/*">
            </div>
<img id="coverPreview" src="<?php echo htmlspecialchars($cover_path); ?>" alt="Cover Preview" style="margin-top: 10px; max-width: 200px;<?php echo empty($cover_path) ? 'display:none;' : ''; ?>"/>        </div>
             <button class="btn btn-primary" type="submit"> Save Changes </button>
    </form>
</div>
            </section>
            </div>

</body>
</html>
<script src = "../js/reportscript.js"></script>
<script src = "../js/archivescript.js"></script>

<script>
document.querySelectorAll('.custom-file-input').forEach(input => {
    input.addEventListener('change', function() {
        const label = this.nextElementSibling; // Get the label next to the input
        const fileName = this.files.length > 0 ? this.files[0].name : 'Choose file'; // Get the file name or default text
        label.textContent = fileName; // Update the label text to the file name

        // Display the selected image
        const file = this.files[0]; // Get the selected file
        const imgPreview = this.id === 'logo' ? document.getElementById('logoPreview') : document.getElementById('coverPreview'); // Get the corresponding img element

        if (file) {
            const reader = new FileReader(); // Create a FileReader object
            reader.onload = function(e) {
                imgPreview.src = e.target.result; // Set the img src to the file's data URL
                imgPreview.style.display = 'block'; // Show the image preview
            };
            reader.readAsDataURL(file); // Read the file as a data URL
        } else {
            imgPreview.style.display = 'none'; // Hide the image if no file is selected
        }
    });
});

function toggleDropdown(event) {
            event.preventDefault(); // Prevent the default anchor behavior
            document.getElementById("profileDropdown").classList.toggle("show");
        }

        // Close the dropdown if clicked outside of it
        window.onclick = function(event) {
            if (!event.target.matches('.user-icon') && !event.target.matches('.user-icon *')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
document.addEventListener('DOMContentLoaded', () => {
    const toggles = document.querySelectorAll('.report-dropdown-toggle');

    toggles.forEach(toggle => {
        toggle.addEventListener('click', function (event) {
            event.preventDefault();
            const dropdown = this.closest('.report-dropdown');
            dropdown.classList.toggle('show');

            // Close other dropdowns
            document.querySelectorAll('.report-dropdown').forEach(item => {
                if (item !== dropdown) {
                    item.classList.remove('show');
                }
            });
        });
    });

    // Close dropdown when clicking outside
    window.addEventListener('click', event => {
        if (!event.target.closest('.report-dropdown')) {
            document.querySelectorAll('.report-dropdown').forEach(dropdown => {
                dropdown.classList.remove('show');
            });
        }
    });
});




</script>