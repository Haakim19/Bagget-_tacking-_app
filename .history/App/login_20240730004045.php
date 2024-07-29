<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];
    $hashedPassword = password_hash ($password, PASSWORD_DEFAULT);  // Hash the password
    include 'database.connect.php';
    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT pwd FROM users WHERE Email = ?");
    $stmt->bind_param("s", $Email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result();
    $stmt->fetch_assoc();

    if ($stmt->num_rows > 0) {
        // Verify the password
        if (password_verify($Password, $dbPassword)) {
            echo "Login successful";
            // Redirect to the dashboard
            exit();
        } else {
            echo "Invalid password.";
        }
    }