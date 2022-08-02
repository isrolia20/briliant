-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2022 pada 06.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `permatasmart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `privilege` enum('super','administrator','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `name`, `address`, `phone_number`, `privilege`) VALUES
(5, 1, 'Admin Isrolia', 'adminadmin', '085855578424', 'super');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`) VALUES
(1, 'Bagaimana cara mendaftarkan diri menjadi siswa di permata smart?', 'Hallo, Silahkan lakukan pendaftaran pada menu daftar siswa, selanjutnya lakukan registrasi akun dan pilih paket bimbel yang sudah tersedia sesuai tingkat sekolah kamu'),
(2, 'Bagaimana jadwal bimbel siswa dipermata smart?', 'Hai dear, Jadwal bimbel yang kamu pilih bisa dilihat pada menu jadwal sesuai kelas yang kamu ambil, jadwal bimbel dilakukan 1x dalam 1 minggu'),
(3, 'Bagaimana sistem paket bimbel di permata smart?', 'Hallo, untuk paket bimbel kami hanya tersedia untuk paket perbulan, yang dilakukan dalam 1 minggu 1x pertemuan.'),
(4, 'Bagaimana cara mendaftarkan diri menjadi tutor di permata smart?', 'Hallo, Silahkan mendaftarkan diri pada menu daftar tutor, selanjutnya tutor akan dihubungi oleh pihak admin permata smart  apakah tutor dapat menjadi bagian tutor kami atau belum.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `package_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `features`
--

INSERT INTO `features` (`id`, `package_id`, `name`) VALUES
(8, '7', '5'),
(9, '5', '4'),
(11, '3', '3'),
(13, '2', '2'),
(14, '1', '1'),
(15, '6', '6'),
(16, '10', '1,2,3'),
(17, '11', '1,2,3'),
(18, '4', '7'),
(19, '8', '8'),
(20, '9', '9'),
(21, '12', 'VII, VIII, IX'),
(22, '16', 'VII, VIII, IX'),
(23, '17', '10'),
(24, '18', '10'),
(25, '19', '11'),
(26, '20', '11'),
(27, '21', '12'),
(30, '22', '12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `leasons`
--

CREATE TABLE `leasons` (
  `id` int(11) NOT NULL,
  `package_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pukul` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `leasons`
--

INSERT INTO `leasons` (`id`, `package_id`, `name`, `pukul`) VALUES
(9, '1', 'Senin', '16:00 - 17:00'),
(10, '2', 'Selasa/Kamis', '15:30 - 16:30'),
(11, '3', 'Rabu/Jumat', '15:00 - 16:00'),
(13, '5', 'Kamis', '14:00 - 15:15'),
(14, '7', 'Jumat', '15:00 - 16:15'),
(15, '6', 'Sabtu', '14:00 - 15:15'),
(16, '10', 'Minggu', '09:00 - 10:00'),
(17, '11', 'Jumat', '14:00 - 15:00'),
(18, '4', 'Rabu/Minggu', '15:00 - 16:30'),
(19, '8', 'Jumat', '15:00 - 16:30'),
(20, '9', 'Minggu', '10:00 - 11:30'),
(21, '12', 'Sabtu', '15:00 - 16:30'),
(22, '16', 'Minggu', '14:00 - 15:30'),
(23, '17', 'Rabu', '18:00 - 19:30'),
(24, '18', 'Selasa', '18:00 - 19:30'),
(25, '19', 'Selasa', '18:30 - 20:00'),
(26, '20', 'Selasa', '18:30 - 20:00'),
(27, '21', 'Sabtu', '14:00 - 15:30'),
(28, '22', 'Sabtu', '15:00 - 16:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `packages`
--

CREATE TABLE `packages` (
  `id` varchar(10) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `duration` int(11) NOT NULL,
  `level` enum('sd','smp','sma') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `packages`
--

INSERT INTO `packages` (`id`, `admin_id`, `name`, `slug`, `price`, `description`, `duration`, `level`) VALUES
('1', 5, 'Tematik 1', 'tematik-1', 159000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 60, 'sd'),
('10', 5, 'Bahasa Jawa', 'bahasa-jawa', 135000, 'Materi : Bahasa Daerah / Bahasa Jawa', 60, 'sd'),
('11', 5, 'PAI', 'pai', 175000, 'Materi : Pendidikan agama islam', 60, 'sd'),
('12', 5, 'Eksklusif IPA', 'eksklusif-ipa', 229000, 'Materi : Full IPA', 90, 'smp'),
('16', 5, 'Eksklusif B.Inggris', 'eksklusif-binggris', 219000, 'Materi Full Bahasa Inggris', 90, 'smp'),
('17', 5, 'X IPA', 'x-ipa', 239000, 'Materi : Fisika, Kimia, Biologi', 90, 'sma'),
('18', 5, 'X IPS', 'x-ips', 239000, 'Materi : Ekonomi, Sejarah, Sosial', 90, 'sma'),
('19', 5, 'XI IPA', 'xi-ipa', 239000, 'Materi : Fisika, Kimia, Biologi', 90, 'sma'),
('2', 5, 'Tematik 2', 'tematik-2', 159000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 60, 'sd'),
('20', 5, 'XI IPS', 'xi-ips', 239000, 'Materi : Ekonomi, Sejarah, Sosial', 90, 'sma'),
('21', 5, 'XII IPA', 'xii-ipa', 259000, 'Materi : Fisika, Kimia, Biologi', 90, 'sma'),
('22', 5, 'XII IPS', 'xii-ips', 259000, 'Materi : Ekonomi, Sejarah, Sosial', 90, 'sma'),
('3', 5, 'Tematik 3', 'tematik-3', 159000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 60, 'sd'),
('4', 5, 'VII', 'vii', 239000, 'Materi : Matematika, Bahasa Indonesia, IPA, IPS', 90, 'smp'),
('5', 5, 'Tematik 4', 'tematik-4', 179000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 75, 'sd'),
('6', 5, 'Tematik 6', 'tematik-6', 185000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 75, 'sd'),
('7', 5, 'Tematik 5', 'tematik-5', 179000, 'Materi : Matematika, Bahasa Indonesia, PPKN', 75, 'sd'),
('8', 5, 'VIII', 'viii', 239000, 'Materi : Matematika, Bahasa Indonesia, IPA, IPS', 90, 'smp'),
('9', 5, 'IX', 'ix', 259000, 'Materi : Matematika, Bahasa Indonesia, IPA, IPS', 90, 'smp');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `transaction_id` varchar(15) NOT NULL,
  `rating` smallint(6) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `schedule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `sex` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `phone_number_parent` varchar(15) NOT NULL,
  `bio` text NOT NULL,
  `school` varchar(255) NOT NULL,
  `level` enum('sd','smp','sma') NOT NULL,
  `class` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `user_id`, `name`, `address`, `sex`, `phone_number`, `parent`, `phone_number_parent`, `bio`, `school`, `level`, `class`) VALUES
(27, 48, 'Dwi Bagus', 'Kp. Krajan RT03/RW01', '', '089112122122', 'Yani', 'Uhtea', 'Yuks', 'SD bws', 'sd', '2'),
(28, 57, 'Pratiwi', 'Jln. Mastrip no 5, Jember', 'perempuan', '082 331 234 675', 'Anik Khumaira', '085 890 098 765', 'Tiwi', 'SDN Jember 2', 'sd', '2'),
(29, 58, 'Farimatul Hasanah', 'Jln. Paritmas,Mangaran Krajan, Ajung Jember.', '', '085 675 654 909', 'Hadi Abdillah', '087 890 098 765', 'Faril', 'SMPN 2 Jember', 'smp', 'VII'),
(30, 59, 'Nilna Wulandari', 'Jln. Sumatra no 12, Jember', 'perempuan', '082 331 234 908', 'Wulan', '089 890 098 765', 'Nilna', 'SMPN 3 Jember', 'smp', 'IX'),
(31, 61, 'Yulia Anggraeni', 'Jln. Melati no 134 Jember', 'perempuan', '089112122122', 'Saiful Ikhsan', '082 336 178 134', 'Yulia', 'SMA Negeri 2 Jember', 'sma', 'XII');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(15) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `package_id` varchar(10) NOT NULL,
  `status` enum('pending','verified','not_verified','block') NOT NULL,
  `is_active` enum('active','inactive') NOT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `schedule` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `student_id`, `tutor_id`, `package_id`, `status`, `is_active`, `receipt`, `discount`, `total`, `schedule`, `created_at`, `updated_at`) VALUES
('2022060803', 30, 8, '12', 'verified', 'active', NULL, NULL, 265000, '0000-00-00', '2022-06-10 01:47:16', '0000-00-00 00:00:00'),
('2022060809', 29, 7, '8', 'pending', 'active', '1654669825981.png', NULL, 255000, '0000-00-00', '2022-06-12 08:02:55', '0000-00-00 00:00:00'),
('2022061102', 31, 8, '19', 'verified', 'active', '1654946059955.jpeg', NULL, 239000, '0000-00-00', '2022-06-11 11:15:23', '0000-00-00 00:00:00'),
('2022061203', 31, NULL, '17', 'pending', 'active', NULL, NULL, 239000, '0000-00-00', '2022-06-12 14:34:32', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tutors`
--

CREATE TABLE `tutors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `leason_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `sex` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` text NOT NULL,
  `profession` varchar(255) NOT NULL,
  `level` enum('sd','smp','sma') NOT NULL,
  `schedule` varchar(100) NOT NULL,
  `is_active` enum('active','inactive') NOT NULL,
  `is_available` enum('available','not_available') NOT NULL,
  `file_pdf` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tutors`
--

INSERT INTO `tutors` (`id`, `user_id`, `leason_id`, `schedule_id`, `name`, `address`, `sex`, `phone_number`, `bio`, `profession`, `level`, `schedule`, `is_active`, `is_available`, `file_pdf`) VALUES
(6, 56, NULL, NULL, 'Agya', 'Jl Karuwa', 'perempuan', '089112122122', 'Suka mengajar', 'Guru Honorer', 'sd', 'Malam', 'active', 'available', 'Cv_Lia6.pdf'),
(7, 60, NULL, NULL, 'Jefry Dwiyanto', 'Jln. Karang Asem, Pakusari, Jember', 'laki-laki', '087 889 098 765', 'Jefry', 'Mahasiswa', 'sd', 'Minggu', 'active', 'available', 'CV_Lia6.pdf'),
(8, 62, NULL, NULL, 'Robert Muhajir', 'Jln. Mastrip no 15 Jember', 'laki-laki', '087734282972', 'Robert', 'Mahasiswa', 'sd', 'Kamis', 'active', 'available', 'KHS.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_active` enum('active','inactive') NOT NULL,
  `role` enum('admin','student','tutor') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `email_verified_at`, `avatar`, `is_active`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, '1654703857390.jpg', 'active', 'admin', NULL, NULL, '2022-06-08 15:57:37'),
(2, 'tutor@tutor.com]', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(48, 'dwibagus@gmail.com', '$2y$10$eB2UfSLsioiaKy6TZCobkeAyqCnH1eFUwTZnRX6g3EvK1Jl6zUpGW', NULL, '1641714068608.jpg', 'active', 'student', NULL, NULL, '2022-06-12 07:20:06'),
(50, 'dino@gmail.com', '$2y$10$7WFqoSxAoFgLxe2.oci6ZeEPvadvUlnh3FUeDS1N9TL1oHcUWQrMa', NULL, 'IMG-20181123-WA0027.jpg', 'active', 'tutor', NULL, NULL, NULL),
(56, 'ageng@gmail.com', '$2y$10$1ElWDC2GiVthgiJTW7x3.uTp3gZCizXgbN5nvWBMOSBJF15weqzbW', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(57, 'tiwi@gmail.com', '$2y$10$GWiTXDEYMpDvhgehxKzl3el.GlmJDCy0RXAop9GPejGgp.4/0dY3.', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(58, 'farimatul@gmail.com', '$2y$10$mgWCLDOMWe.SnbmSiNlREON.4HLFej5D/4SgEjmlHc416okO/oRbK', NULL, NULL, 'active', 'student', NULL, NULL, '2022-06-08 13:10:26'),
(59, 'nilna@gmail.com', '$2y$10$Aa4Hjh/mea99ORCWIAdAt.wZ6PvoBVGD6bQ6gPgBDshOvdiabrKRW', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(60, 'jefrydwiyanto@gmail.com', '$2y$10$1dhWU5NAQ9ppFyun1cUXhe48zO8QfgBNSp49895qjKIRcG4PvIt1u', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(61, 'yulia@gmail.com', '$2y$10$WtS3P/2FQNvayv3J..pP4.ZQ3SdRnqqj91lVnUGB.rckfU7MwhtBi', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(62, 'robertmuhajir@gmail.com', '$2y$10$01WXsFFwdThnoG6M/CqawuVSt4yLQVJdkBllDr/ldvSe8vAmWFwQ6', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indeks untuk tabel `leasons`
--
ALTER TABLE `leasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indeks untuk tabel `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`,`transaction_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indeks untuk tabel `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`,`package_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indeks untuk tabel `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`leason_id`),
  ADD KEY `leason_id` (`leason_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `leasons`
--
ALTER TABLE `leasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tutors`
--
ALTER TABLE `tutors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `leasons`
--
ALTER TABLE `leasons`
  ADD CONSTRAINT `leasons_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Ketidakleluasaan untuk tabel `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Ketidakleluasaan untuk tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`);

--
-- Ketidakleluasaan untuk tabel `tutors`
--
ALTER TABLE `tutors`
  ADD CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tutors_ibfk_4` FOREIGN KEY (`leason_id`) REFERENCES `leasons` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
