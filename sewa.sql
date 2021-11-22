-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Nov 2021 pada 12.30
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur_sewa`
--

CREATE TABLE `faktur_sewa` (
  `IDfaktur` varchar(10) NOT NULL,
  `IDpemilik` varchar(10) NOT NULL,
  `waktu` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `jumlah_jam` varchar(20) NOT NULL,
  `total_bayar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `IDjadwal` varchar(10) NOT NULL,
  `IDmember` varchar(10) NOT NULL,
  `waktu` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lapang`
--

CREATE TABLE `lapang` (
  `IDlapang` varchar(10) NOT NULL,
  `jenis_lapang` varchar(20) NOT NULL,
  `IDmember` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `IDmember` varchar(10) NOT NULL,
  `nama_member` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `no_ktp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik`
--

CREATE TABLE `pemilik` (
  `IDpemilik` varchar(10) NOT NULL,
  `IDjadwal` varchar(20) NOT NULL,
  `IDfaktur` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `registrasi`
--

CREATE TABLE `registrasi` (
  `no_ktp` varchar(20) NOT NULL,
  `IDmember` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `no_hp` int(20) NOT NULL,
  `alamat_email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `faktur_sewa`
--
ALTER TABLE `faktur_sewa`
  ADD PRIMARY KEY (`IDfaktur`),
  ADD KEY `IDpemilik` (`IDpemilik`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`IDjadwal`),
  ADD KEY `IDmember` (`IDmember`);

--
-- Indeks untuk tabel `lapang`
--
ALTER TABLE `lapang`
  ADD PRIMARY KEY (`IDlapang`),
  ADD KEY `IDmember` (`IDmember`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`IDmember`),
  ADD KEY `no_ktp` (`no_ktp`);

--
-- Indeks untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`IDpemilik`),
  ADD KEY `IDjadwal` (`IDjadwal`),
  ADD KEY `IDfaktur` (`IDfaktur`);

--
-- Indeks untuk tabel `registrasi`
--
ALTER TABLE `registrasi`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `faktur_sewa`
--
ALTER TABLE `faktur_sewa`
  ADD CONSTRAINT `faktur_sewa_ibfk_1` FOREIGN KEY (`IDpemilik`) REFERENCES `pemilik` (`IDpemilik`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`IDmember`) REFERENCES `member` (`IDmember`);

--
-- Ketidakleluasaan untuk tabel `lapang`
--
ALTER TABLE `lapang`
  ADD CONSTRAINT `lapang_ibfk_1` FOREIGN KEY (`IDmember`) REFERENCES `member` (`IDmember`);

--
-- Ketidakleluasaan untuk tabel `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`no_ktp`) REFERENCES `registrasi` (`no_ktp`);

--
-- Ketidakleluasaan untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD CONSTRAINT `pemilik_ibfk_1` FOREIGN KEY (`IDjadwal`) REFERENCES `jadwal` (`IDjadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
