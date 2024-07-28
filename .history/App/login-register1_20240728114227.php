<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="login-register.css">
    <title>FinTrackPro-Login/Register</title>
    <style>
        .message {
            display: none;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>

<body>
    <h1 class="app-name">FinTrackPro</h1>

    <?php if (isset($_SESSION['message'])) : ?>
        <div id="popupMessage" class="message <?php echo $_SESSION['msg_type']; ?>">
            <?php
            echo $_SESSION['message'];
            unset($_SESSION['message']);
            unset($_SESSION['msg_type']);
            ?>
        </div>
    <?php endif; ?>

    <!-- register to the Website -->
    <div class="container" id="sign-up" style="display: none;">
        <h1 class="form-title">Register</h1>
        <form action="login-reggister.php" method="POST">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="fname" id="fname" placeholder="First Name" required>
                <label for="fname">First Name</label>
            </div>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="lname" id="lname" placeholder="Last Name" required>
                <label for="lname">Last Name</label>
            </div>
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="Email" required>
                <label for="email">Email</label>
            </div>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="userName" id="userName" placeholder="userName" required>
                <label for="userName">User Name</label>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            <div class="input-group">
                <i class="fa fa-calendar"></i>
                <input type="date" name="dob" id="dob" placeholder="Date of Birth" required>
                <label for="dob">Date of Birth</label>
            </div>
            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="tel" name="phone" id="phone" placeholder="Phone" required>
                <label for="phone">Phone</label>
            </div>
            <div class="input-group">
                <i class="fa fa-globe"></i>
                <input type="text" name="address" id="address" placeholder="address" required>
                <label for="address">Address</label>
            </div>
            <input type="hidden" name="register" value="1">
            <input type="submit" class="btn" value="Register">
        </form>
        <div class="links">
            <p>Already have an account?</p>
            <button id="sign-in-button" class="btn2">Login</button>
        </div>
    </div>

    <!-- Log in to the website -->
    <div class="container" id="sign-in">
        <h1 class="form-title">Login</h1>
        <form action="login-reggister.php" method="POST">
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="Email" required>
                <label for="email">Email</label>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="password" placeholder="Password" required>
                <label for="password">Password</label>
            </div>
            <input type="hidden" name="login" value="1">
            <input type="submit" class="btn" value="Login">
        </form>
        <div class="links">
            <p> Don't have an account?</p>