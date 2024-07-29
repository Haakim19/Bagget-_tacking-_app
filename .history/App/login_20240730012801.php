<?php
session_start();

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Checking if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate input
    $Email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
    $Password = trim($_POST['password']);

    if (!filter_var($Email, FILTER_VALIDATE_EMAIL)) {
        echo "<script>alert('Invalid email format.'); window.location.href='login-register.php';</script>";
        exit();
    }

    include 'database.connect.php';

    // Prepare the SQL statement to prevent SQL injection
    if ($stmt = $conn->prepare("SELECT pwd FROM users WHERE Email = ?")) {
        $stmt->bind_param("s", $Email);
        $stmt->execute();
        $stmt->store_result();

        // Debugging output
        echo "Number of rows: " . $stmt->num_rows . "<br>";

        // Check if a user with that email exists
        if ($stmt->num_rows > 0) {
            // Bind result variables
            $stmt->bind_result($dbPassword);
            $stmt->fetch();

            // Debugging output
            echo "Stored password hash: " . htmlspecialchars($dbPassword) . "<br>";

            // Verify the password
            if (password_verify($Password, $dbPassword)) {
                echo "Login successful";
                // Redirect to the dashboard
                header("Location: main-dashboard.php");
                exit();
            } else {
                echo "<script>alert('Username or password is incorrect.'); window.location.href='login-register.php';</script>";
            }
        } else {
            echo "<script>alert('Username or password is incorrect.'); window.location.href='login-register.php';</script>";
        }

        $stmt->close();
    } else {
        echo "Error preparing statement: " . $conn->error;
    }

    $conn->close();
}
