-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 14 Jun 2023 pada 08.55
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peserta_pemilu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daerah_pemilihan`
--

CREATE TABLE `daerah_pemilihan` (
  `id_daerah` int(10) NOT NULL,
  `nama_daerah` varchar(50) NOT NULL,
  `jumlah_penduduk` int(10) NOT NULL,
  `jumlah_DPT` int(10) NOT NULL,
  `jumlah_DPTb` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daerah_pemilihan`
--

INSERT INTO `daerah_pemilihan` (`id_daerah`, `nama_daerah`, `jumlah_penduduk`, `jumlah_DPT`, `jumlah_DPTb`) VALUES
(999, 'kasihan bantul', 10, 10, 10),
(1122, 'bantul', 650, 0, 0),
(12345, 'konoha', 700, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kandidat`
--

CREATE TABLE `kandidat` (
  `no_urut` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kandidat`
--

INSERT INTO `kandidat` (`no_urut`, `nama`, `alamat`, `email`) VALUES
(1, 'acil', 'bawah jembatan', 'acil@gmal.com'),
(2, 'meng', 'sembarang', 'meng@yo.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(10) NOT NULL,
  `id_daerah` int(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `setatus_memilih` varchar(20) NOT NULL,
  `daftar_pemilih` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `id_daerah`, `Nama`, `password`, `jenis_kelamin`, `setatus_memilih`, `daftar_pemilih`) VALUES
(1, 999, 'az', 'd41d8cd98f00b204e9800998ecf8427e', 'Laki-laki', 'belum memilih', 'DPT'),
(332, 12345, 'baim', 'd41d8cd98f00b204e9800998ecf8427e', 'Laki-laki', 'belum memilih', 'DPT'),
(333, 1122, 'mmm', 'd41d8cd98f00b204e9800998ecf8427e', 'Laki-laki', 'belum memilih', 'DPT'),
(12345, 12345, 'naruto', '827ccb0eea8a706c4c34a16891f84e7b', 'perempuan', 'sudah memilih', 'DPT'),
(12345678, 1122, 'azaz', 'd41d8cd98f00b204e9800998ecf8427e', 'Laki-laki', 'belum memilih', 'DPTb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `TPS`
--

CREATE TABLE `TPS` (
  `id_TPS` int(10) NOT NULL,
  `id_daerah` int(10) NOT NULL,
  `no_urut` int(10) NOT NULL,
  `id_peserta` int(10) NOT NULL,
  `jumlah_suara` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `TPS`
--

INSERT INTO `TPS` (`id_TPS`, `id_daerah`, `no_urut`, `id_peserta`, `jumlah_suara`) VALUES
(1, 1122, 1, 12345, 1),
(2, 1122, 1, 333, 12);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daerah_pemilihan`
--
ALTER TABLE `daerah_pemilihan`
  ADD PRIMARY KEY (`id_daerah`);

--
-- Indeks untuk tabel `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`no_urut`),
  ADD KEY `alamat` (`alamat`(768));

--
-- Indeks untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_daerah` (`id_daerah`);

--
-- Indeks untuk tabel `TPS`
--
ALTER TABLE `TPS`
  ADD PRIMARY KEY (`id_TPS`),
  ADD KEY `id_peserta` (`id_peserta`),
  ADD KEY `no_urut` (`no_urut`),
  ADD KEY `id_daerah` (`id_daerah`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `no_urut` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`id_daerah`) REFERENCES `daerah_pemilihan` (`id_daerah`);

--
-- Ketidakleluasaan untuk tabel `TPS`
--
ALTER TABLE `TPS`
  ADD CONSTRAINT `tps_ibfk_4` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  ADD CONSTRAINT `tps_ibfk_5` FOREIGN KEY (`no_urut`) REFERENCES `kandidat` (`no_urut`),
  ADD CONSTRAINT `tps_ibfk_6` FOREIGN KEY (`id_daerah`) REFERENCES `daerah_pemilihan` (`id_daerah`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
