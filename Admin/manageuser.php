<?php
// session_start(); // Start the session

// // Check if the user is logged in as an admin
// if (!isset($_SESSION['username'])) {
//     header("Location: adminlogin.php"); // Redirect to login if not logged in
//     exit();
// }

// Include database connection
include 'connection.php';
include('auth_check.php');

$sql_settings = "SELECT system_name FROM settings LIMIT 1";
$result_settings = $conn->query($sql_settings);
$system_name = 'BUREAU OF FIRE PROTECTION ARCHIVING SYSTEM';
if ($result_settings && $row_settings = $result_settings->fetch_assoc()) {
    $system_name = $row_settings['system_name'];
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


// Fetch user data from the database
$stmt = $conn->prepare("SELECT * FROM users");
$stmt->execute();
$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="reportstyle.css">
    <link rel="stylesheet" href="modal.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/fontawesome.min.css">
    <link rel="icon" type="image/png" href="../REPORT.png">
    <title>Manage Users</title>
    <style>
        /* General styles for the action dropdown */
.action-dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-btn {
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    padding: 8px 12px;
    cursor: pointer;
    font-size: 14px;
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.dropdown-btn i {
    margin-left: 8px;
}

.action-dropdown-content {
    display: none;
    position:fixed;
    right: 0;
    background-color: #fff;
    min-width: 160px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    border-radius: 4px;
    overflow: hidden;
    border: 1px solid #ccc;
}

.action-dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display:block;
    font-size: 14px;
    border-bottom: 1px solid #f1f1f1;
}

.action-dropdown-content a:hover {
    background-color: #f1f1f1;
}

.action-dropdown-content a:last-child {
    border-bottom: none;
}

/* Show the dropdown when the button is clicked */
.action-dropdown.open .action-dropdown-content {
    display: flex;
}

/* Optional: Add hover effect for the action button */
.dropdown-btn:hover {
    background-color: #e0e0e0;
}

/* Modal background */
.confirm-delete-modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Black with transparency */
    padding-top: 60px;
}

/* Modal content */
.modal-content {
    background-color: #fff;
    margin: auto;
    padding: 20px;
    border-radius: 4px;
    width: 300px;
    text-align: center;
}

