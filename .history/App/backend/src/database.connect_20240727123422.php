<?php
//connecting to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fintrackpro";

// create conection with the database
try {
    $conn = new PDO(" mysql:host = $servername ; dbname=$dbname , $username , $password ");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

$conn = null;
