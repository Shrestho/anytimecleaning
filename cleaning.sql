-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2023 at 07:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleaning`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `json_extract` (`details` TEXT, `required_field` VARCHAR(255)) RETURNS TEXT CHARSET latin1 COLLATE latin1_swedish_ci  BEGIN
        SET details = SUBSTRING_INDEX(details, "{", -1);
        SET details = SUBSTRING_INDEX(details, "}", 1);
        RETURN TRIM(
            BOTH '"' FROM SUBSTRING_INDEX(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(
                        details,
                        CONCAT(
                            '"',
                            SUBSTRING_INDEX(required_field,'$.', -1),
                            '":'
                        ),
                        -1
                    ),
                    ',"',
                    1
                ),
                ':',
                -1
            )
        ) ;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `latitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `longitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `default` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Hotel', '6590 Hand Brooks Apt. 428\nJohnathonberg, MA 60603-3858', 51.89890725000000000, 10.87795958000000000, 0, 7, '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(2, 'Workshop', '5918 Bergnaum Extensions Apt. 555\nBernhardborough, TX 16702-7378', 50.42053941000000000, 11.67219743000000000, 0, 7, '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(3, 'Home', '405 Tobin Center\nWest Harmonyhaven, MS 82730-1620', 51.41096516000000000, 9.06003297000000000, 0, 1, '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(4, 'Hotel', '9302 Nitzsche Dale\nFloridaburgh, NE 34767', 50.71414485000000000, 9.82686536000000000, 0, 4, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(5, 'Work', '479 Shanny Terrace\nPort Lafayette, TN 68071', 50.30012837000000000, 10.21046745000000000, 0, 4, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(6, 'Home', '1099 Harris Field\nLake Hudson, MD 45136-8111', 50.59313467000000000, 10.70469090000000000, 0, 6, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(7, 'Workshop', '85431 Jamal Views Apt. 234\nWest Marisa, WA 18259-3402', 51.94769735000000000, 11.63591825000000000, 0, 2, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(8, 'Building', '788 Evans Groves\nNew Schuyler, ID 70230', 50.27874800000000000, 9.14203101000000000, 0, 2, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(9, 'Work', '190 Herzog Courts Suite 289\nProhaskabury, CT 42943', 50.54767323000000000, 9.96543462000000000, 0, 1, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(10, 'Office', '63076 Roslyn Coves Suite 585\nNew Marjolainemouth, HI 09592-9271', 51.07944745000000000, 9.87676632000000000, 0, 1, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(12, NULL, '1963 Everardo Bypass South Edgarville, MO 38187-2661', 9.86032781000000000, 123.45600000000000000, 0, 2, '2023-03-29 01:13:35', '2023-03-29 01:13:35'),
(13, NULL, 'Dolor ab reprehender', 0.00000000000000000, 0.00000000000000000, 0, 2, '2023-04-05 02:01:48', '2023-04-05 02:01:48'),
(14, NULL, 'thjtphj rh', 0.00000000000000000, 0.00000000000000000, 0, 18, '2023-04-08 22:52:19', '2023-04-08 22:52:19'),
(15, NULL, 'DC Road', 0.00000000000000000, 0.00000000000000000, 0, 18, '2023-04-10 19:14:08', '2023-04-10 19:14:08');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Home Services'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-dark navbar-navy'),
(38, 'logo_bg_color', 'text-light  navbar-navy'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#F4841F'),
(117, 'main_dark_color', '#F4841F'),
(118, 'second_color', '#08143A'),
(119, 'second_dark_color', '#CCCCDD'),
(120, 'accent_color', '#8C9DA8'),
(121, 'accent_dark_color', '#9999AA'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '1'),
(129, 'default_currency_code', 'USD'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light'),
(135, 'enable_paystack', '0'),
(136, 'paystack_key', 'pk_test_d754715fa3fa9048c9ab2832c440fb183d7c91f5'),
(137, 'paystack_secret', 'sk_test_66f87edaac94f8adcb28fdf7452f12ccc63d068d'),
(138, 'enable_flutterwave', '0'),
(139, 'flutterwave_key', 'FLWPUBK_TEST-d465ba7e4f6b86325cb9881835726402-X'),
(140, 'flutterwave_secret', 'FLWSECK_TEST-d3f8801da31fc093fb1207ea34e68fbb-X'),
(141, 'enable_stripe_fpx', '0'),
(142, 'stripe_fpx_key', 'pk_test_51IQ0zvB0wbAJesyPLo3x4LRgOjM65IkoO5hZLHOMsnO2RaF0NlH7HNOfpCkjuLSohvdAp30U5P1wKeH98KnwXkOD00mMDavaFX'),
(143, 'stripe_fpx_secret', 'sk_test_51IQ0zvB0wbAJesyPUtR7yGdyOR7aGbMQAX5Es9P56EDUEsvEQAC0NBj7JPqFuJEYXrvSCm5OPRmGaUQBswjkRxVB00mz8xhkFX'),
(144, 'enable_paymongo', '0'),
(145, 'paymongo_key', 'pk_test_iD6aYYm4yFuvkuisyU2PGSYH'),
(146, 'paymongo_secret', 'sk_test_oxD79bMKxb8sA47ZNyYPXwf3'),
(147, 'provider_app_name', 'Service Provider'),
(148, 'default_country_code', 'DE'),
(149, 'enable_otp', '1'),
(150, 'razorpay_key', ''),
(151, 'razorpay_secret', ''),
(152, 'enable_razorpay', '0'),
(153, 'paypal_mode', '0'),
(155, 'enable_cash', '0'),
(156, 'enable_wallet', '0');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hours`
--

CREATE TABLE `availability_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) NOT NULL DEFAULT 'monday',
  `start_at` varchar(16) DEFAULT NULL,
  `end_at` varchar(16) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_hours`
--

