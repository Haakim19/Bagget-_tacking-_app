<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['register'])) {
        $F_name = $_POST['fname'];
        $L_name = $_POST['lname'];
        $Email = $_POST['email'];
        $Password = $_POST['password'];
        $DOB = $_POST['dob'];
        $Phone = $_POST['phone'];
        $Address = $_POST['address'];
        $User_name = $_POST['userName'];

        include 'database.connect.php';

        // Check if the username or email already exists
        $checkStmt = $conn->prepare("SELECT User_id FROM users WHERE User_name = ? OR Email = ?");
        $checkStmt->bind_param("ss", $User_name, $Email);
        $checkStmt->execute();
        $checkStmt->store_result();

        if ($checkStmt->num_rows > 0) {
            $_SESSION['message'] = "Username or Email already exists.";
            $_SESSION['msg_type'] = "error";
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
            $stmt->bind_param("sssssssss", $newUserId, $User_name, $F_name, $L_name, $DOB, $Email, $Password, $Phone, $Address);

            if ($stmt->execute()) {
                $_SESSION['message'] = "New record created successfully";
                $_SESSION['msg_type'] = "success";
            } else {
                $_SESSION['message'] = "Error: " . $stmt->error;
                $_SESSION['msg_type'] = "error";
            }

            $stmt->close();
        }

        $conn->close();
        header("Location: your_form_page.php");
        exit();
    }

    if (isset($_POST['login'])) {
        $Email = $_POST['email'];
        $Password = $_POST['password'];

        include 'database.connect.php';

        $stmt = $conn->prepare("SELECT pwd FROM users WHERE Email = ?");
        $stmt->bind_param("s", $Email);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($hashedPassword);
        $stmt->fetch();

        if ($stmt->num_rows == 1 && password_verify($Password, $hashedPassword)) {
            $_SESSION['message'] = "Login successful";
            $_SESSION['msg_type'] = "success";
            // Redirect to the dashboard or another page
            header("Location: dashboard.php");
            exit();
        } else {
            $_SESSION['message'] = "Invalid email or password.";
            $_SESSION['msg_type'] = "error";
            header("Location: your_form_page.php");
            exit();
        }

        $stmt->close();
        $conn->close();
    }
}
