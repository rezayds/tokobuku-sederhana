<?php
session_start();
require 'proses/koneksi.php';

if (isset($_SESSION['manager']) == "") {
    header('location: ../index.php');
}

$id = $_SESSION['manager'];
$query = mysqli_query($mysqli, "SELECT*FROM kasir WHERE id_kasir = '$id'");
$data = mysqli_fetch_array($query);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Manager || Toko Buku</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <nav>
            <h1 class="judul-nav">Toko Buku</h1>
            <a href="proses/logout.php?logout"><?php echo $data['nama']; ?> - Logout</a>
            <a href="pegawai.php">Data Pegawai</a>
            <a href="buku.php">Data Buku</a>
            <a href="distributor.php">Data Distributor</a>
            <a href="pasok.php">Pasok Buku</a>
            <a href="penjualan.php">Laporan Penjualan</a>
        </nav>
