-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jul 2022 pada 15.36
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

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
(5, 1, 'Admin Permata Smart', 'adminadmin', '085855578424', 'super');

-- --------------------------------------------------------

--
-- Struktur dari tabel `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `course`
--

INSERT INTO `course` (`id`, `name`) VALUES
(1, 'Matematika (MTK)'),
(2, 'Ilmu Pengetahuan Sosial (IPS)'),
(3, 'Ilmu Pengetahuan Alam (IPA)'),
(4, 'Bahasa Inggris'),
(5, 'Bahasa Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `examps`
--

CREATE TABLE `examps` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answer`)),
  `corrrect_answer` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `rating` smallint(6) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `max_students` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schedules`
--

INSERT INTO `schedules` (`id`, `tutor_id`, `date`, `start_time`, `end_time`, `max_students`, `created_at`, `updated_at`) VALUES
(1, 1, 'rabu', '18:00:00', '20:00:00', 20, '2022-07-19 12:49:57', '2022-07-19 12:49:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule_student`
--

CREATE TABLE `schedule_student` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutors_id` int(11) NOT NULL,
  `transaction_id` varchar(15) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schedule_student`
--

INSERT INTO `schedule_student` (`id`, `student_id`, `tutors_id`, `transaction_id`, `created_at`, `updated_at`) VALUES
(16, 41, 1, '165829818305', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 39, 1, '165830434802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 36, 1, '165832283409', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(36, 80, 'Dina Mardiani', 'Jln. Paritmas, Ajung Jember.', 'perempuan', '082 331 234 564', 'Rukmiati', '089 890 098 765', 'Dina', 'SMA Negeri 1 Jenggawah', 'sma', '2'),
(39, 112, 'Irvan Junaidi', 'Irvan Junaidi', 'laki-laki', '088809939825', 'Irvan`s', 'irvan`s', 'Test', 'SDN MENCARI CINTA', 'sd', '6'),
(40, 113, 'Baimwong', 'Irvan Junaidi', 'laki-laki', '087762638070', 'sadasd', 'sadsad', 'Solo Player', 'SDN TEST AJA', 'sd', '6'),
(41, 114, 'Mursidin', 'Irvan Junaidi', 'laki-laki', '087762638070', 'Irvans', 'asdasda', 'Solo Player', 'SDN TEST AJA', 'sd', '6'),
(42, 117, 'Irvan 2', 'Irvan 2', 'laki-laki', '088805949569', 'Irvann', '087216261313', 'hanya gabut', 'sdn karangbaru', 'sd', '6');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(15) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `status` enum('pending','verified','not_verified','block') NOT NULL,
  `is_active` enum('active','inactive') NOT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `student_id`, `tutor_id`, `status`, `is_active`, `receipt`, `discount`, `total`, `created_at`, `updated_at`) VALUES
