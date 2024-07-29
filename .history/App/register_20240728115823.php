<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $F_name = $_POST['fname'];
    $L_name = $_POST['lname'];
    $Email = $_POST['email'];
    $Password = $_POST['password'];
    $DOB = $_POST['dob'];
    $Phone = $_POST['phone'];
    $Address = $_POST['address'];
    $User_name = $_POST['userName'];

    include 'database.connect.php';
    // Hash the password
    $hashedPassword = password_hash($Password, PASSWORD_DEFAULT);
    // Check if the username or email already exists
    $checkStmt = $conn->prepare("SELECT User_id FROM users WHERE User_name = ? OR Email = ?");
    $checkStmt->bind_param("ss", $User_name, $Email);
    $checkStmt->execute();
    $checkStmt->store_result();

    if ($checkStmt->num_rows > 0) {
        echo "Username or Email already exists.";
        $checkStmt->close();
    } else {
        $checkStmt->close();

        // Fetch the last inserted User_id
        $result = $conn->query("SELECT User_id FROM users ORDER BY User_id DESC LIMIT 1");
        $row = $result->fetch_assoc();
        $lastUserId = $row['User_id'];

        // Generate new User_id
        $newUserId = 'U' . str_pad((int)substr($lastUserId, 1) + 1, 5, '0', STR_PAD_LEFT);

        // Prepare the SQL statement to prevent SQL injection
        $stmt = $conn->prepare("INSERT INTO users (User_id, User_name, First_name, Last_name, DOB, Email, pwd, Phone_number, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssssss", $newUserId, $User_name, $F_name, $L_name, $DOB, $Email, $hashedPassword, $Phone, $Address);

        if ($stmt->execute()) {
            echo "New record created successfully";
            // Redirect to the dashboard
            echo "successfully added";
            exit();
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    }

    $conn->close();
}
