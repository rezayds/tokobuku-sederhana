<?php
session_start();
require 'proses/koneksi.php';

if (isset($_SESSION['kasir']) == "") {
    header('location: ../index.php');
}

$id = $_SESSION['kasir'];
$query = mysqli_query($mysqli, "SELECT*FROM kasir WHERE id_kasir = '$id'");
$data = mysqli_fetch_array($query);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Kasir || Toko Buku</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <nav>
            <a href="proses/logout.php?logout"><?php echo $data['nama']; ?> - Logout</a>
        </nav>