('165829818305', 41, 1, 'verified', 'active', '1658298200767.png', NULL, 300000, '2022-07-20 08:24:28', '2022-07-20 06:23:03'),
('165830434802', 39, 1, 'verified', 'active', '1658304369237.png', NULL, 300000, '2022-07-20 08:24:38', '2022-07-20 08:05:48'),
('165832283409', 36, NULL, 'verified', 'active', '1658322853860.png', NULL, 300000, '2022-07-20 13:15:33', '2022-07-20 13:13:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tutors`
--

CREATE TABLE `tutors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `sex` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` text NOT NULL,
  `profession` varchar(255) NOT NULL,
  `level` enum('sd','smp','sma') NOT NULL,
  `schedule` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `is_active` enum('active','inactive') NOT NULL,
  `is_available` enum('available','not_available') NOT NULL,
  `file_pdf` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tutors`
--

INSERT INTO `tutors` (`id`, `user_id`, `nik`, `name`, `address`, `sex`, `phone_number`, `bio`, `profession`, `level`, `schedule`, `course_id`, `price`, `is_active`, `is_available`, `file_pdf`) VALUES
(1, 116, '12234678', 'Irvan Junaidi', '12414', 'laki-laki', '087762638070', 'Mahasiswa Politeknik Negeri Jember Semester 4', 'Mahasiswa', 'sd', '', 5, 300000, 'active', 'available', 'resume1.pdf'),
(22, 118, NULL, '123113134114', 'jl rahasia', 'laki-laki', '0898797977', 'freelance', 'freelance', 'sd', '', 1, 0, 'active', 'available', 'Final_Project_Chameleon_Academy.pdf');

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
(1, 'admin@admin.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, '1655281470517.png', 'active', 'admin', NULL, NULL, '2022-06-15 08:24:30'),
(60, 'jefrydwiyanto@gmail.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(76, 'faiqotulmunawaroh@gmail.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(80, 'dinamardiani16@gmail.com', '$2y$10$sK2OpeAmlTNC14ho/VStMON7VduD8/EWgvs5UsDH8SF80vCVFp4lO', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(81, 'fatimatuzzahro@gmail.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(88, 'melindafitiyani876@gmail.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(89, 'faikotul15@gmail.com', '$2y$10$aQpgOL6uzwqGtRhMeKQMhusRV1q03kMDXL7M2zRmpbeh9rJUV6u62', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(94, 'siapaling@gmail.com', '$2y$10$5e74UK1DWj/tLqp32UrQWuD25FCDSJDg24/fuS1z2jSjlFvc2pvyC', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(95, 'siapaling@gmail.com', '$2y$10$sK2OpeAmlTNC14ho/VStMON7VduD8/EWgvs5UsDH8SF80vCVFp4lO', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(112, 'testaja@gmail.com', '$2y$10$sK2OpeAmlTNC14ho/VStMON7VduD8/EWgvs5UsDH8SF80vCVFp4lO', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(113, 'coba@gmail.com', '$2y$10$1nnHny/7M8mIC.XjO/Lh8u0OjdJwvzKHkLK/KRDFhhLmEFnKMRkAW', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(114, 'Jeremysurya@gmail.com', '$2y$10$sK2OpeAmlTNC14ho/VStMON7VduD8/EWgvs5UsDH8SF80vCVFp4lO', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(116, 'coba@gmail.com', '$2y$10$Yk2czICr/rqlaClwrMZAROiFzRyhbkZZlzMvZdFy0gMDnaxD4AwbC', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL),
(117, 'irvanjunaidi2@gmail.com', '$2y$10$4uEYrSXX49qV2UvJTrswGO3.u.mI1wC6EpZjq8HcyihoC9Mzs1dhK', NULL, NULL, 'active', 'student', NULL, NULL, NULL),
(118, 'ghina@digitalnative.id', '$2y$10$yCWuBssr7PI2/eiym.FOnehoTiuaFniNSpmusGAYpSfmG27pK4ibe', NULL, NULL, 'active', 'tutor', NULL, NULL, NULL);

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
-- Indeks untuk tabel `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `examps`
--
ALTER TABLE `examps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indeks untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `reviews_ibfk_1` (`tutor_id`);

--
-- Indeks untuk tabel `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_ibfk_1` (`tutor_id`);

--
-- Indeks untuk tabel `schedule_student`
--
ALTER TABLE `schedule_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `tutors_id` (`tutors_id`),
  ADD KEY `transaction_id` (`transaction_id`);

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
  ADD KEY `student_id` (`student_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indeks untuk tabel `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tutors_ibfk_5` (`course_id`);

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
-- AUTO_INCREMENT untuk tabel `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `examps`
--
ALTER TABLE `examps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `schedule_student`
--
ALTER TABLE `schedule_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `tutors`
--
ALTER TABLE `tutors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `examps`
--
ALTER TABLE `examps`
  ADD CONSTRAINT `examps_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `schedule_student`
--
ALTER TABLE `schedule_student`
  ADD CONSTRAINT `schedule_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `schedule_student_ibfk_2` FOREIGN KEY (`tutors_id`) REFERENCES `tutors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `schedule_student_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`);

--
-- Ketidakleluasaan untuk tabel `tutors`
--
ALTER TABLE `tutors`
  ADD CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tutors_ibfk_5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
