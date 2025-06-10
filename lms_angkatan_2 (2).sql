-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2025 pada 10.04
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms_angkatan_2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `education` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instructors`
--

INSERT INTO `instructors` (`id`, `name`, `gender`, `education`, `phone`, `email`, `Password`, `address`, `created_at`, `updated_at`) VALUES
(2, 'Muhammad Siddiq', 1, 'Universitas Indraprasta PGRI', '089684758768', 'sidiksadar11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jl. TB. Simatupang, RT.011, RW.002, KEL. Susukan, KEC. Ciracas, Jakarta Timur, Kode Pos. 13750. ', '2025-06-04 04:52:06', '2025-06-06 09:49:17'),
(6, 'Riyan Perdana Putra', 1, 'Universitas Indraprasta PGRI', '089737337890', 'riyan@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'JL. Masjid ', '2025-06-06 09:50:13', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `instructor_majors`
--

CREATE TABLE `instructor_majors` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instructor_majors`
--

INSERT INTO `instructor_majors` (`id`, `id_major`, `id_instructor`, `created_at`, `updated_at`) VALUES
(47, 22, 1, '2025-06-05 02:25:58', NULL),
(51, 21, 1, '2025-06-05 07:35:19', NULL),
(52, 41, 2, '2025-06-06 09:50:27', NULL),
(53, 40, 2, '2025-06-06 09:50:44', '2025-06-06 09:50:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(25, 'Akutansi Junior', '2025-06-06 09:42:07', NULL),
(26, 'Barista', '2025-06-06 09:42:27', NULL),
(27, 'Digital Marketing', '2025-06-06 09:42:41', NULL),
(28, 'Bahasa Inggris', '2025-06-06 09:44:02', NULL),
(29, 'Content Creator', '2025-06-06 09:44:20', NULL),
(30, 'Desain Grafis Madya', '2025-06-06 09:44:35', NULL),
(31, 'Teknisi Jaringan', '2025-06-06 09:44:49', NULL),
(32, 'Make Up Artist', '2025-06-06 09:45:04', NULL),
(33, 'Data Management Staff', '2025-06-06 09:45:17', NULL),
(34, 'Tata Boga', '2025-06-06 09:45:26', NULL),
(35, 'Tata Busana', '2025-06-06 09:45:35', NULL),
(36, 'Perhotelan', '2025-06-06 09:46:06', NULL),
(37, 'Kontruksi Bangunan dengan CAD', '2025-06-06 09:46:19', NULL),
(38, 'Teknisi Komputer', '2025-06-06 09:46:35', NULL),
(39, 'Desain Multimedia', '2025-06-06 09:46:52', NULL),
(40, 'Web Programming', '2025-06-06 09:47:02', NULL),
(41, 'Mobile Programming', '2025-06-06 09:47:24', NULL),
(42, 'Bahasa Korea', '2025-06-06 09:47:34', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls`
--

CREATE TABLE `moduls` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `moduls`
--

INSERT INTO `moduls` (`id`, `id_major`, `id_instructor`, `name`, `created_at`, `updated_at`) VALUES
(8, 40, 2, 'Materi Pertemuan 1 - php dasar', '2025-06-10 04:19:12', NULL),
(9, 40, 2, 'sodik', '2025-06-10 04:38:21', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls_details`
--

CREATE TABLE `moduls_details` (
  `id` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `moduls_details`
--

INSERT INTO `moduls_details` (`id`, `id_modul`, `file`, `created_at`, `updated_at`) VALUES
(4, 8, '6847b24073e9e-dash_kasir.php', '2025-06-10 04:19:12', NULL),
(5, 9, '6847b6bda3875-836519_08305325082013_jokowi_metal.jpg', '2025-06-10 04:38:21', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Instuktur', '2025-06-05 02:51:15', NULL),
(4, 'PIC', '2025-06-05 02:51:22', NULL),
(5, 'Siswa', '2025-06-05 02:51:30', '2025-06-05 04:59:17'),
(6, 'Administrasi', '2025-06-06 09:41:10', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `education` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `id_major`, `name`, `gender`, `education`, `phone`, `email`, `Password`, `address`, `created_at`, `updated_at`) VALUES
(2, 40, 'Muhammad Siddiq', 1, 'Universitas Indraprasta PGRI', '089684758768', 'sadar11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jl. TB. Simatupang, RT.011, RW.002, KEL. Susukan, KEC. Ciracas, Jakarta Timur, Kode Pos. 13750. ', '2025-06-04 04:52:06', '2025-06-10 07:40:18'),
(6, 0, 'Riyan Perdana Putra', 1, 'Universitas Indraprasta PGRI', '089737337890', 'riyan@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'JL. Masjid ', '2025-06-06 09:50:13', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `update_at`, `deleted_at`) VALUES
(2, 'Om Burhan', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-03 07:06:12', '2025-06-04 05:28:56', 0),
(9, 'Agra Saputra', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-04 02:41:28', '2025-06-06 09:52:10', 0),
(10, 'Muhammad Siddiq', 'sidiksadar11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-04 05:31:57', '2025-06-06 09:51:50', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `instructor_majors`
--
ALTER TABLE `instructor_majors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `moduls`
--
ALTER TABLE `moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `moduls_details`
--
ALTER TABLE `moduls_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `instructor_majors`
--
ALTER TABLE `instructor_majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `moduls_details`
--
ALTER TABLE `moduls_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
