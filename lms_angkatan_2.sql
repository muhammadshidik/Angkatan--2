-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2025 pada 09.52
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
  `id_role` int(11) NOT NULL,
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

INSERT INTO `instructors` (`id`, `id_role`, `name`, `gender`, `education`, `phone`, `email`, `Password`, `address`, `created_at`, `updated_at`) VALUES
(2, 3, 'Muhammad Siddiq', 1, 'Universitas Indraprasta PGRI', '089684758768', 'sidiksadar11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jl. TB. Simatupang, RT.011, RW.002, KEL. Susukan, KEC. Ciracas, Jakarta Timur, Kode Pos. 13750. ', '2025-06-04 04:52:06', '2025-06-11 01:33:53'),
(6, 3, 'Riyan Perdana Putra', 1, 'Universitas Indraprasta PGRI', '089737337890', 'riyan@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'JL. Masjid ', '2025-06-06 09:50:13', '2025-06-11 01:56:05'),
(7, 3, 'Elja Gusfi Anwar', 0, 'Universitas Indraprasta PGRI', '089684758768', 'elja@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'jl. tambun', '2025-06-11 02:40:50', NULL);

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
(54, 40, 2, '2025-06-11 02:37:11', NULL),
(55, 31, 2, '2025-06-11 02:37:18', NULL),
(56, 40, 7, '2025-06-11 02:41:01', NULL);

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
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `urutan` int(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `url`, `urutan`, `created_at`, `updated_at`) VALUES
(1, 0, 'Dashboard', 'bi bi-grid', 'home.php', 1, '2025-06-11 04:21:50', NULL),
(2, 0, 'Master Data', 'bi bi-menu-button-wide', '', 2, '2025-06-11 04:28:32', NULL),
(3, 0, 'Modul', 'bi bi-book', '?page=moduls', 3, '2025-06-11 04:29:57', NULL),
(4, 2, 'Instructor', 'bi bi-circle', 'instructor', 1, '2025-06-11 04:31:01', '2025-06-11 05:27:36'),
(5, 2, 'Major', 'bi bi-circle', 'major', 2, '2025-06-11 04:32:09', '2025-06-11 05:28:18'),
(6, 2, 'Menu', 'bi bi-circle', 'menu', 3, '2025-06-11 04:32:23', '2025-06-11 05:27:57'),
(7, 2, 'Role', 'bi bi-circle', 'role', 4, '2025-06-11 04:32:43', '2025-06-11 05:27:59'),
(9, 2, 'users', 'bi bi-circle', 'user', 5, '2025-06-12 01:06:35', '2025-06-12 01:19:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_roles`
--

CREATE TABLE `menu_roles` (
  `id` int(11) NOT NULL,
  `id_roles` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu_roles`
--

INSERT INTO `menu_roles` (`id`, `id_roles`, `id_menu`, `created_at`, `updated_at`) VALUES
(27, 4, 1, '2025-06-12 06:33:55', NULL),
(28, 4, 9, '2025-06-12 06:33:55', NULL),
(46, 9, 1, '2025-06-12 07:25:20', NULL),
(47, 9, 2, '2025-06-12 07:25:20', NULL),
(48, 9, 4, '2025-06-12 07:25:20', NULL),
(49, 9, 5, '2025-06-12 07:25:20', NULL),
(50, 9, 6, '2025-06-12 07:25:20', NULL),
(51, 9, 7, '2025-06-12 07:25:20', NULL),
(52, 9, 9, '2025-06-12 07:25:20', NULL),
(53, 9, 3, '2025-06-12 07:25:20', NULL),
(54, 6, 1, '2025-06-12 07:25:41', NULL),
(55, 6, 3, '2025-06-12 07:25:41', NULL),
(56, 3, 3, '2025-06-12 07:26:09', NULL);

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
(10, 41, 2, 'S1 - Hubungan Internasional', '2025-06-11 01:15:00', NULL),
(11, 41, 2, 'Muhammad Reihan Perdana', '2025-06-11 02:20:04', NULL),
(12, 40, 7, 'S1 - Hubungan Internasional', '2025-06-11 02:51:59', NULL);

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
(6, 10, '6848d8948830d-lms_angkatan_2.sql', '2025-06-11 01:15:00', NULL),
(7, 10, '6848d89488a2f-driver-hub-install__28.exe', '2025-06-11 01:15:00', NULL),
(8, 10, '6848d89489070-Nicepage-7.7.3.exe', '2025-06-11 01:15:00', NULL),
(9, 10, '6848d89489848-portofolio-angkatan2-main.zip', '2025-06-11 01:15:00', NULL),
(10, 11, '6848e7d43a1b8-bubur-ayam-kuning-e1666848225186.jpg', '2025-06-11 02:20:04', NULL),
(11, 12, '6848ef4f8a367-836519_08305325082013_jokowi_metal.jpg', '2025-06-11 02:51:59', NULL);

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
(3, 'Instructor', '2025-06-05 02:51:15', '2025-06-11 02:27:34'),
(4, 'PIC', '2025-06-05 02:51:22', NULL),
(5, 'Administrator', '2025-06-06 09:41:10', '2025-06-11 02:27:04'),
(6, 'Students', '2025-06-11 01:22:15', '2025-06-11 02:27:28'),
(9, 'Admin', '2025-06-12 01:20:15', NULL);

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
(2, 40, 'Muhammad Siddiq', 1, 'Universitas Indraprasta PGRI', '089684758768', 'sidik@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Jl. TB. Simatupang, RT.011, RW.002, KEL. Susukan, KEC. Ciracas, Jakarta Timur, Kode Pos. 13750. ', '2025-06-04 04:52:06', '2025-06-11 02:28:17'),
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
(2, 'Om Burhan', 'admin11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-03 07:06:12', '2025-06-12 02:45:02', 0),
(9, 'Agra Saputra', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-04 02:41:28', '2025-06-06 09:52:10', 0),
(13, 'Muhammad Siddiq', 'sidiksadar11@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-12 01:22:05', '2025-06-12 02:47:52', 0);

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
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `instructor_majors`
--
ALTER TABLE `instructor_majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `moduls_details`
--
ALTER TABLE `moduls_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
