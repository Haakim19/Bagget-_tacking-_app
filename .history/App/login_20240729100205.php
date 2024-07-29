<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];

    include 'database.connect.php';
    $hashedPassword = password_hash($Password, PASSWORD_DEFAULT);
    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT Email, pwd FROM users WHERE Email = ?");
    $stmt->bind_param("s", $Email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($dbEmail, $hashedPassword);
    $stmt->fetch();

    if ($stmt->num_rows > 0) {
        // Verify the password
        if (password_verify($Password, $hashedPassword)) {
            echo "Login successful";
            // Redirect to the dashboard
            exit();
        } else {
            echo "Invalid email or password.";
        }
    } else {
        echo "Invalid email or password.";
    }

    $stmt->close();
    $conn->close();
}
