-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql305.byetcluster.com
-- Waktu pembuatan: 05 Nov 2025 pada 10.32
-- Versi server: 11.4.7-MariaDB
-- Versi PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_40236604_agus_playground`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `id_pengunjung` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `isi_feedback` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ;

--
-- Dumping data untuk tabel `feedback`
--

INSERT INTO `feedback` (`id`, `id_pengunjung`, `tanggal`, `isi_feedback`, `rating`) VALUES
(1, 1, '2025-11-01', 'Tempatnya bersih dan aman.', 5),
(2, 2, '2025-11-02', 'Harga tiket lumayan mahal tapi menyenangkan.', 4),
(3, 3, '2025-11-03', 'Perlu tambah tempat duduk untuk orang tua.', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kerja`
--

CREATE TABLE `jadwal_kerja` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `shift` enum('pagi','siang','malam') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_kerja`
--

INSERT INTO `jadwal_kerja` (`id`, `id_pegawai`, `tanggal`, `shift`) VALUES
(1, 1, '2025-11-01', 'pagi'),
(2, 2, '2025-11-01', 'siang'),
(3, 3, '2025-11-01', 'pagi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_main`
--

CREATE TABLE `jadwal_main` (
  `id` int(11) NOT NULL,
  `id_pengunjung` int(11) DEFAULT NULL,
  `id_wahana` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_main`
--

INSERT INTO `jadwal_main` (`id`, `id_pengunjung`, `id_wahana`, `tanggal`, `jam_mulai`, `jam_selesai`) VALUES
(1, 1, 1, '2025-11-01', '09:00:00', '09:30:00'),
(2, 2, 2, '2025-11-02', '10:00:00', '10:45:00'),
(3, 3, 4, '2025-11-03', '11:00:00', '11:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `id_wahana` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `status` enum('dijadwalkan','selesai') DEFAULT 'dijadwalkan'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `maintenance`
--

INSERT INTO `maintenance` (`id`, `id_wahana`, `tanggal`, `deskripsi`, `status`) VALUES
(1, 4, '2025-11-05', 'Pengecekan tali dan peralatan safety', 'dijadwalkan'),
(2, 2, '2025-10-30', 'Pergantian jaring trampolin', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `jabatan`, `no_hp`, `alamat`) VALUES
(1, 'Budi Santoso', 'Kasir', '081234567890', 'Kajen'),
(2, 'Sinta Dewi', 'Operator Wahana', '082345678901', 'Wiradesa'),
(3, 'Andi Nugroho', 'Teknisi', '083456789012', 'Pekalongan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` int(11) NOT NULL,
  `nama_anak` varchar(100) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `nama_pendamping` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `nama_anak`, `umur`, `nama_pendamping`, `no_hp`, `alamat`) VALUES
(1, 'Dika', 7, 'Rina Wati', '081234567890', 'Pekalongan'),
(2, 'Nina', 6, 'Slamet', '082345678901', 'Kajen'),
(3, 'Rafi', 8, 'Agus', '083456789012', 'Wiradesa'),
(4, 'boy', 7, 'Demas', '0857888678765', 'Kesesi'),
(5, 'a', 1, 'a', '0', 'a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id` int(11) NOT NULL,
  `jenis_tiket` varchar(50) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id`, `jenis_tiket`, `harga`, `keterangan`) VALUES
(1, 'Reguler', 20000, 'Akses semua wahana kecil'),
(2, 'VIP', 35000, 'Akses semua wahana termasuk besar'),
(3, 'Promo', 15000, 'Harga khusus event');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_pengunjung` int(11) DEFAULT NULL,
  `id_tiket` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pengunjung`, `id_tiket`, `tanggal`, `jumlah`, `total`) VALUES
(1, 1, 1, '2025-11-01', 2, 40000),
(2, 2, 2, '2025-11-02', 1, 35000),
(3, 3, 3, '2025-11-03', 3, 45000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pegawai') DEFAULT 'pegawai',
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `nama_lengkap`, `created_at`) VALUES
(1, 'admin', 'admin123', 'admin', 'Administrator', '2025-11-03 11:47:41'),
(2, 'budi', 'budi123', 'pegawai', 'Budi Santoso', '2025-11-03 11:47:41'),
(3, 'sinta', 'sinta123', 'pegawai', 'Sinta Dewi', '2025-11-03 11:47:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wahana`
--

CREATE TABLE `wahana` (
  `id` int(11) NOT NULL,
  `nama_wahana` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `batas_umur` int(11) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `wahana`
--

INSERT INTO `wahana` (`id`, `nama_wahana`, `deskripsi`, `batas_umur`, `status`) VALUES
(1, 'Kereta Mini', 'Wahana kereta anak-anak', 3, 'aktif'),
(2, 'Trampolin', 'Lompatan elastis untuk anak', 5, 'aktif'),
(3, 'Rumah Balon', 'Area bermain balon besar', 3, 'aktif'),
(4, 'Flying Fox Mini', 'Flying fox untuk anak 7 tahun ke atas', 7, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal_kerja`
--
ALTER TABLE `jadwal_kerja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `jadwal_main`
--
ALTER TABLE `jadwal_main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pengunjung` (`id_pengunjung`),
  ADD KEY `id_wahana` (`id_wahana`);

--
-- Indeks untuk tabel `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wahana` (`id_wahana`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pengunjung` (`id_pengunjung`),
  ADD KEY `id_tiket` (`id_tiket`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wahana`
--
ALTER TABLE `wahana`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kerja`
--
ALTER TABLE `jadwal_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jadwal_main`
--
ALTER TABLE `jadwal_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `wahana`
--
ALTER TABLE `wahana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
