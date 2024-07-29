<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);  // Hash the password
    include 'database.connect.php';
    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT pwd FROM users WHERE Email = ?");
    $stmt->bind_param("s", $Email);
    $stmt->execute();
    $stmt->store_result();
    $userData = $stmt->get_result()->fetch_assoc();

    if (!empty($userData) && count($userData) > 0) {
        // Verify the password
        if (password_verify($Password, $hashedPassword)) {
            echo "Login successful";
            // Redirect to the dashboard
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
