-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jul 2022 pada 11.24
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bumdes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `jabatan` enum('admin','kepala_desa','ketua_bumdes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `token`, `jabatan`) VALUES
(15, 'Admin', 'admin@gmail.com', 'admin', 'admin', NULL, 'admin'),
(19, 'bumdes', 'bumdes@gmail.com', 'bumdes', 'bumdes', NULL, 'ketua_bumdes'),
(20, 'kepala desa', 'desa@gmail.com', 'desa', 'desa', NULL, 'kepala_desa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `stok_barang`) VALUES
(22, 'meja', 5000, 600),
(23, 'kursi', 1000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cafe`
--

CREATE TABLE `cafe` (
  `id_cafe` int(11) NOT NULL,
  `setoran_laba` varchar(50) NOT NULL,
  `tanggal_setor` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cafe`
--

INSERT INTO `cafe` (`id_cafe`, `setoran_laba`, `tanggal_setor`) VALUES
(15, '100000', '2022-07-26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `formulir`
--

CREATE TABLE `formulir` (
  `kode_formulir` varchar(15) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `status_pengajuan` enum('pinjaman','sewabarang') NOT NULL,
  `konfirmasi` enum('pengajuan','setuju','tolak') NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `formulir`
--

INSERT INTO `formulir` (`kode_formulir`, `nik`, `status_pengajuan`, `konfirmasi`, `create_at`) VALUES
('FORM0001', '18215', 'pinjaman', 'setuju', '2022-07-24 18:16:55'),
('FORM0002', '18215', 'sewabarang', 'pengajuan', '2022-07-24 19:00:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penduduk`
--

CREATE TABLE `penduduk` (
  `id_penduduk` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `dusun` varchar(100) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `desa` varchar(100) DEFAULT NULL,
  `agama` enum('islam','protestan','katolik','hindu','buddha','khonghucu') NOT NULL,
  `status` enum('kawin','belum kawin') NOT NULL,
  `pekerjaan` varchar(255) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penduduk`
--

INSERT INTO `penduduk` (`id_penduduk`, `nik`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `dusun`, `rt`, `rw`, `desa`, `agama`, `status`, `pekerjaan`, `telepon`) VALUES
(14, '18215000019', 'very nugraha', 'P', '1998-06-02', 'krajan', '01', '03', 'alaskandang', 'islam', 'belum kawin', 'cutting', '098654'),
(15, '18215', 'husni mubarok', 'L', '2022-07-21', 'krajan', '01', '01', 'alaskandang', 'islam', 'belum kawin', 'cutting', '098654');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id_pinjaman` int(11) NOT NULL,
  `kode_formulir` varchar(25) NOT NULL,
  `tanggal_pinjaman` date NOT NULL,
  `jumlah_pinjaman` varchar(20) DEFAULT NULL,
  `jangka_waktu` date DEFAULT NULL,
  `status_pinjaman` enum('belum','proses','selesai','tolak') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`id_pinjaman`, `kode_formulir`, `tanggal_pinjaman`, `jumlah_pinjaman`, `jangka_waktu`, `status_pinjaman`, `keterangan`, `create_at`) VALUES
(1, 'FORM0001', '2022-07-24', '1000000', '2022-10-24', 'selesai', NULL, '2022-07-24 18:16:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setoran_pinjaman`
--

CREATE TABLE `setoran_pinjaman` (
  `id_setor` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `id_pinjaman` int(11) NOT NULL,
  `tanggal_setor` date NOT NULL,
  `jumlah_setor` varchar(20) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `setoran_pinjaman`
--

INSERT INTO `setoran_pinjaman` (`id_setor`, `nik`, `id_pinjaman`, `tanggal_setor`, `jumlah_setor`, `create_at`) VALUES
(1, '18215', 1, '2022-07-24', '100000', '2022-07-24 20:10:57'),
(2, '18215', 1, '2022-07-25', '200000', '2022-07-24 20:13:05'),
(3, '18215', 1, '2022-07-27', '400000', '2022-07-24 20:13:24'),
(4, '18215', 1, '2022-07-24', '300000', '2022-07-24 20:13:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewabarang`
--

CREATE TABLE `sewabarang` (
  `id_sewa` int(11) NOT NULL,
  `kode_formulir` varchar(25) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `harga_barang` int(11) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `total_biaya` int(11) DEFAULT NULL,
  `status_pengembalian` enum('belum','sudah') NOT NULL,
  `konfirmasi` enum('sewa','batal') NOT NULL,
  `dp` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sewabarang`
--

INSERT INTO `sewabarang` (`id_sewa`, `kode_formulir`, `id_barang`, `jumlah_barang`, `harga_barang`, `tanggal_sewa`, `tanggal_pengembalian`, `total_biaya`, `status_pengembalian`, `konfirmasi`, `dp`, `keterangan`, `create_at`) VALUES
(1, 'FORM0002', 23, 100, 1000, '2022-07-24', '2022-07-30', 100000, 'sudah', 'sewa', 600000, NULL, '2022-07-25 07:37:24'),
(2, 'FORM0002', 22, 100, 5000, '2022-07-24', '2022-07-30', 500000, 'sudah', 'sewa', 600000, NULL, '2022-07-25 07:37:28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `cafe`
--
ALTER TABLE `cafe`
  ADD PRIMARY KEY (`id_cafe`);

--
-- Indeks untuk tabel `formulir`
--
ALTER TABLE `formulir`
  ADD PRIMARY KEY (`kode_formulir`),
  ADD KEY `id_penduduk` (`nik`);

--
-- Indeks untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`id_penduduk`);

--
-- Indeks untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjaman`);

--
-- Indeks untuk tabel `setoran_pinjaman`
--
ALTER TABLE `setoran_pinjaman`
  ADD PRIMARY KEY (`id_setor`),
  ADD KEY `id_penduduk` (`nik`),
  ADD KEY `id_pinjaman` (`id_pinjaman`);

--
-- Indeks untuk tabel `sewabarang`
--
ALTER TABLE `sewabarang`
  ADD PRIMARY KEY (`id_sewa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `cafe`
--
ALTER TABLE `cafe`
  MODIFY `id_cafe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id_penduduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id_pinjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `setoran_pinjaman`
--
ALTER TABLE `setoran_pinjaman`
  MODIFY `id_setor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sewabarang`
--
ALTER TABLE `sewabarang`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