/* Close button (X) */
.close-btn {
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    position: absolute;
    top: 10px;
    right: 20px;
    cursor: pointer;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* Button styles */
.modal-buttons button {
    padding: 10px 20px;
    margin: 10px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 4px;
}
.fa-pen-to-square{
    color: #003D73;
}
.fa-trash{
    color: #bd000a;
}

         .entries-search {
                margin: 10px;
                display: flex;
                justify-content: space-between; /* Spread left and right */
                align-items: center;
                gap: 10px;
            }

            .entries-right{
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .search-input-container {
            position: relative;
            display: inline-block;
            }

            .entries-right .search-input {
                width: 220px;
                padding-left: 30px;
                background-size: 16px;
            }

            .search-input {
                width: 220px;
                padding-left: 32px;
                 padding: 5px 10px;
                font-size: 14px;
                }

          .search-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            pointer-events: none;
            }
.section-separator.full-bleed {
    height: 1px;
    background: linear-gradient(90deg, rgba(0,0,0,0.08), rgba(0,0,0,0.18), rgba(0,0,0,0.08));
    border: none;
    margin: 12px 0 20px;
    width: calc(100% + 40px); /* expand across left+right padding (2 * 20px) */
    margin-left: -20px;        /* shift left by container padding */
    box-sizing: border-box;
}
    </style>
</head>
<body>
<div class="dashboard">
   <aside class="sidebar">
        <nav>
            <ul>
                <li class = "archive-text"><h4><?php echo htmlspecialchars($system_name); ?></h4></li>                <li><a href="admindashboard.php"><i class="fa-solid fa-gauge"></i> <span>Dashboard</span></a></li>
                <li class = "archive-text"><p>Archives</p></li>
                <li><a href="fire_types.php"><i class="fa-solid fa-fire-flame-curved"></i><span> Causes of Fire </span></a></li>
                <li><a href="barangay_list.php"><i class="fa-solid fa-map-location-dot"></i><span> Barangay List </span></a></li>
                <li><a href="myarchives.php"><i class="fa-solid fa-box-archive"></i><span> My Archives </span></a></li>
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
                <a href="#" id="logoutLink"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </div>
        </div>
    </div>
</header>
    <div class = "card">
        <h3>Manage Users</h3> 
        <p> List of Users </p>
        <hr class="section-separator full-bleed">
        <div class="top-controls">
            <button onclick="window.location.href='create_manager.php'" class="create-new-button"><i class="fa-solid fa-circle-plus"></i>Create New</button>
        </div>
        <hr class="section-separator full-bleed">
            <br>
        <table class = "archive-table">
      <div class="entries-right">
  <div class="search-input-container">
    <form method="GET" style="display:inline;" id="searchForm">
      <input type="search" name="search" class="search-input" placeholder="Search..." value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
      <span class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
    </form>
  </div>
</div>
            <thead>
                <tr>
                    <th>Avatar</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>User Type</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
              <tbody id="usersTableBody">
    <?php
        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $avatar = $row['avatar'] ?: '../avatars/default_avatar.png';
                $fullName = htmlspecialchars($row['first_name'] . ' ' . $row['middle_name'] .' '. $row['last_name']);
                $username = htmlspecialchars($row['username']);
                $user_type = htmlspecialchars($row['user_type']);
                $department = htmlspecialchars($row['department']);
                $status = htmlspecialchars($row['status']);
                $userId = htmlspecialchars($row['id']);

                echo "<tr>
                    <td><img src='../avatars/$avatar' alt='Avatar' width='40' height='40' style=border-radius:100%;></td>
                    <td>$fullName</td>
                    <td>$username</td>
                    <td>$user_type</td>
                    <td>$department</td>
                    <td>$status</td>
                    <td>
                        <div class='action-dropdown'>
                            <button class='dropdown-btn' onclick=\"toggleDropdown(event, 'actionDropdown$userId')\">
                                Action <i class='fa-solid fa-caret-down'></i>
                            </button>
                            <div id='actionDropdown$userId' class='action-dropdown-content'>";
                if ($status !== 'verified') {
                    echo "<a href='verify_user.php?id=$userId'><i class='fa-solid fa-check'></i> Verify</a>";
                }

                echo "      <a href='edit_user.php?id=$userId'><i class='fa-solid fa-pen-to-square'></i> Edit</a>
                            <a href='#' onclick='confirmDelete($userId)'><i class='fas fa-trash'></i> Delete</a>
                            </div>
                        </div>
                    </td>
                </tr>";
            }
        } else {
            echo "<tr><td colspan='7'>No users found.</td></tr>";
        }
    ?>
</tbody>

        </table>
    </div>
</div>
</div>

<!-- Confirmation Modal -->
<div id="confirmDeleteModal" class="confirm-delete-modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal()">&times;</span>
        <h3> Confirm Delete </h3>
        <hr>
        <p>Are you sure you want to delete this user?</p>
            <button id="confirmDelete" class="confirm-btn">Confirm</button>
            <button class="cancel-btn" onclick="closeModal()">Cancel</button>
    </div>
</div>

<!-- Success Message Modal -->
<div id="successMessageModal" class="success-modal">
    <div class="success-modal-content">
        <h3 id="successMessageTitle" hidden></h3>
        <i class="fa-regular fa-circle-check"></i><h2 id="successMessageTitle"> Success! </h2>
        <p id="successMessageBody"></p>
    </div>
</div>

<script>
    // Toggle dropdown visibility
function toggleDropdown(event, dropdownId) {
    event.stopPropagation(); // Prevents the click event from bubbling up to the document

    // Close all other dropdowns
    let allDropdowns = document.querySelectorAll('.dropdown-content');
    allDropdowns.forEach(function(dropdown) {
        if (dropdown.id !== dropdownId) {
            dropdown.style.display = 'none'; // Close the dropdown if it's not the one clicked
        }
    });

    // Toggle the clicked dropdown
    let dropdown = document.getElementById(dropdownId);
    if (dropdown.style.display === 'block') {
        dropdown.style.display = 'none'; // Hide if already open
    } else {
        dropdown.style.display = 'block'; // Show if closed
    }
}
document.addEventListener('click', function(event) {
    const isClickInsideDropdown = event.target.closest('.dropdown');
    if (!isClickInsideDropdown) {
        // Close all open dropdowns when clicking outside
        let allDropdowns = document.querySelectorAll('.dropdown-content');
        allDropdowns.forEach(function(dropdown) {
            dropdown.style.display = 'none';
        });
    }
});

