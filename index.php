<?php
session_start();
require 'proses/koneksi.php';
//Add useless comment
if (isset($_SESSION['kasir']) != "") {
    header('location: kasir/');
}elseif(isset($_SESSION['manager']) != "") {
    header('location: manager/');
}else{
    ?>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Login || Toko Buku</title>
            <link rel="stylesheet" href="style.css">
        </head>
        <body>
            <div class="center">
                <h1 class="panel">Toko Buku</h1>

                <div class=" panel-login">
                    <h2>Login</h2>
                    <form action="proses/login.php" method="post">
                        <p><input type="text" name="username" value="" placeholder="Username"></p>
                        <p><input type="password" name="password" value="" placeholder="Password"></p>
                        <p><input type="submit" name="login" value="Masuk"></p>
                    </form>
                </div>
            </div>
        </body>
    </html>
    <?php
}
?>
