<?php
require 'halaman/header.php';
$query = mysqli_query($mysqli, 'SELECT*FROM kasir');
$no = 1;
?>
<div class="container center">
    <div class="search">
        <form action="pegawai.php" method="post">
            <input type="text" name="search" value="" placeholder="Masukan Nama Pegawai">
            <input type="submit" name="cari" value="Cari Pegawai">
        </form>
    </div>

    <div class="table-data">
        <table border='1' cellspacing='0'>
            <tr>
                <th>No.</th>
                <th>ID Kasir</th>
                <th>Nama</th>
                <th>Alamat</th>
                <th>Telepon</th>
                <th>Status</th>
                <th>Username</th>
                <th>Password</th>
                <th>Akses</th>
                <th colspan="2">Opsi</th>
            </tr>
            <?php

            if (isset($_POST['cari'])) {
                $search = $_POST['search'];
                $cq = mysqli_query($mysqli, "SELECT*FROM kasir WHERE nama LIKE '%$search%'");
                if (mysqli_num_rows($cq) > 0) {
                    while ($dapet = mysqli_fetch_array($cq)) {
                        ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $dapet['id_kasir']; ?></td>
                            <td><?php echo $dapet['nama']; ?></td>
                            <td><?php echo $dapet['alamat']; ?></td>
                            <td><?php echo $dapet['telepon']; ?></td>
                            <td><?php echo $dapet['status']; ?></td>
                            <td><?php echo $dapet['username']; ?></td>
                            <td><?php echo $dapet['password']; ?></td>
                            <td><?php echo $dapet['akses']; ?></td>
                            <td class="hapus"><a href="proses/hapus-pg.php?hapus=<?php echo $dapet['id_kasir'] ?>">Hapus</a></td>
                            <td class="edit"><a href="edit-pegawai.php?edit=<?php echo $dapet['id_kasir'] ?>">Edit</a></td>
                        </tr>
                        <?php
                    }
                }else {
                    echo "<tr><td colspan='11'><b>Pegawai tidak ditemukan</td></tr>";
                }
            }else {
                if (mysqli_num_rows($query) > 0) {
                    while ($fetch = mysqli_fetch_array($query)) {
                        ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $fetch['id_kasir']; ?></td>
                            <td><?php echo $fetch['nama']; ?></td>
                            <td><?php echo $fetch['alamat']; ?></td>
                            <td><?php echo $fetch['telepon']; ?></td>
                            <td><?php echo $fetch['status']; ?></td>
                            <td><?php echo $fetch['username']; ?></td>
                            <td><?php echo $fetch['password']; ?></td>
                            <td><?php echo $fetch['akses']; ?></td>
                            <td class="hapus"><a href="proses/hapus-pg.php?hapus=<?php echo $fetch['id_kasir'] ?>">Hapus</a></td>
                            <td class="edit"><a href="edit-pegawai.php?edit=<?php echo $fetch['id_kasir'] ?>">Edit</a></td>
                        </tr>
                        <?php
                    }
                }
            }
            ?>
        </table>
    </div>

    <p><a href="tambah-pegawai.php" class="tambah-baru">Tambah Pegawai Baru</a></p>
</div>



<?php require 'halaman/footer.php'; ?>
