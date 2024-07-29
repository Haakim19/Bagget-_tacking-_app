<?php
session_start();

// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];

    include 'database.connect.php';

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT pwd FROM users WHERE Email = ?");
    $stmt->bind_param("s", $Email);
    $stmt->execute();
    $stmt->store_result();

    // Check if a user with that email exists
    if ($stmt->num_rows > 0) {
        // Bind result variables
        $stmt->bind_result($dbPassword);
        $stmt->fetch();

        // Verify the password
        if (password_verify($Password, $dbPassword)) {
            echo "Login successful";
            // Redirect to the dashboard
            header("Location: login-register.php");
            exit();
        } else {
            echo "<script>alert('Username or password is incorrect.'); window.location.href='login-register.php';</script>";
        }
    } else {
        echo "<script>alert('Username or password is incorrect.'); window.location.href='login-register.php';</script>";
    }

    $stmt->close();
    $conn->close();
}