let userIdToDelete = null; // Variable to store the user ID of the user to be deleted

// Function to show the modal and set the userId to delete
function confirmDelete(userId) {
    userIdToDelete = userId; // Store the userId of the user to delete
    document.getElementById('confirmDeleteModal').style.display = 'flex'; // Show the modal
}

// Function to close the modal
function closeModal() {
    document.getElementById('confirmDeleteModal').style.display = 'none'; // Hide the modal
}

// Function to confirm deletion
document.getElementById('confirmDelete').addEventListener('click', function() {
    if (userIdToDelete !== null) {
        // Perform the deletion (redirect or AJAX request)
        window.location.href = 'delete_user.php?id=' + userIdToDelete; // Redirect to the delete action
    }
});


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
// Function to close the success message modal
function closeSuccessModal() {
    document.getElementById('successMessageModal').style.display = 'none'; // Hide the modal
}

document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('status');

    if (status) {
        const modal = document.getElementById('successMessageModal');
        const title = document.getElementById('successMessageTitle');
        const body = document.getElementById('successMessageBody');

        if (status === 'verified') {
            title.textContent = "User Verified!";
            body.textContent = "The user has been successfully verified!";
        } else if (status === 'deleted') {
            title.textContent = "User Deleted!";
            body.textContent = "The user has been successfully deleted!";
        }

        modal.style.display = 'block'; // Show the modal

        // Remove the query parameter from the URL
        window.history.replaceState({}, document.title, window.location.pathname);

        // Automatically close the modal after 2 seconds
        setTimeout(closeSuccessModal, 2000);
    }
});

document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.querySelector('.search-input');
  const usersTableBody = document.getElementById('usersTableBody');

  if (searchInput && usersTableBody) {
    let searchTimeout;
    searchInput.addEventListener('input', function() {
      clearTimeout(searchTimeout);
      searchTimeout = setTimeout(function() {
        const query = searchInput.value;
        if (query === '') {
          window.location.href = window.location.pathname + window.location.search.replace(/([?&])search=[^&]*/g, '');
        } else {
          fetch(`manageuser_ajax.php?search=${encodeURIComponent(query)}`)
            .then(response => response.text())
            .then(html => {
              usersTableBody.innerHTML = html;
            });
        }
      }, 0); // instant update
    });
  }
});

document.addEventListener('DOMContentLoaded', function() {
    // Show Confirm Logout Modal
   document.getElementById('logoutLink').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('logoutModal').style.display = 'flex';
    document.getElementById('profileDropdown').classList.remove('show'); // <-- Add this line
});

    // Handle Confirm Logout
    document.getElementById('confirmLogout').addEventListener('click', function() {
        window.location.href = 'logout.php';
    });

    // Handle Cancel Logout
    document.getElementById('cancelLogout').addEventListener('click', function() {
        document.getElementById('logoutModal').style.display = 'none';
    });
});

window.onclick = function(event) {
    // ...existing code...
    const logoutModal = document.getElementById('logoutModal');
    if (event.target === logoutModal) {
        logoutModal.style.display = 'none';
    }
};
</script>

<div id="logoutModal" class = "confirm-delete-modal">
<div class = "modal-content">   
<h3 style="margin-bottom:10px;">Confirm Logout?</h3>
<hr>
    <p style="margin-bottom:24px;">Are you sure you want to logout?</p>
    <button id="confirmLogout" class = "confirm-btn">Logout</button>
    <button id="cancelLogout" class = "cancel-btn">Cancel</button>
  </div>
</div>
</body>
</html>
<script src="../js/archivescript.js"></script>
