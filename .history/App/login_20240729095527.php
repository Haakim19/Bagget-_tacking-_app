<?php
session_start();
// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $Email = $_POST['email'];
    $Password = $_POST['password'];
}
include 'database.connect.php';
// Prepare the SQL statement to prevent SQL injection
$hashedPassword = password_hash($Password, PASSWORD_DEFAULT);
$stmt = $conn->prepare("SELECT Email,pwd  FROM users WHERE Email = ?, $hashedPassword= ?");
$stmt->bind_param("ss", $Email, $Password);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($Email, $Password);
$stmt->fetch();
if ($stmt->num_rows > 0) {
    echo "Login successful";
    // Redirect to the dashboard
    echo "successfully added";
    exit();
} else {
    echo "Error: " . $stmt->error;
}
$stmt->close();
