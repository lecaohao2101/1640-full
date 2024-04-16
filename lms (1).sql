-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 16, 2024 lúc 07:04 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `lms`
--
CREATE DATABASE IF NOT EXISTS `lms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lms`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `academic_years`
--

CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL,
  `year` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `academic_years`
--

INSERT INTO `academic_years` (`id`, `year`, `start_date`, `end_date`) VALUES
(8, 'Summer', '2024-04-01', '2024-04-16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_account` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `admin_account`, `admin_password`) VALUES
(1, 'admin@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `time_created` varchar(2555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `author_id`, `content`, `article_id`, `time_created`) VALUES
(1, 1, 'aaa', 2, 'Fri Apr 05 2024 01:03:27 GMT+0700 (Indochina Time)'),
(2, 1, 'aaa', 2, 'Fri Apr 05 2024 01:07:04 GMT+0700 (Indochina Time)'),
(3, 1, 'aa', 2, 'Fri Apr 05 2024 01:08:56 GMT+0700 (Indochina Time)'),
(4, 1, 'aaa', 2, 'Fri Apr 05 2024 01:09:36 GMT+0700 (Indochina Time)'),
(5, 1, 'aaaaaa', 2, 'Fri Apr 05 2024 01:09:51 GMT+0700 (Indochina Time)'),
(6, 1, 'llllllll', 2, 'Fri Apr 05 2024 10:59:43 GMT+0700 (Indochina Time)'),
(7, 1, 'aaaaa', 16, 'Fri Apr 05 2024 11:09:20 GMT+0700 (Indochina Time)'),
(8, 1, 'mojmm', 2, 'Fri Apr 05 2024 11:12:13 GMT+0700 (Indochina Time)'),
(9, 1, '', 2, 'Fri Apr 05 2024 11:12:14 GMT+0700 (Indochina Time)'),
(10, 1, 'klll\n', 2, 'Fri Apr 05 2024 11:12:36 GMT+0700 (Indochina Time)'),
(11, 1, 'helo', 2, 'Sun Apr 07 2024 10:53:42 GMT+0700 (Indochina Time)'),
(12, 1, 'hello comment\n', 18, 'Sun Apr 07 2024 10:53:56 GMT+0700 (Indochina Time)'),
(13, 3, 'a', 2, 'Sun Apr 07 2024 19:42:11 GMT+0700 (Indochina Time)'),
(14, 3, '111', 2, 'Sun Apr 07 2024 19:43:25 GMT+0700 (Indochina Time)'),
(15, 3, '1111', 2, 'Sun Apr 07 2024 20:04:02 GMT+0700 (Indochina Time)'),
(16, 3, '111111111', 2, 'Sun Apr 07 2024 20:04:06 GMT+0700 (Indochina Time)'),
(17, 5, 'good', 18, 'Sun Apr 07 2024 20:04:34 GMT+0700 (Indochina Time)'),
(18, 5, 'abc', 18, 'Wed Apr 10 2024 15:57:22 GMT+0700 (Indochina Time)'),
(19, 5, 'aa', 18, 'Thu Apr 11 2024 20:09:46 GMT+0700 (Indochina Time)'),
(20, 5, 'âs', 22, 'Thu Apr 11 2024 21:58:18 GMT+0700 (Indochina Time)'),
(21, 5, '', 22, 'Thu Apr 11 2024 21:59:15 GMT+0700 (Indochina Time)'),
(22, 5, '', 22, 'Thu Apr 11 2024 22:00:11 GMT+0700 (Indochina Time)'),
(23, 5, '', 22, 'Thu Apr 11 2024 22:00:54 GMT+0700 (Indochina Time)'),
(24, 5, '', 22, 'Thu Apr 11 2024 22:00:56 GMT+0700 (Indochina Time)'),
(25, 5, 'ádasdsad', 22, 'Thu Apr 11 2024 22:03:37 GMT+0700 (Indochina Time)'),
(26, 5, 'ádsad', 22, 'Thu Apr 11 2024 22:03:53 GMT+0700 (Indochina Time)'),
(27, 5, '', 22, 'Thu Apr 11 2024 22:03:57 GMT+0700 (Indochina Time)'),
(28, 5, 'sdas', 18, 'Thu Apr 11 2024 22:28:36 GMT+0700 (Indochina Time)'),
(29, 5, 'dêd', 18, 'Thu Apr 11 2024 22:44:14 GMT+0700 (Indochina Time)'),
(30, 5, 'Good', 2, 'Sun Apr 14 2024 17:19:01 GMT+0700 (Indochina Time)'),
(31, 5, 'best\n', 2, 'Mon Apr 15 2024 13:59:00 GMT+0700 (Indochina Time)'),
(32, 5, 'coment\n', 25, 'Tue Apr 16 2024 19:15:34 GMT+0700 (Indochina Time)'),
(33, 9, 'Good', 27, 'Tue Apr 16 2024 23:16:49 GMT+0700 (Indochina Time)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departmentmanager`
--

CREATE TABLE `departmentmanager` (
  `department_manager_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `manager_email` varchar(255) DEFAULT NULL,
  `manager_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `departmentmanager`
--

INSERT INTO `departmentmanager` (`department_manager_id`, `department_id`, `manager_name`, `manager_email`, `manager_password`) VALUES
(9, 1, 'Coordinator IT', 'coordinatorit@gmail.com', '12345678'),
(10, 2, 'Coordinator KHMT', 'coordinatorkhmt@gmail.com', '12345678'),
(11, 3, 'Coordinator Design', 'coordinatordesign@gmail.com', '12345678'),
(12, 8, 'Coordinator Business', 'coordinatorbussiness@gmail.com', '12345678'),
(13, 1, 'Nguyen Thi Huong Hoa', 'nguyenthihuonghoa121970@gmail.com', '12345678'),
(14, 3, 'Nguyen Van Phuoc', 'phuoc0905886611@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faculty`
--

CREATE TABLE `faculty` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `faculty`
--

INSERT INTO `faculty` (`department_id`, `department_name`) VALUES
(1, 'IT'),
(2, 'KHMT'),
(3, 'Design'),
(8, 'Business');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magazine`
--

CREATE TABLE `magazine` (
  `magazine_id` int(11) NOT NULL,
  `magazine_name` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `magazine`
--

INSERT INTO `magazine` (`magazine_id`, `magazine_name`, `start_date`, `end_date`, `faculty_id`) VALUES
(17, 'Magazine of IT 2', '2024-04-16', '2024-04-27', 1),
(18, 'Magazine of KHMT', '2024-04-01', '2024-04-12', 2),
(19, 'Magazine of Design', '2024-04-16', '2024-04-26', 3),
(20, 'Magazine of Business', '2024-04-16', '2024-04-19', 8),
(23, 'Magazine of IT 1', '2024-04-01', '2024-04-03', 1),
(24, 'Magazine of IT', '2024-04-16', '2024-04-26', 1),
(25, 'Magazine of KHMT 2', '2024-04-16', '2024-04-20', 2),
(26, 'Magazine of KHMT 1', '2024-04-01', '2024-04-10', 2),
(27, 'Magazine of Design 2', '2024-04-01', '2024-04-05', 3),
(28, 'Magazine of Design 1', '2024-04-06', '2024-05-10', 3),
(29, 'Magazine of Business 1', '2024-04-16', '2024-04-27', 8),
(30, 'Magazine of Business 2', '2024-04-01', '2024-04-06', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `marketing`
--

CREATE TABLE `marketing` (
  `marketing_id` int(11) NOT NULL,
  `marketing_name` varchar(255) NOT NULL,
  `marketing_email` varchar(255) NOT NULL,
  `marketing_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `marketing`
--

INSERT INTO `marketing` (`marketing_id`, `marketing_name`, `marketing_email`, `marketing_password`) VALUES
(2, 'Marketing', 'marketing@gmail.com', '12345678'),
(5, 'Marketing 11', 'marketing1@gmail.com', '12345678'),
(7, 'Le Duy Long', 'leduylong.dn99@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `article_id` int(11) NOT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_content` text DEFAULT NULL,
  `article_file` varchar(255) NOT NULL,
  `article_author_id` int(11) DEFAULT NULL,
  `article_default` int(11) NOT NULL DEFAULT 0,
  `article_created_at` varchar(255) NOT NULL,
  `article_updated_at` varchar(255) NOT NULL,
  `magazine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`article_id`, `article_title`, `article_content`, `article_file`, `article_author_id`, `article_default`, `article_created_at`, `article_updated_at`, `magazine_id`) VALUES
(27, 'IT', 'Hello IT', '1713284232326-416353622_805713404916211_5817761570164165352_n.jpg', 7, 1, 'Tue Apr 16 2024 22:25:14 GMT+0700 (Indochina Time)', 'Tue Apr 16 2024 22:25:14 GMT+0700 (Indochina Time)', 24),
(28, 'IT 2', 'Hello IT 2', '1713283913540-vector-edited-cleaned-vietnam-map-600nw-2237057533.jpg', 7, 1, 'Tue Apr 16 2024 23:11:53 GMT+0700 (Indochina Time)', 'Tue Apr 16 2024 23:11:53 GMT+0700 (Indochina Time)', 17),
(29, 'Hello design', 'xin caho the gio', '1713285046809-vector-edited-cleaned-vietnam-map-600nw-2237057533.jpg', 6, 1, 'Tue Apr 16 2024 23:30:15 GMT+0700 (Indochina Time)', 'Tue Apr 16 2024 23:38:47 GMT+0700 (Indochina Time)', 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_password` varchar(255) DEFAULT NULL,
  `student_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `student_email`, `student_password`, `student_department_id`) VALUES
(3, 'Student IT', 'studentit@gmail.com', '12456789', 1),
(5, 'Student KHTM', 'studentkhmt@gmail.com', '1245678', 2),
(6, 'Student Design', 'studentdesign@gmail.com', '12345678', 3),
(7, 'Student IT1', 'studentit@gmail.com', '12345678', 1),
(17, 'Student Business', 'studentbussiness@gmail.com', '12345678', 8);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `departmentmanager`
--
ALTER TABLE `departmentmanager`
  ADD PRIMARY KEY (`department_manager_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Chỉ mục cho bảng `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`department_id`);

--
-- Chỉ mục cho bảng `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`magazine_id`);

--
-- Chỉ mục cho bảng `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`article_id`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_department_id` (`student_department_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `departmentmanager`
--
ALTER TABLE `departmentmanager`
  MODIFY `department_manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `faculty`
--
ALTER TABLE `faculty`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `magazine`
--
ALTER TABLE `magazine`
  MODIFY `magazine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `marketing`
--
ALTER TABLE `marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
