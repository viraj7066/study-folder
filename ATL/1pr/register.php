<?php
include('db.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $rollno = $_POST['rollno'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Check if passwords match
    if ($password !== $confirm_password) {
        echo "<script>
                alert('Passwords do not match!');
                window.location.href = 'register.html';
              </script>";
        exit();
    }

    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert into the database
    $sql = "INSERT INTO users (name, email, phone, rollno, username, password) 
            VALUES ('$name', '$email', '$phone', '$rollno', '$username', '$hashed_password')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>
                alert('Registration successful! Redirecting to login page...');
                window.location.href = 'login.html';
              </script>";
    } else {
        echo "<script>
                alert('Error: " . $conn->error . "');
                window.location.href = 'register.html';
              </script>";
    }
}
?>
