-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2021 at 10:48 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superlaundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `id_bahan` int(11) NOT NULL,
  `nama_bahan` varchar(50) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`id_bahan`, `nama_bahan`, `tgl_pembelian`, `jumlah`, `harga`) VALUES
(6, 'Gas', '2021-09-09', 2, 400000),
(7, 'Parfum snappy', '2021-09-17', 2, 250000),
(8, 'Parfum Ocean', '2021-09-17', 5, 750000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembayaran`
--

CREATE TABLE `detail_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembayaran`
--

INSERT INTO `detail_pembayaran` (`id_pembayaran`, `id_transaksi`, `total`, `tgl_bayar`) VALUES
(1, 4, 40000, '2021-09-07'),
(2, 3, 55000, '2021-09-07'),
(3, 2, 19500, '2021-09-07'),
(4, 1, 30000, '2021-09-07'),
(5, 5, 16000, '2021-09-10'),
(6, 6, 75000, '2021-09-18'),
(7, 6, 75000, '2021-09-18');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jnsbrg` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jnsbrg`, `nama_barang`, `harga`) VALUES
(1, 'Bed Cover Kecil', 10000),
(2, 'Bed Cover Sedang', 15000),
(3, 'Bed Cover Besar', 18000),
(4, 'Sprei Kecil', 10000),
(5, 'Sprei Sedang', 12000),
(6, 'Sprei Besar', 15000),
(7, 'Selimut Tipis', 10000),
(8, 'Selimut Sedang', 15000),
(9, 'Selimut Tebal', 18000),
(10, 'Tas Kecil', 10000),
(11, 'Tas Sedang', 15000),
(12, 'Tas Besar', 15000),
(13, '-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `harga`) VALUES
(1, 'Cuci Kering (4 Hari)', 7000),
(2, 'Cuci Setrika (4 Hari)', 10000),
(4, 'Setrika (2 hari)', 13000),
(5, 'Cuci Kering (2 hari)', 10000),
(6, 'Paket Khusus', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `tgl_masuk`, `id_user`, `alamat`, `telepon`, `id_paket`, `status`) VALUES
(2, '2021-09-07', 16, 'Sikumana', '081337508770', 2, 3),
(3, '2021-09-07', 16, 'Sikumana', '081337508770', 1, 3),
(6, '2021-09-14', 19, 'Penfui', '1234567', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_nota` varchar(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `nama` varchar(250) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_jnsbrg` int(11) NOT NULL,
  `tgl_selesai` date NOT NULL,
  `total` int(11) NOT NULL,
  `pembayaran` varchar(15) NOT NULL,
  `status` varchar(50) NOT NULL,
  `Kg` int(11) NOT NULL,
  `sub_harga` int(11) NOT NULL,
  `sub_harga_jenis` int(11) DEFAULT NULL,
  `id_pesanan` int(11) DEFAULT NULL,
  `feedback` int(11) NOT NULL DEFAULT '0',
  `tanggal` int(15) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_nota`, `username`, `nama`, `telepon`, `id_paket`, `id_jnsbrg`, `tgl_selesai`, `total`, `pembayaran`, `status`, `Kg`, `sub_harga`, `sub_harga_jenis`, `id_pesanan`, `feedback`, `tanggal`, `time`) VALUES
(1, '0709210001', 'nona', 'Nona Mbura', '085238004653', 5, 1, '2021-09-09', 30000, 'DIBAYAR', 'DIAMBIL', 5, 4000, 10000, 1, 0, 1631021457, '2021-09-07 13:46:10'),
(2, '0709210002', 'melsy', 'Melsy Ndun', '12345678', 4, 13, '0000-00-00', 19500, 'DIBAYAR', 'DIAMBIL', 7, 3000, 0, 4, 0, 1631021946, '2021-09-07 13:46:03'),
(3, '0709210003', 'martin', 'Martin Talo', '081337508770', 1, 8, '0000-00-00', 55000, 'DIBAYAR', 'DIAMBIL', 8, 5000, 15000, 3, 0, 1631022013, '2021-09-07 13:45:48'),
(4, '0709210004', 'martin', 'Martin Talo', '081337508770', 2, 10, '2021-09-08', 40000, 'DIBAYAR', 'DIAMBIL', 5, 6000, 10000, 2, 0, 1631022080, '2021-09-07 13:45:39'),
(5, '0709210005', '-', 'Sofi Suy', '9876542', 4, 7, '0000-00-00', 16000, 'DIBAYAR', 'DIAMBIL', 2, 3000, 10000, NULL, 0, 1631032775, '2021-09-10 05:30:24'),
(6, '1009210006', 'reksi', 'Reksi Fanggidae', '1234567890', 4, 1, '0000-00-00', 75000, 'DIBAYAR', 'DIAMBIL', 5, 13000, 10000, 5, 0, 1631249682, '2021-09-10 05:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `telepon` varchar(14) NOT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama`, `password`, `image`, `telepon`, `alamat`, `role_id`, `is_active`) VALUES
(11, 'admin', 'Admin', '$2y$10$OIjKAGgLmbKbMOXAq2juLuHzEoYixsaStsDB5Yqq7KzULDptS.8l2', 'default.jpg', '0895341765157', 'Perumahan BTN-Kolhua Blok X1 No.33 Maulafa,Kupang', 2, 1),
(12, 'owner', 'Pemilik', '$2y$10$5nIaXqZ4XbJZIad/CDIi6u.nualD5pAoO5On2fJvyFw4YF5JizyfW', 'default.jpg', '089686255451', 'Jl. Teratai No.8 Naikolan, Kupang', 1, 1),
(13, 'kurir', 'Kurir', '$2y$10$Ql4UC/xwgK1gQ5nh1HpSCOly7TBYW5u4ngqlxL25EfqLi93b71GBa', 'default.jpg', '085754993467', 'Perumahan BTN-Kolhua Blok X1 No.33 Maulafa,Kupang\r\n', 3, 1),
(15, 'nona', 'Nona Mbura', '$2y$10$niMEB5xrAPjWsD2raFrbyO.sacRxFnpwkfbq55keCClG/Mrr4Ld8y', 'default.jpg', '085238004653', 'Perumahan BTN kolhua', 4, 1),
(16, 'martin', 'Martin Talo', '$2y$10$1WUH6Uc0.D626MKZl7neI./FKcuzuboSscVCyVcxwQpFLkDDuvq6W', 'default.jpg', '081337508770', 'Sikumana', 4, 1),
(17, 'melsy', 'Melsy Ndun', '$2y$10$6fc0fXScA.l5M3COLS4Ave/27eRe6UbZ1.M/GVVFKiAymcZxm3JgC', 'default.jpg', '12345678', 'Matani', 4, 1),
(18, 'reksi', 'Reksi Fanggidae', '$2y$10$buX/Ut37q5fvS1pn1DTPfeMR69nU0yCxi4udAR.B8.OMBnJs5KELK', 'default.jpg', '1234567890', 'sikumana', 4, 1),
(19, 'ningsi', 'Ningsi Mbura', '$2y$10$rmSA4KdstePo6oHndbrJI.T372MTwwHqvR0FNKBCgnw5/biN3iDXW', 'default.jpg', '1234567', 'Penfui', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(6, 2, 2),
(9, 3, 3),
(29, 4, 4),
(30, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Owner'),
(2, 'Admin'),
(3, 'Kurir'),
(4, 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'owner'),
(2, 'admin'),
(3, 'kurir'),
(4, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'owner', 'fa fa-home', 1),
(2, 1, 'Role & Menu Management', 'owner/rolemenu', 'fa fa-desktop', 1),
(4, 2, 'Dashboard', 'admin', 'fa fa-home', 1),
(5, 2, 'Transaksi', 'admin/transaksi', 'fa fa-dropbox', 1),
(6, 2, 'Pesanan', 'admin/pesanan', 'fa fa-motorcycle', 1),
(7, 1, 'Jenis Barang', 'owner/jenis', 'fa fa-tag', 1),
(9, 1, 'Paket', 'owner/paket', 'fa fa-archive', 1),
(10, 1, 'Pembelian Bahan', 'owner/bahan', 'fa fa-shopping-cart', 1),
(11, 3, 'Penjemputan', 'kurir/penjemputan', 'fa fa-arrow-down', 1),
(12, 3, 'Pengantaran', 'kurir/pengantaran', 'fa fa-arrow-up', 1),
(14, 1, 'Report', 'owner/report', 'fa fa-th-list', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indexes for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jnsbrg`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jnsbrg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
