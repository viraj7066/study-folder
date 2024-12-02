<?php
include('db.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Retrieve user from database
    $sql = "SELECT * FROM users WHERE username = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            echo "<script>
                    alert('Login successful!');
                    window.location.href = 'front.html';
                  </script>";
        } else {
            echo "<script>
                    alert('Incorrect password!');
                    window.location.href = 'login.html';
                  </script>";
        }
    } else {
        echo "<script>
                alert('No user found with this username!');
                window.location.href = 'login.html';
              </script>";
    }
}
?>