INSERT INTO `availability_hours` (`id`, `day`, `start_at`, `end_at`, `data`, `user_id`) VALUES
(1, 'tuesday', '05:00', '13:00', '{\"en\":\"Aperiam eius atque iusto.\"}', 7),
(2, 'thursday', '05:00', '16:00', '{\"en\":\"Ut qui aut voluptatem illum.\"}', 5),
(3, 'tuesday', '08:00', '22:00', '{\"en\":\"Qui eligendi libero neque rem magnam nulla.\"}', 5),
(4, 'tuesday', '05:00', '18:00', '{\"en\":\"Ut id voluptate dolores ut.\"}', 3),
(5, 'friday', '04:00', '15:00', '{\"en\":\"Delectus ut id consequuntur et dolorem esse.\"}', 6),
(6, 'thursday', '02:00', '13:00', '{\"en\":\"Quibusdam nemo perspiciatis illum qui illo.\"}', 8),
(7, 'sunday', '04:00', '20:00', '{\"en\":\"Et voluptatem dolorem et neque.\"}', 1),
(8, 'wednesday', '05:00', '16:00', '{\"en\":\"Voluptas culpa quia et omnis quia aut tenetur.\"}', 4),
(9, 'sunday', '07:00', '15:00', '{\"en\":\"Qui soluta sit quas odit.\"}', 7),
(10, 'wednesday', '12:00', '23:00', '{\"en\":\"Ullam aliquid illum qui qui quia est voluptas.\"}', 8),
(11, 'saturday', '11:00', '19:00', '{\"en\":\"Quasi earum pariatur aut perferendis ut.\"}', 1),
(12, 'tuesday', '10:00', '15:00', '{\"en\":\"Ipsa praesentium veniam est quisquam cum.\"}', 4),
(13, 'thursday', '12:00', '13:00', '{\"en\":\"Corporis ipsa et et dolores earum quos quia.\"}', 3),
(14, 'friday', '08:00', '18:00', '{\"en\":\"Deserunt nobis quod quam natus est et amet.\"}', 1),
(15, 'tuesday', '10:00', '21:00', '{\"en\":\"Ut nemo aperiam nobis impedit et quia amet quis.\"}', 6),
(16, 'sunday', '03:00', '13:00', '{\"en\":\"Dolores ut nulla omnis.\"}', 5),
(17, 'thursday', '08:00', '23:00', '{\"en\":\"Possimus fugiat illo vel sint tenetur porro.\"}', 6),
(18, 'wednesday', '03:00', '13:00', '{\"en\":\"Rerum velit maiores in asperiores quibusdam.\"}', 8),
(19, 'sunday', '04:00', '20:00', '{\"en\":\"Nam molestiae officiis reiciendis vero velit.\"}', 7),
(20, 'thursday', '12:00', '19:00', '{\"en\":\"Facilis sed id voluptate.\"}', 7),
(21, 'monday', '11:00', '21:00', '{\"en\":\"Eum et aspernatur aut dolorem voluptates rem.\"}', 5),
(22, 'friday', '11:00', '22:00', '{\"en\":\"Explicabo optio totam a corporis.\"}', 3),
(23, 'thursday', '12:00', '18:00', '{\"en\":\"Eum corrupti vel facilis voluptatem ut et.\"}', 4),
(24, 'wednesday', '08:00', '19:00', '{\"en\":\"Ea quia corporis non deleniti nostrum.\"}', 3),
(25, 'tuesday', '05:00', '19:00', '{\"en\":\"Voluptatem quis sit et voluptatem provident.\"}', 7),
(26, 'saturday', '07:00', '20:00', '{\"en\":\"Non hic ipsam cum aut sit veniam at rerum.\"}', 4),
(27, 'thursday', '11:00', '15:00', '{\"en\":\"Eum numquam sed sunt deserunt rerum quas.\"}', 4),
(28, 'monday', '10:00', '20:00', '{\"en\":\"Modi animi consequuntur expedita deleniti et.\"}', 1),
(29, 'tuesday', '09:00', '21:00', '{\"en\":\"Nihil est corporis voluptatem magni.\"}', 8),
(30, 'sunday', '02:00', '18:00', '{\"en\":\"Numquam aut exercitationem expedita.\"}', 2),
(31, 'saturday', '09:00', '18:00', '{\"en\":\"Nihil nobis at necessitatibus sit error et harum.\"}', 2),
(32, 'friday', '08:00', '19:00', '{\"en\":\"Sit hic rerum impedit sed magni.\"}', 6),
(33, 'thursday', '10:00', '18:00', '{\"en\":\"Non dolore debitis ullam quasi vitae.\"}', 8),
(34, 'saturday', '02:00', '23:00', '{\"en\":\"Et qui ipsa ea. Maxime sequi modi inventore eos.\"}', 2),
(35, 'saturday', '12:00', '15:00', '{\"en\":\"Dolorum sed eum consequatur accusantium.\"}', 3),
(36, 'saturday', '02:00', '18:00', '{\"en\":\"Odit corporis ullam rerum temporibus.\"}', 3),
(37, 'wednesday', '07:00', '20:00', '{\"en\":\"Ratione id sapiente nam veniam fuga.\"}', 5),
(38, 'thursday', '09:00', '18:00', '{\"en\":\"Occaecati quae quia eos sit numquam nam totam.\"}', 5),
(39, 'sunday', '02:00', '22:00', '{\"en\":\"Dolor fuga inventore omnis qui eaque non.\"}', 4),
(40, 'wednesday', '05:00', '13:00', '{\"en\":\"Neque molestias ut deserunt quis maxime id qui.\"}', 6),
(41, 'tuesday', '09:00', '13:00', '{\"en\":\"Eos libero qui nisi corporis soluta nulla nihil.\"}', 5),
(42, 'saturday', '11:00', '14:00', '{\"en\":\"In et facilis sit quis ipsam et.\"}', 7),
(43, 'thursday', '11:00', '19:00', '{\"en\":\"Placeat saepe inventore adipisci.\"}', 7),
(44, 'sunday', '02:00', '17:00', '{\"en\":\"Dolore quod distinctio aperiam.\"}', 2),
(45, 'sunday', '07:00', '16:00', '{\"en\":\"Omnis nesciunt laborum consequatur dolorem.\"}', 3),
(46, 'wednesday', '05:00', '19:00', '{\"en\":\"Officia itaque aliquid rem veniam dicta in.\"}', 3),
(47, 'friday', '05:00', '13:00', '{\"en\":\"Quia quia harum ut. Et non quas et porro.\"}', 6),
(48, 'wednesday', '08:00', '17:00', '{\"en\":\"Ex quis autem quia quia et voluptatem omnis quia.\"}', 7),
(49, 'friday', '08:00', '16:00', '{\"en\":\"Est amet necessitatibus ipsam porro eaque.\"}', 6),
(50, 'wednesday', '08:00', '21:00', '{\"en\":\"Autem neque at et enim.\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Consequatur dicta labore culpa corrupti id. Perspiciatis totam nam recusandae eius et aut.\"}', '{\"en\":\"Alice to herself, as she couldn\'t answer either question, it didn\'t sound at all the same, the next moment she felt that there ought! And when I learn music.\' \'Ah! that accounts for it,\' said Alice.\"}', 2, '2023-03-29 11:10:10', '2023-03-29 11:10:10'),
(2, '{\"en\":\"Optio sapiente possimus porro est magni. Aut nam voluptatem illum.\"}', '{\"en\":\"Lizard in head downwards, and the March Hare,) \'--it was at in all directions, tumbling up against each other; however, they got their tails in their mouths. So they couldn\'t see it?\' So she set off.\"}', 1, '2023-03-29 11:10:10', '2023-03-29 11:10:10'),
(3, '{\"en\":\"Sunt distinctio blanditiis suscipit. Et hic aut maiores fugit ullam dolorem.\"}', '{\"en\":\"I shall ever see you again, you dear old thing!\' said Alice, a good opportunity for making her escape; so she bore it as a boon, Was kindly permitted to pocket the spoon: While the Owl had the door.\"}', 8, '2023-03-29 11:10:10', '2023-03-29 11:10:10'),
(4, '{\"en\":\"Esse unde sint rerum. Dignissimos impedit placeat dolore. Vero non molestias accusantium natus est.\"}', '{\"en\":\"I\'LL soon make you grow taller, and the whole party at once crowded round it, panting, and asking, \'But who is to give the prizes?\' quite a chorus of voices asked. \'Why, SHE, of course,\' he said in.\"}', 8, '2023-03-29 11:10:10', '2023-03-29 11:10:10'),
(5, '{\"en\":\"Aliquid odio atque ipsam nulla. Corrupti debitis et repudiandae quidem qui velit alias.\"}', '{\"en\":\"Duchess. \'I make you grow shorter.\' \'One side of the evening, beautiful Soup! \'Beautiful Soup! Who cares for you?\' said the March Hare and the beak-- Pray how did you ever see such a rule at.\"}', 2, '2023-03-29 11:10:11', '2023-03-29 11:10:11'),
(6, '{\"en\":\"Nostrum eum nostrum non. Non sed dolorem amet velit repudiandae adipisci alias ad.\"}', '{\"en\":\"I suppose Dinah\'ll be sending me on messages next!\' And she kept on good terms with him, he\'d do almost anything you liked with the bread-and-butter getting so far off). \'Oh, my poor hands, how is.\"}', 3, '2023-03-29 11:10:11', '2023-03-29 11:10:11'),
(7, '{\"en\":\"Recusandae neque unde sapiente autem. Autem ut mollitia qui.\"}', '{\"en\":\"Northumbria--\\\"\' \'Ugh!\' said the Caterpillar. \'Well, perhaps you haven\'t found it advisable--\\\"\' \'Found WHAT?\' said the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all.\"}', 8, '2023-03-29 11:10:11', '2023-03-29 11:10:11'),
(8, '{\"en\":\"Quos vero quas quia. Provident voluptates eum eius dolores error voluptate quidem.\"}', '{\"en\":\"I only wish people knew that: then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides of the leaves: \'I should like to be seen: she found her head struck against the door, and.\"}', 1, '2023-03-29 11:10:11', '2023-03-29 11:10:11'),
(9, '{\"en\":\"Debitis ducimus aut libero sed consequuntur. Id non velit dolor quod aut.\"}', '{\"en\":\"Bill had left off when they hit her; and when she heard was a real Turtle.\' These words were followed by a very hopeful tone though), \'I won\'t interrupt again. I dare say you\'re wondering why I.\"}', 6, '2023-03-29 11:10:11', '2023-03-29 11:10:11'),
(10, '{\"en\":\"Ut rerum quas aut consequatur. Quidem corrupti eos est quas voluptatibus nulla.\"}', '{\"en\":\"Now you know.\' \'Not at first, the two creatures got so much already, that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the fan, and skurried away.\"}', 2, '2023-03-29 11:10:11', '2023-03-29 11:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service` longtext NOT NULL,
  `options` longtext DEFAULT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_status_id` int(10) UNSIGNED DEFAULT NULL,
  `address` longtext NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` longtext DEFAULT NULL,
  `taxes` longtext DEFAULT NULL,
  `booking_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `hint` text DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `e_service`, `options`, `quantity`, `user_id`, `booking_status_id`, `address`, `payment_id`, `coupon`, `taxes`, `booking_at`, `start_at`, `ends_at`, `hint`, `cancel`, `created_at`, `updated_at`) VALUES
(106, '{\"id\":2,\"name\":\"Gutter Cleaning\",\"price\":43.85,\"discount_price\":0,\"price_unit\":\"fixed\",\"quantity_unit\":\"\",\"duration\":\"03:00\",\"enable_booking\":false}', '[]', 1, 18, 2, '{\"id\":15,\"description\":null,\"address\":\"DC Road\",\"latitude\":0,\"longitude\":0}', 40, NULL, '[]', '2023-04-15 05:28:47', NULL, NULL, NULL, 0, '2023-04-14 23:30:24', '2023-04-14 23:34:17'),
(107, '{\"id\":2,\"name\":\"Gutter Cleaning\",\"price\":43.85,\"discount_price\":0,\"price_unit\":\"fixed\",\"quantity_unit\":\"\",\"duration\":\"03:00\",\"enable_booking\":false}', '[]', 1, 18, 2, '{\"id\":15,\"description\":null,\"address\":\"DC Road\",\"latitude\":0,\"longitude\":0}', 41, NULL, '[]', '2023-04-15 05:34:28', NULL, NULL, NULL, 0, '2023-04-14 23:34:52', '2023-04-14 23:35:11'),
(108, '{\"id\":2,\"name\":\"Gutter Cleaning\",\"price\":43.85,\"discount_price\":0,\"price_unit\":\"fixed\",\"quantity_unit\":\"\",\"duration\":\"03:00\",\"enable_booking\":false}', '[]', 1, 18, 2, '{\"id\":15,\"description\":null,\"address\":\"DC Road\",\"latitude\":0,\"longitude\":0}', NULL, NULL, '[]', '2023-04-15 05:35:53', NULL, NULL, NULL, 0, '2023-04-14 23:36:10', '2023-04-14 23:36:10'),
(109, '{\"id\":5,\"name\":\"Snow Removal\",\"price\":48.76,\"discount_price\":0,\"price_unit\":\"fixed\",\"quantity_unit\":\"\",\"duration\":\"04:00\",\"enable_booking\":false}', '[]', 1, 18, 2, '{\"id\":15,\"description\":null,\"address\":\"DC Road\",\"latitude\":0,\"longitude\":0}', NULL, NULL, '[]', '2023-04-15 07:24:54', NULL, NULL, NULL, 0, '2023-04-15 01:25:23', '2023-04-15 01:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Received', 1, '2021-01-25 13:25:46', '2021-01-29 11:56:35'),
(2, 'In Progress', 40, '2021-01-25 13:26:02', '2021-02-16 15:56:52'),
(3, 'On the Way', 20, '2021-01-28 01:47:23', '2021-02-16 06:10:13'),
(4, 'Accepted', 10, '2021-02-16 06:09:29', '2021-02-16 06:10:06'),
(5, 'Ready', 30, '2021-02-16 06:11:50', '2021-02-16 15:56:42'),
(6, 'Done', 50, '2021-02-16 15:57:02', '2021-02-16 15:57:02'),
(7, 'Failed', 60, '2021-02-16 15:58:36', '2021-02-16 15:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `color` varchar(36) NOT NULL,
  `description` longtext DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `description`, `order`, `featured`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Residential Service', '#ff9f43', '<p>At Men In Kilts, our work is exterior home cleaning, but our mission is to deliver extraordinary experiences. Our combination of professional-grade equipment, innovative processes, and a commitment to excellence results in a home that shines and an experience that’s nothing short of extraordinary. It’s all backed by our commitment to raising the bar, providing high-quality services, and holding ourselves to the highest standards. \n\nLots of people can clean your home’s exterior, but only our exterior cleaning experts do it with a knowledgeable eye for detail and a dedication to providing customer service that raises the bar on what it means to be a trusted partner. They assess each job individually, take the time to understand your property and your needs, and then decide on the best treatment method. \n\nOnce finished, our technicians do a thorough walk-through to ensure results meet our exceptionally high standards. Best of all, our results are backed by our Clean Guarantee. When you spot the tartan, you know you’re in good hands.</p>', 1, 1, NULL, '2021-01-19 11:01:35', '2021-01-31 08:19:56'),
(2, 'Commercial Service', '#0abde3', '<p>If you’re ready for your business to look its best, the team at Men In Kilts is ready to make it sparkle. From window washing to gutter cleaning to pressure washing, we’ll take care of your business’s outside so you can handle everything on the inside. Our kilted technicians are equipped to handle every type of building exterior and we know how to take down what nature builds up. \n\nThanks to professional-grade equipment, customized solutions, and a team that takes a lot of pride in a job well done, we’re able to produce results that impress and provide an experience that’s nothing short of extraordinary.</p>', 2, 1, NULL, '2021-01-19 12:05:00', '2021-01-31 07:35:11'),
(3, 'Laundry Service', '#ee5253', '<p>Category for all Laundry Service</p>', 3, 1, NULL, '2021-01-31 07:37:04', '2021-02-01 18:33:10'),
(4, 'Beauty & Hair Cuts', '#10ac84', '<p>Category for Hair Cuts and Barber</p>', 4, 0, NULL, '2021-01-31 07:38:37', '2021-02-23 08:37:09'),
(5, 'Washing & Cleaning', '#5f27cd', '<p>Category for&nbsp;Washing &amp; Cleaning&nbsp;</p>', 5, 0, NULL, '2021-01-31 07:42:02', '2021-01-31 07:42:02'),
(6, 'Media & Photography', '#ff9f43', '<p>Category for Media & Photography</p>', 6, 0, NULL, '2021-01-31 07:43:20', '2021-01-31 08:55:51'),
(7, 'Sewer Cleaning', '#5f27cd', '<p>Category for Sewer Cleaning<br></p>', 1, 0, 5, '2021-01-31 08:46:15', '2021-01-31 08:46:30'),
(8, 'Carpet Cleaning', '#5f27cd', '<p>Category for Carpet Cleaning<br></p>', 2, 0, 5, '2021-01-31 08:47:23', '2021-01-31 08:47:23'),
(9, 'Wheel Repair', '#5f27cd', '<p>Category for Wheel Repair<br></p>', 1, 0, 1, '2021-01-31 08:49:40', '2021-01-31 08:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `phone_number`, `message`, `created_at`, `updated_at`) VALUES
(1, '', 'kuzonury@mailinator.com', 'Nobis consequatur E', '+1 (157) 929-5925', 'Voluptatem nulla omn', '2023-04-13 07:51:49', '2023-04-13 07:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) NOT NULL DEFAULT 'percent',
  `description` longtext DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `discount_type`, `description`, `expires_at`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'PROMO', 1.00, 'percent', '{\"en\":null}', '2023-03-30 17:14:00', 1, '2023-03-29 01:14:28', '2023-03-29 01:14:28'),
(2, 'HAPPY', 5.00, 'fixed', '{\"en\":\"Nisi do aperiam non . ghg\"}', '2023-04-29 18:36:00', 1, '2023-04-05 02:37:17', '2023-04-05 02:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `symbol` longtext DEFAULT NULL,
  `code` longtext DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 09:50:48', '2020-10-22 09:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2020-10-22 09:51:39', '2020-10-22 09:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2020-10-22 09:52:50', '2020-10-22 09:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2020-10-22 09:53:22', '2020-10-22 09:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2020-10-22 09:54:00', '2020-10-22 09:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2020-10-22 09:55:51', '2020-10-22 09:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2020-10-22 09:56:26', '2020-10-22 09:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) NOT NULL,
  `type` varchar(56) NOT NULL,
  `values` varchar(191) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-06 15:43:58', '2019-09-06 15:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-06 15:49:22', '2019-09-06 15:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext DEFAULT NULL,
  `view` longtext DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(30, 'Explicabo. Eum provi. qq <span style=\\\"color: rgb(0, 0, 0); font-family: \\\"Open Sans\\\", Arial, sans-serif; font-size: 14px; text-align: justify;\\\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.</span><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \\\"Open Sans\\\", Arial, sans-serif; font-size: 14px;\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.</p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \\\"Open Sans\\\", Arial, sans-serif; font-size: 14px;\\\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'Explicabo. Eum provi. qq Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 5, 'App\\Models\\User', 2, '2019-09-06 15:52:30', '2023-04-09 22:02:41'),
(31, 'Modi est libero qui', 'Modi est libero qui', 6, 'App\\Models\\User', 2, '2019-09-06 15:52:30', '2021-02-02 05:32:57'),
(33, 'Consequatur error ip.&nbsp;', 'Consequatur error ip.&nbsp;', 5, 'App\\Models\\User', 1, '2019-09-06 15:53:58', '2021-02-02 05:32:01'),
(34, 'Qui vero ratione vel', 'Qui vero ratione vel', 6, 'App\\Models\\User', 1, '2019-09-06 15:53:58', '2021-02-02 05:32:01'),
(36, 'Ex qui elit nemo qu', 'Ex qui elit nemo qu', 5, 'App\\Models\\User', 3, '2019-10-15 11:21:32', '2023-04-04 19:25:45'),
(37, 'Dolor ab reprehender4wt43q', 'Dolor ab reprehender4wt43q', 6, 'App\\Models\\User', 3, '2019-10-15 11:21:32', '2023-04-05 03:46:50'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-16 13:31:46', '2019-10-16 13:31:46'),
(40, 'Sequi molestiae ipsa1', 'Sequi molestiae ipsa1', 6, 'App\\Models\\User', 4, '2019-10-16 13:31:46', '2021-02-21 17:32:10'),
(42, 'Omnis fugiat et cons.', 'Omnis fugiat et cons.', 5, 'App\\Models\\User', 5, '2019-12-15 12:49:44', '2021-02-02 05:29:47'),
(43, 'Consequatur delenit', 'Consequatur delenit', 6, 'App\\Models\\User', 5, '2019-12-15 12:49:44', '2021-02-02 05:29:47'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-29 11:28:05', '2020-03-29 11:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-29 11:28:05', '2020-03-29 11:28:05'),
(48, 'Voluptatem. Omnis op.', 'Voluptatem. Omnis op.', 5, 'App\\Models\\User', 7, '2021-01-17 10:13:24', '2021-02-02 05:31:36'),
(49, 'Perspiciatis aut ei', 'Perspiciatis aut ei', 6, 'App\\Models\\User', 7, '2021-01-17 10:13:24', '2021-02-02 05:31:36'),
(51, 'sdfsdf56', 'sdfsdf56', 5, 'App\\Models\\User', 8, '2021-02-10 05:31:12', '2021-02-19 08:09:37'),
(52, 'Adressttt', 'Adressttt', 6, 'App\\Models\\User', 8, '2021-02-10 05:31:12', '2021-02-19 07:57:27'),
(53, NULL, '', 5, 'App\\Models\\User', 9, '2023-03-29 18:49:22', '2023-03-29 18:49:22'),
(54, NULL, NULL, 6, 'App\\Models\\User', 9, '2023-03-29 18:49:22', '2023-03-29 18:49:22'),
(55, NULL, '', 5, 'App\\Models\\User', 10, '2023-04-01 04:58:15', '2023-04-01 04:58:15'),
(56, NULL, NULL, 6, 'App\\Models\\User', 10, '2023-04-01 04:58:16', '2023-04-01 04:58:16'),
(57, NULL, '', 5, 'App\\Models\\User', 16, '2023-04-02 20:09:41', '2023-04-02 20:09:41'),
(58, NULL, NULL, 6, 'App\\Models\\User', 16, '2023-04-02 20:09:41', '2023-04-02 20:09:41'),
(59, NULL, '', 5, 'App\\Models\\User', 17, '2023-04-05 18:02:49', '2023-04-05 18:02:49'),
(60, NULL, NULL, 6, 'App\\Models\\User', 17, '2023-04-05 18:02:49', '2023-04-05 18:02:49'),
(61, NULL, '', 5, 'App\\Models\\User', 18, '2023-04-08 20:13:23', '2023-04-08 20:13:23'),
(62, 'DC Road', 'DC Road', 6, 'App\\Models\\User', 18, '2023-04-08 20:13:24', '2023-04-10 17:51:46'),
(63, NULL, '', 5, 'App\\Models\\User', 19, '2023-04-08 20:40:55', '2023-04-08 20:40:55'),
(64, NULL, NULL, 6, 'App\\Models\\User', 19, '2023-04-08 20:40:55', '2023-04-08 20:40:55'),
(65, NULL, '', 5, 'App\\Models\\User', 20, '2023-04-08 20:47:13', '2023-04-08 20:47:13'),
(66, NULL, NULL, 6, 'App\\Models\\User', 20, '2023-04-08 20:47:13', '2023-04-08 20:47:13'),
(67, NULL, '', 5, 'App\\Models\\User', 21, '2023-04-08 20:49:30', '2023-04-08 20:49:30'),
(68, NULL, NULL, 6, 'App\\Models\\User', 21, '2023-04-08 20:49:30', '2023-04-08 20:49:30'),
(69, NULL, '', 5, 'App\\Models\\User', 22, '2023-04-10 21:19:12', '2023-04-10 21:19:12'),
(70, NULL, NULL, 6, 'App\\Models\\User', 22, '2023-04-10 21:19:12', '2023-04-10 21:19:12');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h1>Privacy Policy of SmarterVision</h1>\r\n<p>SmarterVision operates the SmarterVision website, which provides the SERVICE.</p>\r\n<p>This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the smartersvision.com website.</p>\r\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at smartersvision.com, unless otherwise defined in this Privacy Policy.</p>\r\n<h2>Information Collection and Use</h2>\r\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.</p>\r\n<h2>Log Data</h2>\r\n<p>We want to inform you that whenever you visit our Service, we collect information that your browser sends to us which is called Log Data. This Log Data may include information such as your computer\'s Internet Protocol (“IP”) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.</p>\r\n<h2>Cookies</h2>\r\n<p>Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer\'s hard drive.</p>\r\n<p>Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.</p>\r\n<h2>Service Providers</h2>\r\n<p>We may employ third-party companies and individuals due to the following reasons:</p>\r\n<ul>\r\n<li>To facilitate our Service;</li>\r\n<li>To provide the Service on our behalf;</li>\r\n<li>To perform Service-related services; or</li>\r\n<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n<p>We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n<h2>Security</h2>\r\n<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>\r\n<h2>Links to Other Sites</h2>\r\n<p>Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n<h2>Children\'s Privacy</h2>\r\n<p>Our Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.</p>\r\n<h2>Changes to This Privacy Policy</h2>\r\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p>\r\n<h2>Contact Us</h2>\r\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>', 1, '2021-02-24 05:53:21', '2021-02-24 07:19:19'),
(2, 'Terms & Conditions', '<h2>Terms &amp; Conditions</h2><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.</p><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.<br></p>', 1, '2021-02-24 07:20:06', '2021-02-24 07:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discountables`
--

INSERT INTO `discountables` (`id`, `coupon_id`, `discountable_type`, `discountable_id`) VALUES
(15, 2, 'App\\Models\\EService', 5),
(16, 2, 'App\\Models\\EService', 7),
(17, 2, 'App\\Models\\EService', 9),
(18, 2, 'App\\Models\\EService', 6),
(19, 2, 'App\\Models\\EService', 10),
(20, 2, 'App\\Models\\EProvider', 16),
(21, 2, 'App\\Models\\Category', 1),
(22, 2, 'App\\Models\\Category', 2),
(23, 2, 'App\\Models\\Category', 3),
(24, 2, 'App\\Models\\Category', 4),
(25, 2, 'App\\Models\\Category', 5),
(26, 2, 'App\\Models\\Category', 6),
(27, 2, 'App\\Models\\Category', 7),
(28, 2, 'App\\Models\\Category', 8),
(29, 2, 'App\\Models\\Category', 9);

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_bookings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `e_provider_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `taxes` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `email`, `subject`, `phone_number`, `message`, `created_at`, `updated_at`) VALUES
(3, 'qufaka@mailinator.com', 'Ea Nam repellendus', '+1 (416) 983-6111', 'Inventore sequi odit', '2023-04-13 19:50:52', '2023-04-13 19:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `service` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `estimates`
--

INSERT INTO `estimates` (`id`, `email`, `subject`, `phone_number`, `service`, `message`, `created_at`, `updated_at`) VALUES
(2, 'fovo@mailinator.com', 'Ea minim odit saepe', '+1 (779) 894-7686', 'Window Cleaning', 'Pariatur Obcaecati', '2023-04-13 00:03:52', '2023-04-13 00:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Et impedit et quisquam qui ex tenetur ut. Facilis incidunt minima omnis deleniti. Ut et et id voluptatum.\"}', '{\"en\":\"Hatter. \'You MUST remember,\' remarked the King, going up to them she heard it say to itself, half to itself, half to itself, \'Oh dear! Oh dear! I shall see it trying in a day is very confusing.\' \'It.\"}', 1, '2023-03-29 11:10:17', '2023-03-29 11:10:17'),
(2, '{\"en\":\"Est nobis consequuntur consequuntur quis vel aut. Omnis ex sint quibusdam rem harum aut est sint.\"}', '{\"en\":\"Suppress him! Pinch him! Off with his head!\' or \'Off with her head on her spectacles, and began to cry again. \'You ought to have been ill.\' \'So they were,\' said the Lory hastily. \'I don\'t know the.\"}', 5, '2023-03-29 11:10:17', '2023-03-29 11:10:17'),
(3, '{\"en\":\"Sed id repellat non nesciunt ullam et culpa. Aut enim unde ut iusto. Sit ipsam soluta ullam tenetur eos aut reprehenderit.\"}', '{\"en\":\"Mock Turtle, and said to herself; \'I should like it put more simply--\\\"Never imagine yourself not to be listening, so she went down on their hands and feet at the Gryphon as if nothing had happened.\"}', 1, '2023-03-29 11:10:17', '2023-03-29 11:10:17'),
(4, '{\"en\":\"Dolorum delectus qui omnis modi. Odit aut temporibus laudantium reprehenderit doloremque.\"}', '{\"en\":\"Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King laid his hand upon her face. \'Very,\' said Alice: \'allow me to him: She gave me a good deal on where you want to be?\' it asked.\"}', 5, '2023-03-29 11:10:17', '2023-03-29 11:10:17'),
(5, '{\"en\":\"Totam voluptates quasi repudiandae sed quisquam. Dolore et corporis minus. Est vero nihil placeat architecto.\"}', '{\"en\":\"Gryphon at the Lizard in head downwards, and the pair of white kid gloves, and was going a journey, I should understand that better,\' Alice said nothing; she had grown so large in the same thing.\"}', 1, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(6, '{\"en\":\"Cumque placeat quam voluptates nesciunt. Culpa placeat tempora in veniam. In at impedit quae ut dolorum totam.\"}', '{\"en\":\"Alice. \'Nothing WHATEVER?\' persisted the King. \'Nearly two miles high,\' added the Queen. \'Never!\' said the Gryphon, and, taking Alice by the way, was the BEST butter, you know.\' \'Not the same as.\"}', 1, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(7, '{\"en\":\"Itaque rerum asperiores id non. Aliquam autem architecto libero. Perferendis sint perspiciatis enim eaque ut optio enim.\"}', '{\"en\":\"But she did not dare to disobey, though she looked up, and reduced the answer to it?\' said the King. The White Rabbit blew three blasts on the top of her going, though she knew the meaning of it now.\"}', 4, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(8, '{\"en\":\"Sed ea dolores alias et. Laborum alias rerum iusto mollitia et aut. Omnis aperiam aspernatur aspernatur eaque.\"}', '{\"en\":\"Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must go back by railway,\' she said to the Cheshire Cat, she.\"}', 3, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(9, '{\"en\":\"Ut esse cupiditate reprehenderit aut rerum iusto. Repudiandae et tenetur qui enim natus reprehenderit sit.\"}', '{\"en\":\"Alice said nothing: she had to kneel down on one of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the birds and.\"}', 1, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(10, '{\"en\":\"Dolor quam magni est rerum. Saepe tempore dolore molestiae quo. Ullam voluptatum quia sed sunt.\"}', '{\"en\":\"Dormouse,\' thought Alice; \'but when you have of putting things!\' \'It\'s a pun!\' the King said, for about the twentieth time that day. \'That PROVES his guilt,\' said the Mouse, turning to Alice, and.\"}', 8, '2023-03-29 11:10:18', '2023-03-29 11:10:18'),
(11, '{\"en\":\"Qui magna qui aut id1\"}', '{\"en\":\"Ullam sit ea rerum u.1\"}', 1, '2023-03-29 21:24:31', '2023-03-29 21:24:31'),
(12, '{\"en\":\"Dolores maiores in e12\"}', '{\"en\":\"Doloremque iste ipsa.12\"}', 2, '2023-03-29 21:24:48', '2023-03-29 21:24:48'),
(13, '{\"en\":\"Doloremque qui excep12\"}', '{\"en\":\"Quam est voluptas ea.12\"}', 2, '2023-03-29 22:15:30', '2023-03-29 22:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `e_providers`
--

CREATE TABLE `e_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `e_provider_type_id` int(10) UNSIGNED NOT NULL,
  `types` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_addresses`
--

CREATE TABLE `e_provider_addresses` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_addresses`
--

INSERT INTO `e_provider_addresses` (`user_id`, `address_id`) VALUES
(1, 10),
(2, 4),
(2, 8),
(2, 9),
(3, 2),
(3, 6),
(3, 10),
(4, 4),
(4, 5),
(4, 8),
(5, 6),
(5, 9),
(6, 12),
(7, 2),
(7, 6),
(7, 7),
(8, 4),
(8, 9);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_payouts`
--

CREATE TABLE `e_provider_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(127) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_taxes`
--

CREATE TABLE `e_provider_taxes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_taxes`
--

INSERT INTO `e_provider_taxes` (`user_id`, `tax_id`) VALUES
(6, 1),
(18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_types`
--

CREATE TABLE `e_provider_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT 0.00,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_types`
--

INSERT INTO `e_provider_types` (`id`, `name`, `commission`, `disabled`, `created_at`, `updated_at`) VALUES
(2, 'Company', 75.00, 0, '2021-01-13 12:05:35', '2021-02-01 15:22:19'),
(3, 'Freelancer', 50.00, 0, '2021-01-17 13:27:18', '2021-02-24 12:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_users`
--

CREATE TABLE `e_provider_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_services`
--

CREATE TABLE `e_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(10,2) DEFAULT 0.00,
  `price_unit` enum('hourly','fixed') NOT NULL,
  `quantity_unit` longtext DEFAULT NULL,
  `duration` varchar(16) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `enable_booking` tinyint(1) DEFAULT 1,
  `available` tinyint(1) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_services`
--

INSERT INTO `e_services` (`id`, `name`, `price`, `discount_price`, `price_unit`, `quantity_unit`, `duration`, `description`, `featured`, `enable_booking`, `available`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Window Cleaning\"}', 38.95, 30.90, 'hourly', '{\"en\":null}', '02:00', '{\"en\":\"Window cleaning may look like an art, but it’s a science. And like most scientific pursuits, the difference between amazing results and unmitigated disasters is a lot of know-how and a little elbow grease.\\r\\n\\r\\nMen In Kilts’s home window cleaning experts are armed with both. Not only are they equipped with top-of-the-line tools and proprietary cleaning products, but they also know how to use those tools and products in a way that will give your home the best results.\\r\\n\\r\\nThat means sparkling windows that don’t just look good – they’ll be better protected against scratches and cracks and able to add some natural light into your home.\"}', 1, 0, 1, 2, '2023-03-29 11:09:53', '2023-04-07 20:09:31'),
(2, '{\"en\":\"Gutter Cleaning\"}', 43.85, 0.00, 'fixed', '{\"en\":null}', '03:00', '{\"en\":\"While the other guys will come to your home with the bare necessities, Men In Kilts takes things to another level. We’ve got technology on our side, which means your gutters will be thoroughly cleaned and unclogged thanks to state-of-the-art gutter vacuums that powerfully remove debris in minutes and clean the spaces hands can’t find. Our high reach means our gutter cleaning team can handle the tough jobs others can’t – that’s why they call us in to finish the work.\\r\\n\\r\\nCleaning your gutters is important because this will help you avoid future leaks, cracks in your foundation and prevent critters from creating homes in collected debris. Clean, free-flowing gutters can also boost the curb appeal of your home. To make sure we’ve left your gutters in the best possible shape, we use high-definition gutter cameras to inspect every nook and cranny. That’s how we clean the spaces those other guys leave behind.\"}', 1, 0, 1, 1, '2023-03-29 11:09:53', '2023-04-07 20:27:11'),
(3, '{\"en\":\"House Washing\"}', 18.07, 0.00, 'hourly', '{\"en\":null}', '01:00', '{\"en\":\"When was the last time the exterior of your home received a detailed, thorough cleaning? Extended exposure to the elements can show on your home. Men In Kilts is here to help. Hard work, soft touch - that’s how we approach every house washing project. Using the wrong amount of pressure can damage your home, and traditional soapy cleaners don’t actually clean that well. \\r\\n\\r\\nThat’s why the Men In Kilts team uses a soft wash process that safely and effectively removes dirt, algae, and other organic debris that’s accumulated on your home with a low-pressure detergent application and a low-pressure rinse. High quality, low pressure. Yep, that’s how we get the job done right each and every time.\"}', 1, 0, 1, 6, '2023-03-29 11:09:53', '2023-04-07 20:27:37'),
(4, '{\"en\":\"Pressure Washing\"}', 18.38, 0.00, 'hourly', '{\"en\":null}', '04:00', '{\"en\":\"When you think of pressure washing, what comes to mind? Blowing away dirt, grime, and stains with the maximum amount of horsepower? Did you know that using that much muscle can often cause more harm than good, damaging new driveways, wood, and other sensitive surfaces? Safe, effective pressure washing requires the perfect level of water pressure. Our team has experience cleaning the following areas:\\r\\n\\r\\nDriveways\\r\\nWalkways\\r\\nDecks and fences\\r\\nPatios\\r\\nPlayground equipment\\r\\nRetaining walls\\r\\nPool Decks\\r\\nProtect your home by calling the professionals at Men In Kilts. We know that sometimes getting the toughest clean means using the softest touch. That’s why we use the exact amount of pressure necessary to make sure you get the results you want with no unpleasant side effects.\\r\\n\\r\\nOur pressure washing company also offers the following services:\\r\\n\\r\\nOil stain removal\\r\\nRust stain removal\\r\\nGraffiti removal\\r\\nOxidation or efflorescence\"}', 1, 0, 1, 2, '2023-03-29 11:09:53', '2023-04-07 20:18:47'),
(5, '{\"en\":\"Snow Removal\"}', 48.76, 0.00, 'fixed', '{\"en\":null}', '04:00', '{\"en\":\"Snow is beautiful when it’s falling. Light fluffy flakes covering lawns and trees, snow drifts giving your property a magical look. However, when the storm has passed and the cleanup begins, it can be far less enjoyable. Removing snow from walkways and driveways can be more than just time-consuming – it can be hard work and hard on your back. So why not leave this tiring task to the team at Men In Kilts? We offer fast and thorough snow removal and will get your property cleaned up in no time. \\r\\n\\r\\nOur local snow removal professionals use both snow blowers and hand shovels to clean up your property. Please note that not all of our locations offer snow removal. Contact your local team for more details. \\r\\n\\r\\nIn addition to removing snow from your driveway and sidewalks, Men In Kilts also offers the following:\\r\\n\\r\\nSnow removal for vehicles (select locations)\\r\\nIce melt application\"}', 1, 0, 1, 16, '2023-03-29 11:09:53', '2023-04-09 19:09:38'),
(6, '{\"en\":\"Window Cleaning\"}', 25.96, 18.55, 'hourly', NULL, '1:00', 'Whether it’s a retail store or an apartment complex, commercial properties should always look their best. People make quick judgments of places based on their first impressions, so appearances are crucial. If you own or manage a commercial property, partnering with Men In Kilts is a great way to ensure your property always looks its best. If the windows of your building are dirty or look worn and tired, they may detract from the overall appearance of your property.\n\nWe offer commercial window cleaning services and can make sure your glass is always shining bright. Our kilted technicians use biodegradable, eco-friendly cleaning solutions and detailed processes that clean your windows and ensure they stay clean for longer. \n\nAre you a property manager or a landlord? We’ll make it easy to communicate with your tenants about our upcoming services to minimize any disruptions.', 1, 1, 1, 7, '2023-03-29 11:09:53', '2023-03-29 11:09:53'),
(7, '{\"en\":\"Gutter Cleaning \"}', 21.21, 0.00, 'hourly', NULL, '5:00', 'The team at Men In Kilts is ready to deliver the reliable and thorough commercial gutter cleaning services you need. We do more than the bare minimum – we go above and beyond and use the best technology to clear and unclog your gutters of leaves, dirt, dust, and other debris that collects over time. We can even remove nests from rodents to keep your gutters flowing season after season.\n\nRegardless of the type of commercial property you own or manage, you can rest assured that we can reach every corner of your building and always adhere to strict safety standards. Our commercial gutter cleaning team will be sure to take into consideration your business hours and will try to avoid being disruptive to any customers or clients.', 1, 1, 1, 3, '2023-03-29 11:09:53', '2023-03-29 11:09:53'),
(8, '{\"en\":\"Building Washing \"}', 49.65, 47.68, 'fixed', NULL, '5:00', 'Men In Kilts approaches exterior building washing with an awareness that every property is different and may have unique needs. High pressure can be too harsh on your property, while soapy cleaners aren’t often effective enough. Our exterior building washing team uses a soft wash process that is tough on dirt, grime, algae, and other debris while being gentle on paint, siding, and other surfaces.\n\nBuilding washing may seem like a simple process, but it’s far more complex. To deliver the best results, our team takes the time to determine the best approach. Our soft wash uses proprietary products to neutralize organic dirt and debris and then a low-pressure spray to rinse it away, leaving you with quality, lasting results. Put your best foot forward and make a great first impression with routine commercial exterior building washing from Men In Kilts.', 1, 0, 1, 6, '2023-03-29 11:09:53', '2023-03-29 11:09:53'),
(9, '{\"en\":\"Pressure Washing\"}', 10.41, 0.00, 'hourly', NULL, '5:00', 'The Men In Kilts team is ready to deliver the cleanest of cleans for your commercial property. We offer commercial pressure washing services for properties of all industries and sizes and use effective yet safe methods that tackle the toughest jobs. Whether you are seeking help removing stains, mold, and other debris from parking lots, sidewalks, or loading bays, we have experience with these and more and can handle every area of your property. Our commercial pressure washing team uses industrial pressure washers with high PSI pressure washing units and surface cleaners. With us, your property is in the best hands.', 1, 0, 1, 3, '2023-03-29 11:09:53', '2023-03-29 11:09:53'),
(10, '{\"en\":\"Snow Removal\"}', 34.07, 0.00, 'fixed', '{\"en\":null}', '02:00', '{\"en\":\"Protect your customers, employees, and guests – and your business – by keeping your commercial property free and clear of snow and ice this winter season. Men In Kilts wants to be your partner in staying on top of this important task. We are a full-service provider of a variety of commercial services, including snow removal, and will handle this tough, time-consuming job so that you can focus on running your business. \\r\\n\\r\\nOur commercial snow removal team uses both snow blowers and hand shovels, and some locations use plows, to clean every area you need, from driveways to walkways to loading bays. And we don’t stop there. After we’ve removed the snow, we’ll then use ice melt to make sure the surfaces don’t become slippery. \\r\\n\\r\\nMen In Kilts can work with you for a variety of your needs in addition to snow removal, including window cleaning and pressure washing, eliminating the need to hire multiple vendors. This will save you time, money, and hassle and lead to a cleaner and tidier property for your tenants, employees, and guests.\"}', 1, 1, 1, 9, '2023-03-29 11:09:54', '2023-04-07 20:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `e_service_categories`
--

CREATE TABLE `e_service_categories` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_categories`
--

INSERT INTO `e_service_categories` (`e_service_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `e_service_reviews`
--

CREATE TABLE `e_service_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text DEFAULT NULL,
  `rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_reviews`
--

INSERT INTO `e_service_reviews` (`id`, `review`, `rate`, `user_id`, `e_service_id`, `provider_name`, `created_at`, `updated_at`) VALUES
(1, 'Improve his shining tail, And pour the waters of the other end of every line: \'Speak roughly to.', '2.00', 8, 4, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(2, 'I meant,\' the King said to Alice, flinging the baby with some surprise that the reason and all.', '1.00', 7, 3, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(3, 'Knave was standing before them, in chains, with a kind of sob, \'I\'ve tried every way, and nothing.', '2.00', 7, 4, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(4, 'Hatter. \'You might just as well as she was quite a large flower-pot that stood near. The three.', '5.00', 3, 8, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(5, 'English!\' said the Footman, and began staring at the mushroom (she had kept a piece of rudeness.', '1.00', 3, 4, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(6, 'Alice in a hurry that she never knew whether it would make with the Queen jumped up and walking.', '4.00', 8, 5, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(7, 'She was looking at Alice as it was YOUR table,\' said Alice; \'living at the White Rabbit, trotting.', '4.00', 5, 7, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(8, 'Indeed, she had got its head down, and nobody spoke for some time in silence: at last it sat down.', '1.00', 3, 1, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(9, 'INSIDE, you might like to have lessons to learn! No, I\'ve made up my mind about it; and while she.', '5.00', 8, 9, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(10, 'Caterpillar. \'Is that all?\' said Alice, \'how am I to get out at all for any lesson-books!\' And so.', '4.00', 3, 6, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(11, 'I to get very tired of sitting by her sister on the Duchess\'s voice died away, even in the.', '1.00', 5, 7, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(12, 'Alice: he had never done such a curious appearance in the sea, though you mayn\'t believe it--\' \'I.', '3.00', 5, 2, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(13, 'Gryphon. Alice did not notice this last remark. \'Of course not,\' said the Duchess. \'I make you a.', '2.00', 5, 3, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(14, 'Caterpillar. Alice folded her hands, wondering if anything would EVER happen in a whisper.) \'That.', '4.00', 7, 1, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(15, 'Alice heard the Queen was in March.\' As she said this, she was peering about anxiously among the.', '1.00', 5, 8, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(16, 'Alice, very loudly and decidedly, and there she saw them, they were all talking at once, while all.', '3.00', 7, 7, '', '2023-03-29 11:09:57', '2023-03-29 11:09:57'),
(17, 'Queen in front of the house opened, and a large ring, with the glass table as before, \'and things.', '3.00', 3, 8, '', '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(18, 'For instance, suppose it were nine o\'clock in the kitchen. \'When I\'M a Duchess,\' she said this.', '1.00', 3, 6, '', '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(19, 'I think--\' (she was obliged to say when I was a long sleep you\'ve had!\' \'Oh, I\'ve had such a thing.', '4.00', 8, 6, '', '2023-03-29 11:09:58', '2023-03-29 11:09:58'),
(20, 'Alice had no reason to be lost: away went Alice like the three gardeners, oblong and flat, with.', '1.00', 8, 10, '', '2023-03-29 11:09:58', '2023-03-29 11:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Maiores modi omnis aut. Qui ullam totam modi et. Sit quod tempore consequatur harum aspernatur ab.\"}', '{\"en\":\"French mouse, come over with William the Conqueror.\' (For, with all their simple joys, remembering her own courage. \'It\'s no use going back to the executioner: \'fetch her here.\' And the Gryphon went.\"}', 1, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(2, '{\"en\":\"Harum aut quam quia possimus. Consequatur dolores ut dolores. Soluta optio quia esse sapiente.\"}', '{\"en\":\"I--\' \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t like them!\' When the sands are all dry, he is gay as a boon, Was kindly permitted to pocket the spoon: While the Duchess said to live.\"}', 3, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(3, '{\"en\":\"Voluptatem similique et et. Quia molestiae ex sit hic ratione dignissimos.\"}', '{\"en\":\"Just at this moment Five, who had been looking at it gloomily: then he dipped it into one of the sort!\' said Alice. \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I don\'t see any wine,\' she remarked.\"}', 2, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(4, '{\"en\":\"Est consequatur id omnis tempore dicta dolorem. Cum quia magnam officiis sapiente nemo aut.\"}', '{\"en\":\"CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice (she was so small as this before, never! And I declare it\'s too bad, that it might tell her something worth hearing. For some.\"}', 4, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(5, '{\"en\":\"Vero laboriosam laborum eligendi sunt cupiditate sunt. Qui optio itaque nam quos.\"}', '{\"en\":\"Hatter: \'let\'s all move one place on.\' He moved on as he fumbled over the fire, and at last came a little now and then treading on her hand, and Alice was just going to say,\' said the Duck: \'it\'s.\"}', 1, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(6, '{\"en\":\"Rerum autem sint distinctio. Sit quis nam nihil unde. A vero vero incidunt porro ipsa accusamus.\"}', '{\"en\":\"Alice, and looking at the Queen, and Alice, were in custody and under sentence of execution. Then the Queen to play croquet.\' Then they both bowed low, and their curls got entangled together. Alice.\"}', 3, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(7, '{\"en\":\"Ut est excepturi autem ad occaecati. At architecto dolor qui. Quasi est et explicabo.\"}', '{\"en\":\"For this must ever be A secret, kept from all the jelly-fish out of its right paw round, \'lives a Hatter: and in a confused way, \'Prizes! Prizes!\' Alice had got its head impatiently, and walked a.\"}', 4, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(8, '{\"en\":\"Inventore vero veniam illo consequatur possimus. Minus culpa ut et minima porro eos itaque.\"}', '{\"en\":\"I don\'t know,\' he went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the Queen, tossing her head through the doorway; \'and even if my head would go through,\'.\"}', 1, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(9, '{\"en\":\"Reprehenderit quam aperiam voluptatem. Perspiciatis ut impedit qui animi.\"}', '{\"en\":\"Which shall sing?\' \'Oh, YOU sing,\' said the Dormouse; \'VERY ill.\' Alice tried to fancy to herself \'It\'s the oldest rule in the schoolroom, and though this was the matter worse. You MUST have meant.\"}', 3, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(10, '{\"en\":\"Ut aut id necessitatibus quasi nesciunt perferendis. Odit sint molestiae pariatur velit aut non.\"}', '{\"en\":\"Alice was silent. The King laid his hand upon her knee, and the moon, and memory, and muchness--you know you say \\\"What a pity!\\\"?\' the Rabbit came near her, about the same thing a bit!\' said the.\"}', 1, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(11, '{\"en\":\"Modi atque quia eum. Eos enim aspernatur in vero molestias iste illo.\"}', '{\"en\":\"King replied. Here the other was sitting on a branch of a muchness\\\"--did you ever see you any more!\' And here Alice began to say but \'It belongs to the Queen. \'I never could abide figures!\' And with.\"}', 1, '2023-03-29 11:10:07', '2023-03-29 11:10:07'),
(12, '{\"en\":\"Quo nisi inventore autem adipisci pariatur nemo officia. Repellendus placeat fuga tempora quos.\"}', '{\"en\":\"White Rabbit cried out, \'Silence in the flurry of the sort. Next came an angry tone, \'Why, Mary Ann, what ARE you talking to?\' said one of the lefthand bit. * * * * * * * * * * * * * * * * \'What a.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(13, '{\"en\":\"Excepturi a pariatur placeat quam. Ducimus atque et aliquam. Commodi amet qui non quidem.\"}', '{\"en\":\"Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never said I could shut up like telescopes: this time she found herself in Wonderland, though she felt that it signifies much,\' she.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(14, '{\"en\":\"Est quo qui sint libero pariatur. Quo amet fugit esse aliquam dicta est.\"}', '{\"en\":\"Alice, \'I\'ve often seen a rabbit with either a waistcoat-pocket, or a serpent?\' \'It matters a good way off, panting, with its arms folded, frowning like a telescope.\' And so it was not here before,\'.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(15, '{\"en\":\"Minus voluptatem expedita rerum voluptatem nemo. A corrupti quia est consectetur autem explicabo.\"}', '{\"en\":\"It\'s the most interesting, and perhaps as this before, never! And I declare it\'s too bad, that it was all about, and crept a little more conversation with her head! Off--\' \'Nonsense!\' said Alice.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(16, '{\"en\":\"Eligendi rem aut perspiciatis amet. Id consectetur placeat culpa in. Sed excepturi omnis cum unde.\"}', '{\"en\":\"Alice joined the procession, wondering very much pleased at having found out a box of comfits, (luckily the salt water had not gone far before they saw the Mock Turtle, who looked at her, and said.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(17, '{\"en\":\"Voluptatem ut iure quisquam id. Incidunt sed dolore non dolores. Nisi ut veniam beatae quos.\"}', '{\"en\":\"Queen in a minute or two, looking for eggs, as it could go, and making faces at him as he said in a trembling voice:-- \'I passed by his face only, she would catch a bat, and that\'s very like having.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(18, '{\"en\":\"Itaque ipsum quidem dolorem. Dolorem dignissimos ut et. Quo suscipit eum voluptas.\"}', '{\"en\":\"I don\'t keep the same solemn tone, only changing the order of the Shark, But, when the Rabbit noticed Alice, as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then!\'.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(19, '{\"en\":\"Et nobis nihil qui est. At hic et reprehenderit voluptatem voluptatibus distinctio.\"}', '{\"en\":\"It was high time you were all talking together: she made some tarts, All on a summer day: The Knave of Hearts, who only bowed and smiled in reply. \'That\'s right!\' shouted the Queen. \'You make me.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(20, '{\"en\":\"Soluta optio qui quas. In ullam saepe provident perferendis. Quo incidunt sit quia ut cupiditate.\"}', '{\"en\":\"Alice quietly said, just as she could get to the Dormouse, who was beginning to end,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'I can\'t go no lower,\' said.\"}', 2, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(21, '{\"en\":\"Iusto omnis aliquid dolorem quibusdam aspernatur optio. Veniam impedit rerum sequi molestiae.\"}', '{\"en\":\"Mock Turtle. Alice was soon submitted to by the Hatter, and he went on, yawning and rubbing its eyes, \'Of course, of course; just what I eat\\\" is the same year for such a puzzled expression that she.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(22, '{\"en\":\"Soluta soluta sit et. Eos eius et ut. Error voluptas dolores itaque id facere pariatur nihil aut.\"}', '{\"en\":\"I\'ve got to the company generally, \'You are old, Father William,\' the young lady to see what was coming. It was as steady as ever; Yet you balanced an eel on the trumpet, and then turned to the.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(23, '{\"en\":\"Debitis quae velit aut. Sed id et aliquid quasi distinctio ducimus. Blanditiis quod error sed.\"}', '{\"en\":\"Alice said nothing; she had never forgotten that, if you like,\' said the Gryphon. \'I\'ve forgotten the little thing grunted in reply (it had left off when they liked, and left foot, so as to size,\'.\"}', 3, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(24, '{\"en\":\"Quo minima quo corrupti ipsum. Autem quos dolorum quaerat vero est in reprehenderit.\"}', '{\"en\":\"WHAT? The other guests had taken his watch out of breath, and said to Alice, they all stopped and looked into its eyes again, to see its meaning. \'And just as the rest were quite silent, and looked.\"}', 4, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(25, '{\"en\":\"Voluptates est incidunt iste. Et ut ut ut sunt nulla odio quisquam. Ea praesentium sunt fuga a.\"}', '{\"en\":\"HIM TO YOU,\\\"\' said Alice. \'Who\'s making personal remarks now?\' the Hatter and the party were placed along the course, here and there. There was a very little way off, and found that, as nearly as.\"}', 2, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(26, '{\"en\":\"Vitae iure qui harum et aut veniam. Inventore fugit dolor qui est hic tempora perferendis.\"}', '{\"en\":\"And I declare it\'s too bad, that it was too dark to see that queer little toss of her sister, who was peeping anxiously into her eyes; and once she remembered that she was surprised to find any. And.\"}', 2, '2023-03-29 11:10:08', '2023-03-29 11:10:08'),
(27, '{\"en\":\"Neque alias sequi asperiores est. Corporis doloremque delectus sint aut.\"}', '{\"en\":\"Gryphon hastily. \'Go on with the clock. For instance, if you don\'t like them!\' When the procession came opposite to Alice, flinging the baby at her feet as the Rabbit, and had just succeeded in.\"}', 4, '2023-03-29 11:10:09', '2023-03-29 11:10:09'),
(28, '{\"en\":\"Necessitatibus sit qui sint iste veniam. Sit quo nostrum est et praesentium est.\"}', '{\"en\":\"Alice did not feel encouraged to ask them what the moral of that is--\\\"Birds of a muchness\\\"--did you ever saw. How she longed to change them--\' when she found herself falling down a large one, but.\"}', 3, '2023-03-29 11:10:09', '2023-03-29 11:10:09'),
(29, '{\"en\":\"Ullam non nihil magnam eaque aperiam alias. Nihil sint tempora ab aspernatur odit aliquam.\"}', '{\"en\":\"THESE?\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a sort of chance of getting her hands on her face brightened up again.) \'Please your Majesty,\' said the cook. \'Treacle,\' said the.\"}', 1, '2023-03-29 11:10:09', '2023-03-29 11:10:09'),
(30, '{\"en\":\"Cumque voluptas sint est sunt aut voluptatem. Ad sint officia odit. Dolorem pariatur fuga minus.\"}', '{\"en\":\"Alice thought over all she could not join the dance. Would not, could not, would not, could not help thinking there MUST be more to do next, when suddenly a footman in livery came running out of.\"}', 4, '2023-03-29 11:10:09', '2023-03-29 11:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2023-03-29 11:09:52', '2023-03-29 11:09:52'),
(2, '{\"en\":\"Service\"}', '2023-03-29 11:09:52', '2023-03-29 11:09:52'),
(3, '{\"en\":\"Service\"}', '2023-03-29 11:09:52', '2023-03-29 11:09:52'),
(4, '{\"en\":\"Service\"}', '2023-03-29 11:09:52', '2023-03-29 11:09:52'),
(5, '{\"en\":\"Service\"}', '2023-03-29 11:09:52', '2023-03-29 11:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

CREATE TABLE `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Molestiae repudiandae dolorem perspiciatis facilis est voluptatem eum ut.\"}', 8, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(2, '{\"en\":\"Illo dolores sed ipsam adipisci.\"}', 5, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(3, '{\"en\":\"Veritatis et ipsa dignissimos quo.\"}', 5, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(4, '{\"en\":\"Sed et eos iusto qui molestiae.\"}', 7, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(5, '{\"en\":\"In adipisci occaecati molestiae qui et asperiores nobis.\"}', 1, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(6, '{\"en\":\"Omnis praesentium enim ducimus eveniet amet accusantium iure.\"}', 7, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(7, '{\"en\":\"Hic est mollitia porro quibusdam qui.\"}', 7, '2023-03-29 11:09:54', '2023-03-29 11:09:54'),
(8, '{\"en\":\"A est qui nobis aut voluptas non corporis.\"}', 5, '2023-03-29 11:09:55', '2023-03-29 11:09:55'),
(9, '{\"en\":\"Quia dignissimos sed voluptate earum optio commodi rerum.\"}', 5, '2023-03-29 11:09:55', '2023-03-29 11:09:55'),
(10, '{\"en\":\"Mollitia aut corporis corporis eos minus animi magni.\"}', 1, '2023-03-29 11:09:55', '2023-03-29 11:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text NOT NULL,
  `custom_properties` text NOT NULL,
  `responsive_images` text NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-07 12:03:38', '2021-05-07 12:03:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-07 12:03:49', '2021-05-07 12:03:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-07 12:03:58', '2021-05-07 12:03:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(10, 'App\\Models\\PaymentMethod', 9, 'logo', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a96-8a5e-4a85-8d6e-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(11, 'App\\Models\\PaymentMethod', 8, 'logo', 'paystack', 'paystack.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a96-8a5e-4c85-8d6e-c356648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(12, 'App\\Models\\PaymentMethod', 10, 'logo', 'fpx', 'fpx.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(13, 'App\\Models\\PaymentMethod', 11, 'logo', 'wallet', 'wallet.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(14, 'App\\Models\\PaymentMethod', 12, 'logo', 'paymongo', 'paymongo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 12:04:23', '2021-05-07 12:04:23'),
(15, 'App\\Models\\Upload', 1, 'avatar', 'PngItem_1370168', 'PngItem_1370168.png', 'image/png', 'public', 24443, '[]', '{\"uuid\":\"37139ffb-a518-467a-9df0-9c96b05b2a1b\",\"user_id\":2,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 13, '2023-03-29 21:04:03', '2023-03-29 21:04:05'),
(16, 'App\\Models\\Upload', 2, 'avatar', 'PngItem_1370168', 'PngItem_1370168.png', 'image/png', 'public', 24443, '[]', '{\"uuid\":\"c28003c4-4460-4018-9a31-35ecf6f048e7\",\"user_id\":2,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 14, '2023-03-29 21:06:03', '2023-03-29 21:06:04'),
(17, 'App\\Models\\User', 2, 'avatar', 'PngItem_1370168', 'PngItem_1370168.png', 'image/png', 'public', 24443, '[]', '{\"uuid\":\"c28003c4-4460-4018-9a31-35ecf6f048e7\",\"user_id\":2,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 15, '2023-03-29 21:06:08', '2023-03-29 21:06:08'),
(18, 'App\\Models\\Upload', 3, 'image', 'Review', 'Review.png', 'image/png', 'public', 104184, '[]', '{\"uuid\":\"e5090725-f7d5-44f5-a3b4-73342b937934\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 16, '2023-03-31 20:45:08', '2023-03-31 20:45:15'),
(20, 'App\\Models\\Upload', 4, 'avatar', 'face', 'face.png', 'image/png', 'public', 15971, '[]', '{\"uuid\":\"65cc844b-75fa-4825-9bee-a6c9f55287b3\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 18, '2023-04-01 04:57:43', '2023-04-01 04:57:51'),
(21, 'App\\Models\\Upload', 5, 'avatar', 'pngwing.com (2)', 'pngwing.com-(2).png', 'image/png', 'public', 330609, '[]', '{\"uuid\":\"04124b09-cc60-481d-91bf-d8d5df1e58de\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 19, '2023-04-01 04:59:11', '2023-04-01 04:59:14'),
(22, 'App\\Models\\User', 6, 'avatar', 'pngwing.com (2)', 'pngwing.com-(2).png', 'image/png', 'public', 330609, '[]', '{\"uuid\":\"04124b09-cc60-481d-91bf-d8d5df1e58de\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 20, '2023-04-01 04:59:24', '2023-04-01 04:59:24'),
(23, 'App\\Models\\Upload', 6, 'avatar', 'face', 'face.png', 'image/png', 'public', 15971, '[]', '{\"uuid\":\"3f55c85c-a895-41b6-a56e-977ae4174349\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 21, '2023-04-01 20:12:31', '2023-04-01 20:12:38'),
(24, 'App\\Models\\User', 6, 'avatar', 'face', 'face.png', 'image/png', 'public', 15971, '[]', '{\"uuid\":\"3f55c85c-a895-41b6-a56e-977ae4174349\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 22, '2023-04-01 20:12:48', '2023-04-01 20:12:48'),
(25, 'App\\Models\\Upload', 7, 'image', 'windows', 'windows.png', 'image/png', 'public', 12219, '[]', '{\"uuid\":\"8a26e7e2-2cfc-4e1e-b69e-ee1511c76ac0\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 23, '2023-04-07 20:09:22', '2023-04-07 20:09:30'),
(26, 'App\\Models\\EService', 1, 'image', 'windows', 'windows.png', 'image/png', 'public', 12219, '[]', '{\"uuid\":\"8a26e7e2-2cfc-4e1e-b69e-ee1511c76ac0\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 24, '2023-04-07 20:09:31', '2023-04-07 20:09:31'),
(27, 'App\\Models\\Upload', 8, 'image', 'pressure-washer', 'pressure-washer.png', 'image/png', 'public', 14519, '[]', '{\"uuid\":\"1e07f2c1-320a-441d-b551-7ff8088f41fe\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 25, '2023-04-07 20:18:08', '2023-04-07 20:18:09'),
(28, 'App\\Models\\EService', 4, 'image', 'pressure-washer', 'pressure-washer.png', 'image/png', 'public', 14519, '[]', '{\"uuid\":\"1e07f2c1-320a-441d-b551-7ff8088f41fe\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 26, '2023-04-07 20:18:47', '2023-04-07 20:18:47'),
(29, 'App\\Models\\Upload', 9, 'image', 'snow', 'snow.png', 'image/png', 'public', 19745, '[]', '{\"uuid\":\"63e88194-2dfe-4b64-8b26-cb28c95bc335\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 27, '2023-04-07 20:26:34', '2023-04-07 20:26:35'),
(30, 'App\\Models\\EService', 10, 'image', 'snow', 'snow.png', 'image/png', 'public', 19745, '[]', '{\"uuid\":\"63e88194-2dfe-4b64-8b26-cb28c95bc335\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 28, '2023-04-07 20:26:41', '2023-04-07 20:26:41'),
(31, 'App\\Models\\Upload', 10, 'image', 'garbage', 'garbage.png', 'image/png', 'public', 11345, '[]', '{\"uuid\":\"ad3d2dd6-f807-4c62-ae8d-da422d819cd7\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 29, '2023-04-07 20:27:09', '2023-04-07 20:27:10'),
(32, 'App\\Models\\EService', 2, 'image', 'garbage', 'garbage.png', 'image/png', 'public', 11345, '[]', '{\"uuid\":\"ad3d2dd6-f807-4c62-ae8d-da422d819cd7\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 30, '2023-04-07 20:27:11', '2023-04-07 20:27:11'),
(33, 'App\\Models\\Upload', 11, 'image', 'home', 'home.png', 'image/png', 'public', 12049, '[]', '{\"uuid\":\"36fd640a-32eb-45c7-8684-f0db26257136\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 31, '2023-04-07 20:27:35', '2023-04-07 20:27:36'),
(34, 'App\\Models\\EService', 3, 'image', 'home', 'home.png', 'image/png', 'public', 12049, '[]', '{\"uuid\":\"36fd640a-32eb-45c7-8684-f0db26257136\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 32, '2023-04-07 20:27:37', '2023-04-07 20:27:37'),
(35, 'App\\Models\\Upload', 12, 'image', 'snow', 'snow.png', 'image/png', 'public', 19745, '[]', '{\"uuid\":\"32ec8e1e-405b-4fc6-9305-670a8d118d16\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 33, '2023-04-07 20:41:40', '2023-04-07 20:41:41'),
(36, 'App\\Models\\EService', 5, 'image', 'snow', 'snow.png', 'image/png', 'public', 19745, '[]', '{\"uuid\":\"32ec8e1e-405b-4fc6-9305-670a8d118d16\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 34, '2023-04-07 20:41:44', '2023-04-07 20:41:44'),
(37, 'App\\Models\\Upload', 13, 'avatar', 'clipart2027230', 'clipart2027230.png', 'image/png', 'public', 15505, '[]', '{\"uuid\":\"89632057-8cd9-42fa-9f95-43172066b086\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 35, '2023-04-09 22:02:03', '2023-04-09 22:02:06'),
(38, 'App\\Models\\Upload', 14, 'avatar', 'face', 'face.png', 'image/png', 'public', 15971, '[]', '{\"uuid\":\"002dec69-37e9-4438-b363-bec7bb7f4986\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 36, '2023-04-09 22:02:34', '2023-04-09 22:02:35'),
(39, 'App\\Models\\User', 2, 'avatar', 'face', 'face.png', 'image/png', 'public', 15971, '[]', '{\"uuid\":\"002dec69-37e9-4438-b363-bec7bb7f4986\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 37, '2023-04-09 22:02:40', '2023-04-09 22:02:40'),
(40, 'App\\Models\\Upload', 15, 'avatar', 'PngItem_1370168', 'PngItem_1370168.png', 'image/png', 'public', 24443, '[]', '{\"uuid\":\"1c6f888d-2570-4db0-a921-6248f462926e\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 38, '2023-04-09 22:03:43', '2023-04-09 22:03:43'),
(41, 'App\\Models\\User', 6, 'avatar', 'PngItem_1370168', 'PngItem_1370168.png', 'image/png', 'public', 24443, '[]', '{\"uuid\":\"1c6f888d-2570-4db0-a921-6248f462926e\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 39, '2023-04-09 22:03:49', '2023-04-09 22:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_08_29_213829_create_faq_categories_table', 1),
(11, '2019_08_29_213926_create_faqs_table', 1),
(12, '2019_10_22_144652_create_currencies_table', 1),
(13, '2021_01_07_162658_create_payment_methods_table', 1),
(14, '2021_01_07_164755_create_payment_statuses_table', 1),
(15, '2021_01_07_165422_create_payments_table', 1),
(16, '2021_01_13_105605_create_e_provider_types_table', 1),
(17, '2021_01_13_111155_create_e_providers_table', 1),
(18, '2021_01_13_111622_create_experiences_table', 1),
(19, '2021_01_13_111730_create_awards_table', 1),
(20, '2021_01_13_114302_create_taxes_table', 1),
(21, '2021_01_13_200249_create_addresses_table', 1),
(22, '2021_01_15_115239_create_e_provider_addresses_table', 1),
(23, '2021_01_15_115747_create_e_provider_users_table', 1),
(24, '2021_01_15_115850_create_e_provider_taxes_table', 1),
(25, '2021_01_16_160838_create_availability_hours_table', 1),
(26, '2021_01_19_135951_create_e_services_table', 1),
(27, '2021_01_19_140427_create_categories_table', 1),
(28, '2021_01_19_171553_create_e_service_categories_table', 1),
(29, '2021_01_22_194514_create_option_groups_table', 1),
(30, '2021_01_22_200807_create_options_table', 1),
(31, '2021_01_22_205819_create_favorites_table', 1),
(32, '2021_01_22_205944_create_favorite_options_table', 1),
(33, '2021_01_23_125641_create_e_service_reviews_table', 1),
(34, '2021_01_23_201533_create_galleries_table', 1),
(35, '2021_01_25_105421_create_slides_table', 1),
(36, '2021_01_25_162055_create_notifications_table', 1),
(37, '2021_01_25_170522_create_coupons_table', 1),
(38, '2021_01_25_170529_create_discountables_table', 1),
(39, '2021_01_25_191833_create_booking_statuses_table', 1),
(40, '2021_01_25_212252_create_bookings_table', 1),
(41, '2021_01_30_111717_create_e_provider_payouts_table', 1),
(42, '2021_01_30_135356_create_earnings_table', 1),
(43, '2021_02_24_102838_create_custom_pages_table', 1),
(44, '2021_06_26_110636_create_json_extract_function', 1),
(45, '2021_08_08_134136_create_wallets_table', 1),
(46, '2021_08_08_155732_create_wallet_transactions_table', 1),
(47, '2023_03_15_042449_create_service_provides_table', 1),
(48, '2023_03_20_013153_create_temp_providers_table', 1),
(50, '2023_04_13_031205_create_estimates_table', 3),
(52, '2023_04_11_235351_create_entries_table', 4),
(53, '2023_04_13_032952_create_contacts_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('05c9ad01-b380-4d61-b1ec-776603ab7266', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":1}', NULL, '2023-03-29 19:59:04', '2023-03-29 19:59:04'),
('09198b95-63e2-4896-b828-6c15c8d320c0', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 1, '{\"booking_id\":37}', NULL, '2023-04-11 02:49:04', '2023-04-11 02:49:04'),
('0cef6e3a-6ff6-40ca-80c5-ef82705e0608', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":50}', NULL, '2023-04-12 09:08:31', '2023-04-12 09:08:31'),
('0ea50c1d-169d-4f80-8253-709b327a6c27', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":1}', NULL, '2023-03-29 18:16:31', '2023-03-29 18:16:31'),
('0f109df9-26cd-4fcc-a357-38ef37b10e64', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":45}', NULL, '2023-04-12 07:45:59', '2023-04-12 07:45:59'),
('0fd8e368-4c8d-40af-8f08-7527d966c721', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":52}', NULL, '2023-04-12 09:11:06', '2023-04-12 09:11:06'),
('175c1abb-d438-4433-a48f-13d117c2de54', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":3}', NULL, '2023-03-29 19:15:22', '2023-03-29 19:15:22'),
('1bfb4e65-124c-4006-9433-41b92b83080f', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":10}', NULL, '2023-04-04 07:28:13', '2023-04-04 07:28:13'),
('1c7fed4c-8bf9-4b3e-a674-58524a051676', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":62}', NULL, '2023-04-14 01:32:12', '2023-04-14 01:32:12'),
('1fef3152-1ca0-4046-ba6d-437b0c8e9abf', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":22}', NULL, '2023-04-10 19:10:08', '2023-04-10 19:10:08'),
('21afc120-a612-4247-bc47-c3a5a72c228f', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":58}', NULL, '2023-04-14 01:06:30', '2023-04-14 01:06:30'),
('286beb02-2a18-4902-b66b-2ee0c5f0d19f', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":53}', NULL, '2023-04-12 09:14:08', '2023-04-12 09:14:08'),
('2babf3c0-9953-4f7a-bbbf-4e2ba6b7fa31', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":57}', NULL, '2023-04-14 01:04:37', '2023-04-14 01:04:37'),
('30520029-f13e-4ac8-90b5-d13f7a726f4b', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":35}', NULL, '2023-04-11 02:07:48', '2023-04-11 02:07:48'),
('347aba9d-bc67-4665-915d-1f9b5c0aab70', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":49}', NULL, '2023-04-12 09:02:50', '2023-04-12 09:02:50'),
('3cee96cb-dd88-4404-a4a4-c3299540130c', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":6}', NULL, '2023-03-29 20:34:50', '2023-03-29 20:34:50'),
('3f750c01-5948-47ab-bda7-d7abd4c95095', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":7}', NULL, '2023-03-31 08:04:22', '2023-03-31 08:04:22'),
('40e8a9cb-fd97-4ab5-b924-87a17a0a8b54', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":5}', NULL, '2023-03-29 20:05:50', '2023-03-29 20:05:50'),
('410a8e88-2604-41c3-a0cd-ffb7f54eaa39', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":2}', NULL, '2023-03-29 18:54:36', '2023-03-29 18:54:36'),
('45cec3c0-37c4-4668-affa-70cccdd6211d', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":28}', NULL, '2023-04-10 21:25:30', '2023-04-10 21:25:30'),
('575e8884-2bd4-4048-be48-dac4700377e7', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":56}', NULL, '2023-04-14 01:02:42', '2023-04-14 01:02:42'),
('600f384e-9b7b-4f55-a357-5a994df871ee', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":26}', NULL, '2023-04-10 21:06:27', '2023-04-10 21:06:27'),
('603deb8e-3028-4587-8f5f-e252fa7709c9', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":4}', NULL, '2023-03-29 19:59:19', '2023-03-29 19:59:19'),
('609d9984-657c-4667-bac7-1ba4d261f17d', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":1}', NULL, '2023-03-29 22:11:18', '2023-03-29 22:11:18'),
('610ac09e-f16a-4759-b30d-98c13e56b7c3', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":27}', NULL, '2023-04-10 21:07:51', '2023-04-10 21:07:51'),
('649bf21d-d91b-45c0-9756-ad1c3788ff7a', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":59}', NULL, '2023-04-14 01:11:35', '2023-04-14 01:11:35'),
('65bb2cf8-3b66-4c1a-906d-8d8e760a031e', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":43}', NULL, '2023-04-11 07:09:22', '2023-04-11 07:09:22'),
('6a249caa-4c0a-4db3-b9e2-c06db94241e9', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":61}', NULL, '2023-04-14 01:20:48', '2023-04-14 01:20:48'),
('7508b800-6321-4b13-bebf-bc42a6811472', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":47}', NULL, '2023-04-12 08:09:08', '2023-04-12 08:09:08'),
('754298c2-93ba-478d-b9f6-aebfcbaa8acb', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":39}', NULL, '2023-04-11 06:33:18', '2023-04-11 06:33:18'),
('761da8c4-8e9a-483a-b3bf-8148c963826a', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 1, '{\"booking_id\":20}', NULL, '2023-04-08 22:52:22', '2023-04-08 22:52:22'),
('7d58004c-5ecb-46b5-b779-1d7db3b7b496', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":34}', NULL, '2023-04-11 01:52:57', '2023-04-11 01:52:57'),
('7f185333-d7d9-4706-ac9f-dc106c439c78', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":51}', NULL, '2023-04-12 09:10:06', '2023-04-12 09:10:06'),
('80e68249-c91a-4fec-b64d-4c07ce4f05fb', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":2}', NULL, '2023-03-29 20:19:10', '2023-03-29 20:19:10'),
('817fb7f8-41b9-4dfc-b1c9-2fca9ed31ec1', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":33}', NULL, '2023-04-11 01:50:03', '2023-04-11 01:50:03'),
('84162e38-bad9-4a67-bfa1-c0d4b3a4ed10', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":42}', NULL, '2023-04-11 07:06:30', '2023-04-11 07:06:30'),
('853d1ba6-d823-487a-96ad-3166a8e43eb5', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":9}', NULL, '2023-04-01 07:21:23', '2023-04-01 07:21:23'),
('882742f9-1b9b-46d0-b35c-57312e673442', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":2}', NULL, '2023-03-29 18:30:14', '2023-03-29 18:30:14'),
('89378628-0981-4e68-8a4c-666f981f24e7', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":67}', NULL, '2023-04-14 01:43:46', '2023-04-14 01:43:46'),
('8f296c07-a618-406d-acf6-7fd1e3af0a7c', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":69}', NULL, '2023-04-14 01:47:35', '2023-04-14 01:47:35'),
('90b923d7-f635-4ee6-b317-8052eceff775', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":71}', NULL, '2023-04-14 01:49:04', '2023-04-14 01:49:04'),
('91edfb5d-de4f-49f3-8fbb-d9d743baca6e', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":11}', NULL, '2023-04-05 02:00:51', '2023-04-05 02:00:51'),
('98c72530-7146-4e4a-aa07-57a589534be5', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":46}', NULL, '2023-04-12 07:50:33', '2023-04-12 07:50:33'),
('990ba58b-5e23-4dca-8e16-38ced3943510', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":24}', NULL, '2023-04-10 19:34:11', '2023-04-10 19:34:11'),
('9a9137f1-c7d2-4c9c-b278-e76827e9f120', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":30}', NULL, '2023-04-11 01:42:33', '2023-04-11 01:42:33'),
('9ac35467-24a8-4e76-99d0-3dbfbbfcdaa8', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 9, '{\"booking_id\":60}', NULL, '2023-04-14 01:13:25', '2023-04-14 01:13:25'),
('a81fad32-19d9-48f0-ad35-84fc326c19fc', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":66}', NULL, '2023-04-14 01:42:57', '2023-04-14 01:42:57'),
('a9c97572-6567-489c-ac4a-f3900a406325', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":1}', NULL, '2023-03-29 01:14:46', '2023-03-29 01:14:46'),
('ac068307-3f95-4492-baf4-9f290cc9de5f', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":64}', NULL, '2023-04-14 01:40:08', '2023-04-14 01:40:08'),
('ac247449-12ac-47bc-a9d6-c8fd5607fe3a', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 9, '{\"booking_id\":63}', NULL, '2023-04-14 01:39:43', '2023-04-14 01:39:43'),
('ba753afb-678d-4785-8584-e1553bdeb11a', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":55}', NULL, '2023-04-14 00:43:09', '2023-04-14 00:43:09'),
('bdfabca0-ca19-409e-873f-5d8478c00dbf', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 6, '{\"booking_id\":38}', NULL, '2023-04-11 02:51:50', '2023-04-11 02:51:50'),
('bf60d83c-28fa-4e6c-8ac8-e26ac8ed5c22', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":19}', NULL, '2023-04-08 07:43:15', '2023-04-08 07:43:15'),
('c28c3e2f-1964-4bd8-9bf1-a55f4798b10c', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":21}', NULL, '2023-04-10 19:07:25', '2023-04-10 19:07:25'),
('c6eedda2-11b8-4f45-90eb-4c2592215e83', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":12}', NULL, '2023-04-05 02:01:48', '2023-04-05 02:01:48'),
('c82d243f-1262-49d8-b995-43941921df11', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 3, '{\"booking_id\":8}', NULL, '2023-04-01 07:17:26', '2023-04-01 07:17:26'),
('c8a479da-3626-4b18-bbd2-acc0b9a3fa11', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":54}', NULL, '2023-04-14 00:42:51', '2023-04-14 00:42:51'),
('c988c779-80c6-4651-8ad1-880013ba196b', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":44}', NULL, '2023-04-12 07:45:18', '2023-04-12 07:45:18'),
('cc1ea116-745d-4f89-9d9d-9c8f6a91d3eb', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":32}', NULL, '2023-04-11 01:47:47', '2023-04-11 01:47:47'),
('ce4963f5-8757-4b9d-ae09-8055fc7167cd', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":65}', NULL, '2023-04-14 01:40:39', '2023-04-14 01:40:39'),
('d10b2126-0bd5-4be3-b43f-050b173503e2', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":25}', NULL, '2023-04-10 20:52:06', '2023-04-10 20:52:06'),
('d234651a-684c-4a17-a575-af6784a3b8ed', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":23}', NULL, '2023-04-10 19:25:18', '2023-04-10 19:25:18'),
('d36db747-efcf-4071-ab02-14da0bfe46f3', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":29}', NULL, '2023-04-10 21:28:23', '2023-04-10 21:28:23'),
('d427cc92-ed0b-4c0c-b272-e23b6307b5b7', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":48}', NULL, '2023-04-12 08:19:16', '2023-04-12 08:19:16'),
('dd71d52a-5966-4034-9053-4671defef7cf', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":31}', NULL, '2023-04-11 01:44:02', '2023-04-11 01:44:02'),
('e7da08db-ef33-4d31-b7a5-e330b4c60980', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":41}', NULL, '2023-04-11 06:58:32', '2023-04-11 06:58:32'),
('efc95a8d-d2e0-420b-a48b-beef7c66e8aa', 'App\\Notifications\\StatusChangedBooking', 'App\\Models\\User', 8, '{\"booking_id\":1}', NULL, '2023-03-29 18:47:04', '2023-03-29 18:47:04'),
('f0e74d21-f53f-4547-a920-bbc0b475a968', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":36}', NULL, '2023-04-11 02:17:20', '2023-04-11 02:17:20'),
('fa48df38-acb9-40a1-854f-b37eb793f92d', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 16, '{\"booking_id\":40}', NULL, '2023-04-11 06:51:33', '2023-04-11 06:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `e_service_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"10m²\"}', '{\"en\":\"Sit aut tenetur autem.\"}', 42.16, 8, 1, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(2, '{\"en\":\"10m²\"}', '{\"en\":\"Occaecati deserunt qui officiis corporis iusto.\"}', 38.13, 9, 3, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(3, '{\"en\":\"20m\"}', '{\"en\":\"Id illo voluptates.\"}', 37.47, 2, 1, '2023-03-29 11:09:59', '2023-03-29 11:09:59'),
(4, '{\"en\":\"40m\"}', '{\"en\":\"Et omnis consequuntur optio.\"}', 10.38, 3, 2, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(5, '{\"en\":\"10m²\"}', '{\"en\":\"Inventore sed rerum deserunt itaque.\"}', 43.51, 1, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(6, '{\"en\":\"40m\"}', '{\"en\":\"Dolor est et magnam.\"}', 29.33, 1, 3, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(7, '{\"en\":\"30m²\"}', '{\"en\":\"Quas vero incidunt.\"}', 41.36, 9, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(8, '{\"en\":\"20m\"}', '{\"en\":\"Mollitia odio pariatur praesentium qui.\"}', 44.04, 5, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(9, '{\"en\":\"10m²\"}', '{\"en\":\"Aut nesciunt et temporibus minus.\"}', 33.00, 2, 3, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(10, '{\"en\":\"30m²\"}', '{\"en\":\"Enim consequatur accusamus quod harum minus.\"}', 49.87, 5, 3, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(11, '{\"en\":\"20m\"}', '{\"en\":\"Culpa ullam tempore eos sed.\"}', 15.53, 9, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(12, '{\"en\":\"30m²\"}', '{\"en\":\"Saepe sequi minus ut enim perspiciatis.\"}', 24.65, 8, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(13, '{\"en\":\"20m\"}', '{\"en\":\"Nam molestiae corporis suscipit.\"}', 12.14, 1, 3, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(14, '{\"en\":\"10m²\"}', '{\"en\":\"Voluptatem et aut sunt natus sunt.\"}', 24.86, 3, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(15, '{\"en\":\"40m\"}', '{\"en\":\"Iusto illo voluptas sed.\"}', 34.16, 4, 1, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(16, '{\"en\":\"40m\"}', '{\"en\":\"Mollitia quasi totam sit deserunt fugiat.\"}', 23.32, 2, 3, '2023-03-29 11:10:00', '2023-03-29 11:10:00'),
(17, '{\"en\":\"40m\"}', '{\"en\":\"Dolor iure et.\"}', 27.74, 7, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(18, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptas qui iusto qui consequatur ducimus.\"}', 25.35, 1, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(19, '{\"en\":\"20m\"}', '{\"en\":\"Culpa quia labore illum minima fuga.\"}', 21.72, 4, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(20, '{\"en\":\"40m\"}', '{\"en\":\"Sunt architecto sunt quo illum.\"}', 15.10, 1, 2, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(21, '{\"en\":\"30m²\"}', '{\"en\":\"Ut nemo saepe et.\"}', 29.80, 9, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(22, '{\"en\":\"10m²\"}', '{\"en\":\"Explicabo ad saepe molestias ducimus.\"}', 43.27, 1, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(23, '{\"en\":\"40m\"}', '{\"en\":\"Et omnis veniam reprehenderit amet ipsa.\"}', 33.22, 3, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(24, '{\"en\":\"10m²\"}', '{\"en\":\"Est nam possimus quia.\"}', 46.13, 5, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(25, '{\"en\":\"30m²\"}', '{\"en\":\"Quis dolore error molestiae praesentium deserunt.\"}', 27.24, 2, 2, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(26, '{\"en\":\"20m\"}', '{\"en\":\"Ab nemo reprehenderit laboriosam consequatur voluptatem.\"}', 33.31, 1, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(27, '{\"en\":\"20m\"}', '{\"en\":\"A accusantium ut.\"}', 29.56, 6, 2, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(28, '{\"en\":\"10m²\"}', '{\"en\":\"Consequatur sunt sunt ipsum.\"}', 24.95, 6, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(29, '{\"en\":\"10m²\"}', '{\"en\":\"Ut tempore quod unde.\"}', 37.35, 2, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(30, '{\"en\":\"40m\"}', '{\"en\":\"Velit velit praesentium autem quaerat.\"}', 34.35, 10, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(31, '{\"en\":\"30m²\"}', '{\"en\":\"Deserunt nihil in voluptatem sit voluptas.\"}', 47.76, 1, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(32, '{\"en\":\"10m²\"}', '{\"en\":\"Odio qui vel.\"}', 28.35, 6, 3, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(33, '{\"en\":\"40m\"}', '{\"en\":\"Qui totam ut et.\"}', 25.47, 9, 1, '2023-03-29 11:10:01', '2023-03-29 11:10:01'),
(34, '{\"en\":\"30m²\"}', '{\"en\":\"Ratione sunt ea.\"}', 15.60, 1, 1, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(35, '{\"en\":\"30m²\"}', '{\"en\":\"Sit cum sit quia architecto reiciendis.\"}', 40.52, 9, 2, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(36, '{\"en\":\"30m²\"}', '{\"en\":\"Quisquam harum animi nam velit.\"}', 15.15, 9, 1, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(37, '{\"en\":\"10m²\"}', '{\"en\":\"Eos aut ut voluptatem aliquid voluptatem.\"}', 13.20, 2, 3, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(38, '{\"en\":\"30m²\"}', '{\"en\":\"Nobis ut inventore nulla nemo.\"}', 32.57, 2, 3, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(39, '{\"en\":\"30m²\"}', '{\"en\":\"Quos sapiente voluptas voluptatibus.\"}', 48.50, 6, 3, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(40, '{\"en\":\"40m\"}', '{\"en\":\"Quis distinctio molestiae asperiores voluptas.\"}', 19.04, 6, 1, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(41, '{\"en\":\"10m²\"}', '{\"en\":\"Hic neque sint et ullam.\"}', 38.08, 7, 1, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(42, '{\"en\":\"40m\"}', '{\"en\":\"Eos perferendis libero voluptatem veniam.\"}', 34.81, 3, 2, '2023-03-29 11:10:02', '2023-03-29 11:10:02'),
(43, '{\"en\":\"10m²\"}', '{\"en\":\"Quisquam qui rem.\"}', 41.04, 4, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(44, '{\"en\":\"10m²\"}', '{\"en\":\"Eius recusandae quia quas deleniti.\"}', 15.67, 10, 2, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(45, '{\"en\":\"40m\"}', '{\"en\":\"Praesentium adipisci repudiandae provident eum doloremque.\"}', 21.06, 2, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(46, '{\"en\":\"30m²\"}', '{\"en\":\"Numquam consectetur voluptatem explicabo et.\"}', 13.98, 2, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(47, '{\"en\":\"30m²\"}', '{\"en\":\"Necessitatibus non reiciendis architecto.\"}', 49.86, 8, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(48, '{\"en\":\"20m\"}', '{\"en\":\"Et quia nihil.\"}', 49.09, 1, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(49, '{\"en\":\"30m²\"}', '{\"en\":\"Ut porro magni explicabo culpa.\"}', 16.23, 5, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(50, '{\"en\":\"20m\"}', '{\"en\":\"Voluptate saepe aut consequuntur.\"}', 12.66, 2, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(51, '{\"en\":\"30m²\"}', '{\"en\":\"Laborum blanditiis voluptatem error.\"}', 41.68, 2, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(52, '{\"en\":\"10m²\"}', '{\"en\":\"Tenetur delectus blanditiis voluptas.\"}', 12.17, 9, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(53, '{\"en\":\"30m²\"}', '{\"en\":\"Necessitatibus qui adipisci natus sequi.\"}', 30.71, 3, 2, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(54, '{\"en\":\"30m²\"}', '{\"en\":\"Ad necessitatibus incidunt et occaecati.\"}', 18.58, 5, 2, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(55, '{\"en\":\"20m\"}', '{\"en\":\"Ipsa soluta illum placeat.\"}', 38.18, 8, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(56, '{\"en\":\"10m²\"}', '{\"en\":\"Saepe pariatur necessitatibus et.\"}', 34.59, 8, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(57, '{\"en\":\"20m\"}', '{\"en\":\"Earum mollitia itaque.\"}', 22.89, 7, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(58, '{\"en\":\"10m²\"}', '{\"en\":\"Temporibus ratione dolores vel.\"}', 14.36, 4, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(59, '{\"en\":\"30m²\"}', '{\"en\":\"Omnis sunt est.\"}', 45.03, 8, 3, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(60, '{\"en\":\"20m\"}', '{\"en\":\"Ut aperiam natus ut.\"}', 15.78, 7, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(61, '{\"en\":\"20m\"}', '{\"en\":\"Voluptas eligendi expedita nisi.\"}', 20.18, 4, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(62, '{\"en\":\"20m\"}', '{\"en\":\"Rerum laboriosam est.\"}', 28.89, 6, 1, '2023-03-29 11:10:03', '2023-03-29 11:10:03'),
(63, '{\"en\":\"10m²\"}', '{\"en\":\"Voluptatibus odit eveniet ducimus et.\"}', 20.37, 7, 2, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(64, '{\"en\":\"30m²\"}', '{\"en\":\"Et ratione cupiditate aliquid quisquam sit.\"}', 31.17, 8, 2, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(65, '{\"en\":\"20m\"}', '{\"en\":\"Voluptatum quia voluptatem voluptatum.\"}', 20.25, 10, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(66, '{\"en\":\"30m²\"}', '{\"en\":\"Ratione velit nulla eum praesentium eos.\"}', 23.51, 5, 1, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(67, '{\"en\":\"10m²\"}', '{\"en\":\"Veritatis fugiat et illum sunt aut.\"}', 16.40, 9, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(68, '{\"en\":\"10m²\"}', '{\"en\":\"At itaque quibusdam.\"}', 27.45, 6, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(69, '{\"en\":\"10m²\"}', '{\"en\":\"Dolore deserunt enim voluptatem.\"}', 19.75, 4, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(70, '{\"en\":\"30m²\"}', '{\"en\":\"Alias quis ut tempore.\"}', 28.20, 2, 2, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(71, '{\"en\":\"40m\"}', '{\"en\":\"Quis laboriosam perferendis reiciendis.\"}', 21.79, 8, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(72, '{\"en\":\"20m\"}', '{\"en\":\"Sint deserunt incidunt.\"}', 12.17, 8, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(73, '{\"en\":\"10m²\"}', '{\"en\":\"Asperiores fugit consequatur.\"}', 47.39, 5, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(74, '{\"en\":\"10m²\"}', '{\"en\":\"Magni impedit et sapiente cupiditate sint.\"}', 45.26, 6, 3, '2023-03-29 11:10:04', '2023-03-29 11:10:04'),
(75, '{\"en\":\"10m²\"}', '{\"en\":\"Eum earum dolore rem doloribus.\"}', 46.44, 8, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(76, '{\"en\":\"20m\"}', '{\"en\":\"Et et deleniti aliquid voluptatem ex.\"}', 11.62, 9, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(77, '{\"en\":\"40m\"}', '{\"en\":\"Placeat vitae excepturi.\"}', 38.11, 6, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(78, '{\"en\":\"40m\"}', '{\"en\":\"Harum aut maxime.\"}', 30.62, 1, 2, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(79, '{\"en\":\"40m\"}', '{\"en\":\"Mollitia harum velit quia.\"}', 31.94, 8, 2, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(80, '{\"en\":\"10m²\"}', '{\"en\":\"Saepe suscipit dolorem recusandae architecto.\"}', 37.63, 8, 1, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(81, '{\"en\":\"40m\"}', '{\"en\":\"Et molestiae optio.\"}', 49.84, 10, 2, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(82, '{\"en\":\"20m\"}', '{\"en\":\"Suscipit eos quia.\"}', 20.46, 6, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(83, '{\"en\":\"40m\"}', '{\"en\":\"Maxime minus incidunt.\"}', 37.16, 4, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(84, '{\"en\":\"40m\"}', '{\"en\":\"Consequuntur tempore ipsam.\"}', 27.26, 9, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(85, '{\"en\":\"10m²\"}', '{\"en\":\"Consequatur aut maxime sit.\"}', 18.95, 2, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(86, '{\"en\":\"20m\"}', '{\"en\":\"Autem et molestias assumenda.\"}', 11.75, 5, 2, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(87, '{\"en\":\"20m\"}', '{\"en\":\"Officia est est placeat.\"}', 34.97, 3, 3, '2023-03-29 11:10:05', '2023-03-29 11:10:05'),
(88, '{\"en\":\"30m²\"}', '{\"en\":\"Velit aliquam ut molestiae.\"}', 17.34, 3, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(89, '{\"en\":\"40m\"}', '{\"en\":\"Quia numquam autem et modi exercitationem.\"}', 10.66, 1, 2, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(90, '{\"en\":\"10m²\"}', '{\"en\":\"Quaerat vel eligendi esse facere.\"}', 36.70, 8, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(91, '{\"en\":\"20m\"}', '{\"en\":\"Aperiam iusto aut error.\"}', 47.54, 5, 1, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(92, '{\"en\":\"20m\"}', '{\"en\":\"Aperiam sed hic assumenda aut.\"}', 29.08, 4, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(93, '{\"en\":\"30m²\"}', '{\"en\":\"Aut velit rem.\"}', 48.76, 4, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(94, '{\"en\":\"30m²\"}', '{\"en\":\"Laboriosam hic qui asperiores.\"}', 41.03, 10, 1, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(95, '{\"en\":\"10m²\"}', '{\"en\":\"Odio ea non nihil ut.\"}', 35.01, 1, 2, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(96, '{\"en\":\"40m\"}', '{\"en\":\"Quaerat ex cumque consectetur.\"}', 34.04, 10, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(97, '{\"en\":\"20m\"}', '{\"en\":\"Nostrum aut illum voluptas.\"}', 11.30, 5, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(98, '{\"en\":\"20m\"}', '{\"en\":\"Aperiam enim perferendis aliquam quo.\"}', 25.79, 5, 1, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(99, '{\"en\":\"10m²\"}', '{\"en\":\"Asperiores velit fuga illo.\"}', 42.79, 1, 3, '2023-03-29 11:10:06', '2023-03-29 11:10:06'),
(100, '{\"en\":\"30m²\"}', '{\"en\":\"Natus nesciunt rerum.\"}', 16.70, 9, 1, '2023-03-29 11:10:06', '2023-03-29 11:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

CREATE TABLE `option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `allow_multiple`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2021-01-22 13:49:15', '2021-02-07 14:30:19'),
(2, 'Area', 1, '2021-01-22 14:46:28', '2021-01-22 14:46:28'),
(3, 'Surface', 0, '2021-01-22 14:46:47', '2021-01-22 14:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `description`, `user_id`, `payment_method_id`, `payment_status_id`, `created_at`, `updated_at`) VALUES
(37, 43.85, 'Transaction for Booking #104', 18, 7, 2, '2023-04-14 23:19:20', '2023-04-14 23:19:20'),
(38, 43.85, 'Transaction for Booking #105', 18, 7, 2, '2023-04-14 23:27:53', '2023-04-14 23:27:53'),
(39, 43.85, 'Transaction for Booking #106', 18, 7, 2, '2023-04-14 23:30:55', '2023-04-14 23:30:55'),
(40, 43.85, 'Transaction for Booking #106', 18, 7, 2, '2023-04-14 23:34:16', '2023-04-14 23:34:16'),
(41, 43.85, 'Transaction for Booking #107', 18, 7, 2, '2023-04-14 23:35:11', '2023-04-14 23:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `route` varchar(127) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `route`, `order`, `default`, `enabled`, `created_at`, `updated_at`) VALUES
(2, '{\"en\":\"RazorPay\"}', '{\"en\":\"Click to pay with RazorPay gateway\"}', '/RazorPay', 2, 0, 0, '2021-01-17 08:33:49', '2023-04-11 06:43:42'),
(5, '{\"en\":\"PayPal\"}', '{\"en\":\"Click to pay with your PayPal account\"}', '/PayPal', 1, 0, 1, '2021-01-17 09:46:06', '2023-04-14 19:41:29'),
(6, '{\"en\":\"Cash\"}', '{\"en\":\"Click to pay cash when finish\"}', '/Cash', 3, 0, 0, '2021-02-17 16:38:42', '2023-04-11 06:44:35'),
(7, '{\"en\":\"Credit Card (Stripe)\"}', '{\"en\":\"Click to pay with your Credit Card\"}', '/Stripe', 3, 1, 1, '2021-02-17 16:38:42', '2023-04-12 00:47:46'),
(8, '{\"en\":\"PayStack\"}', '{\"en\":\"Click to pay with PayStack gateway\"}', '/PayStack', 5, 0, 0, '2021-07-23 16:38:42', '2023-04-11 06:45:04'),
(9, '{\"en\":\"FlutterWave\"}', '{\"en\":\"Click to pay with FlutterWave gateway\"}', '/FlutterWave', 6, 0, 0, '2021-07-23 16:38:42', '2023-04-11 06:45:26'),
(10, '{\"en\":\"Malaysian Stripe FPX\"}', '{\"en\":\"Click to pay with Stripe FPX gateway\"}', '/StripeFPX', 7, 0, 0, '2021-07-24 16:38:42', '2023-04-11 06:45:42'),
(11, '{\"en\":\"Wallet\"}', '{\"en\":\"Click to pay with Wallet\"}', '/Wallet', 8, 0, 0, '2021-08-08 16:38:42', '2023-04-11 06:46:23'),
(12, '{\"en\":\"PayMongo\"}', '{\"en\":\"Click to pay with PayMongo\"}', '/PayMongo', 12, 0, 0, '2021-10-08 16:38:42', '2023-04-11 06:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2021-01-17 09:28:28', '2021-02-17 15:55:15'),
(2, 'Paid', 10, '2021-01-11 17:19:49', '2021-02-17 15:55:53'),
(3, 'Failed', 20, '2021-01-17 08:05:04', '2021-02-17 15:56:32'),
(4, 'Refunded', 40, '2021-02-17 15:58:14', '2021-02-17 15:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 07:17:34', '2021-01-07 07:17:34'),
(2, 'medias.create', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(3, 'users.profile', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(4, 'users.index', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(5, 'users.create', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(6, 'users.store', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(7, 'users.show', 'web', '2021-01-07 07:17:35', '2021-01-07 07:17:35'),
(8, 'users.edit', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(9, 'users.update', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(10, 'users.destroy', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(11, 'medias.delete', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(12, 'medias', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(13, 'permissions.index', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(14, 'permissions.create', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(15, 'permissions.store', 'web', '2021-01-07 07:17:36', '2021-01-07 07:17:36'),
(16, 'permissions.show', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(17, 'permissions.edit', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(18, 'permissions.update', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(20, 'roles.index', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(21, 'roles.create', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(22, 'roles.store', 'web', '2021-01-07 07:17:37', '2021-01-07 07:17:37'),
(23, 'roles.show', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(24, 'roles.edit', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(25, 'roles.update', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(26, 'roles.destroy', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(27, 'customFields.index', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(28, 'customFields.create', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(29, 'customFields.store', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(30, 'customFields.show', 'web', '2021-01-07 07:17:38', '2021-01-07 07:17:38'),
(31, 'customFields.edit', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(32, 'customFields.update', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(33, 'customFields.destroy', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(34, 'currencies.index', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(35, 'currencies.create', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(36, 'currencies.store', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(37, 'currencies.edit', 'web', '2021-01-07 07:17:39', '2021-01-07 07:17:39'),
(38, 'currencies.update', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(41, 'app-settings', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 07:17:40', '2021-01-07 07:17:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(48, 'faqs.index', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(49, 'faqs.create', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(50, 'faqs.store', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(51, 'faqs.edit', 'web', '2021-01-07 07:17:41', '2021-01-07 07:17:41'),
(52, 'faqs.update', 'web', '2021-01-07 07:17:42', '2021-01-07 07:17:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 07:17:42', '2021-01-07 07:17:42'),
(54, 'payments.index', 'web', '2021-01-10 18:04:33', '2021-01-10 18:04:33'),
(55, 'payments.show', 'web', '2021-01-10 18:04:33', '2021-01-10 18:04:33'),
(56, 'payments.update', 'web', '2021-01-10 18:04:33', '2021-01-10 18:04:33'),
(57, 'paymentMethods.index', 'web', '2021-01-10 18:04:33', '2021-01-10 18:04:33'),
(58, 'paymentMethods.create', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(59, 'paymentMethods.store', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(60, 'paymentMethods.edit', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(61, 'paymentMethods.update', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(62, 'paymentMethods.destroy', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(63, 'paymentStatuses.index', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(64, 'paymentStatuses.create', 'web', '2021-01-10 18:04:34', '2021-01-10 18:04:34'),
(65, 'paymentStatuses.store', 'web', '2021-01-10 18:04:35', '2021-01-10 18:04:35'),
(66, 'paymentStatuses.edit', 'web', '2021-01-10 18:04:35', '2021-01-10 18:04:35'),
(67, 'paymentStatuses.update', 'web', '2021-01-10 18:04:35', '2021-01-10 18:04:35'),
(68, 'paymentStatuses.destroy', 'web', '2021-01-10 18:04:35', '2021-01-10 18:04:35'),
(69, 'verification.notice', 'web', '2021-01-12 04:19:50', '2021-01-12 04:19:50'),
(70, 'verification.verify', 'web', '2021-01-12 04:19:50', '2021-01-12 04:19:50'),
(71, 'verification.resend', 'web', '2021-01-12 04:19:51', '2021-01-12 04:19:51'),
(72, 'awards.index', 'web', '2021-01-12 04:19:51', '2021-01-12 04:19:51'),
(73, 'awards.create', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(74, 'awards.store', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(75, 'awards.show', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(76, 'awards.edit', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(77, 'awards.update', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(78, 'awards.destroy', 'web', '2021-01-12 04:19:52', '2021-01-12 04:19:52'),
(79, 'experiences.index', 'web', '2021-01-12 05:20:29', '2021-01-12 05:20:29'),
(80, 'experiences.create', 'web', '2021-01-12 05:20:29', '2021-01-12 05:20:29'),
(81, 'experiences.store', 'web', '2021-01-12 05:20:30', '2021-01-12 05:20:30'),
(82, 'experiences.show', 'web', '2021-01-12 05:20:30', '2021-01-12 05:20:30'),
(83, 'experiences.edit', 'web', '2021-01-12 05:20:30', '2021-01-12 05:20:30'),
(84, 'experiences.update', 'web', '2021-01-12 05:20:30', '2021-01-12 05:20:30'),
(85, 'experiences.destroy', 'web', '2021-01-12 05:20:30', '2021-01-12 05:20:30'),
(92, 'eProviderTypes.index', 'web', '2021-01-13 05:31:08', '2021-01-13 05:31:08'),
(93, 'eProviderTypes.create', 'web', '2021-01-13 05:31:09', '2021-01-13 05:31:09'),
(94, 'eProviderTypes.store', 'web', '2021-01-13 05:31:09', '2021-01-13 05:31:09'),
(95, 'eProviderTypes.edit', 'web', '2021-01-13 05:31:09', '2021-01-13 05:31:09'),
(96, 'eProviderTypes.update', 'web', '2021-01-13 05:31:09', '2021-01-13 05:31:09'),
(97, 'eProviderTypes.destroy', 'web', '2021-01-13 05:31:09', '2021-01-13 05:31:09'),
(98, 'eProviders.index', 'web', '2021-01-13 05:48:55', '2021-01-13 05:48:55'),
(99, 'eProviders.create', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(100, 'eProviders.store', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(101, 'eProviders.edit', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(102, 'eProviders.update', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(103, 'eProviders.destroy', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(104, 'addresses.index', 'web', '2021-01-13 05:48:56', '2021-01-13 05:48:56'),
(105, 'addresses.create', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(106, 'addresses.store', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(107, 'addresses.edit', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(108, 'addresses.update', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(109, 'addresses.destroy', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(110, 'taxes.index', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(111, 'taxes.create', 'web', '2021-01-13 05:48:57', '2021-01-13 05:48:57'),
(112, 'taxes.store', 'web', '2021-01-13 05:48:58', '2021-01-13 05:48:58'),
(113, 'taxes.edit', 'web', '2021-01-13 05:48:58', '2021-01-13 05:48:58'),
(114, 'taxes.update', 'web', '2021-01-13 05:48:58', '2021-01-13 05:48:58'),
(115, 'taxes.destroy', 'web', '2021-01-13 05:48:58', '2021-01-13 05:48:58'),
(116, 'availabilityHours.index', 'web', '2021-01-16 10:14:21', '2021-01-16 10:14:21'),
(117, 'availabilityHours.create', 'web', '2021-01-16 10:14:21', '2021-01-16 10:14:21'),
(118, 'availabilityHours.store', 'web', '2021-01-16 10:14:21', '2021-01-16 10:14:21'),
(119, 'availabilityHours.edit', 'web', '2021-01-16 10:14:21', '2021-01-16 10:14:21'),
(120, 'availabilityHours.update', 'web', '2021-01-16 10:14:22', '2021-01-16 10:14:22'),
(121, 'availabilityHours.destroy', 'web', '2021-01-16 10:14:22', '2021-01-16 10:14:22'),
(122, 'eServices.index', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(123, 'eServices.create', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(124, 'eServices.store', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(126, 'eServices.edit', 'web', '2021-01-19 08:03:01', '2021-01-19 08:03:01'),
(127, 'eServices.update', 'web', '2021-01-19 08:03:01', '2021-01-19 08:03:01'),
(128, 'eServices.destroy', 'web', '2021-01-19 08:03:01', '2021-01-19 08:03:01'),
(129, 'categories.index', 'web', '2021-01-19 08:08:55', '2021-01-19 08:08:55'),
(130, 'categories.create', 'web', '2021-01-19 08:08:55', '2021-01-19 08:08:55'),
(131, 'categories.store', 'web', '2021-01-19 08:08:55', '2021-01-19 08:08:55'),
(132, 'categories.edit', 'web', '2021-01-19 08:08:55', '2021-01-19 08:08:55'),
(133, 'categories.update', 'web', '2021-01-19 08:08:56', '2021-01-19 08:08:56'),
(134, 'categories.destroy', 'web', '2021-01-19 08:08:56', '2021-01-19 08:08:56'),
(135, 'optionGroups.index', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(136, 'optionGroups.create', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(137, 'optionGroups.store', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(138, 'optionGroups.edit', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(139, 'optionGroups.update', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(140, 'optionGroups.destroy', 'web', '2021-01-22 13:48:32', '2021-01-22 13:48:32'),
(141, 'options.index', 'web', '2021-01-22 14:10:51', '2021-01-22 14:10:51'),
(142, 'options.create', 'web', '2021-01-22 14:10:51', '2021-01-22 14:10:51'),
(143, 'options.store', 'web', '2021-01-22 14:10:52', '2021-01-22 14:10:52'),
(144, 'options.edit', 'web', '2021-01-22 14:10:52', '2021-01-22 14:10:52'),
(145, 'options.update', 'web', '2021-01-22 14:10:52', '2021-01-22 14:10:52'),
(146, 'options.destroy', 'web', '2021-01-22 14:10:52', '2021-01-22 14:10:52'),
(147, 'favorites.index', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(148, 'favorites.create', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(149, 'favorites.store', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(150, 'favorites.edit', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(151, 'favorites.update', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(152, 'favorites.destroy', 'web', '2021-01-22 15:01:13', '2021-01-22 15:01:13'),
(153, 'eServiceReviews.index', 'web', '2021-01-23 13:42:57', '2021-01-23 13:42:57'),
(154, 'eServiceReviews.create', 'web', '2021-01-23 13:42:58', '2021-01-23 13:42:58'),
(155, 'eServiceReviews.store', 'web', '2021-01-23 13:42:58', '2021-01-23 13:42:58'),
(156, 'eServiceReviews.edit', 'web', '2021-01-23 13:42:58', '2021-01-23 13:42:58'),
(157, 'eServiceReviews.update', 'web', '2021-01-23 13:42:58', '2021-01-23 13:42:58'),
(158, 'eServiceReviews.destroy', 'web', '2021-01-23 13:42:58', '2021-01-23 13:42:58'),
(160, 'galleries.index', 'web', '2021-01-23 14:17:46', '2021-01-23 14:17:46'),
(161, 'galleries.create', 'web', '2021-01-23 14:17:47', '2021-01-23 14:17:47'),
(162, 'galleries.store', 'web', '2021-01-23 14:17:47', '2021-01-23 14:17:47'),
(163, 'galleries.edit', 'web', '2021-01-23 14:17:47', '2021-01-23 14:17:47'),
(164, 'galleries.update', 'web', '2021-01-23 14:17:47', '2021-01-23 14:17:47'),
(165, 'galleries.destroy', 'web', '2021-01-23 14:17:47', '2021-01-23 14:17:47'),
(166, 'requestedEProviders.index', 'web', '2021-01-25 03:53:17', '2021-01-25 03:53:17'),
(167, 'slides.index', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(168, 'slides.create', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(169, 'slides.store', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(170, 'slides.edit', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(171, 'slides.update', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(172, 'slides.destroy', 'web', '2021-01-25 05:01:20', '2021-01-25 05:01:20'),
(173, 'notifications.index', 'web', '2021-01-25 09:42:33', '2021-01-25 09:42:33'),
(174, 'notifications.show', 'web', '2021-01-25 09:42:34', '2021-01-25 09:42:34'),
(175, 'notifications.destroy', 'web', '2021-01-25 09:42:34', '2021-01-25 09:42:34'),
(176, 'coupons.index', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(177, 'coupons.create', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(178, 'coupons.store', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(179, 'coupons.edit', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(180, 'coupons.update', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(181, 'coupons.destroy', 'web', '2021-01-25 10:11:55', '2021-01-25 10:11:55'),
(182, 'bookingStatuses.index', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(183, 'bookingStatuses.create', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(184, 'bookingStatuses.store', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(185, 'bookingStatuses.edit', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(186, 'bookingStatuses.update', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(187, 'bookingStatuses.destroy', 'web', '2021-01-25 13:21:01', '2021-01-25 13:21:01'),
(188, 'bookings.index', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(189, 'bookings.create', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(190, 'bookings.store', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(191, 'bookings.show', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(192, 'bookings.edit', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(193, 'bookings.update', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(194, 'bookings.destroy', 'web', '2021-01-25 15:27:09', '2021-01-25 15:27:09'),
(195, 'eProviderPayouts.index', 'web', '2021-01-30 05:23:08', '2021-01-30 05:23:08'),
(196, 'eProviderPayouts.create', 'web', '2021-01-30 05:23:08', '2021-01-30 05:23:08'),
(197, 'eProviderPayouts.store', 'web', '2021-01-30 05:23:08', '2021-01-30 05:23:08'),
(198, 'eProviderPayouts.destroy', 'web', '2021-01-30 05:23:09', '2021-01-30 05:23:09'),
(199, 'earnings.index', 'web', '2021-01-30 07:57:57', '2021-01-30 07:57:57'),
(200, 'earnings.create', 'web', '2021-01-30 07:57:57', '2021-01-30 07:57:57'),
(201, 'earnings.store', 'web', '2021-01-30 07:57:57', '2021-01-30 07:57:57'),
(202, 'earnings.destroy', 'web', '2021-01-30 07:57:57', '2021-01-30 07:57:57'),
(203, 'customPages.index', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(204, 'customPages.create', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(205, 'customPages.store', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(206, 'customPages.show', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(207, 'customPages.edit', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(208, 'customPages.update', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(209, 'customPages.destroy', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(210, 'wallets.index', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(211, 'wallets.create', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(212, 'wallets.store', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(213, 'wallets.update', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(214, 'wallets.edit', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(215, 'wallets.destroy', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(216, 'walletTransactions.index', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(217, 'walletTransactions.create', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(218, 'walletTransactions.store', 'web', '2021-02-24 05:37:44', '2021-02-24 05:37:44'),
(219, 'modules.update', 'web', '2023-03-29 11:09:49', '2023-03-29 11:09:49'),
(220, 'modules.install', 'web', '2023-03-29 11:09:49', '2023-03-29 11:09:49'),
(221, 'modules.index', 'web', '2023-03-29 11:09:49', '2023-03-29 11:09:49'),
(222, 'modules.enable', 'web', '2023-03-29 11:09:49', '2023-03-29 11:09:49'),
(223, 'eServices.provider_create', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(224, 'eServices.provider_store', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(225, 'hide.in_provider', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(226, 'show.in_provider', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(227, 'eServices.my_services_table', 'web', '2021-01-19 08:03:00', '2021-01-19 08:03:00'),
(228, 'entries.index', 'web', NULL, NULL),
(229, 'contacts.index', 'web', NULL, NULL),
(230, 'estimates.index', 'web', NULL, NULL),
(231, 'estimates.show', 'web', NULL, NULL),
(232, 'estimates.destroy', 'web', NULL, NULL),
(233, 'entries.show', 'web', NULL, NULL),
(234, 'entries.destroy', 'web', NULL, NULL),
(235, 'contacts.show', 'web', NULL, NULL),
(236, 'contacts.destroy', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', 0, NULL, NULL),
(3, 'provider', 'web', 0, NULL, NULL),
(4, 'customer', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(10, 3),
(11, 2),
(11, 4),
(12, 2),
(13, 2),
(16, 2),
(19, 2),
(20, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(54, 3),
(54, 4),
(57, 2),
(57, 3),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(72, 3),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(92, 2),
(92, 3),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(98, 3),
(99, 2),
(99, 4),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(106, 2),
(106, 3),
(106, 4),
(107, 2),
(107, 3),
(107, 4),
(108, 2),
(108, 3),
(108, 4),
(109, 2),
(109, 3),
(109, 4),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(122, 3),
(122, 4),
(123, 2),
(124, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(129, 3),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(149, 2),
(149, 3),
(150, 2),
(151, 2),
(151, 3),
(152, 2),
(153, 2),
(153, 3),
(153, 4),
(156, 2),
(156, 4),
(157, 2),
(157, 4),
(158, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(165, 3),
(166, 2),
(166, 4),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(173, 3),
(173, 4),
(174, 2),
(175, 2),
(175, 3),
(175, 4),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(180, 2),
(181, 2),
(182, 2),
(185, 2),
(186, 2),
(188, 2),
(188, 3),
(188, 4),
(191, 2),
(191, 3),
(191, 4),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(194, 3),
(195, 2),
(195, 3),
(196, 2),
(196, 3),
(197, 2),
(197, 3),
(199, 2),
(199, 3),
(200, 2),
(200, 3),
(203, 2),
(203, 3),
(203, 4),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(210, 3),
(210, 4),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(216, 3),
(216, 4),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2),
(223, 3),
(224, 3),
(225, 2),
(225, 4),
(226, 3),
(227, 3),
(228, 2),
(229, 2),
(230, 2),
(231, 2),
(232, 2),
(233, 2),
(234, 2),
(235, 2),
(236, 2);

-- --------------------------------------------------------

--
-- Table structure for table `service_provides`
--

CREATE TABLE `service_provides` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_provides`
--

INSERT INTO `service_provides` (`e_service_id`, `user_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `button` longtext DEFAULT NULL,
  `text_position` varchar(50) DEFAULT 'start',
  `text_color` varchar(36) DEFAULT NULL,
  `button_color` varchar(36) DEFAULT NULL,
  `background_color` varchar(36) DEFAULT NULL,
  `indicator_color` varchar(36) DEFAULT NULL,
  `image_fit` varchar(50) DEFAULT 'cover',
  `e_service_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `e_service_id`, `user_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assign a Handyman at Work to Fix the Household', 'Discover It', 'bottom_start', '#333333', '#009E6A', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 05:51:45', '2021-01-31 05:08:13'),
(2, 2, 'Fix the Broken Stuff by Asking for the Technicians', 'Repair', 'bottom_start', '#333333', '#F4841F', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 08:23:49', '2021-01-31 05:03:05'),
(3, 3, 'Add Hands to Your Cleaning Chores', 'Book Now', 'bottom_start', '#333333', '#1FA3F4', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-31 05:04:36', '2021-01-31 05:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext DEFAULT NULL,
  `value` double(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tax 20', 20.00, 'percent', '2021-01-15 05:12:13', '2021-02-01 15:23:01'),
(2, 'Tax 10', 10.00, 'percent', '2021-01-15 05:19:30', '2021-01-15 05:19:30'),
(3, 'Maintenance', 2.00, 'fixed', '2021-01-18 14:48:29', '2021-02-01 15:25:13'),
(4, 'Tools Fee', 5.00, 'fixed', '2021-02-01 15:24:12', '2021-02-01 15:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `temp_providers`
--

CREATE TABLE `temp_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(24) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `e_provider_type_id` int(10) UNSIGNED DEFAULT NULL,
  `types` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `api_token` char(60) DEFAULT NULL,
  `device_token` varchar(191) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(191) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
(1, '37139ffb-a518-467a-9df0-9c96b05b2a1b', '2023-03-29 21:04:03', '2023-03-29 21:04:03'),
(2, 'c28003c4-4460-4018-9a31-35ecf6f048e7', '2023-03-29 21:06:02', '2023-03-29 21:06:02'),
(3, 'e5090725-f7d5-44f5-a3b4-73342b937934', '2023-03-31 20:45:07', '2023-03-31 20:45:07'),
(4, '65cc844b-75fa-4825-9bee-a6c9f55287b3', '2023-04-01 04:57:42', '2023-04-01 04:57:42'),
(5, '04124b09-cc60-481d-91bf-d8d5df1e58de', '2023-04-01 04:59:11', '2023-04-01 04:59:11'),
(6, '3f55c85c-a895-41b6-a56e-977ae4174349', '2023-04-01 20:12:30', '2023-04-01 20:12:30'),
(7, '8a26e7e2-2cfc-4e1e-b69e-ee1511c76ac0', '2023-04-07 20:09:22', '2023-04-07 20:09:22'),
(8, '1e07f2c1-320a-441d-b551-7ff8088f41fe', '2023-04-07 20:18:08', '2023-04-07 20:18:08'),
(9, '63e88194-2dfe-4b64-8b26-cb28c95bc335', '2023-04-07 20:26:34', '2023-04-07 20:26:34'),
(10, 'ad3d2dd6-f807-4c62-ae8d-da422d819cd7', '2023-04-07 20:27:09', '2023-04-07 20:27:09'),
(11, '36fd640a-32eb-45c7-8684-f0db26257136', '2023-04-07 20:27:35', '2023-04-07 20:27:35'),
(12, '32ec8e1e-405b-4fc6-9305-670a8d118d16', '2023-04-07 20:41:40', '2023-04-07 20:41:40'),
(13, '89632057-8cd9-42fa-9f95-43172066b086', '2023-04-09 22:02:03', '2023-04-09 22:02:03'),
(14, '002dec69-37e9-4438-b363-bec7bb7f4986', '2023-04-09 22:02:34', '2023-04-09 22:02:34'),
(15, '1c6f888d-2570-4db0-a921-6248f462926e', '2023-04-09 22:03:42', '2023-04-09 22:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(24) DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `e_provider_type_id` int(10) UNSIGNED DEFAULT NULL,
  `types` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `api_token` char(60) DEFAULT NULL,
  `device_token` varchar(191) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(191) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `e_provider_type_id`, `types`, `description`, `mobile_number`, `availability_range`, `available`, `featured`, `accepted`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hyatt Zimmerman', 'admin@demo.com', '+1 234 8996 321', '2021-01-10 11:22:10', '2021-01-10 11:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', '', NULL, NULL, NULL, NULL, NULL, 'fU74kiNeDsPSli77nLRFboCEmUOuK57tpt9SGSczqnmlebqgOODfO8HXjYrb', NULL, '2021-02-09 10:50:32'),
(2, 'Jennifer Paul', 'provider@demo.com', '+1 234 8996 322', '2021-01-10 11:22:10', '2021-01-10 11:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', NULL, 'Update Information', NULL, NULL, 1.00, 1, 0, 0, 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '', NULL, NULL, NULL, NULL, NULL, '4OSPtwSopKZMcyJXYPu7ZOhXsMsidvHOy3UU3HPoKmCfbGWE2rwL7xycXsWR', NULL, '2023-04-04 03:24:45'),
(3, 'Germaine Guzman', 'customer@demo.com', '+1 234 8996 222', '2021-01-10 11:22:10', '2021-01-10 11:22:10', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', '', NULL, NULL, NULL, NULL, NULL, 'SPz6luq3aoxCbgIS1gqmFDgM1qzGlIDtF0HgmDbtWcx2reaeFcogcFQzdP2F', NULL, '2023-04-04 19:24:11'),
(4, 'Aimee Mcgee', 'provider1@demo.com', '+1 234 8996 324', '2021-01-10 11:22:10', '2021-01-10 11:22:10', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', NULL, NULL, NULL, NULL, NULL, 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2021-02-21 08:50:29'),
(5, 'Josephine Harding', 'customer3@demo.com', NULL, NULL, NULL, '$2y$10$n/06hZG121ZGp3tSwDQS3uhsQKxEYspjKrn7kGlLxRinUZKiulrEm', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 04:55:52', '2021-02-02 05:29:47'),
(6, 'Nicolette Christiansen', 'provider2@demo.com', '012346546987', NULL, '2021-01-10 18:00:00', '$2y$04$WRpHC9iMxZ3f.gctQ4igsuZjsYfGjX7igVM8GsC2AMME3.4au3dYu', NULL, '', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p><br></p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '68174968797', 2.00, 1, 1, 1, 'TKArYDDFHNiEI33sfExaBEhxHCs5kFaWP7EO6aNlUZfnqHrvsMCwsYeAk9s2', NULL, NULL, NULL, NULL, NULL, NULL, 'JbiYaHlRWGKkfITxH9qI87GzTMPf0zJ2Iw6NIdlS5dDvWuT5PC2sP5ELGwKx', '2021-01-11 05:33:59', '2023-04-01 05:33:13'),
(7, 'Rose Bauer', 'customer2@demo.com', NULL, NULL, NULL, '$2y$10$3GhoIShzRdSXevYAh1NF/.67J3OshX9D2.sqY50o8kxh7EXPw7tuC', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'w6QJYqZyllY24AIR3nSsKqgj5eMSZevmgpSywwxJxUS9nwULcuriRLBxEXZC', '', NULL, NULL, NULL, NULL, NULL, 'WxYP9zjTBy9SYF5OWjcFbMt2Ob9r0bahBKzPDOtw9OrAJ89JqaMxkN5aqu8J', '2021-01-17 10:13:24', '2021-02-28 12:03:25'),
(8, 'smarter8', 'smartersvision@gmail.com', '+12645595482', NULL, NULL, '$2y$10$MqPMTfg6RUNxxEH6aLdqnOYZUBsT7xtxkglD74pDgThV52.HJrLba', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'WivbG2oAEbEGl51EBeBuHaZeCqyfBnCVGo18nSaj2FwwiDjux2ZOAZWUoddK', '', NULL, NULL, NULL, NULL, NULL, 'SdstZCaeYW0pjqZn832HMzBD7WPGJ5m9hwWG28nhbIrzSS0etj33rbTRJ6kD', '2021-02-10 05:31:12', '2021-02-23 14:41:50'),
(9, 'Shrestho Das', 'pro4@gmail.com', '01236547910', NULL, NULL, '$2y$10$dyi3OprEzHFrSA6eyQdmaOJgDzcjij3u3nvRoFbyBWm1ACs37A7FC', NULL, '', NULL, NULL, 1.00, 0, 1, 1, 'taHGmGDaIU4Pfuh5A8dPI97mnBc3HcwPd9qYIGTehDphvsxJCvgelMMqqG7N', '', NULL, NULL, NULL, NULL, NULL, 'OTqptIxWn9bt1zY3VSJCr5wRsPZxsYNpQlX9g3KGC9Rf7L7NcFn6E8mTzLC5', '2023-03-29 17:49:01', '2023-03-29 18:49:21'),
(10, 'Gannon Burch', 'qiqaj@mailinator.com', '+1 (109) 857-1706', NULL, NULL, '$2y$10$rHkgA7fsaYmdyM.wIVK1FuQxyeQSkIztAm6alQCG/bPqKhOo9y49a', NULL, '', NULL, NULL, 1.00, 1, 0, 1, '9fAIC7EWCi8mljPjaVigBrrlNAuqRjPWIX5UG2QhdwFymJFixfbxs3ttyMFS', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 01:52:02', '2023-04-02 20:11:38'),
(11, 'provider 10', 'pro10@gmail.com', '01236547110', NULL, NULL, '$2y$10$hcFoH2ICVQTUFD3xPZhKIO4b7NRnnxPxmUcMYgPRFbSASALGbh3/m', NULL, '', NULL, NULL, 0.00, 1, 0, 1, 'SF9i5ZkyPomXAg3oPgmK5MIAwIhzuDrG7ckraTP6U8R4eBifGU38ENIPpOIG', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:08:44', '2023-04-01 19:08:44'),
(12, 'provider 11', 'pro11@gmail.com', '01236547111', NULL, NULL, '$2y$10$tnkS8niQXGv0SCYjMMy/YOvHAv6C4d8j9OURLsPEGorUc6iRAp5iy', NULL, '', NULL, NULL, 0.00, 1, 0, 1, 'mDsaOb6rInBXkgAQcr4zBBmtP7HUKch37K2CwR9BvMR9BiSU4jPgM8mxKaSt', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:08:59', '2023-04-01 19:08:59'),
(13, 'provider 12', 'pro12@gmail.com', '01236547112', NULL, NULL, '$2y$10$cB1iuwOCt83WF0rKDmL9V.ydZC0s6h7PNZGqj6sfmEyuboumYqsBe', NULL, '', NULL, NULL, 0.00, 1, 0, 1, 'DW0tTsxYTrj8rswY5XpXAQfFw7XfXHuwPZthpB3i8RYDmdZZ0sUTtS6mfZKg', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:09:11', '2023-04-01 19:09:11'),
(14, 'provider 13', 'pro13@gmail.com', '01236547113', NULL, NULL, '$2y$10$jl5k7o2OcWztRhFx6SzJxeVsJCgH7LSD6KxONMIxrdmmXFVsJpTh2', NULL, '', NULL, NULL, 0.00, 1, 0, 1, '8H6mQPF1vJukqsvko45NzA9wzvLiu3TJbb7celUFIUSlhMGdKfcwSmjwTNwC', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:09:29', '2023-04-01 19:09:29'),
(15, 'provider 14', 'pro14@gmail.com', '01236547114', NULL, NULL, '$2y$10$D5poMs.1vPSb5k69ydmxPut5fzHQv0PtzDRfjLVeY1qsByEOUnvwS', NULL, '', NULL, NULL, 0.00, 1, 0, 1, '32tO0YeogTPzzvrUk1yrx0gCYdKlmWVFYAFfgicugJlXLyrp7EI5CMdGVW4e', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:09:42', '2023-04-01 19:09:42'),
(16, 'provider 15', 'pro15@gmail.com', '01236547115', NULL, NULL, '$2y$10$3W5KsfvRLgp7DEFVd0pBKuRVkDxNdxM/vjVZRP/xrFZLc1WSBg1Sy', NULL, '', NULL, NULL, 1.00, 1, 0, 1, 'QhJnYDMMOgWXDnM797pfrcWtd3v9DVfB6PUjq7htZ3NC38OyXpsvk7IR4NLp', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-01 19:09:59', '2023-04-02 20:09:40'),
(17, 'Stacey Burch', 'user@gmail.com', '+1 (163) 422-5346', NULL, NULL, '$2y$10$ofSjgZS3EAiNozmbHTb84uC5DIORsvuTnHeficOMJQLQKnsK.apBe', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'h2NeRcYUP0tMzkHjx13QlrHSPearGU1ZQBnecfb5mObphp1ZsB7sXFjbaGwO', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-05 18:02:49', '2023-04-05 18:02:49'),
(18, 'Karina Chandler', 'test@mailinator.com', '+1 (932) 913-8073', NULL, NULL, '$2y$10$UdBFMtc9nm3cZaTHw7XOIe79lgBzjHMGlHXz1nbIQwT6BhWkRRr7i', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'TLQnrNTZE3deIMSfisnrNzrm5Ijd88jgAsKeLBz7sROTyl5AXPTH5pcWdY1B', '', NULL, NULL, NULL, NULL, NULL, 'XQZHyKqvSakYWLMM40h1efKqzMP1PtBKrlyNTbf7x0VSOIrd5orRuOO5Ps3R', '2023-04-08 20:13:23', '2023-04-08 20:13:23'),
(19, 'Reed Butler', 'siqoh@mailinator.com', '+1 (104) 572-3753', NULL, NULL, '$2y$10$Q2/KGBuiFioNXc8RYC.Gpu3Kx.u/VM0RIBHXlJmti9QPk9LEuEI9C', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'ydOX2vxrJ1TpdEMnFeWseCr3bW8sgvDk6SXTp6jzZROF4InPKcQr9MlgUqOs', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 20:40:55', '2023-04-08 20:40:55'),
(20, 'Donna Newton', 'nyvyca@mailinator.com', '+1 (776) 687-5984', NULL, NULL, '$2y$10$DNwhOGUPTL0UPnQeSoMXWei3Z8Ws2Oz7ibRUbdmTfYovO1UwqH17.', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'DriN2uq0tsQNCNeMHz6frtonJv83Nio1NDeEgybxarntIdnLwoytmIQ1wCD8', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 20:47:12', '2023-04-08 20:47:12'),
(21, 'Caldwell Velazquez', 'helunyh@mailinator.com', '+1 (277) 495-4341', NULL, NULL, '$2y$10$9UCyyS7ji7DulAmNAIUZFeqcmq6VOl/3bFXZ7qAY9k8zp78pGAW2G', NULL, '', NULL, NULL, 0.00, 1, 0, 0, '7KPK6xcSv8k25saZlyVGnASGKGhyI6X3V6fLitmUMvgyTthOA5hBZdN1s8k8', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-08 20:49:30', '2023-04-08 20:49:30'),
(22, 'Elvis Church', 'fudan@mailinator.com', '+1 (286) 557-4999', NULL, NULL, '$2y$10$hcWsMciO4T5EwLXAgfLjo.YbKnpY4nIVPg1VYBeH0fjxxg8BjNXvS', NULL, '', NULL, NULL, 0.00, 1, 0, 0, 'QC76BL87Gt6A34btA2pPkNy06pEj3VuufxIThaUv3Im8rFo9KV7A1qzPxg5f', '', NULL, NULL, NULL, NULL, NULL, NULL, '2023-04-10 21:19:11', '2023-04-10 21:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `balance` double(16,2) NOT NULL DEFAULT 0.00,
  `currency` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `name`, `balance`, `currency`, `user_id`, `enabled`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 'My USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 1, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 'Home USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 2, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 'Work USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 3, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 'Dummy USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 4, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 'Old USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 5, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 'New USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 6, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 'USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 7, 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('08149a46-11d6-4b95-8dc5-57ea7a244920', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:34:19', '2023-04-14 23:34:19'),
('3bc846d9-ae1c-49ed-99dd-c3eccd88b49b', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:27:54', '2023-04-14 23:27:54'),
('61432e7d-85c8-40c2-8d43-e397fca96f2f', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:35:13', '2023-04-14 23:35:13'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 'Dollar Wallet', 29.65, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 8, 1, '2021-01-07 07:17:34', '2023-04-14 20:47:06'),
('caea7c6a-650c-4ea7-ae72-1d3509171136', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:30:57', '2023-04-14 23:30:57'),
('de8fef7c-9bb2-4d99-b1bc-194b891d766e', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:19:21', '2023-04-14 23:19:21'),
('eaf8d83c-ecca-47cf-aab5-4bf72fd70743', 'My USD Wallet for booking', 0.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 18, 1, '2023-04-14 23:06:34', '2023-04-14 23:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` char(36) NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  `action` enum('credit','debit') NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `amount`, `description`, `action`, `wallet_id`, `user_id`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '01194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '02194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '03194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '04194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '05194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '06194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '07194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '8d194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 07:17:34', '2021-08-07 07:17:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_hours_user_id_foreign` (`user_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_user_id_foreign` (`user_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_booking_status_id_foreign` (`booking_status_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_user_id_foreign` (`user_id`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_user_id_foreign` (`user_id`);

--
-- Indexes for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_providers_email_unique` (`email`),
  ADD KEY `e_providers_e_provider_type_id_foreign` (`e_provider_type_id`);

--
-- Indexes for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD PRIMARY KEY (`user_id`,`address_id`),
  ADD KEY `e_provider_addresses_address_id_foreign` (`address_id`);

--
-- Indexes for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_provider_payouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD PRIMARY KEY (`user_id`,`tax_id`),
  ADD KEY `e_provider_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD PRIMARY KEY (`user_id`,`e_provider_id`),
  ADD KEY `e_provider_users_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_services`
--
ALTER TABLE `e_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_services_user_id_foreign` (`user_id`);

--
-- Indexes for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD PRIMARY KEY (`e_service_id`,`category_id`),
  ADD KEY `e_service_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_service_reviews_user_id_foreign` (`user_id`),
  ADD KEY `e_service_reviews_e_service_id_foreign` (`e_service_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_e_service_id_foreign` (`e_service_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD PRIMARY KEY (`option_id`,`favorite_id`),
  ADD KEY `favorite_options_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_foreign` (`user_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_e_service_id_foreign` (`e_service_id`),
  ADD KEY `options_option_group_id_foreign` (`option_group_id`);

--
-- Indexes for table `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_payment_status_id_foreign` (`payment_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service_provides`
--
ALTER TABLE `service_provides`
  ADD PRIMARY KEY (`e_service_id`,`user_id`),
  ADD KEY `service_provides_user_id_foreign` (`user_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_e_service_id_foreign` (`e_service_id`),
  ADD KEY `slides_user_id_foreign` (`user_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_providers`
--
ALTER TABLE `temp_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `temp_providers_email_unique` (`email`),
  ADD UNIQUE KEY `temp_providers_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `temp_providers_api_token_unique` (`api_token`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `availability_hours`
--
ALTER TABLE `availability_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `e_providers`
--
ALTER TABLE `e_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_services`
--
ALTER TABLE `e_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `temp_providers`
--
ALTER TABLE `temp_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD CONSTRAINT `availability_hours_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_status_id_foreign` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD CONSTRAINT `e_providers_e_provider_type_id_foreign` FOREIGN KEY (`e_provider_type_id`) REFERENCES `e_provider_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD CONSTRAINT `e_provider_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD CONSTRAINT `e_provider_payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD CONSTRAINT `e_provider_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_taxes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD CONSTRAINT `e_provider_users_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_services`
--
ALTER TABLE `e_services`
  ADD CONSTRAINT `e_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD CONSTRAINT `e_service_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_categories_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD CONSTRAINT `e_service_reviews_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_provides`
--
ALTER TABLE `service_provides`
  ADD CONSTRAINT `service_provides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_provides_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `slides_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
