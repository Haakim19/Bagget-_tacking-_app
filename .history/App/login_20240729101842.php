<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];

    include 'database.connect.php';

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT Email, pwd FROM users WHERE Email = ?");
    $stmt->bind_param("s", $Email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($dbEmail, $dbPassword);
    $stmt->fetch();

    if ($stmt->num_rows > 0) {
        // Verify the password
        if (password_verify($Password, $dbPassword)) {
            echo "Login successful";
            // Redirect to the dashboard
            exit();
        } else {
            echo "Invalid email or password.";
        }
    } else {
        echo "sorry";
    }

    $stmt->close();
    $conn->close();
}
