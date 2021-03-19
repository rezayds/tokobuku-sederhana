-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2019 at 03:27 PM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_webkasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(6) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `noisbn` varchar(25) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun` int(4) NOT NULL,
  `stok` int(12) NOT NULL,
  `harga_pokok` int(12) NOT NULL,
  `harga_jual` int(12) NOT NULL,
  `ppn` int(4) NOT NULL,
  `diskon` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `noisbn`, `penulis`, `penerbit`, `tahun`, `stok`, `harga_pokok`, `harga_jual`, `ppn`, `diskon`) VALUES
('BK0001', 'SBMPTN SMA SAINTEK', '0009911', 'Hartano', 'Erlangga', 2017, 23, 85000, 100000, 2, 5),
('BK0002', 'SBMPTN SMA SOSHUM', '0009912', 'Jumadi', 'Erlangga', 2017, 0, 90000, 120000, 2, 20),
('BK0003', 'UN SMP', '00009921', 'Reza', 'Yudhistira', 2016, 38, 120000, 140000, 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` varchar(6) NOT NULL,
  `nama_distributor` varchar(100) NOT NULL,
  `alamat` longtext NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `alamat`, `telepon`) VALUES
('DIS001', 'PT. Jaya Abadi', 'Jl. Pesanggrahan, Jakarta', '021 7762820'),
('DIS002', 'PT. Buku Bagus', 'Jl. Pajajaran, Jakarta', '021 978532'),
('DIS003', 'PT. Ilmu Cahaya', 'Tangerang', '021 767920');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` longtext NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `status` varchar(25) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `akses` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama`, `alamat`, `telepon`, `status`, `username`, `password`, `akses`) VALUES
('TBKS01', 'Yudhistira', 'Rangkapan Jaya, Pancoran Mas, Depok', '087888256503', 'Magang', 'kasir1', 'kasir1', 'Kasir'),
('TBMG01', 'Reza', 'Depok', '087882268322', 'Pegawai Tetap', 'admin1', 'admin1', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `pasok`
--

CREATE TABLE `pasok` (
  `id_pasok` int(6) NOT NULL,
  `id_distributor` varchar(6) NOT NULL,
  `id_buku` varchar(6) NOT NULL,
  `jumlah` int(12) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasok`
--

INSERT INTO `pasok` (`id_pasok`, `id_distributor`, `id_buku`, `jumlah`, `tanggal`) VALUES
(7, 'DIS001', 'BK0002', 5, '2017-02-21'),
(8, 'DIS001', 'BK0001', 5, '2017-02-21'),
(9, 'DIS001', 'BK0003', 30, '2017-02-22'),
(10, 'DIS003', 'BK0003', 5, '2017-02-22'),
(11, 'DIS001', 'BK0001', 10, '2017-02-22');

--
-- Triggers `pasok`
--
DELIMITER $$
CREATE TRIGGER `pasokBuku` AFTER INSERT ON `pasok` FOR EACH ROW BEGIN

UPDATE buku SET stok = stok + NEW.jumlah

WHERE id_buku = NEW.id_buku;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(6) NOT NULL,
  `id_buku` varchar(6) NOT NULL,
  `id_kasir` varchar(6) NOT NULL,
  `jumlah` int(12) NOT NULL,
  `total` int(20) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_buku`, `id_kasir`, `jumlah`, `total`, `tanggal`) VALUES
(3, 'BK0002', 'TBKS01', 2, 196800, '2017-02-22'),
(4, 'BK0002', 'TBKS01', 5, 492000, '2017-02-22'),
(5, 'BK0003', 'TBKS01', 2, 238000, '2017-02-22'),
(6, 'BK0003', 'TBKS01', 1, 119000, '2017-02-22'),
(7, 'BK0002', 'TBKS01', 4, 393600, '2017-02-22'),
(8, 'BK0002', 'TBKS01', 2, 196800, '2017-02-22'),
(9, 'BK0001', 'TBKS01', 1, 97000, '2017-02-22'),
(10, 'BK0003', 'TBKS01', 1, 119000, '2017-02-22'),
(11, 'BK0001', 'TBKS01', 4, 388000, '2017-02-22'),
(12, 'BK0002', 'TBKS01', 6, 590400, '2017-02-22'),
(13, 'BK0003', 'TBKS01', 1, 119000, '2017-02-01'),
(14, 'BK0001', 'TBKS01', 2, 194000, '2017-02-22'),
(15, 'BK0002', 'TBKS01', 2, 196800, '2017-02-22'),
(16, 'BK0003', 'TBKS01', 12, 1428000, '2019-03-10');

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `kurangStok` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN

UPDATE buku SET stok = stok - NEW.jumlah

WHERE id_buku = NEW.id_buku;

END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `pasok`
--
ALTER TABLE `pasok`
  ADD PRIMARY KEY (`id_pasok`),
  ADD KEY `id_distributor` (`id_distributor`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pasok`
--
ALTER TABLE `pasok`
  MODIFY `id_pasok` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasok`
--
ALTER TABLE `pasok`
  ADD CONSTRAINT `pasok_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasok_ibfk_2` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
