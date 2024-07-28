<?php

//Checking the form is submited
//?registration form details
if ($_SERVER["REQUEST_METHODE"] == "POST") {
    $F_name = $_POST['fname'];
    $L_name = $_POST['lname'];
    $Email = $_POST['email'];
    $Password = $_POST['password'];
    $DOB = $_POST['dob'];
    $Phone = $_POST['phone'];
    $Address = $_POST['address'];
    $User_name = $_POST['userName'];
}

include 'database.connect.php';

$sql = "INSERT INTO users (User_name, Firast_name, Last_name, DOB, Email, pwd, Phone_number, Address) 
VALUES ($User_name, $F_name, $L_name, $DOB, $Email, $Password, $Phone, $Address)";

if ($conn->query($sql)  == TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
