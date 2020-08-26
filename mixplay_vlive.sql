-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 21, 2019 at 10:17 PM
-- Server version: 10.2.22-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mixplay_vlive`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_transactions`
--

CREATE TABLE `ads_transactions` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL DEFAULT 0,
  `video_owner` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `time` int(32) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_views`
--

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `announcement_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banned`
--

CREATE TABLE `banned` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(100) DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `pinned` enum('0','1') CHARACTER SET utf8 DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT 0,
  `dis_likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `video_id`, `post_id`, `text`, `time`, `pinned`, `likes`, `dis_likes`) VALUES
(1, 5, 2030, 0, 'dast xosh bra giyan', 1551088114, '0', 0, 0),
(3, 5, 2005, 0, 'ئەی دەست خۆش بێ  برا گیان بە ڕاستی کاریگەر بوو ماندوو نەبیت', 1551210915, '0', 0, 0),
(4, 9, 2094, 0, 'nice', 1551224255, '0', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `reply_id` int(30) NOT NULL DEFAULT 0,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `post_id` int(15) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments_likes`
--

INSERT INTO `comments_likes` (`id`, `user_id`, `comment_id`, `reply_id`, `video_id`, `post_id`, `time`, `type`) VALUES
(2, 5, 4, 0, 0, 0, 1551262983, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comm_replies`
--

CREATE TABLE `comm_replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(15) NOT NULL DEFAULT 0,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `post_id` int(15) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `time` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'theme', 'default'),
(2, 'censored_words', ''),
(3, 'title', 'MixPlay'),
(4, 'name', 'MixPlay'),
(5, 'keyword', 'MixPlay,TorMix,Video,Kurdish,Kurdistan,Clip,Gorani,Ferkari'),
(6, 'email', 'shalawkoyy@gmail.com'),
(7, 'description', 'MixPlay First Kurdish video sharing service'),
(8, 'validation', 'off'),
(9, 'recaptcha', 'off'),
(10, 'recaptcha_key', ''),
(11, 'language', 'kurdish'),
(12, 'google_app_ID', ''),
(13, 'google_app_key', ''),
(14, 'facebook_app_ID', '2345941485417342'),
(15, 'facebook_app_key', '14535a9d3f8248e7ac19c1b11ee2c70d'),
(16, 'twitter_app_ID', 'I0j9fVuXIECZgkwT06ynHp0ph'),
(17, 'twitter_app_key', 'eiYhDVixNmgZCaC6kTi3aixGqWBAJGpBFNeK271CurpvOKYs1y'),
(18, 'yt_api', 'AIzaSyBTwxpmr5EraHyEolTDPiSx7axFS-0CE5s'),
(19, 'seo_link', 'on'),
(20, 'comment_system', 'default'),
(21, 'smtp_or_mail', 'mail'),
(22, 'smtp_host', ''),
(23, 'smtp_username', ''),
(24, 'smtp_password', ''),
(25, 'smtp_encryption', 'ssl'),
(26, 'smtp_port', ''),
(27, 'delete_account', 'off'),
(28, 'total_videos', '168'),
(29, 'total_views', '843'),
(30, 'total_users', '7'),
(31, 'total_subs', '24'),
(32, 'total_comments', '3'),
(33, 'total_likes', '44'),
(34, 'total_dislikes', '0'),
(35, 'total_saved', '0'),
(36, 'last_admin_collection', '1553112724'),
(37, 'user_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_users&quot;:4},{&quot;month&quot;:&quot;March&quot;,&quot;new_users&quot;:2},{&quot;month&quot;:&quot;April&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_users&quot;:0}]'),
(38, 'videos_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:149},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:19},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]'),
(39, 'upload_system', 'on'),
(40, 'import_system', 'on'),
(41, 'resize_video', 'on'),
(42, 'autoplay_system', 'on'),
(43, 'embed_system', 'on'),
(44, 'history_system', 'on'),
(45, 'user_registration', 'on'),
(46, 'verification_badge', 'on'),
(47, 'comments_default_num', '10'),
(48, 'vimeo_api_key', ''),
(49, 'fb_login', 'on'),
(50, 'tw_login', 'on'),
(51, 'plus_login', 'off'),
(52, 'wowonder_app_ID', '2b5a73de8fb79b8173ce'),
(53, 'wowonder_app_key', '4a11d1938df5f920b129929f08c2f31e5c69901'),
(54, 'wowonder_domain_uri', 'https://tormix.net'),
(55, 'wowonder_site_name', ''),
(56, 'wowonder_login', 'on'),
(57, 'wowonder_img', 'https://i.postimg.cc/FsQt0KYp/43590350-972747502909315-4803988153994051584-n.png'),
(58, 'google', ''),
(59, 'last_created_sitemap', '12-06-2018'),
(60, 'is_ok', '1'),
(61, 'pro_pkg_price', '10'),
(62, 'payment_currency', 'USD'),
(63, 'go_pro', 'on'),
(64, 'paypal_id', ''),
(65, 'paypal_secret', ''),
(66, 'paypal_mode', 'sandbox'),
(67, 'last_backup', '00-00-0000'),
(68, 'user_ads', 'on'),
(69, 'rss_export', 'on'),
(70, 'max_upload', '10000000000'),
(71, 's3_upload', 'on'),
(72, 's3_bucket_name', 'mixplay'),
(73, 'amazone_s3_key', 'AKIAJGVD4RBTHVIKGRAQ'),
(74, 'amazone_s3_s_key', 'm0Lq2XWGgQiR1BA2Cx9tP/T2jUsEbqQkCTD15vNG'),
(75, 'region', 'us-west-2'),
(76, 'ad_v_price', '0.1'),
(77, 'ad_c_price', '0.5'),
(78, 'pub_price', '0.02'),
(79, 'usr_v_mon', 'on'),
(80, 'apps_api_id', '03867a9eeeadb8fb48b5e6152071190b'),
(81, 'apps_api_key', '08696a3ab92331f1f919f6e5abeed545'),
(82, 'ffmpeg_system', 'off'),
(83, 'ffmpeg_binary_file', 'ffmpeg'),
(84, 'user_max_upload', '1000000000'),
(85, 'user_max_import', '100'),
(86, 'convert_speed', 'fast'),
(87, 'night_mode', 'both'),
(88, 'server', 'ajax'),
(89, 'article_system', 'on'),
(90, 'ftp_host', ''),
(91, 'ftp_port', ''),
(92, 'ftp_username', ''),
(93, 'ftp_password', ''),
(94, 'ftp_upload', 'off'),
(95, 'ftp_endpoint', ''),
(96, 'ftp_path', './'),
(97, 'watermark', 'https://i.postimg.cc/QCZTX70v/10000.png'),
(98, 'ftp_host', 'localhost'),
(99, 'ftp_port', '21'),
(100, 'ftp_username', ''),
(101, 'ftp_password', ''),
(102, 'ftp_upload', 'off'),
(103, 'ftp_endpoint', 'storage.wowonder.com'),
(104, 'ftp_path', './'),
(105, 'watermark', 'https://i.postimg.cc/QCZTX70v/10000.png'),
(106, 'download_videos', 'on'),
(107, 'facebook_import', 'on'),
(108, 'donate_system', 'on'),
(109, 'approve_videos', 'off'),
(110, 'videos_upload_limit', '0'),
(111, 'sell_videos_system', 'on'),
(112, 'admin_com_sell_videos', '5'),
(113, 'who_sell', 'pro_users'),
(114, 'auto_approve_', 'yes'),
(115, 'com_type', '1'),
(116, 'upload_system_type', '1'),
(117, 'max_upload_all_users', '1000000000'),
(118, 'max_upload_free_users', '1000000000'),
(119, 'max_upload_pro_users', '10000000000'),
(120, 'player_type', 'videojs'),
(121, 'two_factor_setting', 'on'),
(122, 'queue_count', '0'),
(123, 'popular_channels', 'on'),
(124, 'twitch_api', 'twb88q5mhne1gsrwvkhtlugvrqniks'),
(125, 'twitch_import', 'on'),
(126, 'geo_blocking', 'off'),
(127, 'server_key', '1312a113c58715637a94437389326a49'),
(128, 'earn_from_ads', 'on'),
(129, 'push', '1'),
(130, 'push_id', '44dac439-ef98-47a7-86d4-5cd173f77b70'),
(131, 'push_key', 'NTdkYzVmNjktMDdiNS00OWU4LWI5NTktYmYwN2FiMzViYTUx'),
(132, 'recurring_payment', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_one`, `user_two`, `time`) VALUES
(1, 3, 1, 1550759700),
(2, 1, 3, 1550759700),
(3, 9, 1, 1551224303),
(4, 1, 9, 1551224303);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `user_id`, `video_id`, `time`) VALUES
(21, 1, 614, 1550800485),
(22, 1, 587, 1550800738),
(24, 3, 614, 1550803523),
(25, 5, 1988, 1550849565),
(26, 5, 614, 1550850584),
(27, 5, 1989, 1550851409),
(28, 5, 1990, 1550852164),
(30, 5, 1991, 1550921977),
(31, 5, 1992, 1550922510),
(32, 1, 1992, 1550953276),
(33, 5, 1993, 1551010343),
(34, 5, 1994, 1551015722),
(35, 1, 1994, 1551081082),
(37, 5, 2089, 1551085907),
(38, 5, 2030, 1551087525),
(41, 1, 2030, 1551130973),
(45, 1, 1998, 1551135810),
(47, 5, 2094, 1551188029),
(48, 5, 2095, 1551189612),
(49, 6, 2088, 1551192458),
(50, 5, 2005, 1551210695),
(51, 9, 2094, 1551224233),
(52, 9, 1998, 1551224273),
(53, 2, 2095, 1551458063),
(54, 5, 2096, 1551538875),
(55, 1, 2096, 1551612573),
(56, 1, 603, 1551612583),
(57, 10, 605, 1551711344),
(59, 11, 2087, 1551773187),
(60, 11, 2086, 1551773202),
(61, 11, 1998, 1551775609),
(62, 12, 1993, 1551777655),
(63, 12, 1989, 1551777656),
(64, 11, 2079, 1551784320),
(65, 11, 2080, 1551784324),
(66, 13, 1998, 1551888018),
(69, 14, 1997, 1552139410),
(72, 15, 2060, 1552167945),
(76, 5, 2100, 1552666978),
(79, 5, 2087, 1552737306),
(80, 1, 2100, 1552739487),
(81, 5, 2101, 1552743230),
(82, 5, 2102, 1552755079),
(84, 1, 2102, 1552825885),
(85, 5, 609, 1552850879),
(86, 1, 605, 1552887411),
(87, 1, 613, 1552887811),
(88, 1, 610, 1552887831),
(89, 5, 2103, 1552991499),
(90, 5, 2104, 1552992540),
(91, 5, 2105, 1552992651),
(92, 5, 2106, 1552992882),
(93, 5, 2107, 1552993067),
(94, 5, 2108, 1552993283),
(95, 5, 2109, 1552993485),
(96, 5, 2110, 1552993650),
(97, 5, 2111, 1552993879),
(98, 5, 2112, 1552994211),
(99, 5, 2113, 1553008263),
(100, 1, 2103, 1553043296),
(101, 1, 2110, 1553045287),
(103, 1, 567, 1553045888),
(104, 5, 2115, 1553093904),
(105, 5, 2116, 1553094438),
(106, 5, 2117, 1553094824),
(107, 5, 2118, 1553100360);

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `english` text DEFAULT NULL,
  `arabic` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dutch` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `french` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `german` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `russian` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `spanish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `turkish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `kurdish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `kurdish_badini` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `persian` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`, `kurdish`, `kurdish_badini`, `persian`) VALUES
(1, 'login', '', 'Login', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Anmeldung', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç', 'چوونه‌ژووره‌وه‌', 'داخل بوون', 'ورود'),
(2, 'search_keyword', '', 'Search for videos', 'البحث عن مقاطع الفيديو', 'Zoek naar video\'s', 'Rechercher des vidéos', 'Suche nach Videos', 'Поиск видео', 'Buscar videos', 'Videoları arayın', 'گه‌ڕان به‌ دوای ڤیدیۆ', 'گەڕیان بدیف ویدیۆیان', 'جستجو برای ویدیو'),
(3, 'register', '', 'Register', 'تسجيل', 'Registreren', 'registre', 'Neu registrieren', 'регистр', 'Registro', 'Kayıt olmak', 'تۆماربوون', 'خۆتۆمارکرن', 'ثبت نام'),
(4, 'invalid_request', '', 'Invalid request', 'طلب غير صالح', 'Ongeldig verzoek', 'Requête invalide', 'Ungültige Anfrage', 'Неверный запрос', 'Solicitud no válida', 'Geçersiz istek', 'هەڵەیەک ڕوویدا', 'داخازا مێهڤان کردنێ', 'خطا رخ داد!'),
(5, 'please_check_details', '', 'Please check the details', 'يرجى التحقق من التفاصيل', 'Controleer de details', 'Vérifiez les détails', 'Bitte überprüfen Sie die Details', 'Пожалуйста, проверьте детали', 'Por favor verifique los detalles', 'Lütfen ayrıntıları kontrol edin', 'تکایە لە زانیاریەکان دڵنیابەرەوە', 'هیڤی دکەم سەح کە پێزانینێن خۆ', 'لطفا جزئیات خود را بررسی کنید'),
(6, 'email_sent', '', 'E-mail sent successfully', 'تم إرسال البريد الإلكتروني بنجاح', 'E-mail is succesvol verzonden', 'E-mail envoyé avec succès', 'Email wurde erfolgreich Versendet', 'Письмо успешно отправлено', 'E-mail enviado correctamente', 'E-posta başarıyla gönderildi', 'پۆستی ئەلیکتڕۆنی بە سەرکەوتوویی نێردرا', 'پۆستێ ئەلیکترۆنی ب سەرکەفتی هاتە فڕێکرن', 'پست الیکترونی با موفقیت ارسال شد'),
(7, 'email_not_exist', '', 'E-mail not exist', 'البريد الإلكتروني غير موجود', 'E-mail bestaat niet', 'E-mail n\'existe pas', 'E-Mail existiert nicht', 'Электронная почта не существует', 'E-mail no existe', 'E-posta yok', 'ئەم پۆستی ئەلیکتڕۆنیە بوونی نیە', 'پۆستێ ئەلیکترۆنی د بنکەهێ پێزانینێن مەدا توونەیە', 'این پست الکترونیکی وجود ندارد'),
(8, 'reset_password', '', 'Reset Password', 'إعادة تعيين كلمة المرور', 'Wachtwoord opnieuw instellen', 'réinitialiser le mot de passe', 'Passwort zurücksetzen', 'Сброс пароля', 'Restablecer la contraseña', 'Şifreyi yenile', 'نوێ کردنەوەی وشەی نهێنی', 'پەیڤا  نهێنی تە ژبیر کرییە؟', 'بازنشانی گذرواژه'),
(9, 'account_is_not_active', '', 'Your account is not active yet, please confirm your E-mail.', 'حسابك غير نشط حتى الآن، يرجى تأكيد بريدك الإلكتروني.', 'Uw account is nog niet actief, bevestig alstublieft uw e-mail.', 'Votre compte n\'est pas encore actif, confirmez votre e-mail.', 'Ihr Konto ist noch nicht aktiv, bitte bestätigen Sie Ihre E-Mail.', 'Ваша учетная запись еще не активирована, пожалуйста, подтвердите свой E-mail.', 'Su cuenta aún no está activa, por favor confirme su E-mail.', 'Hesabınız henüz aktif değil, lütfen e-postanızı onaylayın.', 'هەژمارەکەت نەسەلمێنراوە هێشتا تکایە پۆستی ئەلیکتڕۆنیت بسەلمێنە', 'هەژمارێ تە هێشتا نەچالاکە ، هیڤی دکەم پۆستێ خۆ یێ ئەلیکترۆنی چالاک کە', 'حساب شما هنوز فعال نیست، لطفا پست الیکترونی (ایمیل) خود را تأیید کنید.'),
(10, 'resend_email', '', 'Resend E-mail', 'إعادة إرسال البريد الإلكتروني', 'Email opnieuw verzenden', 'Ré-envoyer l\'email', 'E-Mail zurücksenden', 'Повторно отправить E-mail', 'Reenviar email', 'Elektronik postayı tekrar gönder', 'ناردنەوەی پۆستی ئەلیکتڕۆنی', 'دووبارە پۆستێ ئەلیکترۆنی فڕێکە', 'لطفا ایمیل را دوباره ارسال کنید'),
(11, 'invalid_username_or_password', '', 'Invalid username or password', 'خطأ في اسم المستخدم أو كلمة مرور', 'ongeldige gebruikersnaam of wachtwoord', 'Nom d\'utilisateur ou mot de passe invalide', 'ungültiger Benutzername oder Passwort', 'неправильное имя пользователя или пароль', 'usuario o contraseña invalido', 'Geçersiz kullanıcı adı veya şifre', 'وشەی نهێنی یاخود ناوی بەکارهێنەر هەڵەیە', 'ناڤێ بکارهینەری ئانکو پەیڤا نهێنی نەدرستە!', 'نام کاربری یا گذرواژه نامعتبر است !.!.!'),
(12, 'gender', '', 'Gender', 'جنس', 'Geslacht', 'Le genre', 'Geschlecht', 'Пол', 'Género', 'Cinsiyet', 'ڕه‌گه‌ز', 'ڕەگەز', 'جنسيت'),
(13, 'gender_is_invalid', '', 'Gender is invalid', 'الجنس غير صالح', 'Geslacht is ongeldig', 'Le sexe n\'est pas valable', 'Geschlecht ist ungültig', 'Пол недействителен', 'Género no válido', 'Cinsiyet geçersiz', 'ڕەگەز هەڵەیە', 'ڕەگەز نەدرستە!', 'جنسیت نامعتبر است!'),
(14, 'country', '', 'Country', 'بلد', 'land', 'Pays', 'Land', 'Страна', 'País', 'ülke', 'وڵات', 'دەولەت - هەرێم', 'کشور'),
(15, 'username_is_taken', '', 'Username is taken', 'اسم المستخدم ماخوذ', 'Gebruikersnaam is in gebruik', 'Le nom d\'utilisateur est pris', 'Benutzername ist vergeben', 'Имя пользователя', 'El nombre de usuario se ha tomado', 'kullanıcı adı alınmış', 'ئەم ناوە پێشتر بەکارهاتووە', 'ناڤێ بکارهینەری ژبەری نۆکە یێ هاتییە بکارئینان', 'نام کاربری قبلا گرفته شده است!'),
(16, 'username_characters_length', '', 'Username must be between 5 / 32', 'يجب أن يكون اسم المستخدم بين 5/32', 'Gebruikersnaam moet tussen 5/32 zijn', 'Le nom d\'utilisateur doit être compris entre 5/32', 'Benutzername muss zwischen 5/32 liegen', 'Имя пользователя должно быть от 5/32', 'El nombre de usuario debe estar entre 5/32', 'Kullanıcı adı 5/32 arasında olmalıdır', 'ناوی به‌كارهێنه‌ر پێویسته‌ له‌ نێوان 5 بۆ 32 پیت بێت', 'ناڤێ بکارهینەری پێدڤیە دناڤبەرا 5 بۆ 32 پەیڤاندا بیت', 'نام کاربری باید بین  5/32 حرف باشد'),
(17, 'username_invalid_characters', '', 'Invalid username characters', 'أحرف اسم المستخدم غير صالحة', 'Ongeldige gebruikersnaam karakters', 'Caractères d\'identifiant non valides', 'Ungültige Benutzernamen', 'Неверные символы имени пользователя', 'Caracteres de usuario no válidos', 'Geçersiz kullanıcı adı karakterleri', 'تکایە ناوەکەت بە سادەیی و بە تەواوی بنووسە', 'ناڤێ بکارهینەری نەدرستە!', 'لطفا نام کاربری خود را درست و عادی بنویس'),
(18, 'email_exists', '', 'This e-mail is already in use', 'هذا البريد استخدم من قبل', 'Deze email is al in gebruik', 'Cet e-mail est déjà utilisée', 'Diese E-Mail-Adresse wird schon verwendet', 'Этот электронный адрес уже используется', 'Este correo electrónico ya está en uso', 'Bu e-posta zaten kullanılıyor', 'ئەم پۆستە ئەلیکتڕۆنیە پێشتر بەکارهاتووە', 'ئەڤ پۆستێ ئەلیکترۆنی ژبەری نۆکە یێ هاتییە بکارهینان!', 'این ایمیل در حال حاضر در حال استفاده کردن است!'),
(19, 'email_invalid_characters', '', 'E-mail is invalid', 'البريد الإلكتروني غير صالح', 'Email is ongeldig', 'Le courriel est invalide', 'E-Mail ist ungültig', 'Недействительный адрес электронной почты', 'El correo electrónico es invalido', 'E-posta geçersiz', 'پۆستی ئەلیکتڕۆنی هەڵەیە', 'پۆستێ ئەلیکترۆنی نەدرستە!', 'پست الیکترونی (ایمیل) نامعتبر است!'),
(20, 'password_not_match', '', 'Password not match', 'كلمة المرور غير متطابقة', 'Wachtwoord niet overeenkomen', 'Le mot de passe ne correspond pas', 'Passwort nicht übereinstimmen', 'Пароль не соответствует', 'La contraseña no coincide', 'Şifre eşleşmiyor', 'وشەی نهێنیەکان وەک یەک نین', 'پەیڤێن نهێنی ئێک ناگرن!', 'رمز عبور مطابقت ندارد!'),
(21, 'password_is_short', '', 'Password is too short', 'كلمة المرور قصيرة جدا', 'Wachtwoord is te kort', 'Le mot de passe est trop court', 'Das Passwort ist zu kurz', 'Пароль слишком короткий', 'La contraseña es demasiado corta', 'Şifre çok kısa', 'وشه‌ی نهێنی زۆر كورته‌', 'پەیڤا نهێنی گەلەک کورتە!', 'گذرواژه خیلی کوتاه است!'),
(22, 'reCaptcha_error', '', 'Please Check the re-captcha.', 'يرجى التحقق من إعادة كابتشا.', 'Controleer alstublieft de re-captcha.', 'Vérifiez le re-captcha.', 'Bitte überprüfen Sie das Re-Captcha.', 'Проверьте перехват.', 'Por favor, compruebe la re-captcha.', 'Lütfen yeniden captcha\'yı kontrol edin.', 'تكایه‌ كۆدی سه‌لماندن دڵنیابكه‌ره‌وه‌', 'هیڤی دکەم کۆدا سەلماندنێ پشت ڕاست کە!', 'لطفا کد تایید را بررسی کنید.'),
(23, 'successfully_joined_desc', '', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.', 'التسجيل بنجاح! لقد أرسلنا إليك رسالة إلكترونية، يرجى التحقق من البريد الوارد / الرسائل غير المرغوب فيها للتحقق من حسابك.', 'Registratie gelukt! Wij hebben u een email gestuurd, Controleer uw inbox / spam om uw account te verifiëren.', 'Inscription réussi! Nous vous avons envoyé un courriel, vérifiez votre boîte de réception / spam pour vérifier votre compte.', 'Registrierung erfolgreich! Wir haben Ihnen eine E-Mail geschickt, bitte überprüfen Sie Ihren Posteingang / Spam, um Ihr Konto zu bestätigen.', 'Регистрация прошла успешно! Мы отправили вам электронное письмо. Пожалуйста, проверьте свой почтовый ящик / спам, чтобы подтвердить свою учетную запись.', '¡Registro exitoso! Te hemos enviado un correo electrónico, verifica tu bandeja de entrada / spam para verificar tu cuenta.', 'Kayıt başarılı! Size bir e-posta gönderdik. Hesabınızı doğrulamak için lütfen gelen kutunuzu / spam\'inizi kontrol edin.', 'تۆماربوون به‌ سه‌ركه‌وتووی كۆتایی هات پۆستی ئه‌لیكترۆنیمان بۆ ناردیت سه‌یری بكه‌ له‌ به‌شی  په‌یامه‌كان یان سپام', 'تۆماربوون ب سەرکەفتی بدووماهیک هات ، مە پۆستەکێ ئەلیکتۆنی ژبۆ تە فڕێکر هیڤی دکەم بدیف چوونێ ژبۆ بکە د ناڤ بەشێن پەیامان ئانکو دناڤ بەشێ Spam دا', 'ثبت نام موفقیت آمیز بود!  <br>ما یک پست الیکترونی واسە شما فرستاده ایم، لطفا صندوق ورودی یا هرزنامه خود را بررسی کنید تا حساب کاربری خود را تأیید کنید.'),
(24, 'change_password', '', 'Change Password', 'تغيير كلمة السر', 'Verander wachtwoord', 'Changer le mot de passe', 'Passwort ändern', 'Изменить пароль', 'Cambia la contraseña', 'Şifre değiştir', 'گۆڕینی وشه‌ی نهێنی', 'گوهەرتنا پەیڤا نهێنی', 'تغییر گذرواژه'),
(25, '404_desc', '', 'The page you were looking for doesn\'t exist.', 'الصفحة التي كنت تبحث عنها غير موجودة.', 'De pagina die u zocht, bestaat niet.', 'La page que vous recherchiez n\'existe pas.', 'Die Seite, die Sie gesucht haben, existiert nicht.', 'Страница, которую вы искали, не существует.', 'La página que buscabas no existe.', 'Aradığınız sayfa mevcut değil.', NULL, NULL, NULL),
(26, '404_title', '', '404, page not found', '404، لم يتم العثور على الصفحة', '404 pagina niet gevonden', '404 Page non trouvée', '404 Seite nicht gefunden', '404 Страница не найдена', '404 Pagina no encontrada', '404 Sayfa Bulunamadı', '404, page not found', 'خەلەتیا  ژمارە 404 پەڕگە ناهاتە دیتن!', 'خطا 404، صفحه یافت نشد!'),
(27, 'your_email_address', '', 'Your E-mail address', 'عنوان بريدك  الإلكتروني', 'Jouw e-mailadres', 'Votre adresse email', 'Deine Emailadresse', 'Ваш адрес электронной почты', 'Tu correo electrónico', 'E', 'پۆستی ئه‌لیكترۆنی تۆ', 'پۆستێ تە یێ ئەلیکترۆنی', 'آدرس ایمیل شما'),
(28, 'request_new_password', '', 'Request new password', 'طلب كلمة مرور جديدة', 'Vraag nieuw wachtwoord aan', 'Demander un nouveau mot de passe', 'Fordere ein neues Passwort an', 'Запросить новый пароль', 'Pide nueva contraseña', 'yeni şifre isteği', 'داواكاری وشه‌ی نهێنی نوێ', 'داخازیا پەیڤا نهێنیا نووی', 'درخواست گذرواژه جدید'),
(29, 'got_your_password', '', 'Got your password?', 'هل حصلت على كلمة المرور؟', 'Heb je je wachtwoord ontvangen?', 'Vous avez votre mot de passe?', 'Haben Sie Ihr Passwort?', 'Получил пароль?', '¿Tienes tu contraseña?', 'Şifreniz var mı?', 'وشه‌ی نهێنیت پێگه‌یشت ؟', 'پەیڤا نهێنی گەهیشتە دەف تە؟', 'رمز عبور خود را بە دست اوردە اید؟'),
(30, 'login_', '', 'Log In', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Einloggen', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç', 'چوونه‌ژووره‌وه‌', 'چوونەژوورڤە', 'ورود'),
(31, 'please_wait', '', 'Please wait..', 'أرجو الإنتظار..', 'Even geduld aub..', 'S\'il vous plaît, attendez..', 'Warten Sie mal..', 'Пожалуйста, подождите..', 'Por favor espera..', 'Lütfen bekle..', 'چاوه‌ڕیكه‌...', 'ل هیڤییێ بە ...', 'لطفا صبر کنید...'),
(32, 'welcome_back', '', 'Welcome back!', 'مرحبا بعودتك!', 'Welkom terug!', 'Nous saluons le retour!', 'Willkommen zurück!', 'Добро пожаловать!', '¡Dar una buena acogida!', 'Tekrar hoşgeldiniz!', 'به‌خێربێیت', 'تو بخێر هاتی', 'خوش آمدید'),
(33, 'username', '', 'Username', 'اسم المستخدم', 'Gebruikersnaam', 'Nom d\'utilisateur', 'Benutzername', 'имя пользователя', 'Nombre de usuario', 'Kullanıcı adı', 'ناوی به‌كارهێنه‌ر', 'ناڤێ بکارهینەری', 'نام کاربری'),
(34, 'password', '', 'Password', 'كلمه السر', 'Wachtwoord', 'Mot de passe', 'Passwort', 'пароль', 'Contraseña', 'Parola', 'وشه‌ی نهێنی', 'پەیڤا نهێنی', 'گذرواژە'),
(35, 'forgot_your_password', '', 'Forgot your password?', 'نسيت رقمك السري؟', 'Je wachtwoord vergeten?', 'Mot de passe oublié?', 'Haben Sie Ihr Passwort vergessen?', 'Забыли пароль?', '¿Olvidaste tu contraseña?', 'Parolanızı mı unuttunuz?', 'وشه‌ی نهێنیت بیرچووه‌ ؟', 'پەیڤا نهێنی تە ژبیر کرییە؟', 'گذرواژە خود را فراموش کرده اید؟'),
(36, 'sign_up', '', 'Sign Up!', 'سجل!', 'Aanmelden!', 'S\'inscrire!', 'Anmelden!', 'Зарегистрироваться!', '¡Regístrate!', 'Kaydol!', 'تۆماربه‌', 'خۆتۆمارکرن', 'ثبت نام!'),
(37, 'new_here', '', 'New here?', 'جديد هنا؟', 'Nieuw hier?', 'Nouveau ici?', 'Neu hier?', 'Новенький тут?', '¿Nuevo aquí?', 'Burada yeni?', 'یه‌كه‌م جارته‌ ؟', 'ئێکەم جارا تەیە؟', 'اولین بارت است؟'),
(38, 'lets_get_started', '', 'Let\'s get started!', 'هيا بنا نبدأ!', 'Laten we beginnen!', 'Commençons!', 'Lass uns anfangen!', 'Давайте начнем!', '¡Empecemos!', 'Başlayalım!', NULL, NULL, NULL),
(39, 'email_address', '', 'E-mail address', 'عنوان البريد الإلكتروني', 'E-mailadres', 'Adresse e-mail', 'E-Mail-Addresse', 'Адрес электронной почты', 'Dirección de correo electrónico', 'E', 'پۆستی ئه‌لیكترۆنی', 'پۆستێ ئەلیکترۆنی', 'پست الیکترونی'),
(40, 'confirm_password', '', 'Confirm Password', 'تأكيد كلمة المرور', 'bevestig wachtwoord', 'Confirmez le mot de passe', 'Bestätige das Passwort', 'Подтвердите Пароль', 'Confirmar contraseña', 'Şifreyi Onayla', 'دڵنیاكردنه‌وه‌ی وشه‌ی نهێنی', 'پشت ڕاست کرنا پەیڤا نهێنی', 'تایید گذرواژە'),
(41, 'male', '', 'Male', 'الذكر', 'Mannetje', 'Mâle', 'Männlich', 'мужчина', 'Masculino', 'Erkek', 'نێر', 'نێر', 'مرد'),
(42, 'female', '', 'Female', 'إناثا', 'Vrouw', 'Femelle', 'Weiblich', 'женский', 'Hembra', 'Kadın', 'مێ', 'مێ', 'زن'),
(43, 'already_have_account', '', 'Already have an account?', 'هل لديك حساب بالفعل؟', 'Heeft u al een account?', 'Vous avez déjà un compte?', 'Hast du schon ein Konto?', 'У вас уже есть учетная запись?', '¿Ya tienes una cuenta?', 'Zaten hesabınız var mı?', 'پێشتر تۆماربوویت ؟', 'ژبەری نۆکە تە خۆ تۆمارکرییە؟', 'قببلا قودتان را ثبت نام کردە اید؟'),
(44, 'home', '', 'Home', 'الصفحة الرئيسية', 'Huis', 'Accueil', 'Zuhause', 'Главная', 'Casa', 'Ev', 'سه‌ره‌تا', 'دەستپێک', 'خانه'),
(45, 'upload', '', 'Upload', 'تحميل', 'Uploaden', 'Télécharger', 'Hochladen', 'Загрузить', 'Subir', 'Yükleme', 'به‌رزكردنه‌وه‌', 'بەلاڤکرن', 'بارگذاری'),
(46, 'terms_of_use', '', 'Terms of use', 'تعليمات الاستخدام', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation', 'Nutzungsbedingungen', 'Условия эксплуатации', 'Términos de Uso', 'Kullanım Şartları', 'یاساكانی به‌كارهێنان', 'مەرجێن بکارئینانێ', 'شرایط استفاده'),
(47, 'privacy_policy', '', 'Privacy Policy', 'سياسة الخصوصية', 'Privacybeleid', 'Politique de confidentialité', 'Datenschutz-Bestimmungen', 'политика конфиденциальности', 'Política de privacidad', 'Gizlilik Politikası', 'تایبه‌تمه‌ندیه‌كان', 'تایبەتمەندی', 'حریم خصوصی'),
(48, 'about_us', '', 'About us', 'معلومات عنا', 'Over ons', 'À propos de nous', 'Über uns', 'О нас', 'Sobre nosotros', 'Hakkımızda', 'ده‌رباره‌ی ئێمه‌', 'دەربارێ مە', 'دربارە'),
(49, 'language', '', 'Language', 'لغة', 'Taal', 'La langue', 'Sprache', 'язык', 'Idioma', 'Dil', 'زمانه‌كان', 'زمان', 'زبان ها'),
(50, 'copyright', '', 'Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.', 'حقوق الطبع والنشر © {{DATE}} {{CONFIG name}}. كل الحقوق محفوظة.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle rechten voorbehouden.', 'Copyright © {{DATE}} {{CONFIG name}}. Tous les droits sont réservés.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle Rechte vorbehalten.', 'Copyright © {{DATE}} {{CONFIG name}}. Все права защищены.', 'Copyright © {{DATE}} {{CONFIG name}}. Todos los derechos reservados.', 'Telif Hakkı © {{DATE}} {{CONFIG name}}. Her hakkı saklıdır.', 'هه‌موو مافێكی پارێزراوه‌ بۆ تۆڕمیكس', 'هەمی مافەک پاراستییە ژدەف تۆڕمێکسێ', '2019 © TorMix'),
(51, 'profile', '', 'Profile', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Профиль', 'Perfil', 'Profil', 'هه‌ژمار', 'هەژمار', 'حساب'),
(52, 'edit', '', 'Edit', 'تصحيح', 'Bewerk', 'modifier', 'Bearbeiten', 'редактировать', 'Editar', 'Düzenleme', 'ده‌ستكاری', 'دەستکاریکرن', 'ویرایش'),
(53, 'settings', '', 'Settings', 'إعدادات', 'instellingen', 'Paramètres', 'Einstellungen', 'настройки', 'Ajustes', 'Ayarlar', 'ڕێكخستنه‌كان', 'ڕێکخستن', 'تنظیمات'),
(54, 'log_out', '', 'Log out', 'الخروج', 'Uitloggen', 'Connectez - Out', 'Ausloggen', 'Выйти', 'Cerrar sesión', 'Çıkış Yap', 'چوونه‌ده‌ره‌وه‌', 'بجیهێلان', 'خروج'),
(55, 'featured_video', '', 'Featured video', 'فيديو متميز', 'Aanbevolen video', 'Vidéo en vedette', 'Empfohlenes Video', 'Продвигаемое Видео', 'Vídeo destacado', 'Öne çıkan video', 'ڤیدیۆی تایبه‌ت', 'ڤیدیۆیا تایبەت', 'ویدیو ویژه'),
(56, 'subscribe', '', 'Subscribe', 'الاشتراك', 'abonneren', 'Souscrire', 'Abonnieren', 'Подписывайся', 'Suscribir', 'Abone ol', 'به‌شداربوون', 'بەژداربوون', 'اشتراک'),
(57, 'views', '', 'Views', 'المشاهدات', 'Bekeken', 'Vues', 'Ansichten', 'Просмотры', 'vistas', 'Görünümler', 'بینینه‌كان', 'تەماشەوان', 'بازدید'),
(58, 'save', '', 'Save', 'حفظ', 'Save', 'sauvegarder', 'sparen', 'Сохранить', 'Salvar', 'Kayıt etmek', 'پاشه‌كه‌وت كردن', 'پاشەکەفتکرن', 'زخیرە'),
(59, 'share', '', 'Share', 'شارك', 'Delen', 'Partager', 'Aktie', 'Поделиться', 'Compartir', 'Pay', 'هاوبه‌ش كردن', 'هەڤپشککرن', 'اشتراک گذاری'),
(60, 'embed', '', 'Embed', 'تضمين', 'insluiten', 'Intégrer', 'Einbetten', 'встраивать', 'Empotrar', 'gömmek', 'بڵاوكردنه‌وه‌', 'بەلاڤەکرن', 'پست کردن'),
(61, 'report', '', 'Report', 'أبلغ عن', 'Rapportere', 'rapport', 'Bericht', 'Отчет', 'Informe', 'Rapor', 'سكاڵا', 'کەیس', 'گزارش'),
(62, 'published_on', '', 'Published on ', 'نشرت في', 'gepubliceerd op', 'Publié le', 'Veröffentlicht auf', 'Опубликован в', 'Publicado en', 'yayınlandı', 'بڵاوكراوه‌ته‌وه‌ له‌', 'هاتییە بەلاڤەکرن ل', 'منتشر شده در'),
(63, 'in', '', 'In', 'في', 'In', 'Dans', 'Im', 'В', 'En', 'İçinde', 'له‌ به‌شی', 'د بەشێ', 'در بخش'),
(64, 'top_videos', '', 'Top videos', 'أهم مقاطع الفيديو', 'Top video\'s', 'Top videos', 'Top Videos', 'Лучшие видеоролики', 'Los mejores videos', 'En iyi videolar', 'ڤیدیۆ پڕبینه‌ره‌كان', 'ڤیدیۆیێن کو زۆرترین تەماشەوان هەبووینە', 'ویدیوهای کە بیشترین بازدید داشتە اند'),
(65, 'trending', '', 'Trending', 'الشائع', 'Trending', 'Tendances', 'Trending', 'Trending', 'Tendencias', 'Trend', 'به‌ناوبانگه‌كان', 'ڤیدیۆیێن کەناڵێن بناڤ و دەنگ', 'معروف ها'),
(66, 'explore_more', '', 'Explore more', 'استكشاف المزيد', 'Ontdek meer', 'Explorez plus', 'Erkunde mehr', 'Узнайте больше', 'Explora más', 'Daha fazla keşfedin', 'بینینی زیاتر', 'دینتا زیدەتر...', 'دیدن بیشتر...'),
(67, 'year', '', 'year', 'عام', 'jaar', 'an', 'Jahr', 'год', 'año', 'yıl', 'ساڵ', 'سال', 'سال'),
(68, 'month', '', 'month', 'شهر', 'maand', 'mois', 'Monat', 'месяц', 'mes', 'ay', 'مانگ', 'مەﮪ', 'ماه'),
(69, 'day', '', 'day', 'يوم', 'dag', 'journée', 'Tag', 'день', 'día', 'gün', 'ڕۆژ', 'ڕۆژ', 'روز'),
(70, 'hour', '', 'hour', 'ساعة', 'uur', 'heure', 'Stunde', 'час', 'hora', 'saat', 'كاژێر', 'دەمژمێر', 'سعات'),
(71, 'minute', '', 'minute', 'اللحظة', 'minuut', 'minute', 'Minute', 'минут', 'minuto', 'dakika', 'خوله‌ك', 'دەقە', 'دقیقه'),
(72, 'second', '', 'second', 'ثانيا', 'tweede', 'seconde', 'zweite', 'второй', 'segundo', 'ikinci', 'چركه‌', 'سانیە', 'سانیە'),
(73, 'years', '', 'years', 'سنوات', 'jaar', 'années', 'Jahre', 'лет', 'años', 'yıl', 'ساڵ', 'ساڵان', 'سال'),
(74, 'months', '', 'months', 'الشهور', 'maanden', 'mois', 'Monate', 'месяцы', 'meses', 'ay', 'مانگ', 'مەﮪان', 'ماه'),
(75, 'days', '', 'days', 'أيام', 'dagen', 'journées', 'Tage', 'дней', 'días', 'günler', 'ڕۆژ', 'ڕۆژان', 'روز'),
(76, 'hours', '', 'hours', 'ساعات', 'uur', 'heures', 'Std.', 'часов', 'horas', 'saatler', 'كاژێر', 'دەمژمێران', 'ساعت'),
(77, 'minutes', '', 'minutes', 'الدقائق', 'notulen', 'minutes', 'Protokoll', 'минут', 'minutos', 'dakika', 'خوله‌ك', 'دەقان', 'دقیقە'),
(78, 'seconds', '', 'seconds', 'ثواني', 'seconden', 'secondes', 'Sekunden', 'секунд', 'segundos', 'saniye', 'چركه‌', 'سانیان', 'سانیە'),
(79, 'time_ago', '', 'ago', 'منذ', 'geleden', 'depuis', 'vor', 'тому назад', 'hace', 'önce', 'به‌ر له‌', 'ژبەری', 'قبل از'),
(80, 'url_not_supported', '', 'URL not supported.', 'عنوان ورل غير متوافق.', 'URL niet ondersteund.', 'URL non prise en charge.', 'URL wird nicht unterstützt.', 'URL не поддерживается.', 'URL no es compatible.', 'URL desteklenmiyor.', 'ئه‌م لینكه‌ ڕێگه‌ پێنه‌دراوه‌', 'ئەڤ لینکە نەیاساییە!', 'این لینک پشتیبانی نمیشود'),
(81, 'no_more_comments', '', 'No more comments found', 'لم يتم العثور على مزيد من التعليقات', 'Er zijn nog geen reacties gevonden', 'Plus de commentaires ont été trouvés', 'Keine weiteren Kommentare gefunden', 'Больше комментариев не найдено', 'No se encontraron comentarios', 'Başka yorum bulunamadı', 'سه‌رنجی زیاتر نیه‌', 'بۆچوونێن زێدەتر نینە', 'نظرات بیشتری یافت نشد!'),
(82, 'video_not_found_please_try_again', '', 'Video not found, please refresh the page and try again.', 'لم يتم العثور على الفيديو، يرجى تحديث الصفحة وإعادة المحاولة.', 'Video niet gevonden, vernieuw de pagina en probeer het opnieuw.', 'Vidéo non trouvée, actualisez la page et réessayez.', 'Video nicht gefunden, bitte aktualisieren Sie die Seite und versuchen Sie es erneut.', 'Видео не найдено, обновите страницу и повторите попытку.', 'No se encontró el video, actualice la página e inténtelo de nuevo.', 'Video bulunamadı, lütfen sayfayı yenileyin ve tekrar deneyin.', 'ڤیدیۆ نه‌دۆزرایه‌وه‌ تكایه‌ لاپه‌ڕه‌كه‌ نوێ بكه‌ره‌وه‌ یاخود دواتر هه‌وڵبده‌وه‌', 'ڤیدیۆ نەهاتە دیتن هیڤی دکەم پەڕگەهی نووی کە ئانکو پاشی دووبارەکەوە', 'ویدیو یافت نشد، لطفا صفحه جدید را باز کنید و دوباره امتحان کنید.'),
(83, 'saved', '', 'Saved', 'حفظ', 'lagret', 'Enregistré', 'gespeichert', 'Сохраненный', 'guardado', 'kaydedilmiş', 'پاشه‌كه‌وتكرا', 'هاتە پاشەکەفتکرن', 'زخیرە شدە'),
(84, 'no_comments_found', '', 'No comments found', 'لم يتم العثور على تعليقات', 'Geen reacties gevonden', 'Aucun commentaire trouvé', 'Keine Kommentare gefunden', 'Комментариев нет', 'No se encontraron comentarios', 'Hiçbir yorum bulunamadı', 'هیچ سه‌رنجێك نیه‌', 'چ بۆچوون نینە', 'هیچ نظری یافت نشد'),
(85, 'import', '', 'Import', 'استيراد', 'Importeren', 'Importer', 'Einführen', 'Импортировать', 'Importar', 'İthalat', 'هێنان', 'هینان', 'آوردن'),
(86, 'import_new_video', '', 'Import new video', 'استيراد فيديو جديد', 'Nieuwe video importeren', 'Importer une nouvelle vidéo', 'Neues Video importieren', 'Импортировать новое видео', 'Importar nuevo video', 'Yeni video aktar', 'هێنانی ڤیدیۆی نوێ', 'هینانا ڤیدیۆیێن نووی', 'آوردن ویدیوی جدید'),
(87, 'video_url', '', 'Video URL', 'عنوان الفيديو', 'Video URL', 'URL de la vidéo', 'Video-URL', 'URL видео', 'URL del vídeo', 'Video URL\'si', 'به‌سته‌ری ڤیدیۆ', 'لینکا ڤیدیۆیێ', 'نشانی اینترنتی (لینک) ویدیو'),
(88, 'url_desc', '', 'YouTube, Dailymotion, Vimeo URLs', 'يوتيوب، دايليموتيون، فيميو عناوين المواقع', 'YouTube, Dailymotion, Vimeo URLs', 'YouTube, Dailymotion, URL de Vimeo', 'YouTube, Dailymotion, Vimeo URLs', 'URL-адреса YouTube, Dailymotion, Vimeo', 'URL de YouTube, Dailymotion, Vimeo', 'YouTube, Dailymotion, Vimeo URL\'leri', 'به‌سته‌ری YouTube, Dailymotion, Vimeo', 'لینکا YouTube, Dailymotion, Vimeo', 'لینک های YouTube, Dailymotion, Vimeo'),
(89, 'fetch_Video', '', 'Fetch Video', 'جلب الفيديو', 'Haal video', 'Fetch Video', 'Video abrufen', 'Извлечение видео', 'Obtener video', 'Video getir', 'هێنان', 'هینان', 'آوردن'),
(90, 'video_title', '', 'Video Title', 'عنوان مقطع الفيديو', 'Video Titel', 'titre de la vidéo', 'Videotitel', 'Название видео', 'Titulo del Video', 'video başlığı', 'سه‌ردێری ڤیدیۆ', 'ناڤ و نیشانێ ڤیدیۆی', 'عنوان ویدئو'),
(91, 'video_title_help', '', 'Your video title, 2 - 55 characters', 'عنوان الفيديو، من 2 إلى 55 حرفا', 'Je videotitel, 2 - 55 tekens', 'Votre titre vidéo, 2 à 55 caractères', 'Ihr Videotitel, 2 - 55 Zeichen', 'Название вашего видео, 2 - 55 символов', 'Su título de vídeo, 2 - 55 caracteres', 'Video başlığınız, 2 - 55 karakter', 'سه‌ردێری ڤیدیۆ له‌ 4 تا 50 وشه‌', 'ناڤ و نیشانا ڤیدیۆی پێدڤیە د ناڤبەرا 4 بۆ 50 پەیڤاندا بیت', 'عنوان ویدیو باید بین 4 تا 50 حرف باشد'),
(92, 'video_descritpion', '', 'Video Description', 'وصف الفيديو', 'video beschrijving', 'description de vidéo', 'Videobeschreibung', 'описание видео', 'Descripción del video', 'Video Açıklaması', 'دڕێژه‌ی ڤیدیۆ', 'وەسڤا ڤیدیۆی', 'شرح ویدیو'),
(93, 'category', '', 'Category', 'فئة', 'categorie', 'Catégorie', 'Kategorie', 'категория', 'categoría', 'kategori', 'به‌ش', 'بەش', 'بخش'),
(94, 'tags', '', 'Tags', 'الكلمات', 'Tags', 'Mots clés', 'Tags', 'Теги', 'Etiquetas', 'Etiketler', 'نیشانه‌', 'نیشانە', 'برچسب ها'),
(95, 'tags_help', '', 'Tags, seprated by comma', 'الكلمات، سيبراتد بواسطة فاصلة', 'Tags gescheiden door komma\'s', 'Tags, séparés par virgule', 'Tags, gefolgt von Komma', 'Теги, разделенные запятой', 'Etiquetas, seprated by comma', 'Etiketler, virgülle ayrılmış', 'نیشانه‌كان به‌ كۆما جیا بكه‌ره‌وه‌', 'نیشانان ب کۆمای لێک جودا کە', 'برچسب ها را ، توسط کاما جدا کنید'),
(96, 'publish', '', 'Publish', 'نشر', 'Publiceren', 'Publier', 'Veröffentlichen', 'Публиковать', 'Publicar', 'yayınlamak', 'بڵاوكردنه‌وه‌', 'بەلاڤەکرن', 'انتشار'),
(97, 'upload_new_video', '', 'Upload new video', 'تحميل فيديو جديد', 'Nieuwe video uploaden', 'Télécharger une nouvelle vidéo', 'Neues Video hochladen', 'Загрузить новое видео', 'Subir nuevo video', 'Yeni video yükle', 'به‌رزكردنه‌وه‌ی ڤیدیۆ', 'ئەپڵۆد کرنا ڤیدیۆیێن نووی', 'بارگذاری ویدیو جدید'),
(98, 'choose_new_file', '', 'Choose video file..', 'اختيار ملف فيديو ..', 'Kies een videobestand ..', 'Choisissez le fichier vidéo ..', 'Videodatei auswählen', 'Выберите видеофайл.', 'Elige un archivo de video ..', 'Video dosyasını seçin ..', 'ڤیدیۆ دیاری بكه‌', 'ڤیدیۆی دەست نیشان کە', 'لطفا ویدیو را انتخاب کنید'),
(99, 'thumbnail', '', 'Thumbnail', 'صورة مصغرة', 'thumbnail', 'La vignette', 'Miniaturansicht', 'Thumbnail', 'Miniatura', 'başparmak tırnağı', 'وێنه‌چكۆل', 'شکلێ بەرچاڤ کری', 'بند انگشتی'),
(100, 'successfully_uplaoded', '', 'successfully uploaded.', 'تم تحميلها بنجاح.', 'succesvol geüpload.', 'téléchargé avec succès.', 'erfolgreich hochgeladen', 'успешно загружен.', 'cargado con éxito.', 'başarıyla yüklendi.', 'به‌ سه‌ركه‌وتووی بڵاوكرایه‌وه‌', 'ب سەرکەفتی هاتە بەلاڤەکرن', 'با موفقیت بارگذاری شد'),
(101, 'reply', '', 'Reply', 'الرد', 'Antwoord', 'Répondre', 'Antworten', 'Ответить', 'Respuesta', 'Cevap', 'وه‌ڵامدانه‌وه‌', 'بەرسڤدان', 'پاسخ'),
(102, 'show_more', '', 'Show more', 'أظهر المزيد', 'Laat meer zien', 'Montre plus', 'Zeig mehr', 'Показать больше', 'Mostrar más', 'Daha fazla göster', 'بینینی زیاتر', 'دیتنا زێدەتر...', 'دیدن بیشتر...'),
(103, 'comments', '', 'Comments', 'تعليقات', 'Comments', 'commentaires', 'Bemerkungen', 'Комментарии', 'Comentarios', 'Yorumlar', 'سه‌رنجه‌كان', 'بۆچوون', 'نظر ها'),
(104, 'write_your_comment', '', 'Write your comment..', 'اكتب تعليقك ..', 'Schrijf je reactie ..', 'Écrivez votre commentaire ..', 'Schreiben Sie Ihren Kommentar ..', 'Написать комментарий ..', 'Escriba su comentario ..', 'Yorumunuzu yazın ..', 'سه‌رنجه‌كه‌ت بنووسه‌...', 'بۆچوونا خۆ بنڤیسە...', 'نظرتان را بنویسید'),
(105, 'fb_comments', '', 'Facebook Comments', 'تعليقات الفيسبوك', 'Facebook Reacties', 'Commentaires de Facebook', 'Facebook Kommentare', 'Комментарии Facebook', 'Comentarios de Facebook', 'Facebook Yorumları', 'سه‌رنجی فه‌یس بووك', 'بۆچۆنێن فەیسبووکێ', 'نظرات فیس بوک'),
(106, 'related_videos', '', 'Related Videos', 'فيديوهات ذات علاقة', 'Relaterte videoer', 'Vidéos connexes', 'Ähnliche Videos', 'Похожие видео', 'Videos relacionados', 'İlgili videolar', 'ڤیدیۆی هاوشێوه‌', 'ڤیدیۆیێن هەڤ رەنگ', 'ویدیو های مرتبط'),
(107, 'delete_confirmation', '', 'Are you sure you want to delete your comment?', 'هل تريد بالتأكيد حذف تعليقك؟', 'Weet u zeker dat u uw reactie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer votre commentaire?', 'Bist du sicher, dass du deinen Kommentar löschen möchtest?', 'Вы уверены, что хотите удалить свой комментарий?', '¿Seguro que quieres eliminar tu comentario?', 'Yorumu silmek istediğinizden emin misiniz?', 'دڵنیایی له‌ سڕینه‌وه‌ی ئه‌م سه‌رنجه‌ ؟', 'تو پشت ڕاستی کو تە دڤێت وێ بۆچوونێ ڕەشوەکەی؟', 'آیا مطمئن هستید که میخواهید نظر خود را حذف کنید؟'),
(108, 'subscribed', '', 'Subscribed', 'المشترك', 'geabonneerd', 'Souscrit', 'Gezeichnet', 'подписной', 'Suscrito', 'Abone', 'به‌شداربوو', 'بەژداربوو', 'مشترک'),
(109, 'no_videos_found_subs', '', 'No videos found, subscribe to get started!', 'لم يتم العثور على مقاطع فيديو، اشترك في الخطوات الأولى!', 'Geen video\'s gevonden, schrijf je in om te beginnen!', 'Aucune vidéo n\'a été trouvée, inscrivez-vous pour commencer!', 'Keine Videos gefunden, abonnieren, um loszulegen!', 'Видео не найдено, подписаться, чтобы начать работу!', 'No videos encontrados, suscríbase para empezar!', 'Hiçbir video bulunamadı, başlamak için abone olun!', 'هیچ ڤیدیۆیه‌ك نیه‌ به‌شداربه‌ بۆ بینینی ڤیدیۆی نوێ', 'چ ڤیدیۆ نینە بەژداربە ژبۆ دیتنا ڤیدیۆیێن نووی', 'هیچ ویدئویی یافت نشد، برای دیدن ویدیو ها مشترک شوید!'),
(110, 'subscriptions', '', 'Subscriptions', 'الاشتراكات', 'abonnementen', 'Abonnements', 'Abonnements', 'Подписки', 'Suscripciones', 'Abonelikler', 'به‌شداربووه‌كان', 'بەژداربوویی', 'اشتراک ها'),
(111, 'no_videos_found_history', '', 'No videos found, watch to get started!', 'لم يتم العثور على مقاطع فيديو، يمكنك مشاهدة الخطوات الأولى!', 'Geen video\'s gevonden, kijk om te beginnen!', 'Aucune vidéo n\'a été trouvée, regardez pour commencer!', 'Keine Videos gefunden, schau, um loszulegen!', 'Видео не найдено, следите, чтобы начать!', 'No se han encontrado vídeos, ¡mira para empezar!', 'Hiçbir video bulunamadı, başlamak için izleyin!', 'هیچ ڤیدیۆیه‌ك نه‌دۆزرایه‌وه‌', 'چ ڤیدیۆ نەهاتنە دیتن!', 'هیچ ویدیویی یافت نشد!'),
(112, 'history', '', 'History', 'التاريخ', 'Geschiedenis', 'Histoire', 'Geschichte', 'история', 'Historia', 'tarih', 'مێژوو', 'تەئریخ', 'تاریخ'),
(113, 'no_videos_found_liked', '', 'No videos found, like to get started!', 'لم يتم العثور على مقاطع فيديو، مثل البدء!', 'Geen video\'s gevonden, graag aan de slag!', 'Aucune vidéo trouvée, n\'aime la mise en route!', 'Keine Videos gefunden, wie los!', 'Видео не найдено, как начать!', 'No se han encontrado vídeos, ¡como para empezar!', 'Hiçbir video bulunamadı, başlamak gibi!', 'هیچ ڤیدیۆیه‌ك نه‌دۆزرایه‌وه‌', 'چ ڤیدیۆ نەهاتنە دیتن!', 'هیچ ویدیویی یافت نشد!'),
(114, 'liked_videos', '', 'Liked videos', 'أعجبت مقاطع الفيديو', 'Verwachte video\'s', 'Vidéos aimées', 'Mochte Videos', 'Понравившиеся видео', 'Videos que me gustaron', 'Beğenilen videolar', 'ڤیدیۆی به‌ دڵبوو', 'ڤیدیۆیێن ب دل بوویی', 'فیلم های مورد علاقه'),
(115, 'latest_videos', '', 'Latest videos', 'أحدث مقاطع الفيديو', 'Laatste video\'s', 'Dernières vidéos', 'Neueste Videos', 'Последние видео', 'Últimos vidéos', 'En yeni videolar', 'نوێترین ڤیدیۆكان', 'نوویترین ڤیدیۆ', 'جدیدترین ویدیوها'),
(116, 'no_videos_found_for_now', '', 'No videos found for now!', 'لم يتم العثور على مقاطع فيديو في الوقت الحالي!', 'Er zijn nog geen video\'s gevonden!', 'Aucune vidéo trouvée pour l\'instant!', 'Bisher keine Videos gefunden!', 'Видео не найдено пока!', 'No se encontraron videos por ahora!', 'Şuan için bir video bulunamadı!', 'هیچ ڤیدیۆیه‌ك به‌رده‌ست نیه‌ له‌ ئێستادا', 'چ ڤیدیۆ بەردەست نینە ژ وی دەمیوە', 'اکنون هیچ ویدئویی در دسترس نیست!'),
(117, 'no_more_videos_to_show', '', 'No more videos to show', 'لا مزيد من مقاطع الفيديو المراد عرضها', 'Nog geen video\'s om te laten zien', 'Plus de vidéos à afficher', 'Keine Videos mehr zu zeigen', 'Больше нет видео для показа', 'No hay más videos para mostrar', 'Gösterilecek daha fazla video yok', 'هیچ ڤیدیۆی زیاتر نیه‌ بۆ نیشاندان', 'ڤیدیۆیێن زێدەتر نینە ژبۆ بەرچاڤکرنێ', 'ویدیویی بیشتری برای نمایش وجود ندارند!'),
(118, 'categories', '', 'Categories', 'الاقسام', 'Categorieën', 'Catégories', 'Kategorien', 'категории', 'Categorías', 'Kategoriler', 'هاوپۆله‌كان', 'هەڤڕێک', 'دسته بندی ها'),
(119, 'video_already_exist', '', 'Video is already exist', 'الفيديو موجود من قبل', 'Video bestaat al', 'La vidéo existe déjà', 'Video ist bereits vorhanden', 'Видео уже существует', 'El video ya existe', 'Video zaten var', 'Video is already exist', 'Video is already exist', 'Video is already exist'),
(120, 'video_saved', '', 'Video successfully updated', 'تم تحديث الفيديو بنجاح', 'Video is succesvol bijgewerkt', 'Vidéo mise à jour avec succès', 'Video erfolgreich aktualisiert', 'Видео успешно обновлено', 'Video actualizado correctamente', 'Video başarıyla güncellendi', 'Video successfully updated', 'ڤیدیۆ ب سەرکەفتی هاتە بەلاڤکرن', 'Video successfully updated'),
(121, 'manage_videos', '', 'Manage Videos', 'إدارة مقاطع الفيديو', 'Beheer video\'s', 'Gérer les vidéos', 'Videos verwalten', 'Управление видео', 'Administrar vídeos', 'Videoları Yönet', 'به‌ڕێوه‌بردنی ڤیدیۆكان', 'ڕەڤەبەریا ڤیدیۆیان', 'مدیریت ویدیوها'),
(122, 'search', '', 'Search', 'بحث', 'Zoeken', 'Chercher', 'Suche', 'Поиск', 'Buscar', 'Arama', 'گه‌ڕان', 'گەڕیان', 'جستجو کردن'),
(123, 'manage', '', 'Manage', 'يدير', 'beheren', 'Gérer', 'Verwalten', 'управлять', 'Gestionar', 'yönetme', 'به‌ڕێوه‌بردن', 'ڕێڤەبرن', 'مدیریت کردن'),
(124, 'edit_video', '', 'Edit video', 'تحرير الفيديو', 'Bewerk video', 'Éditer vidéo', 'Video bearbeiten', 'Редактировать видео', 'Editar video', 'Videoyu düzenle', 'ده‌ستكاری ڤیدیۆ', 'دەستکاریکرنا ڤیدیۆی', 'ویرایش ویدیو'),
(125, 'delete_video_confirmation', '', 'Are you sure you want to delete this video? This action can\'t be undo', 'هل تريد بالتأكيد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء', 'Weet u zeker dat u deze video wilt verwijderen? Deze actie kan niet worden ongedaan gemaakt', 'Êtes-vous sûr de vouloir supprimer cette vidéo? Cette action ne peut pas annuler', 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden', 'Вы действительно хотите удалить это видео? Это действие не может быть отменено', '¿Seguro que quieres eliminar este video? No se puede deshacer esta acción', 'Bu videoyu silmek istediğinizden emin misiniz? Bu işlem geri alınamaz', NULL, NULL, NULL),
(126, 'manage_my_videos', '', 'Manage My Videos', 'إدارة مقاطع الفيديو الخاصة بي', 'Beheer mijn video\'s', 'Gérer mes vidéos', 'Verwalten Sie meine Videos', 'Управление видео', 'Administrar mis videos', 'Videolarımı Yönet', 'به‌ڕێوه‌بردنی ڤیدیۆه‌كان', 'ڕێڤەبەریا ڤیدیۆیێن من', 'مدیریت ویدیوهای من'),
(127, 'delete_videos', '', 'Delete video', 'حذف الفيديو', 'Video verwijderen', 'Supprimer la vidéo', 'Video löschen', 'Удалить видео', 'Eliminar vídeo', 'Videoyu sil', 'سڕینه‌وه‌ی ڤیدیۆ', 'ڕەشوەکرنا ڤیدیۆی', 'حذف ویدیو'),
(128, 'search_results', '', 'Search Results', 'نتائج البحث', 'Zoekresultaten', 'Résultats de la recherche', 'Suchergebnisse', 'результаты поиска', 'Resultados de la búsqueda', 'arama sonuçları', 'ئه‌نجامی گه‌ڕان', 'ئەنجاما گەڕیانێ', 'نتایج جستجو'),
(129, 'status', '', 'Status', 'وضع', 'staat', 'Statut', 'Status', 'статус', 'estatus', 'durum', 'دۆخ', 'ڕەوش', 'حالت'),
(130, 'active', '', 'Active', 'نشيط', 'Actief', 'actif', 'Aktiv', 'активный', 'Activo', 'Aktif', 'چاڵاك', 'چالاک', 'فعال'),
(131, 'inactive', '', 'Inactive', 'غير نشط', 'Inactief', 'Inactif', 'Inaktiv', 'Неактивный', 'Inactivo', 'etkisiz', 'ناچاڵاك', 'نەچالاک', 'غیر فعال'),
(132, 'type', '', 'Type', 'اكتب', 'Type', 'Type', 'Art', 'Тип', 'Tipo', 'tip', 'جۆر', 'جۆر', 'نوع'),
(133, 'user', '', 'User', 'المستعمل', 'Gebruiker', 'Utilisateur', 'Benutzer', 'пользователь', 'Usuario', 'kullanıcı', 'به‌كارهێنه‌ر', 'بکارهینەر', 'کاربر'),
(134, 'admin', '', 'Admin', 'مشرف', 'beheerder', 'Admin', 'Administrator', 'Администратор', 'Administración', 'yönetim', 'به‌ڕێوه‌به‌ر', 'ڕێڤەبەر', 'مدیر'),
(135, 'verification', '', 'Verification', 'التحقق', 'Verificatie', 'Vérification', 'Überprüfung', 'верификация', 'Verificación', 'Doğrulama', 'سه‌لماندن', 'سەلماندن', 'تایید'),
(136, 'verified', '', 'Verified', 'التحقق', 'geverifieerd', 'Vérifié', 'Verifiziert', 'проверенный', 'Verificado', 'Doğrulanmış', 'سه‌لمێنراو', 'سەلماندی', 'تایید شدە'),
(137, 'not_verified', '', 'Not verified', 'لم يتم التحقق منه', 'niet geverifieerd', 'non vérifié', 'Nicht verifiziert', 'не подтверждено', 'No verificado', 'Doğrulanmadı', 'نه‌سه‌لمێنراو', 'نەسەلماندی', 'تایید نشدە'),
(138, 'setting_updated', '', 'Settings successfully updated!', 'تم تحديث الإعدادات بنجاح!', 'Instellingen succesvol bijgewerkt!', 'Les paramètres ont été mis à jour avec succès!', 'Einstellungen erfolgreich aktualisiert!', 'Настройки успешно обновлены!', 'Configuración actualizada con éxito!', 'Ayarlar başarıyla güncellendi!', 'به‌سه‌ركه‌وتووی نوێكرایه‌وه‌', 'ڕێکخستن ب سەرکەفتی بدووماهیک هات', 'تنظیمات با موفقیت به روز شد!'),
(139, 'first_name', '', 'First Name', 'الاسم الاول', 'Voornaam', 'Prénom', 'Vorname', 'Имя', 'Nombre de pila', 'İsim', 'ناوی یه‌كه‌م', 'ناڤێ ئێکێ', 'نام کوچک'),
(140, 'last_name', '', 'Last Name', 'الكنية', 'Achternaam', 'Nom de famille', 'Familienname, Nachname', 'Фамилия', 'Apellido', 'Soyadı', 'ناوی دووه‌م', 'ناڤێ دوویێ', 'نام خانوادگی'),
(141, 'about_profile', '', 'About', 'حول', 'Over', 'Sur', 'Über', 'Около', 'Acerca de', 'hakkında', 'ده‌رباره‌', 'دەربارە', 'در باره'),
(142, 'facebook', '', 'Facebook', 'فيس بوك', 'Facebook', 'Facebook', 'Facebook', 'facebook', 'Facebook', 'Facebook', 'Facebook', 'فەیسبووک', 'فیسبوک'),
(143, 'google_plus', '', 'Google+', 'في + Google', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'گۆگل پڵەس', 'گوگل پلاس'),
(144, 'twitter', '', 'Twitter', 'تغريد', 'tjilpen', 'Gazouillement', 'Twitter', 'щебет', 'Gorjeo', 'heyecan', 'Twitter', 'توویتەر', 'توییتر'),
(145, 'current_password', '', 'Current Passowrd', 'باسورد الحالي', 'Huidige Passowrd', 'Passowrd actuel', 'Aktuelles Passowrd', 'Текущий Passowrd', 'Passowrd actual', 'Geçerli Geçiş', 'وشه‌ی نهێنی ئێستا', 'پەیڤا نهێنیا نۆکە', 'رمز عبور فعلی'),
(146, 'new_password', '', 'New Passowrd', 'جديد باسورد', 'Nieuwe Passowrd', 'New Passowrd', 'Neue Passowrd', 'Новый Passowrd', 'Nuevo pasatiempo', 'Yeni Passowrd', 'وشه‌ی نهێنی نوێ', 'پەیڤا نهێنیا نووی', 'رمز عبور جدید'),
(147, 'confirm_new_password', '', 'Confirm new password', 'تأكيد كلمة المرور الجديدة', 'Bevestig nieuw wachtwoord', 'Confirmer le nouveau mot de passe', 'Bestätige neues Passwort', 'Подтвердите новый пароль', 'Confirmar nueva contraseña', 'Yeni şifreyi onayla', 'دڵنیاكردنه‌وه‌ی وشه‌ی نهێنی نوێ', 'پشت ڕاستکرنا پەیڤا نهێنی', 'تایید رمز عبور جدید'),
(148, 'current_password_dont_match', '', 'Current password doesn\'t match.', 'كلمة المرور الحالية غير متطابقة.', 'Huidig ​​wachtwoord komt niet overeen.', 'Le mot de passe actuel ne correspond pas.', 'Aktuelles Passwort stimmt nicht überein.', 'Текущий пароль не соответствует.', 'La contraseña actual no coincide.', 'Geçerli şifre uyuşmuyor.', NULL, NULL, NULL),
(149, 'new_password_dont_match', '', 'New password doesn\'t match.', 'كلمة المرور الجديدة غير متطابقة.', 'Nieuw wachtwoord komt niet overeen.', 'Le nouveau mot de passe ne correspond pas.', 'Neues Passwort stimmt nicht überein.', 'Новый пароль не соответствует.', 'La nueva contraseña no coincide.', 'Yeni şifre uyuşmuyor.', NULL, NULL, NULL),
(150, 'avatar', '', 'Avatar', 'الصورة الرمزية', 'avatar', 'Avatar', 'Benutzerbild', 'Аватар', 'Avatar', 'Avatar', 'كه‌سی', 'شەخسی', 'شخصی'),
(151, 'cover', '', 'Cover', 'غطاء، يغطي', 'deksel', 'Couverture', 'Abdeckung', 'Обложка', 'Cubrir', 'kapak', 'به‌رگ', 'شکلێ پشتێ', 'عکس سرصفحە'),
(152, 'your_account_was_deleted', '', 'Your account was deleted', 'تم حذف حسابك', 'Uw account is verwijderd', 'Votre compte a été supprimé', 'Ihr Konto wurde gelöscht', 'Ваша учетная запись была удалена', 'Se ha eliminado tu cuenta.', 'Hesabınız silindi', 'هه‌ژماره‌كه‌ت سڕایه‌وه‌', 'هەژمارێ تە هاتە ڕەشوەکرن', 'حساب کاربری شما حذف شد'),
(153, 'avatar_and_cover', '', 'Avatar & Cover', 'الصورة الرمزية والغطاء', 'Avatar & Cover', 'Avatar et couverture', 'Avatar & Cover', 'Аватар & Cover', 'Avatar y portada', 'Avatar & Kapak', 'وێنه‌كان', 'شکل', 'عکس نمایە &amp; عکس سرصفحە'),
(154, 'general', '', 'General', 'جنرال لواء', 'Algemeen', 'Général', 'General', 'Генеральная', 'General', 'Genel', 'گشتی', 'هەمی', 'عمومی'),
(155, 'delete_account', '', 'Delete account', 'حذف الحساب', 'Account verwijderen', 'Supprimer le compte', 'Konto löschen', 'Удалить аккаунт', 'Borrar cuenta', 'Hesabı sil', 'سڕینه‌وه‌ی هه‌ژمار', 'ڕەشوەکرنا هەژماری', 'حذف حساب'),
(156, 'general_settings', '', 'General Settings', 'الاعدادات العامة', 'Algemene instellingen', 'réglages généraux', 'Allgemeine Einstellungen', 'общие настройки', 'Configuración general', 'Genel Ayarlar', 'ڕێكخستنه‌ گشتیه‌كان', 'ڕێکخستنێن گشتی', 'تنظیمات عمومی'),
(157, 'password_settings', '', 'Password Settings', 'إعدادات كلمة المرور', 'Wachtwoordinstellingen', 'Paramètres du mot de passe', 'Kennworteinstellungen', 'Настройки пароля', 'Configuración de la contraseña', 'Şifre Ayarları', 'ڕێکخستنەکانی وشەی نهێنی', 'ڕێکخستنێن پەیڤا نهێنی', 'تنظیمات گذرواژە'),
(158, 'profile_settings', '', 'Profile Settings', 'إعدادات الملف الشخصي', 'Profielinstellingen', 'Paramètres de profil', 'Profileinstellungen', 'Настройки профиля', 'Configuración de perfil', 'Profil ayarları', 'ڕێكخستنه‌كانی هه‌ژمار', 'ڕێکخستنێن پەڕگەهێ کەسی', 'تنظیمات نمایە'),
(159, 'videos', '', 'Videos', 'أشرطة فيديو', 'Videos', 'Vidéos', 'Videos', 'Видео', 'Videos', 'Videolar', 'ڤیدیۆكان', 'ڤیدیۆ', 'ویدیوها'),
(160, 'up_next', '', 'Up next', 'التالي', 'Volgende', 'Suivant', 'Als nächstes', 'Следующий', 'Hasta la próxima', 'Bir sonraki', 'دوواتر', 'پاشی', 'بعدی'),
(161, 'autoplay', '', 'Autoplay', 'تشغيل تلقائي', 'Automatisch afspelen', 'Lecture automatique', 'Automatisches Abspielen', 'Автовоспроизведение', 'Auto reproducción', 'Otomatik oynatma', 'هه‌ڵكردنی خۆكار', 'ڤەکرنا خودکار', 'پخش خودکار'),
(162, 'featured', '', 'Featured', 'متميز', 'Uitgelicht', 'En vedette', 'Vorgestellt', 'Рекомендуемые', 'Destacados', 'Öne çıkan', 'هه‌ڵواسین', 'گرێدان', 'Featured'),
(163, 'saved_videos', '', 'Saved Videos', 'مقاطع الفيديو المحفوظة', 'Opgeslagen video\'s', 'Vidéos sauvegardées', 'Gespeicherte Videos', 'Сохраненные видео', 'Videos guardados', 'Kaydedilen Videolar', 'Saved Videos', 'ڤیدیۆ ب سەرکەفتی هاتنە پاشەکەفتکرن', 'ویدیو های ذخیره شده'),
(164, 'my_channel', '', 'My Channel', 'قناتي', 'Mijn kanaal', 'Ma chaîne', 'Mein Kanal', 'Мой канал', 'Mi canal', 'Benim kanalım', 'كه‌ناڵه‌كه‌م', 'کەناڵێ من', 'کانال من'),
(165, 'add_to', '', 'Add to', 'إضافة إلى', 'Legg til i', 'Ajouter à', 'Hinzufügen zu', 'Добавить в', 'Agregar a', 'Ekle', 'زیادكردن بۆ', 'زێدەکرن ژبۆ', 'اضافه کردن برای'),
(166, 'add_to_pl', '', 'Add to playlist', 'إضافة إلى قائمة التشغيل', 'Legg til i spilleliste', 'Ajouter à la playlist', 'Zu Playlist hinzufügen', 'Добавить в плейлист', 'Agregar a lista de reproducción', 'Çalma listesine ekle', 'Add to playlist', 'زێدەکرن ژبۆ لیستا لێدانان', 'افزودن به لیست پخش'),
(167, 'create_new', '', 'Create new', 'إنشاء جديد', 'Opprett ny', 'Créer un nouveau', 'Neu erstellen', 'Создать новый', 'Crear nuevo', 'Yeni oluştur', 'Create new', 'چێکرنا نووی', 'ایجاد جدید'),
(168, 'close', '', 'Close', 'قريب', 'Lukk', 'Fermer', 'Schließen', 'Закрыть', 'cerca', 'yakın', 'Close', 'قەپاتکرن', 'Close'),
(169, 'removed_from', '', 'Removed from', 'تمت الإزالة من', 'Fjernet fra', 'Retiré de', 'Entfernt von', 'Удалено из', 'Eliminado de', 'Kaldırıldı', 'Removed from', 'هاتیە ڕەشوەکرن ل', 'حذف شده از'),
(170, 'added_to', '', 'Added to', 'تمت الإضافة إلى', 'Lagt til', 'Ajouté à', 'Hinzugefügt zu', 'Добавлено в', 'Agregado a', 'Eklendi', 'Added to', 'هاتییە زێدەکرن ل', 'اضافه شده به'),
(171, 'create_new_pl', '', 'Create new playlist', 'إنشاء قائمة تشغيل جديدة', 'Opprett ny spilleliste', 'Créer une nouvelle playlist', 'Neue Playlist erstellen', 'Создать новый плейлист', 'Crear nueva lista de reproducción', 'Yeni çalma listesi oluştur', 'Create new playlist', 'چێکرنا لیستەکا لێدانێ یا نووی', 'ایجاد لیست پخش جدید'),
(172, 'pl_name', '', 'Playlist name', 'اسم قائمة التشغيل', 'Spilleliste navn', 'Nom de la liste de lecture', 'Playlist-Name', 'Название плейлиста', 'Nombre de la lista de reproducción', 'Çalma listesi adı', 'Playlist name', 'ناڤێ لیستا  لێدانان', 'نام لیست پخش'),
(173, 'privacy', '', 'Privacy', 'خصوصية', 'personvern', 'Confidentialité', 'Privatsphäre', 'Приватность', 'intimidad', 'gizlilik', 'توانای بینین', 'هێزا دیتنێ', 'حریم خصوصی'),
(174, 'description', '', 'Description', 'وصف', 'beschrijving', 'Description', 'Beschreibung', 'Описание', 'descripción', 'tanım', 'كورته‌ باس', 'وەصف', 'شرح'),
(175, 'create', '', 'Create', 'خلق', 'Opprett', 'Créer', 'Erstellen', 'создать', 'crear', 'oluşturmak', 'Create', 'چێکرن', 'ايجاد'),
(176, 'cancel', '', 'Cancel', 'إلغاء', 'Avbryt', 'Annuler', 'Abbrechen', 'отменить', 'cancelar', 'iptal', 'Cancel', 'ڤەگەڕیان', 'لغو'),
(177, 'pl_name_required', '', 'Play list name is required.', 'اسم قائمة التشغيل مطلوب.', 'Spillelistenavn er nødvendig.', 'Le nom de la liste de lecture est requis.', 'Der Name der Wiedergabeliste ist erforderlich.', 'Введите имя плейлиста', 'Se requiere el nombre de la lista de reproducción.', 'Çalma listesi adı gerekiyor.', 'Play list name is required.', 'Play list name is required.', 'نام لیست پخش مورد نیاز است'),
(178, 'play_lists', '', 'PlayLists', 'قوائم التشغيل', 'spillelister', 'PlayLists', 'PlayLists', 'плейлисты', 'las listas de reproducción', 'çalma', 'لیستی لێدانه‌كان', 'لیستێن لێدانان', 'لیست های پخش'),
(179, 'delete', '', 'Delete', 'حذف', 'Slett', 'Supprimer', 'Löschen', 'удалять', 'borrar', 'silmek', 'سڕینه‌وه‌', 'ڕەشوەکرن', 'حذف'),
(180, 'confirmation', '', 'Confirmation!', 'تأكيد!', 'Bekreftelse!', 'Confirmation!', 'Bestätigung!', 'Подтверждение!', 'Confirmación!', 'Onay!', 'سه‌لماندن', 'سەلماندن', 'تایید'),
(181, 'confirm_delist', '', 'Are you sure you want to delete this PlayList?', 'هل تريد بالتأكيد حذف قائمة التشغيل هذه؟', 'Er du sikker på at du vil slette denne PlayList?', 'Êtes-vous sûr de vouloir supprimer cette PlayList?', 'Möchten Sie diese PlayList wirklich löschen?', 'Вы действительно хотите удалить этот список воспроизведения?', '¿Estás seguro de que quieres eliminar esta PlayList?', 'Bu Oynatma Listesini silmek istediğinizden emin misiniz?', 'Are you sure you want to delete this PlayList?', 'تو پشت ڕاستی کو تە دڤێت وێ لیستا لێدانا ڕەشوەکەی؟', 'آیا مطمئنید که میخواهید این لیست پخش را حذف کنید؟'),
(182, 'yes_del', '', 'Yes,delete it!', 'نعم، حذفه!', 'Ja, slett det!', 'Oui, supprimez-le!', 'Ja, löschen Sie es!', 'Да, удалите его!', 'Sí, ¡bórralo!', 'Evet, sil şunu!', 'به‌ڵی بیسڕه‌وه‌', 'بەڵێ ، ڕەشوەکە', 'بله، آن را حذف کنید!'),
(183, 'deleted', '', 'Deleted!', 'حذف!', 'Slettet!', 'Supprimé!', 'Gelöscht!', 'Удаляется!', 'Borrado!', 'Silinen!', 'سڕایه‌وه‌.', 'هاتە ڕەشوەکرن!', 'حذف شد!'),
(184, 'was_deleted', '', 'has been deleted!', 'تم حذف!', 'har blitt slettet!', 'a été supprimé!', 'wurde gelöscht!', 'был удален!', 'ha sido eliminado', 'silindi!', 'سڕایه‌وه‌.', 'هاتە ڕەشوەکرن!', 'حذف شد!'),
(185, 'no_lists_found', '', 'No PlayLists Found!', 'لم يتم العثور على قوائم تشغيل!', 'Ingen spillelister funnet!', 'Aucune liste de lecture trouvée!', 'Keine PlayLists gefunden!', 'Нет списков воспроизведения!', 'No se encontraron listas de reproducción', 'Hiç PlayList Bulunamadı!', 'No PlayLists Found!', 'چ لیستێن لێدانان نەهاتنە دیتن', 'هیچ لیست پخش یافت نشد!'),
(186, 'public', '', 'Public', 'جمهور', 'offentlig', 'Public', 'Öffentlichkeit', 'Публичный', 'público', 'kamu', 'گشتی', 'گشتی', 'عمومی'),
(187, 'private', '', 'Private', 'خاص', 'privat', 'Privé', 'Privat', 'Приватный', 'privado', 'özel', 'تایبه‌ت', 'تایبەت', 'خصوصی'),
(188, 'сreated', '', 'Created', 'مكون', 'laget', 'établi', 'Erstellt', 'созданный', 'creado', 'düzenlendi', 'Created', 'هاتە چێکرن', 'ایجاد شده'),
(189, 'pl_сreated', '', 'PlayList was successful added!', 'تمت إضافة قائمة التشغيل بنجاح!', 'Spilleliste ble lagt til!', 'PlayList a été ajouté avec succès!', 'PlayList wurde erfolgreich hinzugefügt!', 'Плейлист был успешно добавлен!', '¡La lista de reproducción se agregó con éxito!', 'Çalma listesi başarıyla eklendi!', 'PlayList was successful added!', 'لیستا لێدانان هاتە زێدەکرن', 'لیست پخش با موفقیت اضافه شد!'),
(190, 'pl_saved', '', 'PlayList was successful saved!', 'تم حفظ قائمة التشغيل بنجاح!', 'Spillelisten ble lagret!', 'PlayList a été enregistré avec succès!', 'PlayList wurde erfolgreich gespeichert!', 'Плейлист был успешно сохранен!', '¡La lista de reproducción se guardó con éxito!', 'Çalma listesi başarıyla kaydedildi!', 'PlayList was successful saved!', 'لیستا لێدانێ ب سەرکەفتی هاتە پاشەکەفتکرن', 'لیست پخش با موفقیت آمیز زخیرە شد!'),
(191, 'watch_later', '', 'Watch later', 'سأشاهده لاحقا', 'Se senere', 'Regarder plus tard', 'Später ansehen', 'Посмотреть позже', 'Ver despues', 'Daha sonra izle', 'Watch later', 'پاشی سەحکێ', 'بعدا تماشا کنید'),
(192, 'articles', '', 'Articles', 'مقالات', 'Artikler', 'Des articles', 'Artikel', 'Статьи', 'Artículos', 'Makaleler', 'بابه‌ته‌كان', 'بابەت', 'مقالات'),
(193, 'search_articles', '', 'Search for articles', 'البحث عن المقالات', 'Søk etter artikler', 'Rechercher des articles', 'Suche nach Artikeln', 'Поиск статей', 'Buscar artículos', 'Makaleleri ara', 'گه‌ڕان بۆ بابه‌ت', 'گەڕیان بدیف بابەتان', 'جستجو برای مقالات'),
(194, 'most_popular', '', 'Most popular', 'الأكثر شعبية', 'Mest populær', 'Le plus populaire', 'Am beliebtesten', 'Самый популярный', 'Más popular', 'En popüler', 'به‌ناوبانگترین', 'بناڤ و دەنگترین', 'معروف ترین'),
(195, 'no_result_for', '', 'Sorry, no results found for', 'آسف، لا توجد نتائج ل', 'Beklager, ingen resultater funnet for', 'Désolé, aucun résultat trouvé pour', 'Leider wurden keine Ergebnisse für', 'Извините, результатов не найдено', 'Lo sentimos, no se encontraron resultados para', 'Üzgünüz, bunun hakkında bir sonuç yok', 'Sorry, no results found for', 'داخازا لێبوورینی دکەم ، پەڕگەهی داخازکری نەهاتە دیتن', 'متاسفانه نتیجه ای یافت نشد'),
(196, 'no_post_found', '', 'No posts found!', 'لم يتم العثور على أية مشاركات!', 'Ingen innlegg funnet!', 'Aucun article trouvé!', 'Keine Einträge gefunden!', 'Сообщений не найдено!', '¡No se han encontrado publicaciones!', 'Gönderi bulunamadı!', 'هیچ بابه‌تێك نیه‌', 'چ بابەت نینە!', 'هیچ پستی پیدا نشد!');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`, `kurdish`, `kurdish_badini`, `persian`) VALUES
(197, 'related_articles', '', 'Related Articles', 'مقالات ذات صلة', 'Relaterte artikler', 'Articles Liés', 'In Verbindung stehende Artikel', 'Статьи по Теме', 'Artículos relacionados', 'İlgili Makaleler', 'بابه‌تی هاوشێوه‌', 'بابەتێن هەفڕەنگ', 'مقالات مرتبط'),
(198, 'share_to', '', 'Share to', 'مشاركة في', 'Del til', 'Partager à', 'Teilen mit', 'Поделиться с', 'Compartir a', 'Paylaş', 'بڵاوكردنه‌وه‌', 'بەلاڤەکرن', 'انتشار'),
(199, 'no_more_articles', '', 'No more Articles', 'لا مزيد من المقالات', 'Ingen flere artikler', 'Plus d\'articles', 'Keine Artikel mehr', 'Нет статей', 'No más artículos', 'Artık Makale Yok', 'بابه‌تی زیاتر نیه‌ بۆ نیشاندان', 'بابەتێن زێدەتر نینە ژبۆ بەرچاڤکرنێ', 'هیچ مقالات بیشتر نیست برای نمایش کردن'),
(200, 'go_pro', '', 'Go Pro', 'الذهاب للمحترفين', 'Bli profesjonell', 'Go Pro', 'Go pro', 'Стать pro', 'Hazte profesional', 'Yanlışa git', 'ببه‌ پێشكه‌وتوو', 'ببە پێشکەفتی', 'خودتان را ارتقاء دهید'),
(201, 'buy_pro_pkg', '', 'Discover more features with {{SITE_NAME}} Pro package!', 'اكتشاف المزيد من الميزات مع {{SITE_NAME}} حزمة برو!', 'Oppdag flere funksjoner med {{SITE_NAME}} Pro pakke!', 'Découvrez plus de fonctionnalités avec le package {{SITE_NAME}} Pro!', 'Entdecken Sie weitere Funktionen mit dem {{SITE_NAME}} Pro-Paket!', 'Узнайте больше о функциях с пакетом {{SITE_NAME}} Pro!', 'Descubre más funciones con el {{SITE_NAME}} paquete Pro!', '{{SITE_NAME}} Pro paketi ile daha fazla özellik keşfedin!', 'تایبه‌تمه‌ندی زیاتر به‌ده‌ست بێنه‌ له‌ ڕیگای  پاكێجی پێشكه‌وتوو !!', 'تایبەتمەندیێن زێدەتر بدەست خۆڤە بینە ژڕێکا پاکێجا پێشکەفتی!!', 'Discover more features with {{SITE_NAME}} Pro package!'),
(202, 'free_mbr', '', 'Free Member', 'عضو مجاني', 'Gratis medlem', 'Membre gratuit', 'Freies Mitglied', 'Свободный член', 'miembro gratuito', 'Ücretsiz Üye', 'ئه‌ندامی ئاسایی', 'ئەندامێ ئاسایی', 'عضو معمولی'),
(203, 'pro_mbr', '', 'Pro Member', 'عضو برو', 'Pro-medlem', 'Membre Pro', 'Pro-Mitglied', 'Про член', 'Pro miembro', 'Pro Üyesi', 'ئه‌ندامی تایبه‌ت', 'ئاندامێ تایبەت', 'عضو ویژە'),
(204, 'upload_1gb_limit', '', 'Upload up to 1GB limit', 'تحميل حد يصل إلى 1 غيغابايت', 'Last opp opptil 1 GB grense', 'Importer jusqu\'à 1 Go de limite', 'Bis zu 1 GB limitieren', 'Загружать ограничение до 1 ГБ', 'Carga hasta 1GB de límite', '1GB limitine kadar yükle', 'به‌رزكردنه‌وه‌ تاكو 50 مێگابایت', 'ئەپڵۆد کرن هەتا 50 مێگابایتان', 'حد مجاز برای بارگذاری  50 مگابایت است'),
(205, 'ads_will_show_up', '', 'Videos ads will show up', 'ستظهر إعلانات مقاطع الفيديو', 'Videoannonser vises', 'Les annonces vidéo s\'affichent', 'Videos werden geschaltet', 'Появятся видеообъявления', 'Los anuncios de videos aparecerán', 'Videolar reklamları gösterilir', 'ڕێكلام له‌سه‌ر ڤیدیۆكان ئه‌بێت', 'ڕێکلام لسەر ڤیدیۆیان نەبیت', 'هیچ تبلیغاتی روو فیلم ها نباشد'),
(206, 'not_featured_videos', '', 'Not featured videos', 'مقاطع الفيديو غير المميزة', 'Ikke kjennetegnet videoer', 'Vidéos non présentées', 'Nicht vorgestellte Videos', 'Не показано видео', 'Videos no destacados', 'Özellikli video yok', 'ڤیدۆكان تایبه‌ت ناكرێن', 'ڤیدیۆ ناهێنە تایبەت کرن', 'ویدیوها مخصوص نخواهد کرد'),
(207, 'no_verified_badge', '', 'No verified badge', 'لم يتم التحقق من شارة', 'Ingen bekreftet merke', 'Aucun badge vérifié', 'Kein bestätigtes Abzeichen', 'Нет подтвержденного значка', 'Sin insignia verificada', 'Doğrulanmış rozet yok', 'به‌بێ هێمای سه‌لماندن', 'بێی نیشانا سەلماندنێ', 'بدون نشان تایید'),
(208, 'stay_free', '', 'Stay Free', 'ابق حرا', 'Forbli fri', 'Reste libre', 'Bleibe frei', 'Оставайся свободным', 'Mantente Libre', 'Bedava Kal', 'له‌ دۆخی خۆت بمێنه‌وه‌', 'د ڕەوشا خۆدا بمینە', 'در حال خودتان بمانید'),
(209, 'upgrade', '', 'Upgrade', 'تطوير', 'Oppgradering', 'Surclassement', 'Aktualisierung', 'Обновить', 'Mejorar', 'yükseltmek', 'ببه‌ پێشكه‌وتوو', 'ببە پێشکەفتی', 'خودتان را ارتقاء دهید'),
(210, 'upload_1tr_limit', '', 'Upload up to 1000GB', 'تحميل ما يصل إلى 1000 غيغابايت', 'Last opp opptil 1000 GB', 'Télécharger jusqu\'à 1000Go', 'Bis zu 1000 GB hochladen', 'Загрузите до 1000 ГБ', 'Carga hasta 1000GB', '1000GB\'a kadar yükle', 'به‌رزكردنه‌وه‌ تاكو 10 گێگابایت', 'ئەپڵۆدکرن هەتانی 10 گێگابایتان', 'حد مجار برای بارگذاری 10 گیگابایت است'),
(211, 'ads_wont_show_up', '', 'No ads will show up', 'لن تظهر أية إعلانات', 'Ingen annonser vil dukke opp', 'Aucune annonce ne s\'affichera', 'Es werden keine Anzeigen geschaltet', 'Объявления не будут отображаться', 'No se mostrarán anuncios', 'Hiçbir reklam gösterilmez', 'رێكلام له‌سه‌ر ڤیدۆكان نابێت', 'ڕێکلام لسەر ڤیدییۆیان نابیت', 'هیچ تبلیغاتی روو ویدیوها نخواهد گزاشت'),
(212, 'ur_are_featured', '', 'Featured videos', 'مقاطع الفيديو الخاصة بك واردة', 'Dine videoer er omtalt', 'Vos vidéos sont en vedette', 'Ihre Videos sind gekennzeichnet', 'Ваши видеоролики', 'Tus videos son presentados', 'Videolarınız öne çıkıyor', 'ڤیدیۆ تایبه‌ت ئه‌كرێت', 'ڤیدیۆ دێ هێتە تایبەت کرن', 'ویدیو مخصوص نخواهد شد'),
(213, 'verified_badge', '', 'Verified badge', 'تم التحقق من الشارة', 'Verifisert merketegn', 'Badge vérifié', 'Bestätigter Ausweis', 'Проверенный значок', 'Insignia verificada', 'Doğrulanmış rozet', 'هێمای سه‌لماندن', 'نیشانا سەلماندنێ', 'نشان تایید'),
(214, 'congratulations', '', 'Congratulations!', 'تهانينا!', 'Gratulerer!', 'Toutes nos félicitations!', 'Glückwünsche!', 'Поздравления!', '¡Felicitaciones!', 'Tebrik ederiz!', 'Congratulations!', 'پیرۆزباهییێ ژتە دکەم!', 'تبریک می گویم!'),
(215, 'uare_pro', '', 'You have successfully upgraded you profile to PRO user!', 'لقد نجحت في ترقية ملفك الشخصي إلى مستخدم برو!', 'Du har oppgradert profilen din til PRO-brukeren!', 'Vous avez mis à jour votre profil avec succès vers l\'utilisateur PRO!', 'Sie haben Ihr Profil erfolgreich auf den PRO-Benutzer aktualisiert!', 'Вы успешно обновили свой профиль до пользователя PRO!', '¡Ha actualizado su perfil con éxito a usuario PRO!', 'Profilinizi PRO kullanıcılarına başarıyla yükselttiniz!', 'You have successfully upgraded you profile to PRO user!', 'تە ب سەرکەفتی هەژمارێ خۆ گوهەرت ژبۆ هەژمارەکێ بناڤ و دەنگ PRO', 'You have successfully upgraded you profile to PRO user!'),
(216, 'start_features', '', 'Start browsing new features', 'ابدأ تصفح الميزات الجديدة', 'Begynn å bla gjennom nye funksjoner', 'Commencer à parcourir les nouvelles fonctionnalités', 'Suche nach neuen Funktionen', 'Начать просмотр новых функций', 'Comienza a navegar por nuevas funciones', 'Yeni özelliklere göz atmaya başlayın', 'Start browsing new features', 'Start browsing new features', 'Start browsing new features'),
(217, 'import_limit_reached_upgrade', '', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'لقد وصلت إلى حد الاستيراد، وترقية إلى الموالية لاستيراد أشرطة الفيديو غير محدود!', 'Du har nådd importgrensen din, oppgrader til pro for å importere ubegrensede videoer!', 'Vous avez atteint votre limite d\'importation, passez à pro pour importer des vidéos illimitées!', 'Sie haben Ihr Importlimit erreicht, aktualisieren Sie auf Pro, um unlimitierte Videos zu importieren!', 'Вы достигли своего лимита импорта, обновляете pro для импорта неограниченного количества видео!', '¡Has alcanzado tu límite de importación, actualízate a pro para importar videos ilimitados!', 'İçe aktarma limitinize ulaştınız, sınırsız videoları içe aktarmak için yanlızca yükseltin!', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'You have reached your import limit, upgrade to pro to import unlimited videos!'),
(218, 'upload_limit_reached_upgrade', '', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'لقد وصلت إلى حد التحميل، وترقية إلى الموالية لتحميل أشرطة الفيديو غير محدود!', 'Du har nådd opplastingsgrensen din, oppgrader til pro for å laste opp ubegrensede videoer!', 'Vous avez atteint votre limite de téléchargement, passez à pro pour télécharger des vidéos illimitées!', 'Du hast dein Upload-Limit erreicht, aktualisiere auf Pro, um unlimitierte Videos hochzuladen!', 'Вы достигли предела загрузки, обновляете до Pro для загрузки неограниченного количества видео!', 'Has alcanzado el límite de carga y actualízate a profesional para subir videos ilimitados.', 'Yükleme limitinize ulaştınız, sınırsız video yüklemek için profesyonelliğe geçin!', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!'),
(219, 'import_limit_reached', '', 'You have reached your import limit', 'لقد وصلت إلى حد الاستيراد', 'Du har nådd importgrensen din', 'Vous avez atteint votre limite d\'importation', 'Sie haben Ihr Importlimit erreicht', 'Вы достигли своего предела импорта', 'Has alcanzado tu límite de importación', 'İçe aktarma limitinize ulaştınız.', 'You have reached your import limit', 'You have reached your import limit', 'You have reached your import limit'),
(220, 'upload_limit_reached', '', 'You have reached your upload limit', 'لقد وصلت إلى حد التحميل', 'Du har nådd opplastingsgrensen din', 'Vous avez atteint votre limite de téléchargement', 'Du hast dein Upload-Limit erreicht', 'Вы достигли предела загрузки', 'Has alcanzado tu límite de carga', 'Yükleme limitinize ulaştınız.', 'You have reached your upload limit', 'تە سنوورێ ئەپڵۆدکرنێ بەزاند ئیدی تە نەشێی چ ڤیدیۆیان ئەپلۆد کەی', 'You have reached your upload limit'),
(221, 'upgrade_now', '', 'Upgrade Now?', 'تحديث الآن؟', 'Oppgrader nå?', 'Mettre à jour maintenant?', 'Jetzt upgraden?', 'Обнови сейчас?', '¿Actualizar ahora?', 'Şimdi Yükselt?', 'Upgrade Now?', 'ئا نۆکە بناڤبانگ بی؟', 'ارتقا در حال حاضر؟'),
(222, 'error', '', 'Error!', 'خطأ!', 'Feil!', 'Erreur!', 'Fehler!', 'Ошибка!', '¡Error!', 'Hata!', 'Error!', 'خەلەتی!', 'خطا!'),
(223, 'error_msg', '', 'Something went wrong Please try again later!', 'هناك شئ خاطئ، يرجى المحاولة فى وقت لاحق!', 'Noe gikk galt. Prøv igjen senere!', 'Quelque chose c\'est mal passé. Merci d\'essayer plus tard!', 'Etwas ist schief gelaufen Bitte versuche es später noch einmal!', 'Что-то пошло не так. Пожалуйста, повторите попытку позже!', 'Algo salió mal. ¡Inténtalo de nuevo más tarde!', 'Bir şeyler yanlış oldu. Lütfen sonra tekrar deneyiniz!', 'Something went wrong Please try again later!', 'خەلەتییەک چێ بوو ، هیڤی دکەم پاشی دووبارە کەوە', 'Something went wrong Please try again later!'),
(224, 'oops', '', 'Oops', 'وجه الفتاة', 'Oops', 'Oops', 'Hoppla', 'Ой', 'Uy', 'Hata', 'Oops', 'ئۆ نا!', 'اوه'),
(225, 'write_a_reply', '', 'Write a comment and press ENTER', 'اكتب تعليق واضغط إنتر', 'Schrijf een reactie en druk op ENTER', 'Ecrire un commentaire et appuyez sur ENTER', 'Schreiben Sie einen Kommentar und drücken Sie ENTER.', 'Напишите комментарий и нажмите клавишу ВВОД', 'Escribe un comentario y presiona ENTER', 'Yorum yazın ve ENTER tuşuna basın', 'سه‌رنجه‌كه‌ت بنووسه‌ و بینێره‌', 'بۆچوونەکێ بنڤیسە...', 'نظرتان را بنویسید و ارسالش کنید'),
(226, 'file_is_too_big', '', 'File is too big, Max upload size is', 'الملف كبير جدا، الحد الأقصى لحجم التحميل هو', 'Bestand is te groot, Max upload grootte is', 'Le fichier est trop grand, la taille maximale de téléchargement est', 'Datei ist zu groß, Max Upload-Größe ist', 'Файл слишком большой, максимальный размер загрузки', 'El archivo es demasiado grande, el tamaño máximo de carga es', 'Dosya çok büyük, Maks. Yükleme boyutu', 'File is too big, Max upload size is', 'فایل گەلەک یا گرانە بهایێ دەست نیشان کری ژبۆ ئاپڵۆدکرنێ بریتییە ل', 'File is too big, Max upload size is'),
(227, 'ads', '', 'Advertising', 'إعلان', 'Advertising', 'Publicité', 'Werbung', 'реклама', 'publicidad', 'reklâm', 'رێكلام', 'ڕێکلام', 'تبلیغات'),
(228, 'wallet', '', 'Wallet', 'محفظة', 'portemonnee', 'Portefeuille', 'Geldbörse', 'бумажник', 'billetera', 'cüzdan', 'جزدان', 'جزدان', 'کیف پول'),
(229, 'name', '', 'Name', 'اسم', 'naam', 'Nom', 'Name', 'имя', 'nombre', 'isim', 'ناو', 'ناڤ', 'نام'),
(230, 'results', '', 'Results', 'النتائج', 'resultaten', 'Résultats', 'Ergebnisse', 'результаты', 'resultados', 'sonuçlar', 'ئه‌نجام', 'ئەنجام', 'نتایج'),
(231, 'spent', '', 'Spent', 'أمضى', 'besteed', 'Dépensé', 'Ausgegeben', 'потраченное', 'gastado', 'harcanmış', 'ڕۆشتوو', 'چوویی', 'صرف شدە'),
(232, 'action', '', 'Action', 'عمل', 'actie', 'Action', 'Aktion', 'действие', 'acción', 'eylem', 'كاریگه‌ری', 'گاریگەر', 'عمل'),
(233, 'clicks', '', 'Clicks', 'نقرات', 'klikken', 'Clics', 'Klicks', 'Щелчки', 'clics', 'Tıklanma', 'Clicks', 'وەکرن', 'کلیک ها'),
(234, 'create_ad', '', 'Create ad', 'إنشاء إعلان', 'Maak een advertentie', 'Créer une annonce', 'Anzeige erstellen', 'Создать объявление', 'Crear anuncio', 'Reklam oluştur', 'دانانی ڕێكلام', 'دانانا ڕێکلامان', 'ایجاد آگهی'),
(235, 'my_balance', '', 'MY BALANCE', 'ماي بالانس', 'MIJN EVENWICHT', 'MON ÉQUILIBRE', 'MEINE BALANCE', 'МОЙ БАЛАНС', 'MI EQUILIBRIO', 'MY BALANCE', 'به‌ڵانسه‌كه‌م', 'بالانسێ من', 'شارژ من'),
(236, 'replenish_my_balance', '', 'Replenish My Balance', 'ريبلينيش بلدي التوازن', 'Vervult mijn saldo', 'Réapprovisionner mon équilibre', 'Füllen Sie mein Gleichgewicht auf', 'Пополнить баланс', 'Reponer mi saldo', 'Bakiyemi yenile', 'پڕكردنه‌وه‌ی به‌ڵانس', 'تژیکرنا بالانسی', 'تسویە کردن شارژ'),
(237, 'amount', '', 'Amount', 'كمية', 'bedrag', 'Montant', 'Betrag', 'Сумма', 'cantidad', 'miktar', 'بڕ', 'بها', 'میزان'),
(238, 'replenish', '', 'Replenish', 'سد النقص', 'bijvullen', 'Régénérer', 'Auffüllen', 'Пополнить', 'reponer', 'doldurmak', 'Replenish', 'دوبارە تژی کەڤە', 'Replenish'),
(239, 'create_new_ad', '', 'Create new ad', 'إنشاء إعلان جديد', 'Maak een nieuwe advertentie', 'Créer une nouvelle annonce', 'Neue Anzeige erstellen', 'Создать новое объявление', 'Crear nuevo anuncio', 'Yeni reklam oluştur', 'دانانی ڕێكلامی نوێ', 'دانانا ڕێکلامێن نووی', 'ایجاد آگهی جدید'),
(240, 'title', '', 'Title', 'لقب', 'titel', 'Titre', 'Titel', 'Название', 'título', 'başlık', 'ناونیشان', 'ناڤ و نیشان', 'عنوان'),
(241, 'select_media', '', 'Select Media', 'حدد الوسائط', 'Selecteer media', 'Sélectionner un média', 'Medien auswählen', 'Выбрать носитель', 'Seleccionar medios', 'Medya Seç', 'دیاری كردنی میدیا', 'دەست نیشان کرنا جڤاکێ', 'انتخاب کردن رسانه ها'),
(242, 'pricing', '', 'Pricing', 'التسعير', 'pricing', 'Tarification', 'Preise', 'Ценообразование', 'la fijación de precios', 'Fiyatlandırma', 'نرخه‌كان', 'بها', 'قیمت ها'),
(243, 'placement', '', 'Placement', 'وضع', 'plaatsing', 'Placement', 'Platzierung', 'Размещение', 'colocación', 'yerleştirme', 'شوێنی ده‌ركه‌وتن', 'جهێ بدەرکەفتنێ', 'جاه نمایش کردن'),
(244, 'traget_audience', '', 'Target Audience', 'الجمهور المستهدف', 'Doelgroep', 'Public cible', 'Zielgruppe', 'Целевая аудитория', 'Audiencia objetivo', 'Hedef Kitle', 'Target Audience', 'Target Audience', 'Target Audience'),
(245, 'video_ad', '', 'Videos (Format Video / Image)', 'مقاطع الفيديو (تنسيق الفيديو / الصورة)', 'Video\'s (video / afbeelding opmaken)', 'Vidéos (format vidéo / image)', 'Videos (Format Video / Bild)', 'Видео (формат видео / изображение)', 'Videos (Formato de video / imagen)', 'Videolar (Biçim Video / Resim)', 'Videos (Format Video / Image)', 'Videos (Format Video / Image)', 'Videos (Format Video / Image)'),
(246, 'page_ad', '', 'Sidebar (Format Image)', 'الشريط الجانبي (تنسيق الصورة)', 'Zijbalk (opmaakafbeelding)', 'Barre latérale (format image)', 'Seitenleiste (Bild formatieren)', 'Боковая панель (формат изображения)', 'Barra lateral (Imagen de formato)', 'Kenar Çubuğu (Biçim Resim)', 'Sidebar (Format Image)', 'Sidebar (Format Image)', 'Sidebar (Format Image)'),
(247, 'cost_click', '', 'Pay Per Click', 'الدفع لكل نقرة', 'Betaal per klik', 'Payer par clic', 'Zahlen pro Klick', 'Оплатить за клик', 'Pago por clic', 'Tıklama Başı Ödeme', 'Pay Per Click', 'پارەدان بدیف ڤەکرنان', 'Pay Per Click'),
(248, 'cost_view', '', 'Pay Per Impression', 'الدفع لكل ظهور', 'Betaal per indruk', 'Pay Per Impression', 'Bezahlen pro Eindruck', 'Оплатить за показ', 'Pago por impresión', 'Gösterim Başı Ödeme', 'Pay Per Impression', 'Pay Per Impression', 'Pay Per Impression'),
(249, 'invalid_name', '', 'Name must be between 5/32', 'يجب أن يكون الاسم بين 5/32', 'Naam moet tussen 5/32 zijn', 'Le nom doit être entre 5/32', 'Name muss zwischen 5/32 liegen', 'Имя должно быть от 5/32', 'El nombre debe estar entre 5/32', 'Ad 5/32 arasında olmalıdır', 'ناو پێویسته‌ له‌ نێوان 5 بۆ 32 پیت بێت', 'ناڤ پێدڤیە د ناڤبەرا 5 بۆ 32 پەیڤاندا بیت', 'نام باید بین  5/32 حرف باشد'),
(250, 'invalid_url', '', 'The URL is invalid. Please enter a valid URL', 'عنوان ورل غير صالح. الرجاء إدخال عنوان ورل صالح', 'De URL is ongeldig. Voer een geldige URL in', 'L\'URL est invalide. Veuillez entrer une URL valide', 'Die URL ist ungültig. Bitte geben Sie eine gültige URL ein', 'Недопустимый URL. Введите действительный URL-адрес', 'La URL no es válida. Por favor ingrese una URL válida', 'URL geçersiz. Lütfen geçerli bir URL girin', 'The URL is invalid. Please enter a valid URL', 'لینک نەدرستە! هیڤی دکەم لینکەکا درست  دانێ', 'The URL is invalid. Please enter a valid URL'),
(251, 'invalid_ad_title', '', 'Ad title must be between 5/100', 'يجب أن يكون عنوان الإعلان بين 5/100', 'De advertentietitel moet tussen 5/100 zijn', 'Le titre de l\'annonce doit être compris entre 5/100', 'Der Anzeigentitel muss zwischen 5/100 liegen', 'Название объявления должно быть от 5/100', 'El título del anuncio debe estar entre 5/100', 'Reklam başlığı 5/100 arasında olmalıdır.', 'ناونیشانی بانگه‌شه‌ پێویسته‌ له‌ نێوان 5 بۆ 100 پیت بێت', 'ناڤ و نیشانێ بانگهێشت نامەی پێدڤیە د ناڤبەرا 5 بۆ 100 پەیڤاندا بیت', 'عنوان تبلیغ باید بین 5/100 حرف باشد'),
(252, 'invalid_videoad_media', '', 'Media file is invalid. Please select a valid image / video', 'ملف الوسائط غير صالح. الرجاء تحديد صورة / فيديو صالح', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding / video', 'Le fichier multimédia est invalide. Veuillez sélectionner une image / vidéo valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild / Video aus', 'Недопустимый файл мультимедиа. Выберите действительное изображение / видео', 'El archivo multimedia no es válido. Seleccione una imagen / video válido', 'Medya dosyası geçersiz. Lütfen geçerli bir resim / video seçin', 'په‌ڕگه‌ی میدیا هه‌ڵه‌یه‌ تكایه‌ وێنه‌ یان ڤیدیۆیه‌كی ته‌واو هه‌ڵبژێره‌', 'پەڕگەهێ جڤاکی نەدرستە ! هیڤی دکەم شکل ئانکو ڤیدیۆیەکێ درست دەست نیشان کە', 'فایل رسانه ای نامعتبر است ! لطفا یک تصویر یا ویدیوی معتبر را انتخاب کنید'),
(253, 'invalid_pagead_media', '', 'Media file is invalid. Please select a valid image', 'ملف الوسائط غير صالح. الرجاء تحديد صورة صالحة', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier multimédia est invalide. Veuillez sélectionner une image valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл мультимедиа. Выберите действительное изображение', 'El archivo multimedia no es válido. Seleccione una imagen válida', 'Medya dosyası geçersiz. Lütfen geçerli bir resim seçin', 'میدیا هه‌ڵه‌یه‌ تكایه‌ وێنه‌یه‌كی ته‌واو دابنێ', 'جڤاک نەدرستە هیڤی دکەم شکلەکێ درست دانێ', 'فایل رسانه ای نامعتبر است ! لطفا یک تصویر معتبر را انتخاب کنید'),
(254, 'edit_ad', '', 'Edit ad', 'تعديل الإعلان', 'Advertentie bewerken', 'Modifier l\'annonce', 'Anzeige bearbeiten', 'Изменить объявление', 'Editar anuncio', 'Reklamı düzenle', 'Edit ad', 'دەستکاریکرنا ڕێکلامی', 'ویرایش تبلیغ'),
(255, 'by', '', 'By', 'بواسطة', 'door', 'Par', 'Von', 'по', 'por', 'tarafından', 'By', 'ژ لایێ', 'توسط'),
(256, 'more_info', '', 'More Info', 'مزيد من المعلومات', 'Meer info', 'Plus d\'infos', 'Mehr Infos', 'Дополнительная информация', 'Más información', 'Daha Fazla Bilgi', 'More Info', 'پێزانینێن زێدەتر', 'اطلاعات بیشتر'),
(257, 'monetization', '', 'Monetization', 'تسييل', 'monetization', 'Monétisation', 'Monetarisierung', 'монетизация', 'monetización', 'Para Kazanma', 'هاوبه‌شی', 'هەڤپشک', 'اشتراک گذاری'),
(258, 'monetization_settings', '', 'Monetization Settings', 'إعدادات تحقيق الدخل', 'Instellingen voor inkomsten genereren', 'Paramètres de monétisation', 'Monetarisierungseinstellungen', 'Настройки монетизации', 'Configuración de monetización', 'Para Kazandırma Ayarları', 'ڕێكخسته‌كانی هاوبه‌شی', 'ڕێکخستنێن هەڤپشک کرنێ', 'تنظیمات اشتراک گذاری'),
(259, 'withdrawals', '', 'Withdrawals', 'السحب', 'onttrekkingen', 'Retraits', 'Abhebungen', 'Изъятия', 'Los retiros', 'Çekme', 'وه‌رگرتن', 'وەرگرتن', 'گرفتن'),
(260, 'balance', '', 'Available balance', 'الرصيد المتاح', 'Beschikbare balans', 'Solde disponible', 'Verfügbare Bilanz', 'Доступный баланс', 'Saldo disponible', 'Kullanılabilir bakiye', 'به‌ڵانسی به‌رده‌ست', 'بالانسێ بەردەست', 'شارژ موجود'),
(261, 'min', '', 'Min', 'دقيقة', 'min', 'Min', 'Min', 'мин', 'min', 'min', 'كه‌متر نه‌بێت له‌', 'کێمتر نەبیت ژ', 'کمتر نباشد از'),
(262, 'submit_withdrawal_request', '', 'Submit withdrawal request', 'إرسال طلب السحب', 'Verzoek tot opname indienen', 'Envoyer une demande de retrait', 'Abhebungsanfrage einreichen', 'Отправить запрос', 'Enviar solicitud', 'Istek gönder', 'Submit withdrawal request', 'داخازیا ڕاکێشانێ فڕێکە', 'Submit withdrawal request'),
(263, 'cant_request_withdrawal', '', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'لا يمكنك إرسال طلب', 'U kunt geen aanvraag indienen', 'Vous ne pouvez pas soumettre une demande', 'Sie können keine Anfrage senden', 'Вы не можете отправить запрос до тех пор, пока предыдущий запрос не будет одобрен / отклонен', 'No puede enviar la solicitud hasta que la solicitud anterior haya sido aprobada / rechazada', 'Önceki istek onaylanana / reddedilene kadar istekte bulunamazsınız', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'You can not submit withdrawal request until the previous requests has been approved / rejected'),
(264, 'withdrawal_request_amount_is', '', 'Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:', 'رصيدك هو {{بالانس}}، الحد الأدنى لطلب السحب هو 50:', 'Uw saldo is {{BALANCE}}, het minimum opnameverzoek is 50:', 'Votre solde est {{BALANCE}}, la demande de retrait minimum est de 50:', 'Ihr Guthaben ist {{BALANCE}}, die Mindestanzahl der Auszahlungen beträgt 50:', 'Ваш баланс {{BALANCE}}, минимальный запрос на изъятие составляет 50:', 'Su saldo es {{BALANCE}}, la solicitud mínima de retiro es 50:', 'Bakiyeniz {{BALANCE}}, minimum para çekme isteği 50\'dir:', 'به‌ڵانسه‌كه‌ت بریتیه‌ له‌  كه‌متر بڕ بۆ ڕاكێشان بریتیه‌ له‌ 100 دۆلار', 'بالانسێ تە بریتییە ل , کێمترین بها ژبۆ ڕاکێشانێ بریتییە ل 100 دۆلاران:', 'شارژ شما , کمترین تعداد برای کسب و کشیدن 100 دلار است'),
(265, 'min_withdrawal_request_amount_is', '', 'The minimum withdrawal request is 50:', 'الحد الأدنى لطلب السحب هو 50:', 'Het minimale opnameverzoek is 50:', 'La demande de retrait minimum est de 50:', 'Die minimale Auszahlungsanforderung ist 50:', 'Минимальный запрос на изъятие составляет 50:', 'La solicitud mínima de retiro es 50:', 'Minimum para çekme talebi 50\'dir:', 'The minimum withdrawal request is 50:', 'The minimum withdrawal request is 50:', 'The minimum withdrawal request is 50:'),
(266, 'withdrawal_request_sent', '', 'Your withdrawal request has been successfully sent!', 'تم إرسال طلب السحب بنجاح!', 'Uw opnameverzoek is met succes verzonden!', 'Votre demande de retrait a bien été envoyée!', 'Ihre Auszahlungsanfrage wurde erfolgreich versendet!', 'Ваш запрос на удаление был успешно отправлен!', '¡Su solicitud de retiro ha sido enviada con éxito!', 'Çekilme isteğiniz başarıyla gönderildi!', 'Your withdrawal request has been successfully sent!', 'داخازیا ڕاکێشانا تە ب سەرکەفتی هاتە فڕێکرن', 'Your withdrawal request has been successfully sent!'),
(267, 'enabled', '', 'Enabled', 'تمكين', 'ingeschakeld', 'Activé', 'Aktiviert', 'Включено', 'Activado', 'Etkin', 'چاڵاك كراوه‌', 'هاتییە چالاک کرن', 'فعال شده است'),
(268, 'disabled', '', 'Disabled', 'معاق', 'invalide', 'Désactivé', 'Deaktiviert', 'Выключено', 'discapacitado', 'engelli', 'ناچاڵاك', 'هاتییە نەچالاک کرن', 'غیرفعال شدە'),
(269, 'withdrawals_history', '', 'Withdrawals History', 'انسحابات التاريخ', 'Opnames geschiedenis', 'Historique des retraits', 'Abhebungen Geschichte', 'История изъятий', 'Historia de Retiros', 'Para Çekme Tarihi', 'Withdrawals History', 'تەئریخا ڕاکێشانێ', 'Withdrawals History'),
(270, 'rejected', '', 'Rejected', 'مرفوض', 'verworpen', 'Rejeté', 'Abgelehnt', 'отвергнуто', 'rechazado', 'reddedilen', 'Rejected', 'رەت بوو', 'Rejected'),
(271, 'accepted', '', 'Accepted', 'قبلت', 'geaccepteerd', 'Accepté', 'Akzeptiert', 'Принято', 'aceptado', 'kabul', 'Accepted', 'هاتە قەبیل کرن', 'پذیرفته شده'),
(272, 'requested_at', '', 'Requested at', 'طلب في', 'Gevraagd om', 'Demandé à', 'Angefordert bei', 'Запрошено на', 'Solicitado en', 'Adresinden istendi', 'Requested at', 'هاتییە داخازی کرن ل', 'درخواست شده در'),
(273, 'confirm_delete_ad', '', 'Are you sure you want to delete this ad?', 'هل تريد بالتأكيد حذف هذا الإعلان؟', 'Weet je zeker dat je deze advertentie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer cette annonce?', 'Möchten Sie diese Anzeige wirklich löschen?', 'Вы уверены, что хотите удалить это объявление?', '¿Seguro que quieres eliminar este anuncio?', 'Bu reklamı silmek istediğinizden emin misiniz?', 'Are you sure you want to delete this ad?', 'تو پشت ڕاستی کو تە دڤێت وێ ڕێکلامێ ڕەشوەکەی؟', 'آیا مطمئن هستید که می خواهید این آگهی را حذف کنید؟'),
(274, 'ad_published', '', 'Your ad has been published successfully', 'إعلانك هنا', 'Uw advertentie is hier', 'Votre annonce est ici', 'Ihre Anzeige ist hier', 'Ваше объявление успешно опубликовано', 'Su anuncio ha sido publicado con éxito', 'Reklamınız başarıyla yayınlandı', 'Your ad has been published successfully', 'ڕێکلاما تە ب سەرکەفتی هاتە بەلاڤکرن', 'آگهی شما با موفقیت منتشر شده است'),
(275, 'ad_saved', '', 'Your changes to the ad were successfully saved', 'تغييراتك إلى الأفضل', 'Uw wijzigingen in de beste', 'Vos changements au meilleur', 'Ihre Änderungen an den besten', 'Ваши изменения в объявлении были успешно сохранены', 'Sus cambios en el anuncio se guardaron con éxito', 'Reklamdaki değişiklikler başarıyla kaydedildi', 'Your changes to the ad were successfully saved', 'ڕێکلاما تە ب سەرکەفتی هاتە نووی کرن', 'تغییرات شما در این آگهی با موفقیت ذخیره شد'),
(276, 'pending', '', 'Pending', 'ريثما', 'in afwachting van', 'en attente', 'anstehend', 'в ожидании', 'pendiente', 'kadar', 'Pending', 'ل هیڤییێ بە...', 'در انتظار'),
(277, 'balance_is_0', '', 'Your current wallet balance is: 0, please top up your wallet to continue.', 'رصيد المحفظة الحالي هو: 0، يرجى متابعة محفظتك للمتابعة.', 'Uw huidige portemonneebalans is: 0, vul uw portemonnee aan om door te gaan.', 'Votre solde de portefeuille actuel est: 0, veuillez compléter votre portefeuille pour continuer.', 'Ihre aktuelle Brieftasche Gleichgewicht ist: 0, bitte nach oben Ihre Brieftasche, um fortzufahren.', 'Ваш текущий баланс кошелька: 0, пожалуйста, пополните свой кошелек, чтобы продолжить.', 'Su saldo de cartera actual es: 0, por favor, recargue su cartera para continuar.', 'Mevcut cüzdan bakiyeniz: 0, devam etmek için lütfen cüzdanınızı doldurun.', 'به‌ڵانسه‌كه‌ت بریتیه‌ له‌ 0 دۆلار پێویسته‌ به‌ڵانسه‌كه‌ت پڕبكه‌یته‌وه‌', 'بالانسێ تە بریتییە ل $0 دۆلار پێدڤیە تو بالانسێ خۆ تژیکری', 'توازن فعلی کیف پول شما:  0 دلار است ، لطفا کیف پول خود را تسویە کنید.'),
(278, 'top_up', '', 'Top Up', 'أشحن', 'Top Up', 'Remplir', 'Nachfüllen', 'Пополнить', 'Completar', 'Ekleyin', 'Top Up', 'Top Up', 'Top Up'),
(279, 'earn_mon', '', 'Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!', 'اربح ({{CONFIG pub_price}} {{CONFIG payment_currency}}) لكل إعلان يتم النقر عليه من مقاطع الفيديو التابعة لك', 'Verdien ({{CONFIG pub_price}} {{CONFIG payment_currency}}) voor elke advertentieklik die je krijgt van je video\'s!', 'Gagnez ({{CONFIG pub_price}} {{CONFIG payment_currency}}) pour chaque annonce que vous recevez de vos vidéos!', 'Verdiene ({{CONFIG pub_price}} {{CONFIG payment_currency}}) für jeden Werbeclick, den du aus deinen Videos erhältst!', 'Заработайте ({{CONFIG pub_price}} {{CONFIG payment_currency}}) для каждого рекламного клика, который вы получаете от своих видео!', 'Gane ({{CONFIG pub_price}} {{CONFIG payment_currency}}) por cada clic publicitario que obtenga de sus videos.', 'Videolarınızdan aldığınız her bir reklam tıklaması için {{CONFIG pub_price}} {{CONFIG payment_currency}} kazanın!', 'بڕی 5 سه‌نت به‌ ده‌ست بێنه‌ له‌ ڕێگای هه‌ر كلیكێكی ڕێكلام له‌سه‌ر ڤیدیۆكه‌ت', '5 سەنتا بدەست خۆڤە بینە ژڕێکا هەر کلیکەکێ ل سەر ڕێکلامان لسەر ڤیدیۆیا خۆ', 'Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!'),
(280, 'get_verified', '', 'Get verified', 'الحصول على التحقق', 'Wordt geverifieerd', 'Être vérifié', 'Verifiziert werden', 'Пройти проверку', 'Verifícate', 'Onaylanmış olmak', 'Get verified', 'داخازکرنا سەلماندنێ', 'تأیید شود'),
(281, 'u_are_verified', '', 'Congratulations, you are verified. Thanks for verifying your ID', 'تهانينا، لقد تم إثبات ملكيتك. نشكرك على إثبات هويتك', 'Gefeliciteerd, je bent geverifieerd. Bedankt voor het verifiëren van uw ID', 'Félicitations, vous êtes vérifié. Merci d\'avoir vérifié votre identifiant', 'Herzlichen Glückwunsch, du bist verifiziert. Vielen Dank für die Bestätigung Ihrer ID', 'Поздравляем, вы подтверждены. Спасибо, что подтвердили свой идентификатор', 'Felicidades, estás verificado. Gracias por verificar tu ID', 'Tebrikler, doğrulanmışsın. Kimliğinizi doğruladığınız için teşekkür ederiz', 'پیرۆزه‌ تۆ هه‌ژماره‌كه‌ت سه‌لمێنراوه‌', 'پیرۆزە هەژمارێ تە یێ هاتییە سەلماندن', 'تبریک می گویم ، حساب شما تأیید شدە است'),
(282, 'verif_request_received', '', 'Your request was received and is pending approval', 'تم استلام طلبك وهو في انتظار الموافقة', 'Uw aanvraag is ontvangen en wacht op goedkeuring', 'Votre demande a été reçue et est en attente d\'approbation', 'Ihre Anfrage wurde empfangen und steht noch aus.', 'Ваш запрос был получен и находится на рассмотрении', 'Su solicitud fue recibida y está pendiente de aprobación', 'Talebiniz alındı ve onay bekliyor', 'Your request was received and is pending approval', 'Your request was received and is pending approval', 'Your request was received and is pending approval'),
(283, 'upload_id', '', 'Upload Passport or ID', 'تحميل جواز السفر أو الهوية', 'Upload paspoort of ID', 'Télécharger un passeport ou un identifiant', 'Reisepass oder ID hochladen', 'Загрузить паспорт или идентификатор', 'Cargar pasaporte o ID', 'Pasaport veya Kimliği Yükle', 'وێنه‌ی پاسپۆرت یاخود مۆڵه‌تی شۆفێری', 'شکلێ پاسپۆرتێ ئانکو مۆڵەتا شۆفێرییێ', 'لطفا عکس گذرنامە یا شناسە خودت را بارگذاری کن'),
(284, 'select_id', '', 'Please select a recent picture of your passport or id', 'يرجى تحديد صورة حديثة لجواز السفر أو الهوية', 'Selecteer een recente foto van uw paspoort of id', 'Veuillez sélectionner une photo récente de votre passeport ou identifiant', 'Bitte wählen Sie ein aktuelles Bild Ihres Passes oder Ihrer ID', 'Пожалуйста, выберите последнее изображение своего паспорта или идентификатора', 'Seleccione una foto reciente de su pasaporte o identificación', 'Lütfen pasaportunuzun veya kimlik numaranızın son bir resmini seçin', 'تكایه‌ پاسپۆڕتت دابنێ', 'هیڤی دکەم شکلێ پاسپۆرتا خۆ دانێ', 'لطفا گزرنامە خود را ارسال کن'),
(285, 'choose_file', '', 'Choose File', 'اختر ملف', 'Kies bestand', 'Choisir le fichier', 'Datei wählen', 'Выберите файл', 'Elija el archivo', 'Dosya seçin', 'Choose File', 'دەست نیشان کرنا فایلان', 'انتخاب فایل'),
(286, 'submit_request', '', 'Submit request', 'تقديم الطلب', 'Aanvraag indienen', 'Envoyer la demande', 'Anfrage einreichen', 'Отправить запрос', 'Enviar peticion', 'İstek gönderin', 'ناردنی داواكاری', 'فڕێکرنا داخازییێ', 'درخواست را ارسال کنید'),
(287, 'submit_verif_request_error', '', 'You can not submit verification request until the previous requests has been accepted / rejected', 'لا يمكنك إرسال طلب التحقق إلى أن يتم قبول الطلبات السابقة أو رفضها', 'U kunt geen verificatieverzoek indienen totdat de vorige verzoeken zijn geaccepteerd / afgewezen', 'Vous ne pouvez pas soumettre de demande de vérification tant que les demandes précédentes n\'ont pas été acceptées / rejetées', 'Sie können keine Überprüfungsanfrage senden, bis die vorherigen Anforderungen akzeptiert / abgelehnt wurden.', 'Вы не можете отправить запрос на подтверждение до тех пор, пока предыдущие запросы не будут приняты / отклонены', 'No puede enviar solicitud de verificación hasta que las solicitudes anteriores hayan sido aceptadas / rechazadas', 'Önceki istekler kabul / reddedilene kadar doğrulama isteği gönderemezsiniz.', 'You can not submit verification request until the previous requests has been accepted / rejected', 'You can not submit verification request until the previous requests has been accepted / rejected', 'You can not submit verification request until the previous requests has been accepted / rejected'),
(288, 'ivalid_last_name', '', 'Last name is too long!', 'اسم العائلة طويل جدا!', 'Achternaam is te lang!', 'Le nom de famille est trop long!', 'Nachname ist zu lang!', 'Фамилия слишком длинная!', '¡El apellido es demasiado largo!', 'Soyadı çok uzun!', 'Last name is too long!', 'ناڤێ دوویێ گەلەک درێژە!', 'Last name is too long!'),
(289, 'ivalid_image_file', '', 'The Image file is Not valid.please select a valid picture!', 'ملف الصورة غير صالح.الرجاء تحديد صورة صالحة!', 'Het afbeeldingsbestand is niet geldig. Selecteer een geldige foto!', 'Le fichier Image n\'est pas valide. Veuillez sélectionner une image valide!', 'Die Bilddatei ist nicht gültig. Bitte wählen Sie ein gültiges Bild aus!', 'Файл изображения недействителен. Выберите правильное изображение!', 'El archivo de imagen no es válido. ¡Por favor seleccione una imagen válida!', 'Resim dosyası geçerli değil. Geçerli bir resim seçin!', 'The Image file is Not valid.please select a valid picture!', 'شکل نە درستە هیڤی دکەم شکلەکێ درست دەست نیشان کە', 'The Image file is Not valid.please select a valid picture!'),
(290, 'ivalid_id_file', '', 'The passport/ID picture must be an image', 'يجب أن تكون صورة الجواز / الهوية صورة', 'Het paspoort / ID-beeld moet een afbeelding zijn', 'L\'image du passeport / ID doit être une image', 'Das Pass / ID-Bild muss ein Bild sein', 'Паспорт / удостоверение личности должно быть изображением', 'El pasaporte / foto de identificación debe ser una imagen', 'Pasaport / kimlik resmi bir resim olmalıdır.', 'The passport/ID picture must be an image', 'شکلێ پاسپۆستێ تە / پێدڤیە ئێک شکل بیت', 'The passport/ID picture must be an image'),
(291, 'verif_request_sent', '', 'Your request was successfully sent and will be in the near future reviwed!', 'تم إرسال طلبك بنجاح وسوف تكون في المستقبل القريب ريفيويد!', 'Uw aanvraag is met succes verzonden en zal in de nabije toekomst worden herzien!', 'Votre demande a été envoyée avec succès et sera dans un futur proche reviwed!', 'Ihre Anfrage wurde erfolgreich versendet und wird in naher Zukunft reviwed sein!', 'Ваш запрос был успешно отправлен и будет в ближайшее время изменен!', 'Su solicitud fue enviada con éxito y será reviwed en el futuro cercano.', 'Talebiniz başarıyla gönderildi ve yakın gelecekte yeniden incelenecek!', 'Your request was successfully sent and will be in the near future reviwed!', 'داخازیا تە ب سەرکەفتی هاتە فڕێکرن ل دەمەکێ نزیک دێ لێکۆلینەوێ ژبۆ کەین', 'Your request was successfully sent and will be in the near future reviwed!'),
(292, 'unknown_error', '', 'Error: an unknown error occurred. Please try again later', 'خطأ: حدث خطأ غير معروف. الرجاء معاودة المحاولة في وقت لاحق', 'Fout: er is een onbekende fout opgetreden. Probeer het later opnieuw', 'Erreur: une erreur inconnue s\'est produite. Veuillez réessayer plus tard', 'Fehler: Ein unbekannter Fehler ist aufgetreten. Bitte versuche es später noch einmal', 'Ошибка: произошла неизвестная ошибка. Пожалуйста, повторите попытку позже', 'Error: se produjo un error desconocido. Por favor, inténtelo de nuevo más tarde', 'Hata: Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz', 'Error: an unknown error occurred. Please try again later', 'خەلەتییەکێ نە دیار ریدایە هیڤی دکەم پاشی دووبارە بزاڤێ بکە', 'Error: an unknown error occurred. Please try again later'),
(293, 'ivalid_thumb_file', '', 'Thumbnail image file is invalid. Please select a valid image', 'ملف الصورة المصغرة غير صالح. الرجاء تحديد صورة صالحة', 'Miniatuurafbeeldingsbestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier d\'image miniature est invalide. Veuillez sélectionner une image valide', 'Miniaturbilddatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл изображения миниатюр. Выберите действительное изображение', 'El archivo de imagen en miniatura no es válido. Seleccione una imagen válida', 'Küçük resim dosyası geçersiz. Lütfen geçerli bir resim seçin', 'Thumbnail image file is invalid. Please select a valid image', 'افیلا شکلێ بەرچاڤکری نەدرستە! هیڤی دکەم شکلەکێ درست دەست نیشان کە', 'Thumbnail image file is invalid. Please select a valid image'),
(294, 'hide', '', 'Hide', 'إخفاء', 'Verbergen', 'Cacher', 'Verbergen', 'Спрятать', 'Esconder', 'Saklamak', 'Hide', 'وەشارتن', 'پنهان کردن'),
(295, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj', 'په‌یام', 'پەیام', 'پیام'),
(296, 'notifications', '', 'Notifications', 'إخطارات', 'Varsler', 'Notifications', 'Benachrichtigungen', 'Уведомления', 'Notificaciones', 'Bildirimler', 'ئاگانامه‌كان', 'ئاگەهداری', 'اعلان ها'),
(297, 'subscribed_u', '', 'subscribed to your channel', 'مشترك في قناتك', 'abonnerer på kanalen din', 'abonné à votre chaîne', 'abonniert deinen Kanal', 'подписался на ваш канал', 'suscrito a tu canal', 'kanalınıza abone', 'به‌شداركرد له‌ كه‌ناڵه‌كه‌ت', 'د کەنالێ تەدا بەژداربوو', 'مشترک شد در کانال شما'),
(298, 'unsubscribed_u', '', 'unsubscribed from your channel', 'غير مشترك من قناتك', 'avmeldt fra kanalen din', 'désabonné de votre chaîne', 'von deinem Kanal abgemeldet', 'отписался с вашего канала', 'anulado de su canal', 'kanalınızdan aboneliğiniz iptal edildi', 'پاشگه‌ز بۆوه‌ له‌ به‌شداری كردن له‌ كه‌ناڵه‌كه‌ت', 'پەشیمان بوو ژ بەژداری کرن د کەنالێ تەدا', 'اشتراک را لغو کرد از کانال شما'),
(299, 'liked_ur_video', '', 'liked your video', 'أعجبك الفيديو', 'likte videoen din', 'aimé votre vidéo', 'mochte dein Video', 'понравилось ваше видео', 'me gustó tu video', 'videonuzu beğendim', 'ڤیدیۆکەتی بەدڵ بوو', 'ڤیدیۆیا تە یاب دلە', 'ویدیوی شما را دوست داشت'),
(300, 'disliked_ur_video', '', 'disliked your video', 'لم يعجبك الفيديو', 'Mislikte videoen din', 'n\'aimait pas votre vidéo', 'hat dein Video nicht gefallen', 'не понравилось ваше видео', 'disgustó tu video', 'videonun beğenilmediğini', 'ڤیدیۆكه‌تی به‌ دڵ نەبوو', 'ڤیدیۆیاتە نەب دلە', 'ویدیوتان را دوست نداشت'),
(301, 'commented_ur_video', '', 'commented on your video', 'علق على الفيديو التابع لك', 'kommenterte videoen din', 'a commenté votre vidéo', 'hat dein Video kommentiert', 'прокомментировал ваше видео', 'comentó tu video', 'videonuza yorum yaptı', 'سه‌رنجی دا له‌سه‌ر ڤیدیۆه‌كه‌ت', 'بۆچوون نڤیسی لسەر ڤیدیۆیێ تە', 'درباره ویدیوی شما نظر داد'),
(302, 'liked_ur_comment', '', 'liked your comment', 'أحب تعليقك', 'likte din kommentar', 'aimé ton commentaire', 'mochte deinen Kommentar', 'понравился ваш комментарий', 'le gustó su comentario', 'Yorumu beğeniyor', 'سه‌رنجه‌كه‌تی به‌ دڵه‌', 'بۆچوونا تە یا بدلە', 'نظر شما را دوست داشت'),
(303, 'disliked_ur_comment', '', 'disliked your comment', 'لم يعجبك تعليقك', 'Mislikte din kommentar', 'n\'aimait pas ton commentaire', 'hat deinen Kommentar nicht gefallen', 'не понравился ваш комментарий', 'disgustado su comentario', 'yorumunu beğenmedi', 'سه‌رنجه‌كه‌تی به‌ دڵ نیه‌', 'بۆچوونا تە نەب دلە', 'نظر شما را دوست نداشت'),
(304, 'replied_2ur_comment', '', 'replied to your comment', 'أجاب على تعليقك', 'svarte på din kommentar', 'a répondu à votre commentaire', 'antwortete auf deinen Kommentar', 'ответил на ваш комментарий', 'respondió a tu comentario', 'senin yorumuna cevap verdi', 'وه‌ڵامی سه‌رنجه‌كه‌تی داوه‌', 'بەرسڤا بۆچوونا تە دا', 'نظر شما را پاسخ داد'),
(305, 'cancel_report', '', 'Cancel Report', 'إلغاء التقرير', 'Avbryt rapport', 'Annuler le rapport', 'Bericht abbrechen', 'Отменить отчет', 'Cancelar informe', 'Raporu İptal Et', 'كێشانه‌وه‌ی سكاڵا', 'پەشیمان بوون ل سەر تۆمارکرنا کەیسێ', 'لغو گزارش'),
(306, 'no_more_videos', '', 'No more videos found', 'لم يتم العثور على مزيد من مقاطع الفيديو', 'Ingen flere videoer funnet', 'Plus de vidéos trouvées', 'Keine weiteren Videos gefunden', 'Больше видео не найдено', 'No se encontraron más videos', 'Başka video bulunamadı', 'ڤیدیۆی زیاتر بوونی نیه‌', 'ڤیدیۆیێن زێدەتر نینە!', 'ویدیوی بیشتری یافت نشد'),
(307, 'load_more', '', 'Load more', 'تحميل المزيد', 'Last mer', 'Charger plus', 'Mehr laden', 'Показать больше', 'Carga más', 'Daha fazla yükle', 'بینینی زیاتر', 'دیتنا زێدەتر...', 'دیدن بیشتر...'),
(308, 'report_zs_video', '', 'Report this video', 'ابلغ عن هذا الفيديو', 'Rapporter denne videoen', 'Signaler cette vidéo', 'Melde dieses Video', 'Сообщить об этом видео', 'Reporta este video', 'Bu videoyu rapor et', 'سكاڵا له‌م ڤیدیۆیه‌ بكه‌', 'سکالایەکێ ل سەر وێ ڤیدییۆیێ تۆمارکە', 'گزارش این ویدیو'),
(309, 'write_vr_summary', '', 'Please write a summary of what this video was about', 'يرجى كتابة ملخص عن هذا الفيديو', 'Vennligst skriv et sammendrag av hva denne videoen handlet om', 'S\'il vous plaît écrire un résumé de ce que cette vidéo était sur', 'Bitte schreibe eine Zusammenfassung darüber, worum es in diesem Video ging', 'Пожалуйста, напишите резюме того, о чем это видео было', 'Por favor, escribe un resumen de lo que este video fue sobre', 'Lütfen bu videonun neye ait olduğunu özetleyin', 'تكایه‌ شتێك بنووسه‌ ئه‌مه‌ سه‌باره‌ت به‌ چیه‌ ؟', 'هیڤی دکەم تشتەکێ بنڤیسە ئەڤە سەبارەت ب چ تشتەکێیە؟', 'لطفا یە چیزی در بارە این ویدیو بنویسید، این ویدیو در مورد چیست؟'),
(310, 'submit', '', 'Submit', 'خضع', 'Sende inn', 'Soumettre', 'einreichen', 'Отправить', 'Enviar', 'Gönder', 'ناردن', 'فڕێکرن', 'ارسال'),
(311, 'thank_u', '', 'Thank you', 'شكرا لكم', 'Takk skal du ha', 'Je vous remercie', 'Vielen Dank', 'Спасибо', 'Gracias', 'teşekkür ederim', 'سوپاس بۆتۆ', 'سپاس ژبۆ تە', 'متشکرم'),
(312, 'we_received_ur_rep', '', 'We have received your report!', 'لقد تلقينا تقريرك!', 'Vi har mottatt din rapport!', 'Nous avons reçu votre rapport!', 'Wir haben Ihren Bericht erhalten!', 'Мы получили ваш отчет!', '¡Hemos recibido su informe!', 'Raporunuzu aldık!', 'We have received your report!', 'We have received your report!', 'We have received your report!'),
(313, 'report_canceled', '', 'Your report has been canceled!', 'تم إلغاء تقريرك!', 'Rapporten din er kansellert!', 'Votre rapport a été annulé!', 'Ihr Bericht wurde storniert!', 'Ваш отчет отменен!', '¡Su informe ha sido cancelado!', 'Raporunuz iptal edildi!', 'Your report has been canceled!', 'سکالایا تە نەهاتە قەبیل کرن', 'Your report has been canceled!'),
(314, 'comment_pinned', '', 'Comment pinned to top', 'تم تعليق التعليق إلى الأعلى', 'Kommentar festet til toppen', 'Commentaire épinglé en haut', 'Kommentar nach oben gepinnt', 'Комментарий прикреплен к верхней части', 'Comentario anclado al principio', 'Yorum en üste sabitlendi', 'Comment pinned to top', 'Comment pinned to top', 'Comment pinned to top'),
(315, 'comment_unpinned', '', 'Comment unpinned', 'تم إلغاء تثبيت التعليق', 'Kommentar unpinned', 'Commentaire détaché', 'Kommentar nicht gepinnt', 'Комментарий откреплен', 'Comentario sin fijar', 'Sabitsiz yorum', 'Comment unpinned', 'Comment unpinned', 'Comment unpinned'),
(316, 'porcessing_video', '', 'Processing your video - this may take a few minutes', 'معالجة الفيديو - قد يستغرق ذلك بضع دقائق', 'Je video verwerken - dit kan een paar minuten duren', 'Traitement de votre vidéo - cela peut prendre quelques minutes', 'Verarbeitung deines Videos - dies kann einige Minuten dauern', 'Обработка вашего видео - это может занять несколько минут', 'Procesando su video: esto puede demorar unos minutos', 'Videonuzu işlemek - bu birkaç dakika alabilir', 'جێبه‌جێ ئه‌كرێت تكایه‌ چاوه‌رێكه‌ چه‌ند خوله‌كێكی تر به‌رده‌ست ئه‌بێت', 'دهێتە جێبەجێ کرن هیڤی دکەم ل هیڤییێ بە چەند دەقێن دن دێ بەردەست بیت', 'ویدیوی شما در حال انجام است - لطفا منتظر باشید... ممکن است چند دقیقه طول بکشد'),
(317, 'video_thumbs', '', 'Video thumbnails', 'الصور المصغرة الفيديو', 'Videominiaturen', 'vignettes vidéo', 'Video-Miniaturansichten', 'Видео эскизы', 'Miniaturas de vídeo', 'Video küçük resimleri', 'وێنه‌ی سه‌رڤیدیۆ', 'شکلێ سەر ڤیدیۆی', 'عکس ویدیو'),
(318, 'ur_video_porcessing', '', 'This video is being converted to few resolutions, it may take a few minutes.', 'يتم تحويل الفيديو، قد يستغرق بضع دقائق', 'Video wordt geconverteerd, dit kan enkele minuten duren', 'La vidéo est convertie, cela peut prendre quelques minutes', 'Video wird konvertiert, es kann einige Minuten dauern', 'Видео конвертируется, это может занять несколько минут', 'El video se convierte, puede tomar unos minutos', 'Video dönüştürülür, birkaç dakika sürebilir.', 'ئه‌م ڤیدیۆیه‌ كوالێتی ئه‌گۆڕیت بۆ چه‌ند جۆرێكی جیاواز تكایه‌ چاوه‌ڕێكه‌', 'ئەڤ ڤیدیۆیە کوالیتیا خۆ دێ گوهەڕیت ژبۆ چەند جۆرۆکێ جداتر هیڤی دکەم ل هیڤییێ بە ...', 'این ویدیو بە چند کوالیتی دیگری عوض میشود لطفا منتظر باش'),
(319, 'this_video_porcessing', '', 'This video is being processed, please come back in few minutes', 'تتم معالجة هذا الفيديو، يرجى العودة في غضون بضع دقائق', 'Deze video wordt verwerkt. Kom over een paar minuten terug', 'Cette vidéo est en cours de traitement, revenez dans quelques minutes', 'Dieses Video wird gerade bearbeitet. Bitte kommen Sie in ein paar Minuten zurück', 'Это видео обрабатывается, пожалуйста, вернитесь через несколько минут', 'Este video está siendo procesado, vuelve en unos minutos', 'Bu video işleniyor, lütfen birkaç dakika içinde geri dönün', 'This video is being processed, please come back in few minutes', 'ئەڤ ڤیدیۆیە د ڕەوشا ئەپلۆدکرنێدایە هیڤی دکەم چەند دەقان ل هیڤییێ بە...', 'This video is being processed, please come back in few minutes'),
(320, 'mode', '', 'Mode', 'الوضع', 'mode', 'Mode', 'Modus', 'Режим', 'Modo', 'kip', 'دۆخ', 'ڕەوش', 'حالت'),
(321, 'day_mode', '', 'Day mode', 'وضع اليوم', 'Dagmodus', 'Mode jour', 'Tagesmodus', 'Дневной режим', 'Modo día', 'Gün modu', 'دۆخی ڕۆژ', 'ڕەوشا ڕووناهی', 'حالت روز'),
(322, 'night_mode', '', 'Night mode', 'الوضع الليلي', 'Nachtstand', 'Mode nuit', 'Nacht-Modus', 'Ночной режим', 'Modo nocturno', 'Gece modu', 'دۆخی شەو', 'ڕەوشا تاریکینیێ', 'حالت شب'),
(323, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Сортировать по', 'Ordenar por', 'Göre sırala', 'Sort By', 'ڕێزکرن ب ڕەنگێ', 'مرتب سازی بر اساس'),
(324, 'top_commnets', '', 'Top Comments', 'أعلى تعليقات', 'Top Reacties', 'Meilleures Commentaires', 'Beste Kommentare', 'Лучшие комментарии', 'Top Comentarios', 'En Çok Yorumlananlar', 'Top Comments', 'ئێکەمین بۆچوون', 'آولین نظرها'),
(325, 'last_commnets', '', 'Latest comments', 'أحدث تعليقات', 'Laatste Reacties', 'Derniers Commentaires', 'Neueste Kommentare', 'Последние комментарии', 'Últimos comentarios', 'Son Yorumlar', 'Latest comments', 'دووماهیک بۆچوون', 'آخرین نظرات'),
(326, 'darg_drop_video', '', 'Drag & Drop video', 'سحب وإسقاط الفيديو', 'Video slepen en neerzetten', 'Drag & Drop vidéo', 'Video per Drag & Drop', 'Перетащите сюда видео', 'Arrastrar y soltar video', 'Sürükle ve Bırak video', 'Drag & Drop video', 'کێشان و دەست نیشان کرنا ڤیدیۆیان', 'کشیدن و رها کردن ویدیو'),
(327, 'click_2choose_file', '', 'click to select a file', 'انقر لتحديد ملف', 'klik om een bestand te selecteren', 'cliquez pour sélectionner un fichier', 'Klicken Sie, um eine Datei auszuwählen', 'нажмите, чтобы выбрать файл', 'haga clic para seleccionar un archivo', 'bir dosya seçmek için tıklayın', 'click to select a file', 'ژبۆ دەست نیشان کرنا ڤیدیۆیەکێ کلیک کە', 'برای انتخاب یک فایل کلیک کنید'),
(328, 'or', '', 'or', 'أو', 'of', 'ou', 'oder', 'или', 'o', 'veya', 'or', '', ''),
(329, 'contact_us', '', 'Contact us', 'اتصل بنا', 'Neem contact met ons op', 'Contactez nous', 'Kontaktiere uns', 'Свяжитесь с нами', 'Contáctenos', 'Bizimle iletişime geçin', 'په‌یوه‌ندی كردن پێمانه‌وه‌', 'پەیڤەندییێ بمەڤە بکە', 'با ما تماس بگیرید'),
(330, 'email', '', 'E-mail', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'پۆستی ئه‌لیكترۆنی', 'پۆستێ ئەلیکترۆنی', 'پست الیکترونی (E-mail)'),
(331, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', 'Ajout d&#039;une nouvelle vidéo', 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi', 'added a new video', 'ڤیدیۆیەکا نووی زێدەکر', 'یک ویدیو جدیدی اضافه کرد'),
(332, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', NULL, 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi', 'added a new video', 'ڤیدیۆیەکا نووی زێدەکر', 'یک ویدیو جدیدی اضافه کرد'),
(333, 'messages', '', 'Messages', 'رسائل', 'berichten', 'messages', 'Mitteilungen', 'Сообщения', 'Mensajes', 'Mesajlar', 'په‌یامه‌كان', 'پەیام', 'پیام ها'),
(334, 'are_you_sure_you_want_delete_chat', '', 'Are you sure that you want to delete the conversation?', 'هل تريد بالتأكيد حذف المحادثة؟', 'Weet je zeker dat je het gesprek wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer la conversation?', 'Möchten Sie die Unterhaltung wirklich löschen?', 'Вы уверены, что хотите удалить разговор?', '¿Estás seguro de que quieres eliminar la conversación?', 'Sohbeti silmek istediğinizden emin misiniz?', 'Are you sure that you want to delete the conversation?', 'تو پشت ڕاستی کو تە دڤێت وان ئاخافتنان ڕەشوەکەی؟', 'آیا مطمئن هستید که میخواهید این مکالمه را حذف کنید؟');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`, `kurdish`, `kurdish_badini`, `persian`) VALUES
(335, 'no_messages_found_hi', '', 'No messages were found, say Hi!', 'لم يتم العثور على رسائل، ويقول مرحبا!', 'Er zijn geen berichten gevonden, bijvoorbeeld Hallo!', NULL, 'Keine Nachrichten gefunden, sagen Hallo!', 'Сообщения не найдены, скажите Привет!', 'No se encontraron mensajes, decir Hola!', 'Mesaj bulunamadı, merhaba deyin!', 'هیچ په‌یامێك بوونی نیه‌', 'چ پەیام نینە', 'هیچ پیغامی وجود ندارد'),
(336, 'no_messages_found_channel', '', 'No messages were found, please choose a channel to chat.', 'لم يتم العثور على أية رسائل، يرجى اختيار قناة للدردشة.', 'Er zijn geen berichten gevonden. Kies een kanaal om te chatten.', NULL, 'Es wurden keine Nachrichten gefunden. Wähle einen Chat-Kanal aus.', 'Сообщения не найдены, выберите канал для чата.', 'No se encontraron mensajes, elija un canal para chatear.', 'Hiçbir mesaj bulunamadı, lütfen sohbet etmek için bir kanal seçin.', 'هیچ په‌یامێك نیه‌ تكایه‌ كه‌ناڵێك دیاری بكه‌ بۆ ئه‌وه‌ی گفتوگۆی له‌گه‌ڵ بكه‌یت', 'چ پەیام نینە هیڤی دکەم کەناڵەکێ دەست نیشان کە داکو دگەل بپەیڤی', 'هیچ پیامی یافت نشد، لطفا یک کانال را برای چت کردن انتخاب کنید.'),
(337, 'no_match_found', '', 'No match found', 'لا يوجد تطابق', 'Geen overeenkomst gevonden', 'Pas de résultat trouvé', 'Keine Übereinstimmung gefunden', 'Не найдено совпадений', 'No se encontraron coincidencias', 'Eşleşme bulunamadı', 'No match found', 'No match found', 'No match found'),
(338, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj', 'په‌یام', 'پەیام', 'پیام'),
(339, 'write_message', '', 'Write your message and hit enter..', 'اكتب رسالتك واضغط على إنتر ..', 'Schrijf je bericht en druk op enter ..', 'Rédigez votre message et appuyez sur Entrée.', 'Schreibe deine Nachricht und drücke Enter.', 'Напишите свое сообщение и нажмите enter.', 'Escriba su mensaje y presione enter ...', 'Mesajınızı yazın ve enter tuşuna basın ..', 'په‌یامه‌كه‌ت بنووسه‌ و بینێره‌', 'پەیاما خۆ بنڤیسە و فڕێکە ...', 'پیام خود را بنویسید و  بفرستید...'),
(346, 'channels', '', 'Channels', 'قنوات', 'kanalen', 'Chaînes', 'Kanäle', 'каналы', 'Canales', 'Kanallar', 'Channels', 'کەناڵ', 'کانال ها'),
(347, 'recent_articles', '', 'Most recent articles', 'أحدث المقالات', 'Meest recente artikelen', 'Articles les plus récents', 'Neueste Artikel', 'Последние статьи', 'Artículos más recientes', 'En yeni makaleler', 'نوێترین بابه‌ته‌كان', 'نوویترین بابەت', 'جدیدترین مقالات'),
(348, 'read_more', '', 'Read more', 'اقرأ أكثر', 'Lees verder', 'Lire la suite', 'Weiterlesen', 'Прочитайте больше', 'Lee mas', 'Daha fazla oku', 'زیاتر بخوێنه‌وه‌', 'زێدەتر بخوینە...', 'بیشتر بخوانید...'),
(349, 'removed_history', '', 'Removed from History', 'تمت إزالته من السجل', 'Verwijderd uit de geschiedenis', NULL, 'Aus dem Verlauf entfernt', 'Удалено из истории', 'Eliminado de la historia', 'Geçmişten kaldırıldı', 'Removed from History', 'د تەئریخێدا هاتییە ڕەشوەکرن', 'از تاریخ حذف شده است'),
(350, 'show_less', '', 'Show less', 'عرض أقل', 'Vis mindre', 'Montre moins', 'Zeige weniger', 'Показывай меньше', 'Muestra menos', 'Daha az göster', 'كه‌متر نیشان بده‌', 'کێمتر بەرچاڤ کە', 'مشاهد کمتر'),
(351, 'no_users_found', '', 'No users found', 'لم يتم العثور على أي مستخدم', 'Geen gebruikers gevonden', 'Aucun utilisateur trouvé', 'Keine Benutzer gefunden', 'Пользователи не найдены', 'No se encontraron usuarios', 'Kullanıcı bulunamadı', 'هیچ به‌كارهێنه‌رێك نیه‌', 'چ بکارهینەر نینە!', 'هیچ کاربری پیدا نشد!'),
(352, 'social_links', '', 'Social links', 'روابط اجتماعية', 'Sociale links', 'Liens sociaux', 'Soziale Verbindungen', 'Социальные ссылки', 'Vínculos sociales', 'Sosyal bağlantılar', 'به‌سته‌ره‌ كۆمه‌ڵایه‌تیه‌كان', 'لینکێن تۆڕێن جڤاکی', 'لینک شبکە های اجتماعی'),
(353, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'На этом веб-сайте используются файлы cookie, чтобы вы могли получить лучший опыт на нашем веб-сайте.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.', 'Bu web sitesi, web sitemizde en iyi deneyimi yaşamanızı sağlamak için çerezleri kullanır.', 'This website uses cookies to ensure you get the best experience on our website.', 'میکس پلەی شەکرۆکەی بکارتینیت ژبۆ خروەکرنا پێزانینێن پێدڤی ب مەرەما باشترکرنا تۆرێ', 'This website uses cookies to ensure you get the best experience on our website.'),
(354, 'cookie_dismiss', '', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', 'Понял!', '¡Lo tengo!', 'Anladım!', 'تێگه‌شتم', 'من فەهم کر', 'فهمیدم!'),
(355, 'cookie_link', '', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Выучить больше', 'Aprende más', 'Daha fazla bilgi edin', 'Learn More', 'زۆرتر بزانە...', 'بیشتر بدانید...'),
(356, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Пожалуйста, соглашайтесь с Условиями использования и Политикой конфиденциальности', 'Acepta los Términos de uso y la Política de privacidad', 'Lütfen Kullanım Koşulları ve Gizlilik Politikasını kabul edin', 'Please agree to the Terms of use & Privacy Policy', 'هیڤی دکەم ب مەرجێن و یاساییێن بکارهینانێ ڕازی بە', 'لطفا با شرایط استفاده و سیاست حفظ حریم خصوصی موافقت کنید'),
(357, 'terms_agreement', '', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Создав свою учетную запись, вы соглашаетесь с нашими', 'Al crear su cuenta, usted acepta nuestra', 'Hesabınızı oluşturarak,', 'به‌ تۆماربوونت ڕه‌زامه‌ندی خۆتت ده‌ربڕیووه‌ به‌ ڕازیبوون له‌سه‌ر', 'ب خۆتۆمارکرنێ تە ڕازامەندی دەربڕییە ب ڕازیبوون لسەر', 'با ثبت نام کردن خود از شرایط استفادە کردنمون ڕازی شدە اید بە'),
(358, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'У вас нет уведомлений', 'No tienes ninguna notificación', 'Bildiriminiz yok', 'هیچ ئاگانامه‌یه‌كت نیه‌', 'تە چ ئاگەهداری نینە', 'شما هیچ اعلانی ندارە اید'),
(359, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'Unlisted', 'No estante en la lista', 'Liste dışı', 'Unlisted', 'Unlisted', 'Unlisted'),
(360, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Это видео конфиденциально, только издатель может его просмотреть.', 'Este es un video privado, solo el editor puede verlo.', 'Bu video özel, sadece yayıncı bunu görüntüleyebilir.', 'This is video private, just the publisher can view it.', 'ئەڤ ڤیدیۆیە تایبەت کرییە بتنێ کەسێ بەلاڤکەر دکاریت وێ بەلاڤکەت', 'This is video private, just the publisher can view it.'),
(361, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'ئینستاگرام', 'انستاگرام'),
(362, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'оригинал', 'Original', 'orijinal', 'Original', 'عەسلی', 'اصلی'),
(363, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Ограничение возраста', 'Restricción de edad', 'Yaş kısıtlaması', 'كۆنتڕۆڵی ته‌مه‌ن', 'کۆنتڕۆلا ژیێ بکارهینەری', 'کنترل سن'),
(364, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Все возрасты могут просматривать это видео', 'Todas las edades pueden ver este video', 'Her yaştan bu videoyu görüntüleyebilir', 'بۆ هه‌موو ته‌مه‌نێك', 'ژبۆ هەمی تەمەنەکێ', 'همه سن ها می توانند این ویدیو را بازدید کنند'),
(365, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Только +18', 'Solo +18', 'Sadece +18', 'سه‌رووی 18 ساڵ', 'سەرڤەی 18 سالیێ', 'بالا +18 سالی'),
(366, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'Вам не разрешается менять свой возраст более одного раза', 'No puedes cambiar tu edad más de una vez', 'Yaşınızı bir kereden fazla değiştiremezsiniz', 'ڕێگه‌پێنه‌دراوه‌ ته‌مه‌ن زیاتر له‌ جارێك بگۆڕدرێت', 'ڕێ پێ ناهێتە دان ژییێ بکارهینەری زێدەتر ژ ئێک جار بهێتە گوهەرتن', 'شما نمیتوانید بیش از یک بار سن خود را عوض کنید'),
(367, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Это видео ограничено для зрителей под +18', 'Este video está restringido para menores de 18 años.', 'Bu video, +18 yaşın altındaki görüntüleyenler için kısıtlanmış', 'This video is age restricted for viewers under +18', 'ئەڤ ڤیدیۆیە ژبۆ بکارهینەرێن خار 18 سالییێ نەدرستە!', 'این ویدیو برای مخاطبان زیر 18 سال محدود است'),
(368, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Создайте учетную запись или авторизуйтесь, чтобы подтвердить свой возраст.', 'Crea una cuenta o inicia sesión para confirmar tu edad.', 'Yaşınızı onaylamak için bir hesap oluşturun veya giriş yapın.', 'Create an account or login to confirm your age.', 'ژبۆ سەلماندنا ژییێ خۆ ، خۆتۆمارکە ئانکو داخل بە', 'برای تأیید سن خود، یک حساب کاربری ایجاد کنید یا وارد شوید.'),
(369, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Пожертвование PayPal Email', 'Donación Correo electrónico de PayPal', 'Bağış PayPal Email', 'پۆستی ئه‌لیكترۆنی په‌یپاڵ بنووسه‌ بۆ به‌خشین', 'پۆستێ ئەلیکترۆنییێ پەیپاڵی بنڤیسە ژبۆ کارێن خۆبەخشییێ', 'پشت الیکترونی پی پالت را بنویس واسە بخشش'),
(370, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Скачать', 'Descargar', 'İndir', 'دابه‌زاندن', 'داونڵۆدکرن', 'بارگیری (Download)'),
(371, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'жертвовать', 'Donar', 'bağışlamak', 'به‌خشین', 'بەخشین', 'اهدا کنید'),
(372, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Это видео просматривается, пожалуйста, зайдите позже.', 'Este video está siendo revisado, por favor revise más tarde.', 'Bu video inceleniyor, lütfen daha sonra tekrar kontrol edin.', 'ئه‌م ڤیدیۆیه‌ نێردراوه‌ بۆ پێداچوونه‌وه‌ تكایه‌ دوواتر سه‌یری بكه‌ره‌وه‌', 'ئەڤ ڤیدیۆیە هاتییە فرێکرن ژبۆ کو لێکۆلین لسەر بهێتە کرن هیڤی دکەم پاشی سحکێ', 'این ویدیو در حال بررسی است، لطفا بعدا تماشاه کنید.'),
(373, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Вы достигли предела загрузки.', 'Has alcanzado tu límite de carga.', 'Yükleme sınırınıza ulaştınız.', 'گه‌یشتیت به‌و په‌ڕی سنوری قه‌باره‌ی ڕێگه‌ پێدراو', 'تو گهیشتییە قەبارێ دەست نیشان کری ژبۆ ئەپلۆدکرنا ڤیدیۆیان چیدی تو نەشێی ڤیدیۆیان ئەپلۆد کەی ! هیڤی دکەم هندیک ڤیدیۆیان ڕەشوەکە داکو بشێی ڤیدیۆییێن نووی بەلاڤکەی', 'شما بە حد مجاز بارگذاری خود رسیدە اید'),
(374, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Пожалуйста, удалите некоторые из ваших видеороликов, которые могут загрузить больше.', 'Elimina algunos de tus videos para poder subir más.', 'Lütfen daha fazla yükleme yapabileceğiniz videolarınızın bir kısmını silin.', 'تكایه‌ هه‌ندێك له‌ ڤیدیۆكانت بسڕه‌وه‌ تاكو بتوانیت ڤیدیۆی زیاتر بڵاوبكه‌یته‌وه‌', 'هیڤی دکەم هندەک ژ ڤیدیۆیێن خۆ ڕەشوەکە داکو بشێی ڤیدیۆیێن زێدەتر بەلاڤکەی', 'لطفا بعضی از ویدیوهای خود را حذف کنید برای اینکە بتوانید ویدیوهای جدیدی را آپلود کنید'),
(375, 'other', 'Other', 'Other', 'آخر', 'anders', 'Autre', 'Andere', 'Другой', 'Otro', 'Diğer', 'Other', 'ییێن دن', 'دیگر'),
(376, 'no_more_s_to_show', 'No more subscriptions', 'No more subscriptions', 'لا مزيد من الاشتراكات', 'Geen abonnementen meer', 'Pas plus d\'abonnements', 'Keine weiteren Abonnements', 'Нет больше подписок', 'No mas suscripciones', 'Başka abonelik yok', 'No more subscriptions', 'بەژداریکەرێن زێدەتر نینە', 'اشتراک بیشتری نیست'),
(377, 'sell_videos', 'Sell videos at any price', 'Sell videos at any price', 'بيع أشرطة الفيديو بأي ثمن', 'Verkoop video\'s voor elke prijs', 'Vendre des vidéos à tout prix', 'Verkaufen Sie Videos um jeden Preis', 'Продавать видео по любой цене', 'Vende videos a cualquier precio', 'Videoları herhangi bir fiyattan satmak', 'Sell videos at any price', 'فرۆشتنا فلمان ب هەر بهایەکێ', 'Sell videos at any price'),
(378, 'set_p_v', 'Price (Leave empty for free videos)', 'Price (Leave empty for free videos)', 'حدد سعرًا للمشاهد', 'Stel een prijs in voor de kijker', 'Fixer un prix pour le spectateur', 'Legen Sie einen Preis für den Viewer fest', 'Установить цену для зрителя', 'Establecer un precio para el espectador', 'Görüntüleyici için bir fiyat belirleme', 'Price (Leave empty for free videos)', 'Price (Leave empty for free videos)', 'Price (Leave empty for free videos)'),
(379, 'p_m_than_', 'Minimum price you can set is', 'Minimum price you can set is', 'أقل سعر يمكنك تعيينه هو', 'Minimumprijs die u kunt instellen is', 'Le prix minimum que vous pouvez définir est', 'Mindestpreis, den Sie einstellen können, ist', 'Минимальная цена, которую вы можете установить,', 'El precio mínimo que puede establecer es', 'Ayarlayabileceğiniz minimum fiyat:', 'Minimum price you can set is', 'ئەو بهاییێ کو تو دشیی دەست نیشان کە بریتتییە ل', 'Minimum price you can set is'),
(380, 'pay_to_see', 'This video is being sold, you have to purchase the video to watch it.', 'This video is being sold, you have to purchase the video to watch it.', 'يتم بيع هذا الفيديو ، يجب عليك شراء الفيديو لمشاهدته.', 'Deze video wordt verkocht, je moet de video kopen om deze te bekijken.', 'Cette vidéo est en vente, vous devez acheter la vidéo pour la regarder.', 'Dieses Video wird verkauft, Sie müssen es kaufen, um es anzusehen.', 'Это видео продается, вы должны купить видео, чтобы посмотреть его.', 'Este video se está vendiendo, tienes que comprar el video para verlo.', 'Bu video satılıyor, izlemek için videoyu satın almanız gerekiyor.', 'ئه‌م ڤیدیۆیه‌ بۆ فرۆشتنه‌،پێویسته‌ بیكڕێت بۆ ئه‌وه‌ی سه‌یری بكه‌یت', 'ئەڤ ڤیدیۆیە ژبۆ فرۆشتنێیە پێتڤیە تو بکڕی ژبۆ کو بشێی سەحکەیێ', 'این ویدیو برای فروش گذاشتە شدە است ، شما باید این ویدیو را بخرید تا بتوانید تماشا کنید.'),
(381, 'pay', 'Purchase', 'Purchase', 'دفع', 'Betalen', 'Payer', 'Zahlen', 'платить', 'Paga', 'ödeme', 'كڕین', 'کڕین', 'خریدن'),
(382, 'paid_videos', 'Paid Videos', 'Paid Videos', 'مقاطع الفيديو المدفوعة', 'Betaalde video\'s', 'Vidéos payées', 'Bezahlte Videos', 'Платные видео', 'Videos de pago', 'Ücretli Videolar', 'Paid Videos', 'Paid Videos', 'فیلم های پرداخت شده'),
(383, 'no_videos_found_paid', 'No paid videos found', 'No paid videos found', 'لم يتم العثور على مقاطع فيديو مدفوعة', 'Geen betaalde video\'s gevonden', 'Aucune vidéo payée trouvée', 'Keine bezahlten Videos gefunden', 'Платные видео не найдены', 'No se encontraron videos pagados', 'Ücretli video bulunamadı', 'هیچ ڤیدیۆیه‌كی به‌ پاره‌ نیه‌', 'چ ڤیدیۆیێن ب پارە نینە', 'هیچ فیلم پرداختی یافت نشد'),
(384, 'transactions', 'Transactions', 'Transactions', 'المعاملات', 'transacties', 'Transactions', 'Transaktionen', 'операции', 'Actas', 'işlemler', 'Transactions', 'معاملە', 'معاملات'),
(385, 'id', 'ID', 'ID', 'هوية شخصية', 'ID kaart', 'ID', 'ICH WÜRDE', 'Я БЫ', 'CARNÉ DE IDENTIDAD', 'İD', 'ID', 'ئای دی (ID)', 'شناسە'),
(386, 'payer_name', 'Payer Name', 'Payer Name', 'اسم المدفوع', 'Naam betaler', 'Nom du payeur', 'Name des Zahlers', 'Имя плательщика', 'Nombre del pagador', 'Ödeme adı', 'Payer Name', 'ناڤێ کڕیاری', 'نام پرداخت کننده'),
(387, 'video', 'Video', 'Video', 'فيديو', 'Video', 'Vidéo', 'Video', 'видео', 'Vídeo', 'Video', 'Video', 'ڤیدیۆ', 'ویدیو'),
(388, 'site_com', 'Site Commission', 'Site Commission', 'لجنة الموقع', 'Site Commissie', 'Commission de chantier', 'Standortkommission', 'Комиссия сайта', 'Comisión del sitio', 'Site Komisyonu', 'Site Commission', 'کۆمسیۆنا وێب سایتی', 'کمیسیون سایت'),
(389, 'time', 'Time', 'Time', 'زمن', 'Tijd', 'Temps', 'Zeit', 'Время', 'Hora', 'zaman', 'كات', 'دەم', 'زمان'),
(390, 'paid_to_see', 'purchased your video', 'purchased your video', 'اشتريت الفيديو الخاص بك', 'heb je video gekocht', 'acheté votre vidéo', 'kaufte dein video', 'купил ваше видео', 'compré tu video', 'videonuzu satın aldı', 'ڤیدیۆكه‌ی تۆی كڕی', 'ڤیدیۆیا تە کڕی', 'ویدیوی شما را خرید'),
(391, 'video_price', 'This video price is:', 'This video price is:', 'سعر الفيديو هذا هو:', 'Deze videoprijs is:', 'Le prix de cette vidéo est:', 'Dieser Videopreis beträgt:', 'Цена этого видео:', 'El precio de este video es:', 'Bu video fiyatı:', 'This video price is:', 'ئەڤە بهاییێ ڤیدیۆییێ یە:', 'این قیمت ویدیو است:'),
(392, 'purchased', 'Purchases', 'Purchases', 'اشترى', 'Gekocht', 'Acheté', 'Gekauft', 'купленный', 'Comprado', 'satın alındı', 'كڕینه‌كان', 'کڕین', 'خرید ها'),
(393, 'balance_', 'Balance', 'Balance', 'توازن', 'Balans', 'Équilibre', 'Balance', 'Остаток средств', 'Equilibrar', 'Denge', 'به‌ڵانس', 'باڵانس', 'شارژ'),
(394, 'video_price_error', 'The video price should be numeric and greater than', 'The video price should be numeric and greater than', 'يجب أن يكون سعر الفيديو رقميًا وأكبر من', 'De videoprijs moet numeriek en groter zijn dan', 'Le prix de la vidéo doit être numérique et supérieur à', 'Der Videopreis sollte numerisch und größer als sein', 'Цена видео должна быть числовой и превышать', 'El precio del video debe ser numérico y mayor que', 'Video fiyatı sayısal ve daha büyük olmalıdır', 'The video price should be numeric and greater than', 'بهاییێ ڤیدیۆییێ پێدڤیە ژمارە بیت و زۆرتر بیت ل', 'The video price should be numeric and greater than'),
(395, 'video_verified', 'This video is verified by our team', 'This video is verified by our team', 'تم التحقق من هذا الفيديو بواسطة فريقنا', 'Deze video wordt geverifieerd door ons team', 'Cette vidéo est vérifiée par notre équipe', 'Dieses Video wird von unserem Team überprüft', 'Это видео проверено нашей командой', 'Este video es verificado por nuestro equipo.', 'Bu video ekibimiz tarafından doğrulandı', 'This video is verified by our team', 'ئەڤ ڤیدیۆییە ژ لاییێ گرووپا مە هاتییە سەلماندن', 'This video is verified by our team'),
(396, 'video_not_available', 'This video is no longer available', 'This video is no longer available', 'هذا المقطع لم يعد متوفرا', 'Deze video is niet langer beschikbaar', 'Cette vidéo n\'est plus disponible', 'Dieses Video ist nicht mehr verfügbar', 'Это видео больше не доступно', 'Este video ya no está disponible', 'Bu video artık mevcut değil', 'This video is no longer available', 'ئەڤ ڤیدیۆیە ئیدی بەردەست نییە!', 'This video is no longer available'),
(397, 'admin_can_see', 'You have access to all videos, paid and free as you are an admin.', 'You have access to all videos, paid and free as you are an admin.', 'لديك حق الوصول إلى جميع مقاطع الفيديو ، مدفوعة ومجانية كما كنت مسؤولا.', 'Je hebt toegang tot alle video\'s, betaald en gratis als je een beheerder bent.', 'Vous avez accès à toutes les vidéos, payantes et gratuites, car vous êtes un administrateur.', 'Sie haben Zugriff auf alle Videos, bezahlt und kostenlos, da Sie ein Administrator sind.', 'У вас есть доступ ко всем видео, платным и бесплатным, поскольку вы являетесь администратором.', 'Tienes acceso a todos los videos, de pago y gratis como eres administrador.', 'Tüm videolara, yönetici olduğunuzdan ücretli ve ücretsiz erişebilirsiniz.', 'You have access to all videos, paid and free as you are an admin.', 'تو ب شکلێ ڕێڤەبەرەکێ ژبۆ هەمی ڤیدیۆیان هاتییە دەست نیشان کرن ، تو دشێی پارەی بدەی و بێ بەرامبەرژی سەح کەیە هەمی ڤیدیۆیان', 'You have access to all videos, paid and free as you are an admin.'),
(398, 'net_earn', 'Net earnings', 'Net earnings', 'صافي الأرباح', 'Netto inkomen', 'Bénéfice net', 'Nettoverdienst', 'Чистая выручка', 'Ganancias netas', 'Net kazançlar', 'Net earnings', 'هەمی قازانج', 'Net earnings'),
(399, 'user_upload_limit', 'User Upload Limit', 'User Upload Limit', 'حد تحميل المستخدم', 'Gebruikers upload limiet', 'Limite de téléchargement utilisateur', 'Benutzer-Upload-Limit', 'Предел загрузки пользователя', 'Límite de carga del usuario', 'Kullanıcı Yükleme Sınırı', 'User Upload Limit', 'User Upload Limit', 'User Upload Limit'),
(400, 'user_reached_upload_limit', 'You have reached your maximum upload limit, if you wish to increase it', 'You have reached your maximum upload limit, if you wish to increase it', 'لقد وصلت إلى الحد الأقصى للتحميل ، إذا كنت ترغب في زيادته', 'U heeft uw maximale uploadlimiet bereikt, als u deze wilt verhogen', 'Vous avez atteint votre limite maximale de téléchargement, si vous souhaitez l\'augmenter', 'Sie haben Ihr maximales Upload-Limit erreicht, wenn Sie es erhöhen möchten', 'Вы достигли максимального лимита загрузки, если хотите увеличить его', 'Has alcanzado tu límite máximo de carga, si deseas aumentarlo', 'Artırmak isterseniz, maksimum yükleme sınırınıza ulaştınız', 'You have reached your maximum upload limit, if you wish to increase it', 'You have reached your maximum upload limit, if you wish to increase it', 'You have reached your maximum upload limit, if you wish to increase it'),
(401, 'please_contact', 'please contact us', 'please contact us', 'الرجاء التواصل معنا', 'Gelieve ons te contacteren', 'Contactez nous s\'il vous plait', 'bitte kontaktieren Sie uns', 'пожалуйста свяжитесь с нами', 'por favor contáctenos', 'lütfen bizimle iletişime geçin', 'please contact us', 'هیڤی دکەین پەیڤەندییێ بمەڤە بکە', 'please contact us'),
(402, '_reached_max_limit', 'You have reached your maximum upload limit', 'You have reached your maximum upload limit', 'لقد وصلت إلى الحد الأقصى للتحميل', 'U heeft uw maximale uploadlimiet bereikt', 'Vous avez atteint votre limite de téléchargement maximale', 'Sie haben Ihr maximales Upload-Limit erreicht', 'Вы достигли максимального ограничения загрузки', 'Has alcanzado tu límite máximo de subida.', 'Maksimum yükleme sınırınıza ulaştınız', 'You have reached your maximum upload limit', 'تو گەهیشتییە سنوورێ دیاریکری ژبۆ ئەپلۆدکرنا ڤیدیۆیان', 'You have reached your maximum upload limit'),
(403, 'upload_up', 'Upload up to', 'Upload up to', 'تحميل حتى', 'Upload tot', 'Télécharger jusqu\'à', 'Laden Sie bis zu', 'Загрузить до', 'Subir hasta', 'Kadar yükle', 'Upload up to', 'ئەپلۆد هەتا', 'Upload up to'),
(404, 'upload_up_no_limit', 'Upload unlimited videos', 'Upload unlimited videos', 'تحميل مقاطع فيديو غير محدودة', 'Upload onbeperkt video\'s', 'Télécharger des vidéos illimitées', 'Lade unbegrenzt Videos hoch', 'Загружайте неограниченное количество видео', 'Subir videos ilimitados', 'Sınırsız video yükle', 'Upload unlimited videos', 'Upload unlimited videos', 'Upload unlimited videos'),
(405, 'two_factor', 'Two-factor authentication', 'Two-factor authentication', 'توثيق ذو عاملين', 'Twee-factor-authenticatie', 'Authentification à deux facteurs', 'Zwei-Faktor-Authentifizierung', 'Двухфакторная аутентификация', 'Autenticación de dos factores', 'İki faktörlü kimlik doğrulama', 'دوو هه‌نگاوی چوونه‌ژووره‌وه‌', 'دوو پێنگاڤێن داخل بوونێ', 'دوتا قدم ورود شدن'),
(406, 'disable', 'Disable', 'Disable', 'تعطيل', 'onbruikbaar maken', 'Désactiver', 'Deaktivieren', 'запрещать', 'Inhabilitar', 'Devre dışı', 'ناچاڵاك', 'نەچالاک', 'غیر فعال'),
(407, 'enable', 'Enable', 'Enable', 'مكن', 'in staat stellen', 'Activer', 'Aktivieren', 'включить', 'Habilitar', 'etkinleştirme', 'چاڵاك', 'چالاک', 'فعال'),
(408, 'sent_two_factor_email', 'We have sent you the confirmation code to your email address.', 'We have sent you the confirmation code to your email address.', 'لقد أرسلنا إليك رمز التأكيد إلى عنوان بريدك الإلكتروني.', 'We hebben je de bevestigingscode gestuurd naar je e-mailadres.', 'Nous vous avons envoyé le code de confirmation à votre adresse e-mail.', 'Wir haben Ihnen den Bestätigungscode an Ihre E-Mail-Adresse gesendet.', 'Мы отправили вам код подтверждения на ваш адрес электронной почты.', 'Le hemos enviado el código de confirmación a su dirección de correo electrónico.', 'Size e-posta adresinize onay kodunu gönderdik.', 'په‌یامی سه‌لماندنمان نارد بۆ پۆستی ئه‌لیكتڕۆنیت', 'مە پەیاما سەلماندنێ ژبۆ پۆستێ ئەلیکترۆنییێ تە فڕیکرن', 'ما یە کد تأیید را به پست الیکترونی شما ارسال کردیم.'),
(409, 'confirm_code', 'Confirmation Code', 'Confirmation Code', 'تأكيد الكود', 'Bevestigingscode', 'Code de confirmation', 'Bestätigungscode', 'Код для подтверждения', 'Código de confirmación', 'Onay kodu', 'Confirmation Code', 'کۆدا سەلماندنێ', 'کد تایید'),
(410, 'wrong_confirm_code', 'Wrong confirmation code', 'Wrong confirmation code', 'رمز تأكيد خطأ', 'Foutieve bevestigingscode', 'Mauvais code de confirmation', 'Falscher Bestätigungscode', 'Неверный код подтверждения', 'Código de confirmación incorrecto', 'Yanlış onay kodu', 'Wrong confirmation code', 'کۆدا سەلماندنێ نەدرستە!', 'کد تایید اشتباه است'),
(411, 'two_factor_description', '', 'Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your password and a 6-digit security code sent to your email to log in.', 'قم بتشغيل تسجيل الدخول المكوَّن من خطوتين لتحسين مستوى أمان حسابك ، وبمجرد تشغيله ، ستستخدم كل من كلمة المرور ورمز الحماية المكون من 6 أرقام والمرسلين إلى بريدك الإلكتروني لتسجيل الدخول.', 'Schakel login in 2 stappen in om de beveiliging van uw account te verbeteren. Als u eenmaal bent ingeschakeld, gebruikt u zowel uw wachtwoord als een uit 6 cijfers bestaande beveiligingscode die naar uw e-mailadres is gestuurd om u aan te melden.', 'Activez la connexion en deux étapes pour renforcer la sécurité de votre compte. Une fois activé, vous utiliserez votre mot de passe et un code de sécurité à 6 chiffres envoyé à votre adresse e-mail pour vous connecter.', 'Aktivieren Sie die Anmeldung in zwei Schritten, um die Sicherheit Ihres Kontos zu erhöhen. Nach dem Einschalten verwenden Sie sowohl Ihr Passwort als auch einen 6-stelligen Sicherheitscode, der an Ihre E-Mail gesendet wird, um sich anzumelden.', 'Включите двухэтапную регистрацию, чтобы повысить уровень безопасности своей учетной записи. После включения вы будете использовать для входа в свой пароль и 6-значный код безопасности, отправленный на вашу электронную почту.', 'Active el inicio de sesión en dos pasos para aumentar la seguridad de su cuenta. Una vez que lo haya activado, utilizará su contraseña y un código de seguridad de 6 dígitos enviado a su correo electrónico para iniciar sesión.', 'Hesabınızın güvenliğini artırmak için 2 adımlı giriş özelliğini açın. Açıldıktan sonra, giriş yapmak için e-postanıza gönderilen şifrenizi ve 6 basamaklı bir güvenlik kodunu kullanacaksınız.', 'دوو هه‌نگاوی چوونه‌ژووره‌وه‌ به‌كاربخه‌ بۆ پارێزگاری كردن له‌ هه‌ژماره‌كه‌ت بۆ ئه‌وه‌ی هه‌ژماره‌كه‌ت به‌ كۆد بكه‌یته‌وه‌ واته‌ كۆدێك دێت بۆ پۆستی ئه‌لیكترۆنی به‌ڕێزتان دوای دڵنیابوونه‌وه‌ ئه‌وكات هه‌ژماره‌كه‌تان ده‌كرێته‌وه‌', 'دوو پێنگاڤێن داخل بوونێ چالاک کە ژبۆ بەڕاڤانیکارنا هەژمارێ خۆ ژبۆ کو بشێی هەژمارێ خۆ ب کۆد بکەیەڤە یەعنی کۆدەک دێ ژبۆ پۆستێ ئەلیکترۆنییێ تە هێتە فڕێکرن پشتی پشت ڕاست بوونێ هەژمارێ تە دێ هێتە ڤەکرن', 'دوتا قدم ورود شدن را فعال کنید برای اینکە امنیت حسابتان بالا برود ، با فعال کردن این خدمتگذاری هر وقتی تو یا کسی دیگە ای ورودە حسابتان شود ما یک کد تایید کنندە را واسە تو میفرستیم برای ایمیل یا شمارە تلفنت ، تا این کد را ورود نکنید نمیتوانید ورود حسابتان شوید'),
(412, 'upload_date', 'Upload Date', 'Upload Date', 'تاريخ الرفع', 'Upload datum', 'Date de dépôt', 'Hochladedatum', 'Дата загрузки', 'Fecha de carga', 'Yükleme tarihi', 'Upload Date', 'دەمێ ئەپلۆدکرنێ', 'تاریخ آپلود'),
(413, 'last_hour', 'Last hour', 'Last hour', 'الساعة الأخيرة', 'Laatste uur', 'Dernière heure', 'Letzte Stunde', 'Последний час', 'Ultima hora', 'Son saat', 'Last hour', 'دوماهیک دەمژمێر', 'آخرین ساعت'),
(414, 'today', 'Today', 'Today', 'اليوم', 'Vandaag', 'Aujourd\'hui', 'Heute', 'сегодня', 'Hoy', 'Bugün', 'ئه‌مڕۆ', 'ئەڤڕۆ', 'امروز'),
(415, 'this_week', 'This week', 'This week', 'هذا الاسبوع', 'Deze week', 'Cette semaine', 'Diese Woche', 'На этой неделе', 'Esta semana', 'Bu hafta', 'This week', 'وێ حەفتییێ', 'این هفته'),
(416, 'this_month', 'This month', 'This month', 'هذا الشهر', 'Deze maand', 'Ce mois-ci', 'Diesen Monat', 'Этот месяц', 'Este mes', 'Bu ay', 'This month', 'وێ مەهێ', 'این ماه'),
(417, 'this_year', 'This year', 'This year', 'هذا العام', 'Dit jaar', 'Cette année', 'Dieses Jahr', 'В этом году', 'Este año', 'Bu yıl', 'This year', 'ئەڤ ساڵ', 'امسال'),
(418, 'video_studio', 'Video Studio', 'Video Studio', 'فيديو ستوديو', 'Video Studio', 'Studio vidéo', 'Videostudio', 'Видеостудия', 'Estudio de video', 'Video Stüdyosu', 'ستۆدیۆ', 'ڤیدیۆ ستۆدیۆ', 'استودیوی ویدیو'),
(419, 'view_analytics', 'View Analytics', 'View Analytics', 'عرض التحليلات', 'Bekijk Analytics', 'Voir Analytics', 'Analytics anzeigen', 'Просмотр аналитики', 'Ver Analytics', 'Analytics\'i görüntüle', 'View Analytics', 'View Analytics', 'View Analytics'),
(420, 'likes', 'Likes', 'Likes', 'الإعجابات', 'sympathieën', 'Aime', 'Likes', 'Нравится', 'Gustos', 'Seviyor', 'Likes', 'بدل بوون', 'پسند ها'),
(421, 'dislikes', 'Dislikes', 'Dislikes', 'يكره', 'Houdt niet van', 'N\'aime pas', 'Abneigungen', 'Не нравится', 'Aversiones', 'Beğenmeme', 'به‌ دڵنه‌بوونه‌كان', 'بدل نەبوون', 'نپسندیدن ها'),
(422, 'video_analytics', 'Video Analytics', 'Video Analytics', 'تحليلات الفيديو', 'Video Analytics', 'Analyse vidéo', 'Video Analytics', 'Видео Аналитика', 'Video Analytics', 'Video Analizi', 'ئاماره‌كانی ڤیدیۆ', 'ئامارێن ڤیدیۆیێ', 'Video Analytics'),
(423, 'total_likes', 'Total Likes', 'Total Likes', 'مجموع يحب', 'Totaal houdt van', 'Total de J\'aime', 'Likes insgesamt', 'Всего лайков', 'Me gusta en total', 'Toplam Beğeniler', 'هه‌موو به‌دڵبوونه‌كان', 'هەمی بدل بوویی', 'مجموع پسند ها'),
(424, 'total_dislikes', 'Total Dislikes', 'Total Dislikes', 'مجموع يكره', 'Totaal houdt niet van', 'Total n\'aime pas', 'Total Abneigungen', 'Всего не нравится', 'Aversiones totales', 'Toplam Sevmediğim', 'هه‌موو به‌ دڵنه‌بوونه‌كان', 'هەمی بدل نەبوویی', 'مجموع نپسندیدن ها'),
(425, 'total_views', 'Total Views', 'Total Views', 'عدد المشاهدات', 'Totaal aantal weergaven', 'Vues totales', 'Gesamtansichten', 'Всего просмотров', 'Vistas totales', 'Toplam görüntülenme', 'هه‌موو بینینه‌كان', 'هەمی دیتن', 'مجموع بازدیدها'),
(426, 'view_report', 'View report', 'View report', 'عرض التقرير', 'Bekijk rapport', 'Voir le rapport', 'Zeige Bericht', 'Посмотреть отчет', 'Vista del informe', 'Raporu görüntüle', 'View report', 'دیتنا کەیسێ', 'مشاهده گزارش'),
(427, 'dashboard', 'Dashboard', 'Dashboard', 'لوحة القيادة', 'Dashboard', 'Tableau de bord', 'Instrumententafel', 'Приборная доска', 'Tablero', 'gösterge paneli', 'ده‌ستپێك', 'دەستپێک', 'داشبورد'),
(428, 'latest_comments', 'Latest Comments', 'Latest Comments', 'أحدث تعليقات', 'laatste Reacties', 'Derniers Commentaires', 'neueste Kommentare', 'Последние комментарии', 'últimos comentarios', 'son Yorumlar', 'Latest Comments', 'دووماهیک بۆچوون', 'آخرین نظرات'),
(429, 'total_comments', 'Total Comments', 'Total Comments', 'مجموع التعليقات', 'Totaal commentaar', 'Total des commentaires', 'Kommentare insgesamt', 'Всего комментариев', 'Total de comentarios', 'Toplam Yorumlar', 'هه‌موو سه‌رنجه‌كان', 'هەمی بۆچوون', 'مجموع نظرات'),
(430, 'total_comments_today', 'Comments Today', 'Comments Today', 'مجموع التعليقات اليوم', 'Totaal aantal reacties vandaag', 'Total des commentaires aujourd\'hui', 'Kommentare heute insgesamt', 'Всего комментариев сегодня', 'Total de comentarios hoy', 'Bugün Toplam Yorum', 'سه‌رنجه‌كانی ئه‌مڕۆ', 'بۆچوونێن ئیڕۆ', 'نظرات امروز'),
(431, 'total_comments_month', 'Comments This Month', 'Comments This Month', 'مجموع التعليقات هذا الشهر', 'Totaal aantal reacties deze maand', 'Total des commentaires ce mois-ci', 'Kommentare insgesamt in diesem Monat', 'Всего комментариев в этом месяце', 'Total de comentarios este mes', 'Bu Ayın Toplam Yorumu', 'سه‌رنجه‌كانی ئه‌م مانگه‌', 'بۆچوونێن وێ مەهێ', 'نظرات این ماه'),
(432, 'total_comments_year', 'Comments This Year', 'Comments This Year', 'مجموع التعليقات هذا العام', 'Totaal aantal reacties dit jaar', 'Total des commentaires cette année', 'Kommentare insgesamt in diesem Jahr', 'Всего комментариев в этом году', 'Total de comentarios de este año', 'Bu Yanda Toplam Yorum', 'سه‌رنجه‌كانی ئه‌م ساڵ', 'بۆچوونێن ئەڤ ساڵ', 'نظرات امسال'),
(433, 'edit_comment', 'Edit Comment', 'Edit Comment', 'تعديل التعليق', 'Commentaar bewerken', 'Modifier le commentaire', 'Kommentar bearbeiten', 'Редактировать комментарий', 'Editar comentario', 'Yorumu Düzenle', 'Edit Comment', 'دەستکاریکرنا بۆچوونان', 'ویرایش نظر'),
(434, 'channel_analytics', 'Channel Analytics', 'Channel Analytics', 'تحليلات القناة', 'Kanaalanalyses', 'Analyse de canal', 'Channel Analytics', 'Канальная аналитика', 'Analítica de canales', 'Kanal Analizi', 'Channel Analytics', 'Channel Analytics', 'Channel Analytics'),
(435, 'total_sub', 'Total Subscribers', 'Total Subscribers', 'مجموع المشتركين', 'Totaal aantal abonnees', 'Nombre total d\'abonnés', 'Abonnenten insgesamt', 'Всего подписчиков', 'Total de suscriptores', 'Toplam Aboneler', 'هه‌موو به‌شداربووان', 'هەمی بەژداربوو', 'تعداد مشترک ها'),
(436, 'the_most_viewed', 'Most Viewed Videos', 'Most Viewed Videos', 'معظم الفيديوهات التي تمت مشاهدتها', 'Meest bekeken video\'s', 'Vidéos les plus visionnées', 'Meistgesehene Videos', 'Самые популярные видео', 'Videos más vistos', 'En Çok İzlenen Videolar', 'Most Viewed Videos', 'ڤیدیۆیێن کو زۆرترین جارا هاتنە دیتن', 'ویدیوهای کە بیشترین بار بازدید شدە اند'),
(437, 'the_most_liked', 'Most Liked Videos', 'Most Liked Videos', 'أحب معظم الفيديوهات', 'Meest populaire video\'s', 'Vidéos les plus appréciées', 'Meistgeliebte Videos', 'Самые популярные видео', 'Videos que mas me gustaron', 'En Çok İzlenen Videolar', 'Most Liked Videos', 'ڤیدیۆیێن کو زۆرترین بدل بوون هەبووینە', 'ویدیو های مورد علاقه بیشتر'),
(438, 'the_most_disliked', 'Most Disliked Videos', 'Most Disliked Videos', 'مقاطع الفيديو الأكثر إعجابًا', 'Meest gehate video\'s', 'Vidéos les plus détestées', 'Beliebteste Videos', 'Самые популярные видео', 'Los videos más disgustados', 'En Beğenilmeyen Videolar', 'Most Disliked Videos', 'ڤیدیۆییێن کو زۆرترین بدل نەبوون هەبووینە', 'ویدیو های مورد علاقه بیشتر'),
(439, 'the_most_commented', 'Most Commented Videos', 'Most Commented Videos', 'مقاطع الفيديو الأكثر تعليقًا', 'De meeste video\'s met commentaar', 'Vidéos les plus commentées', 'Meist kommentierte Videos', 'Самые комментируемые видео', 'Videos más comentados', 'En Çok Yorumlanan Videolar', 'Most Commented Videos', 'ڤیدیۆییێن کو زۆرترین بۆچوون هەبووینە', 'ویدیوهای کە بیشترین نظر دارند'),
(440, 'last_month', 'This month compared to last month', 'This month compared to last month', 'الشهر الماضي', 'Vorige maand', 'Le mois dernier', 'Im vergangenen Monat', 'Прошлый месяц', 'El mes pasado', 'Geçen ay', 'This month compared to last month', 'جیاوازیا وێ مەهێ دگەل مەها بووری', 'این ماه در مقایسه با ماه گذشته'),
(441, 'subscribers', 'Subscribers', 'Subscribers', 'مشتركين', 'abonnees', 'Les abonnés', 'Abonnenten', 'Подписчики', 'Suscriptores', 'Aboneler', 'به‌شداربووان', 'بەژداربوویی', 'مشترک ها'),
(442, 'total_earn', 'Total Earnings', 'Total Earnings', 'الأرباح الكلية', 'totale winst', 'Total des gains', 'Gesamteinnahmen', 'Общий доход', 'Ganancias Totales', 'toplam kazanç', 'كۆی قازانجه‌كان', 'قازانج', 'کل درآمد'),
(443, 'earnings', 'Earnings', 'Earnings', 'أرباح', 'verdiensten', 'Gains', 'Verdienste', 'прибыль', 'Ganancias', 'Kazanç', 'قازانجه‌كان', 'قازانج', 'درآمد'),
(444, 'ur_video_queue', 'Your video is being added to queue, please check back in few minutes.', 'Your video is being added to queue, please check back in few minutes.', 'تتم إضافة الفيديو الخاص بك إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Je video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Votre vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier dans quelques minutes.', 'Ihr Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Ваше видео добавляется в очередь, пожалуйста, проверьте его через несколько минут.', 'Su video se está agregando a la cola, por favor, vuelva en unos minutos.', 'Videonuz sıraya ekleniyor, lütfen birkaç dakika içinde tekrar kontrol edin.', 'Your video is being added to queue, please check back in few minutes.', 'ڤیدیۆیا تە د سەفێدا زێدە بوویە هیڤی دکەم چەند دەقەیان ل هیڤییێ بە...', 'Your video is being added to queue, please check back in few minutes.'),
(445, 'this_video_queue', 'This video is being added to queue, please check back in few minutes.', 'This video is being added to queue, please check back in few minutes.', 'تتم إضافة هذا الفيديو إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Deze video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Cette vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier à nouveau dans quelques minutes.', 'Dieses Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Это видео добавляется в очередь, пожалуйста, зайдите через несколько минут.', 'Este video se está agregando a la cola, por favor revise de nuevo en unos minutos.', 'Bu video kuyruğa ekleniyor, lütfen birkaç dakika içinde tekrar kontrol edin.', 'This video is being added to queue, please check back in few minutes.', 'This video is being added to queue, please check back in few minutes.', 'This video is being added to queue, please check back in few minutes.'),
(446, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Сортировать по', 'Ordenar por', 'Göre sırala', 'Sort By', 'ڕێزکرن ب ڕەنگێ', 'مرتب سازی بر اساس'),
(447, 'assign_to_user', 'Assign To User', 'Assign To User', 'تعيين للمستخدم', 'Toewijzen aan gebruiker', 'Assigner à l\'utilisateur', 'Einem Benutzer zuweisen', 'Назначить пользователю', 'Asignar a usuario', 'Kullanıcıya Atama', 'Assign To User', 'تایبەت ب بکارهینەری', 'اختصاص به کاربر'),
(448, 'user_not_exists', 'User is not exist', 'User is not exist', 'المستخدم غير موجود', 'Gebruiker bestaat niet', 'L\'utilisateur n\'est pas exister', 'Benutzer ist nicht vorhanden', 'Пользователь не существует', 'El usuario no existe', 'Kullanıcı mevcut değil', 'User is not exist', 'چ بکارهینەرەک نەهاتە دیتن', 'هیچ کاربری وجود نیست'),
(449, 'popular_channels', 'Popular Channels', 'Popular Channels', 'القنوات الشعبية', 'Populaire kanalen', 'Chaînes populaires', 'Beliebte Kanäle', 'Популярные каналы', 'Canales populares', 'Popüler Kanallar', 'كه‌ناڵه‌ به‌ناوبانگه‌كان', 'کەناڵێن بناڤ و دەنگ', 'کانال های محبوب'),
(450, 'no_more_channels_to_show', 'No more channels to show', 'No more channels to show', 'لا مزيد من القنوات لإظهارها', 'Geen kanalen meer om te laten zien', 'Plus de chaînes à montrer', 'Keine Kanäle mehr zu zeigen', 'Нет больше каналов для показа', 'No hay más canales para mostrar.', 'Gösterilecek başka kanal yok', 'كه‌ناڵی زیاتر نیه‌ بۆ نیشاندان', 'کەناڵێن زێدەتر نینە ژبۆ بەرجاڤکرنێ', 'کانالهای بیشتری برای نمایش وجود ندارد'),
(451, 'no_channels_found_for_now', 'No channels found', 'No channels found', 'لم يتم العثور على قنوات', 'Geen kanalen gevonden', 'Aucune chaîne trouvée', 'Keine Channels gefunden', 'Каналы не найдены', 'No se encontraron canales', 'Kanal bulunamadı', 'هیچ كه‌ناڵێك نه‌دۆزرایه‌وه‌', 'چ کەناڵ نەهاتنە دیتن', 'هیچ کانال یافت نشد'),
(452, 'filter_by', 'Filter By', 'Filter By', 'مصنف بواسطة', 'Filteren op', 'Filtrer par', 'Filtern nach', 'Сортировать по', 'Filtrado por', 'Tarafından filtre', 'پاڵاوتن به‌ پێی', 'پارزوون ب دیف', 'Filter By'),
(453, 'sub_category', 'Sub Category', 'Sub Category', 'الفئة الفرعية', 'Subcategorie', 'Sous catégorie', 'Unterkategorie', 'Подкатегория', 'Subcategoría', 'Alt Kategori', 'ژێر به‌ش', 'ناڤەڕۆکا بەشی', 'زیر بخش'),
(454, 'none', 'None', 'None', 'لا شيء', 'Geen', 'Aucun', 'Keiner', 'Никто', 'Ninguna', 'Yok', 'هیچیان', 'هیچ ژوان', 'هیچ یک'),
(455, 'all', 'All', 'All', 'الكل', 'Allemaal', 'Tout', 'Alles', 'Все', 'Todos', 'Herşey', 'هه‌موو', 'هەمی', 'همە'),
(456, 'video_not_available_location', 'This video is not available in your location.', 'This video is not available in your location.', 'هذا الفيديو غير متوفر في موقعك.', 'Deze video is niet beschikbaar op jouw locatie.', 'Cette vidéo n\'est pas disponible dans votre région.', 'Dieses Video ist an Ihrem Standort nicht verfügbar.', 'Это видео недоступно в вашем регионе.', 'Este video no está disponible en tu ubicación.', 'Bu video bulunduğunuz yerde mevcut değil.', 'ئه‌م ڤیدیۆیه‌ به‌رده‌ست نیه‌ له‌ وڵاته‌كه‌ت', 'ئەڤ ڤیدییۆیە د ولات ئانکو هەرێما تەدا بەردەست نییە!', 'این ویدیو در کشور شما در دسترس نیست'),
(457, 'geo_blocking', 'Geo Blocking', 'Geo Blocking', 'جيو الحظر', 'Geo-blokkering', 'Blocage géographique', 'Geo-Blocking', 'Geo Blocking', 'Bloqueo geográfico', 'Coğrafi Engelleme', 'قه‌ده‌غه‌كردنی وڵات', 'بلووک کرنا ولات ئانکو هەرێمان', 'مسدود کردن کشور'),
(458, 'unknown_location', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'موقعك غير معروف ، لذا تم حظر هذا الفيديو.يجوز لك إعادة المحاولة لاحقًا.', 'Uw locatie is onbekend, dus deze video is geblokkeerd. kunt het later opnieuw proberen.', 'Votre position est inconnue, cette vidéo a donc été bloquée. Vous pouvez réessayer plus tard.', 'Ihr Standort ist unbekannt, daher wurde dieses Video gesperrt. Sie können es später erneut versuchen.', 'Ваше местоположение неизвестно, поэтому это видео было заблокировано. Вы можете попробовать позже.', 'Su ubicación es desconocida, por lo que este video fue bloqueado. Puedes intentarlo más tarde.', 'Konumunuz bilinmiyor, bu nedenle bu video engellendi. Daha sonra tekrar deneyebilirsiniz.', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'جهێ تە نەدیارە ، سەرباری وێ جەندێ ئەڤ ڤیدیۆیە یێ هاتییە بلووک کرن هیڤی دکەم پاشی بزاڤێ بکە', 'مکان شما ناشناخته است، بنابراین این ویدیو مسدود شده است.لطفا بعدا دوباره امتحان کنید.'),
(459, 'ads_earnings', 'Ads Earnings', 'Ads Earnings', 'أرباح الإعلانات', 'Inkomsten uit advertenties', 'Revenu des annonces', 'Werbeeinnahmen', 'Доходы от рекламы', 'Ganancias de los anuncios', 'Reklam Kazançları', 'قازانجی بانگه‌شه‌كان', 'قازانجا بانگەشەیان', 'درآمد تبلیغات'),
(460, 'videos_earnings', 'Video Earnings', 'Video Earnings', 'أرباح الفيديو', 'Video-inkomsten', 'Vidéos Gains', 'Videos Einnahmen', 'Видео Заработок', 'Videos de ganancias', 'Videolar Kazançları', 'قازانجی ڤیدیۆكان', 'قازانجا ڤیدیۆیان', 'درآمد ویدیو ها'),
(461, 'sales_earnings', 'Sales Earning', 'Sales Earning', 'كسب المبيعات', 'Verkoop verdienen', 'Ventes', 'Verkäufe verdienen', 'Доход от продаж', 'Ventas ganando', 'Satış Kazançları', 'قازانجی فرۆشتنه‌كان', 'قازانجا فرۆشتنان', 'درآمد فروش ها'),
(462, 'ads_analytics', 'Ads Analytics', 'Ads Analytics', 'تحليلات الإعلانات', 'Analytics voor advertenties', 'Analyse des annonces', 'Anzeigenanalysen', 'Рекламная аналитика', 'Ads Analytics', 'Reklam Analizi', 'ئاماری بانگه‌شه‌كان', 'ئامارێ بانگهێشتان', 'Ads Analytics'),
(463, 'all_time', 'All Time', 'All Time', 'كل الوقت', 'Altijd', 'Tout le temps', 'Alle zeit', 'Все время', 'Todo el tiempo', 'Her zaman', 'هه‌موو كاتێك', 'هەمی دەمەکێ', 'همیشه'),
(464, 'analytics', 'Analytics', 'Analytics', 'تحليلات', 'Analytics', 'Analytique', 'Analytics', 'аналитика', 'Analítica', 'analitik', 'ئاماره‌كان', 'ئامار', 'آمار ها'),
(465, '1', 'category', 'Film & Animation', 'فيلم والرسوم المتحركة', 'Film & Animatie', 'Film et animation', 'Film & Animation', 'Фильм и анимация', 'Cine y Animación', 'Film ve Animasyon', 'فیلم و ئه‌نیمه‌یشن', 'فلم و ئەنیمەیشن', 'فیلم و انیمیشن'),
(466, '3', 'category', 'Music', 'موسيقى', 'Muziek', 'La musique', 'Musik', 'Музыка', 'Música', 'Müzik', 'میوزك', 'میوزیک', 'موسیقی'),
(467, '4', 'category', 'Pets & Animals', 'الحيوانات الأليفة الحيوانات', 'Huisdieren en dieren', 'Animaux et animaux', 'Haustiere und Tiere', 'Домашние животные', 'Animales de compañía', 'Hayvanlar ve Hayvanlar', 'ئاژه‌ڵی ماڵی', 'حەیوانێن مالی', 'حیوانات خانگی و حیوانات'),
(468, '5', 'category', 'Sports', 'رياضات', 'Sport', 'Des sports', 'Sport', 'Виды спорта', 'Deportes', 'Spor Dalları', 'وه‌رزش', 'وەرزش', 'ورزش ها'),
(469, '6', 'category', 'Travel & Events', 'السفر والأحداث', 'Reizen & Evenementen', 'Voyages et événements', 'Reise & Veranstaltungen', 'Путешествия и события', 'Viajes y Eventos', 'Seyahat ve Etkinlikler', 'ڕووداو و سه‌فه‌ر', 'ڕیدان و سەفەر', 'سفر و رویدادها'),
(470, '7', 'category', 'Gaming', 'الألعاب', 'gaming', 'Gaming', 'Spiel', 'азартные игры', 'Juego de azar', 'kumar', 'یاری', 'یاری', 'بازی ها'),
(471, '8', 'category', 'People & Blogs', 'الناس والمدونات', 'Mensen & blogs', 'Personnes et Blogs', 'Leute & Blogs', 'Люди и блоги', 'Personas y blogs', 'Kişiler ve Bloglar', 'خه‌ڵك و نه‌ته‌وه‌', 'خەلک و نەتەوە', 'مردم و قوم ها'),
(472, '9', 'category', 'Comedy', 'كوميديا', 'Komedie', 'Comédie', 'Komödie', 'комедия', 'Comedia', 'Komedi', 'كۆمیدیا', 'کۆمیدیا', 'کمدی'),
(473, '10', 'category', 'Entertainment', 'وسائل الترفيه', 'vermaak', 'Divertissement', 'Unterhaltung', 'Развлекательная программа', 'Entretenimiento', 'Eğlence', 'كات به‌سه‌ربردن', 'بسەربرانا دەمی', 'سرگرمی'),
(474, '11', 'category', 'News & Politics', 'الأخبار والسياسة', 'Nieuws & Politiek', 'Nouvelles et politique', 'Nachrichten & Politik', 'Новости и политика', 'Noticias y Política', 'Haberler ve Politika', 'هه‌واڵ و سیاسه‌ت', 'خەبەر و سیاسەت', 'اخبار و سیاست'),
(475, '12', 'category', 'How-to & Style', 'كيف تصمم', 'How-To & Style', 'Comment styliser', 'How-To & Style', 'How-to & Style', 'Cómo hacer y estilo', 'Nasıl Yapılır ve Stil', 'فێركاری و ستایل', 'فێرکاری و ستایل', 'آموزش و ستایل'),
(476, '13', 'category', 'Non-profits & Activism', 'غير الربحية والنشاط', 'Non-profit & Activisme', 'Organismes à but non lucratif et activisme', 'Non-Profits & Aktivismus', 'Неприбыль и активизм', 'Sin fines de lucro y activismo', 'Kâr amacı gütmeyenler & Aktivizm', 'ناحكومی و چاڵاكی', 'ناحکومی و چالاکی', 'اهلی و فعالیت');

-- --------------------------------------------------------

--
-- Table structure for table `likes_dislikes`
--

CREATE TABLE `likes_dislikes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes_dislikes`
--

INSERT INTO `likes_dislikes` (`id`, `user_id`, `video_id`, `post_id`, `type`, `time`) VALUES
(1, 5, 1988, 0, 1, 1550849597),
(2, 5, 614, 0, 1, 1550850589),
(3, 5, 1989, 0, 1, 1550851415),
(4, 5, 1990, 0, 1, 1550852170),
(5, 5, 1991, 0, 1, 1550921986),
(6, 5, 1992, 0, 1, 1550922515),
(7, 5, 1993, 0, 1, 1551010355),
(8, 5, 1994, 0, 1, 1551015735),
(9, 5, 2089, 0, 1, 1551085917),
(10, 5, 2030, 0, 1, 1551088094),
(12, 5, 2094, 0, 1, 1551188356),
(13, 5, 2095, 0, 1, 1551189879),
(14, 5, 2005, 0, 1, 1551210825),
(15, 9, 2094, 0, 1, 1551224242),
(16, 9, 1998, 0, 1, 1551224281),
(17, 2, 2095, 0, 1, 1551458123),
(18, 5, 2096, 0, 1, 1551538883),
(19, 13, 1998, 0, 1, 1551888022),
(22, 5, 2100, 0, 1, 1552667002),
(23, 5, 2087, 0, 1, 1552737311),
(24, 5, 2101, 0, 1, 1552743237),
(25, 5, 589, 0, 1, 1552744995),
(26, 5, 601, 0, 1, 1552745077),
(27, 5, 2102, 0, 1, 1552755087),
(28, 18, 2087, 0, 1, 1552771048),
(29, 18, 614, 0, 1, 1552773819),
(30, 1, 605, 0, 1, 1552887418),
(31, 5, 2065, 0, 1, 1552909673),
(32, 5, 602, 0, 1, 1552990235),
(33, 5, 2103, 0, 1, 1552991509),
(34, 5, 2104, 0, 1, 1552992552),
(35, 5, 2105, 0, 1, 1552992659),
(36, 5, 2106, 0, 1, 1552992887),
(37, 5, 2107, 0, 1, 1552993072),
(38, 5, 2108, 0, 1, 1552993288),
(39, 5, 2109, 0, 1, 1552993489),
(40, 5, 2110, 0, 1, 1552993653),
(41, 5, 2111, 0, 1, 1552993882),
(42, 5, 2112, 0, 1, 1552994216),
(43, 5, 2113, 0, 1, 1553008278),
(46, 5, 2115, 0, 1, 1553093909),
(47, 5, 2116, 0, 1, 1553094445),
(48, 5, 2117, 0, 1, 1553094880),
(49, 5, 2118, 0, 1, 1553100398);

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `id` int(11) NOT NULL,
  `list_id` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `privacy` int(11) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(3000) NOT NULL DEFAULT '',
  `time` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists`
--

INSERT INTO `lists` (`id`, `list_id`, `user_id`, `name`, `description`, `privacy`, `views`, `icon`, `time`) VALUES
(1, 'jG36sFmTqy6DEY9', 1, 'ss', 'sss', 1, 0, '', 1551135834),
(2, 'YTpTpYR2W1eaVFV', 5, 'English Songs', '', 1, 0, '', 1553083547),
(3, 'vfO5IQbvbgki2Yt', 5, 'فێرکاری', '', 1, 0, '', 1553083733),
(4, 'juMC36EFj2OiDjs', 5, 'دیزایین', '', 1, 0, '', 1553083776),
(5, 'xhzHrJtZRjcbD88', 5, 'هاککینگ - Hacking', '', 1, 0, '', 1553083852),
(6, '6qtQejyUIElpAYP', 5, 'گەیمینگ -Gaming', '', 1, 0, '', 1553083894),
(7, '3LlAxxzSz4slsc7', 5, 'خۆپاراستن', '', 1, 0, '', 1553083936),
(8, 'SDnq1TNFq4jbnLN', 5, 'آهنگ های فارسی', '', 1, 0, '', 1553084075),
(9, '8YpTdA9WQbCGeyg', 5, 'Films', '', 1, 0, '', 1553084174),
(10, 'qbQXv1ci4zbJOFE', 5, 'Turkish Songs', '', 1, 0, '', 1553084274),
(11, 'AMzUEcSv4VrFe3F', 5, 'گۆرانی - ڪوردۍ', '', 1, 0, '', 1553084363),
(12, 'IvEgUTMEzz8gKsN', 5, 'Albanian - Songs', '', 1, 0, '', 1553084445);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `from_deleted` int(11) NOT NULL DEFAULT 0,
  `to_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_id`, `to_id`, `text`, `seen`, `time`, `from_deleted`, `to_deleted`) VALUES
(1, 3, 1, 'Slaw', 1550799535, 1550759700, 0, 0),
(2, 9, 1, 'hi', 1551300567, 1551224304, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notifier_id`, `recipient_id`, `video_id`, `type`, `text`, `url`, `seen`, `time`, `sent_push`) VALUES
(1, 2, 1, 0, 'subscribed_u', NULL, '@FarmanSmaquly', '1553043976', '1550747514', 1),
(2, 3, 1, 0, 'subscribed_u', NULL, '@Barzy', '1553043976', '1550759638', 1),
(3, 1, 3, 0, 'subscribed_u', NULL, '@Shalawkoy', '1550803533', '1550799543', 1),
(4, 4, 1, 0, 'subscribed_u', NULL, '@SK_Music', '1553043976', '1550799989', 1),
(5, 1, 4, 0, 'subscribed_u', NULL, '@Shalawkoy', '1550801160', '1550800006', 1),
(6, 5, 4, 0, 'subscribed_u', NULL, '@ehsan_tech', '0', '1550850480', 1),
(7, 5, 4, 614, 'liked_ur_video', NULL, 'watch/YfjCUe2AjmKVIVx', '0', '1550850589', 1),
(8, 1, 5, 0, 'subscribed_u', NULL, '@Shalawkoy', '1553095250', '1551081106', 1),
(9, 5, 1, 0, 'subscribed_u', NULL, '@ehsan_tech', '1553043976', '1551085914', 1),
(10, 5, 1, 2089, 'liked_ur_video', NULL, 'watch/rJcqSis5cxUpwRo', '1553043976', '1551085917', 1),
(11, 5, 1, 2030, 'liked_ur_video', NULL, 'watch/sFBO4QBCNgFBuuF', '1553043976', '1551088094', 1),
(12, 5, 1, 2030, 'commented_ur_video', NULL, 'watch/sFBO4QBCNgFBuuF&cl=1', '1553043976', '1551088114', 1),
(23, 6, 1, 0, 'subscribed_u', NULL, '@Rebaz', '1553043976', '1551135879', 1),
(24, 1, 6, 0, 'subscribed_u', NULL, '@Shalawkoy', '1553043896', '1551135896', 1),
(27, 5, 1, 2094, 'added_video', NULL, 'watch/QAWMTEXVsS1eaub', '1553043976', '1551188028', 1),
(28, 5, 1, 2095, 'added_video', NULL, 'watch/kw5DCDbV8881fES', '1553043976', '1551189611', 1),
(29, 6, 5, 0, 'subscribed_u', NULL, '@Rebaz', '1553095250', '1551192514', 1),
(30, 5, 1, 2005, 'liked_ur_video', NULL, 'watch/M1Y8QhDjmT3ALP5', '1553043976', '1551210825', 1),
(31, 5, 1, 2005, 'commented_ur_video', NULL, 'watch/M1Y8QhDjmT3ALP5&cl=3', '1553043976', '1551210915', 1),
(32, 5, 2, 0, 'subscribed_u', NULL, '@ehsan_tech', '1552981803', '1551211058', 1),
(33, 9, 5, 0, 'subscribed_u', NULL, '@Ahmadkawani', '1553095250', '1551224241', 1),
(34, 9, 5, 2094, 'liked_ur_video', NULL, 'watch/QAWMTEXVsS1eaub', '1553095250', '1551224242', 1),
(35, 9, 5, 2094, 'commented_ur_video', NULL, 'watch/QAWMTEXVsS1eaub&cl=4', '1553095250', '1551224256', 1),
(36, 9, 1, 0, 'subscribed_u', NULL, '@Ahmadkawani', '1553043976', '1551224279', 1),
(37, 9, 1, 1998, 'liked_ur_video', NULL, 'watch/Zd2rMFNpleMw1NW', '1553043976', '1551224281', 1),
(38, 5, 9, 0, 'liked_ur_comment', NULL, 'watch/QAWMTEXVsS1eaub&cl=4', '0', '1551262983', 1),
(39, 2, 5, 2095, 'liked_ur_video', NULL, 'watch/kw5DCDbV8881fES', '1553095250', '1551458123', 1),
(40, 5, 1, 2096, 'added_video', NULL, 'watch/NnA6yALez9E2WL9', '1553043976', '1551538875', 1),
(41, 5, 6, 2096, 'added_video', NULL, 'watch/NnA6yALez9E2WL9', '1553043896', '1551538875', 1),
(42, 5, 9, 2096, 'added_video', NULL, 'watch/NnA6yALez9E2WL9', '0', '1551538875', 1),
(43, 10, 5, 0, 'subscribed_u', NULL, '@Mansur_garde', '1553095250', '1551710444', 1),
(44, 5, 10, 0, 'subscribed_u', NULL, '@ehsan_tech', '1551711299', '1551710924', 1),
(45, 10, 4, 0, 'subscribed_u', NULL, '@Mansur_garde', '0', '1551711476', 1),
(46, 11, 1, 0, 'subscribed_u', NULL, '@Yadjamal', '1553043976', '1551772516', 1),
(47, 11, 5, 0, 'subscribed_u', NULL, '@Yadjamal', '1553095250', '1551773218', 1),
(48, 11, 1, 0, 'unsubscribed_u', NULL, '@Yadjamal', '1553043976', '1551784329', 1),
(49, 11, 1, 0, 'subscribed_u', NULL, '@Yadjamal', '1553043976', '1551784329', 1),
(50, 13, 1, 1998, 'liked_ur_video', NULL, 'watch/Zd2rMFNpleMw1NW', '1553043976', '1551888022', 1),
(51, 13, 1, 0, 'subscribed_u', NULL, '@Aroo_music', '1553043976', '1551888042', 1),
(52, 13, 5, 0, 'subscribed_u', NULL, '@Aroo_music', '1553095250', '1551888047', 1),
(53, 5, 13, 0, 'subscribed_u', NULL, '@ehsan_tech', '1552057938', '1551899928', 1),
(63, 15, 1, 0, 'subscribed_u', NULL, '@rekawt', '1553043976', '1552167934', 1),
(66, 11, 1, 0, 'unsubscribed_u', NULL, '@Yadjamal', '1553043976', '1552514220', 1),
(67, 5, 1, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '1553043976', '1552666977', 1),
(68, 5, 6, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '1553043896', '1552666977', 1),
(69, 5, 9, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '0', '1552666977', 1),
(70, 5, 10, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '0', '1552666977', 1),
(71, 5, 11, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '0', '1552666977', 1),
(72, 5, 13, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '0', '1552666977', 1),
(73, 5, 16, 2100, 'added_video', NULL, 'watch/McY2f6FR2bnBtSj', '0', '1552666977', 1),
(74, 5, 1, 2087, 'liked_ur_video', NULL, 'watch/8sDfJ3A5YhC5jEw', '1553043976', '1552737311', 1),
(75, 5, 1, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '1553043976', '1552743229', 0),
(76, 5, 6, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '1553043896', '1552743229', 0),
(77, 5, 9, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '0', '1552743229', 0),
(78, 5, 10, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '0', '1552743229', 0),
(79, 5, 11, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '0', '1552743229', 0),
(80, 5, 13, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '0', '1552743229', 0),
(81, 5, 16, 2101, 'added_video', NULL, 'watch/VfnmXo6djyEcqxD', '0', '1552743229', 0),
(82, 5, 1, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '1553043976', '1552755079', 0),
(83, 5, 6, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '1553043896', '1552755079', 0),
(84, 5, 9, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '0', '1552755079', 0),
(85, 5, 10, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '0', '1552755079', 0),
(86, 5, 11, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '0', '1552755079', 0),
(87, 5, 13, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '0', '1552755079', 0),
(88, 5, 16, 2102, 'added_video', NULL, 'watch/1HblvxHx8zKNpOu', '0', '1552755079', 0),
(89, 2, 5, 0, 'subscribed_u', NULL, '@FarmanSmaquly', '1553095250', '1552851698', 1),
(90, 1, 4, 605, 'liked_ur_video', NULL, 'watch/utP5cwJlShXqgag', '0', '1552887418', 1),
(91, 5, 1, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '1553043976', '1553008262', 0),
(92, 5, 6, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '1553043896', '1553008262', 0),
(93, 5, 9, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(94, 5, 10, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(95, 5, 11, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(96, 5, 13, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(97, 5, 16, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(98, 5, 2, 2113, 'added_video', NULL, 'watch/YWHz5XqKIO4LyKf', '0', '1553008262', 0),
(99, 6, 1, 0, 'unsubscribed_u', NULL, '@Rebaz', '1553043976', '1553043918', 1),
(100, 6, 1, 0, 'subscribed_u', NULL, '@Rebaz', '1553043976', '1553043918', 1),
(101, 6, 4, 0, 'subscribed_u', NULL, '@Rebaz', '0', '1553043968', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT 0,
  `date` varchar(100) NOT NULL DEFAULT '',
  `expire` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `play_list`
--

CREATE TABLE `play_list` (
  `id` int(11) NOT NULL,
  `list_id` varchar(500) NOT NULL DEFAULT '',
  `video_id` varchar(500) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `play_list`
--

INSERT INTO `play_list` (`id`, `list_id`, `video_id`, `user_id`) VALUES
(2, 'YTpTpYR2W1eaVFV', '2113', 5),
(3, 'vfO5IQbvbgki2Yt', '2112', 5),
(4, 'vfO5IQbvbgki2Yt', '2111', 5),
(5, 'vfO5IQbvbgki2Yt', '2110', 5),
(6, 'juMC36EFj2OiDjs', '2110', 5),
(7, 'vfO5IQbvbgki2Yt', '2109', 5),
(8, 'xhzHrJtZRjcbD88', '2109', 5),
(9, 'vfO5IQbvbgki2Yt', '2108', 5),
(10, '6qtQejyUIElpAYP', '2108', 5),
(11, 'vfO5IQbvbgki2Yt', '2107', 5),
(12, 'xhzHrJtZRjcbD88', '2107', 5),
(13, '3LlAxxzSz4slsc7', '2107', 5),
(14, '3LlAxxzSz4slsc7', '2106', 5),
(15, 'vfO5IQbvbgki2Yt', '2106', 5),
(16, 'juMC36EFj2OiDjs', '2105', 5),
(17, 'SDnq1TNFq4jbnLN', '2105', 5),
(18, 'xhzHrJtZRjcbD88', '2104', 5),
(19, '3LlAxxzSz4slsc7', '2104', 5),
(20, 'vfO5IQbvbgki2Yt', '2104', 5),
(21, 'xhzHrJtZRjcbD88', '2103', 5),
(22, '8YpTdA9WQbCGeyg', '2103', 5),
(23, 'SDnq1TNFq4jbnLN', '2102', 5),
(24, 'juMC36EFj2OiDjs', '2102', 5),
(25, 'qbQXv1ci4zbJOFE', '2101', 5),
(26, 'SDnq1TNFq4jbnLN', '2100', 5),
(27, 'qbQXv1ci4zbJOFE', '2096', 5),
(28, 'AMzUEcSv4VrFe3F', '2095', 5),
(29, 'qbQXv1ci4zbJOFE', '2094', 5),
(30, 'IvEgUTMEzz8gKsN', '1994', 5),
(31, 'SDnq1TNFq4jbnLN', '1993', 5),
(32, 'vfO5IQbvbgki2Yt', '1992', 5),
(33, 'SDnq1TNFq4jbnLN', '1991', 5),
(34, 'IvEgUTMEzz8gKsN', '1990', 5),
(35, 'AMzUEcSv4VrFe3F', '1989', 5),
(36, 'SDnq1TNFq4jbnLN', '1988', 5),
(37, 'YTpTpYR2W1eaVFV', '2115', 5),
(38, 'vfO5IQbvbgki2Yt', '2116', 5),
(39, 'juMC36EFj2OiDjs', '2116', 5),
(40, 'juMC36EFj2OiDjs', '2117', 5),
(41, 'vfO5IQbvbgki2Yt', '2117', 5),
(42, 'AMzUEcSv4VrFe3F', '2118', 5);

-- --------------------------------------------------------

--
-- Table structure for table `profile_fields`
--

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT 0,
  `profile_page` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pt_posts`
--

CREATE TABLE `pt_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `category` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(3000) NOT NULL DEFAULT '',
  `text` text DEFAULT NULL,
  `tags` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT 0,
  `shared` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pt_posts`
--

INSERT INTO `pt_posts` (`id`, `title`, `description`, `category`, `image`, `text`, `tags`, `time`, `user_id`, `active`, `views`, `shared`) VALUES
(1, 'میكس پله‌ی ئێستا به‌رده‌سته‌', 'میكس پله‌ی یه‌كه‌مین تۆڕی ڤیدیۆی كوردی ئێستا به‌رده‌سته‌ بۆ به‌كارهێنان !', '8', 'upload/photos/2019/03/dLsYCZocQ6L7OVMArqR4_20_6c2896d0a51469d119d05b50f7dad5f2_image.png', '&lt;div id=&quot;js_4&quot; class=&quot;_5pbx userContent _3576&quot; data-ft=&quot;{&amp;quot;tn&amp;quot;:&amp;quot;K&amp;quot;}&quot;&gt;&lt;div class=&quot;_5wj-&quot; dir=&quot;rtl&quot;&gt;&lt;p&gt;میكس پله‌ی ئێستا به‌رده‌سته‌&lt;/p&gt;&lt;p&gt;میكس پله‌ی یه‌كه‌مین تۆڕی ڤیدیۆی كوردی ئێستا به‌رده‌سته‌ بۆ به‌كارهێنان !&lt;/p&gt;&lt;p&gt;میكس پله‌ی چیه‌ ؟&amp;nbsp;&lt;br&gt;میكس پله‌ی یه‌كه‌مین تۆڕی ڤیدیۆیی كوردیه‌ له‌سه‌ر ئاستی كوردستان هاوشێوه‌ی Youtube و Twitch و پلاتفۆڕمه‌ ڤیدیۆیه‌ جیهانیه‌كان به‌ زمانی شیرینی كوردی و تایبه‌تمه‌ندی ناوازه‌ ئێستا به‌رده‌سته‌ بۆ به‌كارهێنان...&lt;/p&gt;&lt;p&gt;تایبه‌تمه‌ندیه‌كانی میكس پله‌ی چین ؟&lt;/p&gt;&lt;p&gt;بڵاوكردنه‌وه‌ی ڤیدیۆ تاكو قه‌باره‌ی 10 گێگابایت.فرۆشتنی ڤیدیۆ به‌ ئۆنڵاین&lt;br&gt;به‌خشین (به‌خشین به‌ كه‌ناڵه‌كان Donate)&amp;nbsp;&lt;br&gt;به‌ده‌ست هێنانی پاره‌ له‌ ڕیگای بڵاوكردنه‌وه‌ی ڕێكلام له‌سه‌ر ڤیدیۆكانت.&lt;br&gt;ئاسان بۆ به‌كارهێنان و خێرا&lt;br&gt;هێمای سه‌لماندن&lt;br&gt;پارێزراو&lt;br&gt;هه‌بوونی پاڵپشتی به‌ زمانی كوردی و زیاتر له‌ 5 زمان.&lt;br&gt;وه‌رگرتنه‌وه‌ی پاره‌ به‌ كاش و بانك&lt;br&gt;هێنانی ڤیدیۆ له‌ تۆڕه‌كانی تری ڤیدیۆی به‌ ئاسانترین شێوه‌ به‌بێ به‌رزكردنه‌وه‌&lt;br&gt;كه‌ناڵه‌ پڕبینه‌ره‌كان ئۆفه‌ری تایبه‌ت ده‌یناگرێته‌وه‌&lt;br&gt;ئازادی به‌كارهێنان&lt;/p&gt;&lt;p&gt;ئه‌پڵیكه‌یشنی میكس پله‌ی بۆ ئه‌ندرۆید&amp;nbsp;&lt;br&gt;&lt;a href=&quot;https://play.google.com/store/apps/details?id=com.mixplay.Android&amp;amp;fbclid=IwAR0zD41eHsLVUI7TfX9qV7dZqq9ZvIYZ74Fmgy8ZdiYHGsFPd3CIIRRitKY&quot; target=&quot;_blank&quot; rel=&quot;noopener nofollow&quot; data-ft=&quot;{&amp;quot;tn&amp;quot;:&amp;quot;-U&amp;quot;}&quot; data-lynx-mode=&quot;async&quot; data-lynx-uri=&quot;https://l.facebook.com/l.php?u=https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.mixplay.Android%26fbclid%3DIwAR0zD41eHsLVUI7TfX9qV7dZqq9ZvIYZ74Fmgy8ZdiYHGsFPd3CIIRRitKY&amp;amp;h=AT2--aM4waXDA0vg3Ocgu9Xm7bMW6a4KJjdD1Zq4syge2hqCbSfauYheVDCj8nR-zxRdE6wmMM6wEi7Ko8V1eiDYf3IoMB370eOKBwU9sB8K70ft1_9CA9giyE_akkAciKelKjGc20DVy4MpLxT0wvDl7vhdNsTsMC8fpPTfjmdiZRT_qurEn1bXOmA-5S4-o2ZxCe7zTDb5LjHjtPKbz23NZAVke6TDD5LPh8zXtiZOLUgJnUw6mcB0QCvkjDOrIJYV0FsQ7KMRp-h0Btq0VEqioZK7kBoDrZ9yLLFDgI_QmrHXwkXv8vga-sJHW-4qGMbuB9n9Yek40qd5fSsOk3flAV_QdN15qmaNoVQxgR0GVEdP2D8KJtdcncOF8-LVNChWpb0ZrrNMTC0ExqbolgYfTyUlol5p68wkzt8xideJ8_zcTDxftGwkgYfbH6cYKUWSqUN5EBKGG3zUiiGF_BG3Xdu8Hd4gbyGUApTJAyGH8S872QogPf59jugGbuIHX6vDMyYh3-utrLjsmLjsVOWcY9Fbk4LhQR9BSA-JJJYNfMUqM34euPmDtwnWI7Dft035AvON16TyvOix5oIoUtSC5ce64ZK1a5MyleD-D1HX&quot; data-mce-href=&quot;https://play.google.com/store/apps/details?id=com.mixplay.Android&amp;amp;fbclid=IwAR0zD41eHsLVUI7TfX9qV7dZqq9ZvIYZ74Fmgy8ZdiYHGsFPd3CIIRRitKY&quot;&gt;https://play.google.com/store/apps/details…&lt;/a&gt;&lt;/p&gt;&lt;p&gt;بۆ زانیاری زیاتر و هه‌بوونی پرسیار&amp;nbsp;&lt;br&gt;info@mixplay.net&lt;/p&gt;&lt;p&gt;&lt;a class=&quot;_58cn&quot; href=&quot;https://www.facebook.com/hashtag/mix_network?source=feed_text&amp;amp;epa=HASHTAG&amp;amp;__xts__%5B0%5D=68.ARC6bPBXTq8ez5Iz0rsYVT3PuwRMXp-aKDQqJLViDQPZ6icfWCeAZ1kmBtq0oH64CJwMV4YlwGaXk3CRfloaUJwkAttWHUSHVQRQU4ICiT_PsJ-TxuQzSjeslGkXWRVoOca-lLBNhBa35Y8TODbjckQBz2Vg5xxG3pMqF1Qoon3LkWZqsScWfXNLpqBRM02Obl4_JNxS_oI02BQx3wpvr7_df8lfb83WycTQDfVtlowVgstiuWIESwSr39wQ5BN_Z96SO0VNSpVuYCnj2qsXHWsdofSCRQGB1QlENI5F-pRQPVYcTzxnluXS4Vh0C0dk4T_gFR4&amp;amp;__tn__=%2ANK-R&quot; data-ft=&quot;{&amp;quot;type&amp;quot;:104,&amp;quot;tn&amp;quot;:&amp;quot;*N&amp;quot;}&quot; data-mce-href=&quot;https://www.facebook.com/hashtag/mix_network?source=feed_text&amp;amp;epa=HASHTAG&amp;amp;__xts__%5B0%5D=68.ARC6bPBXTq8ez5Iz0rsYVT3PuwRMXp-aKDQqJLViDQPZ6icfWCeAZ1kmBtq0oH64CJwMV4YlwGaXk3CRfloaUJwkAttWHUSHVQRQU4ICiT_PsJ-TxuQzSjeslGkXWRVoOca-lLBNhBa35Y8TODbjckQBz2Vg5xxG3pMqF1Qoon3LkWZqsScWfXNLpqBRM02Obl4_JNxS_oI02BQx3wpvr7_df8lfb83WycTQDfVtlowVgstiuWIESwSr39wQ5BN_Z96SO0VNSpVuYCnj2qsXHWsdofSCRQGB1QlENI5F-pRQPVYcTzxnluXS4Vh0C0dk4T_gFR4&amp;amp;__tn__=%2ANK-R&quot;&gt;&lt;span class=&quot;_5afx&quot;&gt;&lt;span class=&quot;_58cl _5afz&quot; aria-label=&quot;hashtag&quot;&gt;#&lt;/span&gt;&lt;span class=&quot;_58cm&quot;&gt;Mix_Network&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;_3x-2&quot; data-ft=&quot;{&amp;quot;tn&amp;quot;:&amp;quot;H&amp;quot;}&quot;&gt;&lt;div data-ft=&quot;{&amp;quot;tn&amp;quot;:&amp;quot;H&amp;quot;}&quot;&gt;&lt;div class=&quot;mtm&quot;&gt;&lt;div&gt;&lt;div class=&quot;_5cq3 _1ktf&quot; data-ft=&quot;{&amp;quot;tn&amp;quot;:&amp;quot;E&amp;quot;}&quot;&gt;&lt;br data-mce-bogus=&quot;1&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 'mixplay,kurdish,video,sharing,website', '1553080710', 1, '1', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `video_res` varchar(20) NOT NULL DEFAULT '',
  `processing` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `video_id` int(15) NOT NULL DEFAULT 0,
  `article_id` int(15) NOT NULL DEFAULT 0,
  `ad_id` int(15) NOT NULL DEFAULT 0,
  `comment_id` int(20) NOT NULL DEFAULT 0,
  `reply_id` int(25) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text DEFAULT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT 0,
  `type` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_videos`
--

CREATE TABLE `saved_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `time`) VALUES
(5, '72bf6ce92f363e9a912d38208355efe71d8f9cdc15507940252eb1d42172db54f24fe1108d4eb61c1d', 4, 'web', 1550794025),
(6, '2bd4bd6ea9b41862ea6af97937ff87b2aba10fc61550842158e4bf381cd640b3ddde311bda27aae4b7', 5, 'web', 1550842158),
(7, 'd36e2a6f93443f1ab33321474ce072a6397abc16155084316047159790703bb354de0b6b48a9c07875', 1, 'web', 1550843160),
(8, '261de52d0f0ca137e21f0a100c3da99c749a6e771550867011efa9ff5a8dea6de3e944596b5d957527', 5, 'web', 1550867011),
(9, '7a2d9adaa1d27514f286b37b12deb5f3e27c574b1551039057ce15903d062034f9033d40bfb58b891f', 5, 'web', 1551039057),
(12, '905e042c5d801285693a045df64b20b24034645015511353839ac984ac84c86d9a066d84b87c12f60b', 1, 'web', 1551135383),
(20, 'e540ed597ed603398fe0c2041b43bbf49a6c61911551224218b869e4ae3282eb7e514fb3898500d111', 9, 'web', 1551224218),
(21, '32aff1e0a1ef7549575ce539b4d1c9b36ce6e8171551224555298de5485daac6f0f010e782cd75f3a0', 9, 'web', 1551224555),
(22, '8bf6f70b60e5b0b45745df49def70abe4a9aaf1e155124503836717108442ff94e8e217071ffc1effb', 1, 'web', 1551245038),
(23, 'f402188b389ee219c250bbc700f63b7eeb0232dd1551300707fbaefe51f70b63483beebbd6864b88e7', 5, 'web', 1551300707),
(24, 'f116eec76f790f72228a9b11caf9aef70a6c7eba15515127825a0bfe0490fef613a3cf6360162a6591', 2, 'web', 1551512782),
(26, 'bafb2851bd2ec24a9ecb7f30a5ae84a8084a7cf115517103593b7a0144578605cc0a2ba2ced08087ff', 10, 'web', 1551710359),
(27, 'fccfe4cba533150dbbf2a3f84ddec47eb73a938515517109155e41bcbf6c60931153ad46aff483309c', 5, 'web', 1551710915),
(28, 'edb9cbe0bc232ae6ec219fefcf57dfbf0adaec8a1551772301d7de6c84ce7c4dcca1f24fc240fda4cd', 11, 'web', 1551772301),
(29, 'd508e1f95edc2ac5d977732108d4ca131447077915517755802d18bb117c58a98719262db89d006bd3', 11, 'web', 1551775580),
(30, 'ec663b90854398b9da1b61517974a749815b50601551777652014ce2693801ce3388d1953b4e74064b', 12, 'web', 1551777652),
(31, '11a0e9d92b553a1f99211fea8259cecf397c1ad61551810853f056d0345d4baaab56cd28d482b86f94', 13, 'web', 1551810853),
(32, '631775c9ef0975190f0cf1a0d4ae898c604645f31552135225d28b91eb150592a9c3a1a0f662aefb40', 5, 'web', 1552135225),
(33, 'd33d053ac6430fcaafaf0a49d69014b4268de0891552139248da37e5344d4a42f5dce2ec86d24d0817', 14, 'web', 1552139248),
(35, 'aed40f60390818c04fcf64817ec84f96724482781552167921763b15d13547798838a54df24b83fb22', 15, 'web', 1552167921),
(36, '6d9861d17bd08c494c022139005d860dc21a785e155216802052a74a7ff9915ce1a1e88cc12521d02e', 1, 'web', 1552168020),
(37, '250b7cb961c587bb3d6cca8df93d78d0b597e2ab1552495147efcfe358aef0e5356aabbab666e35c7d', 1, 'web', 1552495147),
(38, 'b67f822edf38ba91fc1545aefc323b783ef64d9e1552569730dd353277fdd933326924df701d1c7a43', 8, 'web', 1552569730),
(39, 'd5b9dc84354cc73a5992fbf58338dd8fde133ad21552570733f6cbcc0de76dadbd7f6c3262815a656a', 8, 'phone', 1552570733),
(40, 'd5b9dc84354cc73a5992fbf58338dd8fde133ad21552570733f6cbcc0de76dadbd7f6c3262815a656a', 8, 'web', 1552570733),
(41, '7c2c0d8c0664dd1f9f8311d261633088272b3ad81552596863c649b9ea0044978de3ace4987b838f24', 16, 'phone', 1552596863),
(42, '7c2c0d8c0664dd1f9f8311d261633088272b3ad81552596863c649b9ea0044978de3ace4987b838f24', 16, 'web', 1552596863),
(44, 'e41091852f2b296ba4c076a53c51979abfc4bfc91552726691d50c204c581246971d380f776ea74e8e', 5, 'phone', 1552726691),
(45, 'e41091852f2b296ba4c076a53c51979abfc4bfc91552726691d50c204c581246971d380f776ea74e8e', 5, 'web', 1552726691),
(46, '3c3d4ac0608e1c36666a23fbc4795e1d11e682fc155273942232b63ca6ee0de2c4df18d2c813d07d6e', 1, 'web', 1552739422),
(47, '884556be30cc66846fd0a4cd41d0488d1811e6c71552743031afb8ea3f6cdbfb58deefe205ad31fa52', 5, 'web', 1552743031),
(48, '6fb41ee1058719baaa69a9da1b3c5e4d55994bf01552767658790abffe9884726fb5d695d1ddc3b63f', 17, 'phone', 1552767658),
(49, '6fb41ee1058719baaa69a9da1b3c5e4d55994bf01552767658790abffe9884726fb5d695d1ddc3b63f', 17, 'web', 1552767658),
(50, '9895c31cbf3ff66a3c5827f2de78a5d194702bec15527701518863f6c4aace55cea71988527d627e27', 18, 'phone', 1552770151),
(51, '9895c31cbf3ff66a3c5827f2de78a5d194702bec15527701518863f6c4aace55cea71988527d627e27', 18, 'web', 1552770151),
(52, '1ce92197d5150f18368defb9459b35e8e9017cd61552825997c9312d3c71aa4c28223d53658bdced5f', 5, 'web', 1552825997),
(53, 'd77b95cb95d7627eaa1a224f535c9963e0a76ac31552842555ce9ea792a02f75eac9b2a65237f77822', 2, 'web', 1552842555),
(54, '57cf00d88fa48f067620ef9eaf06d4f705d0e9d815528489503e8c42c494960f7ff429b40b97f1e780', 2, 'phone', 1552848950),
(55, '57cf00d88fa48f067620ef9eaf06d4f705d0e9d815528489503e8c42c494960f7ff429b40b97f1e780', 2, 'web', 1552848950),
(57, '5b7e9c6810e78c7e69cb74e2f50c0b8d584afda51553043892baa2096d65b78457571bdaae3cf8615b', 6, 'web', 1553043892),
(58, '81644f879b3a52c9281e3c75670f5e2639379fe31553045750eb771dff38b42e4c5435bf6164c6bd47', 19, 'web', 1553045750);

-- --------------------------------------------------------

--
-- Table structure for table `site_ads`
--

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_ads`
--

INSERT INTO `site_ads` (`id`, `placement`, `code`, `active`) VALUES
(1, 'header', '', 0),
(2, 'footer', '', 0),
(3, 'watch_side_bar', '', 0),
(4, 'watch_comments', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `subscriber_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `subscriber_id`, `time`, `active`) VALUES
(1, 1, 2, 1550747514, 1),
(2, 1, 3, 1550759638, 1),
(3, 3, 1, 1550799542, 1),
(4, 1, 4, 1550799989, 1),
(5, 4, 1, 1550800006, 1),
(7, 5, 1, 1551081106, 1),
(8, 1, 5, 1551085913, 1),
(10, 6, 1, 1551135896, 1),
(11, 5, 6, 1551192514, 1),
(12, 2, 5, 1551211058, 1),
(13, 5, 9, 1551224241, 1),
(14, 1, 9, 1551224279, 1),
(15, 5, 10, 1551710444, 1),
(16, 10, 5, 1551710924, 1),
(17, 4, 10, 1551711476, 1),
(19, 5, 11, 1551773218, 1),
(21, 1, 13, 1551888042, 1),
(22, 5, 13, 1551888047, 1),
(23, 13, 5, 1551899927, 1),
(24, 1, 15, 1552167934, 1),
(25, 5, 16, 1552599702, 1),
(27, 5, 2, 1552851698, 1),
(28, 1, 6, 1553043918, 1),
(29, 4, 6, 1553043968, 1);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `type` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `type`, `text`) VALUES
(1, 'terms_of_use', '&lt;h4&gt;1- Write your Terms Of Use here.&lt;/h4&gt;           &lt;br&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis sdnostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          &lt;br&gt;&lt;br&gt;          &lt;h4&gt;2- Random title&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(2, 'privacy_policy', '&lt;h2&gt;Who we are?&lt;/h2&gt;Provide name and contact details of the data controller. This will typically be your business or you, if you are a sole trader. Where applicable, you should include the identity and contact details of the controller’s representative and/or the data protection officer.   &lt;br&gt;&lt;h2&gt;What information do we collect?&lt;/h2&gt; Specify the types of personal information you collect, eg names, addresses, user names, etc. You should include specific details on: &lt;br&gt;how you collect data (eg when a user registers, purchases or uses your services, completes a contact form, signs up to a newsletter, etc)  &lt;br&gt;what specific data you collect through each of the data collection method &lt;br&gt;if you collect data from third parties, you must specify categories of data and source &lt;br&gt;if you process sensitive personal data or financial information, and how you handle this  &lt;br&gt;&lt;br&gt;You may want to provide the user with relevant definitions in relation to personal data and sensitive personal data.  &lt;br&gt;&lt;br&gt;&lt;h2&gt;How do we use personal information?&lt;/h2&gt;Describe in detail all the service- and business-related purposes for which you will process data. For example, this may include things like: &lt;br&gt;personalisation of content, business information or user experience &lt;br&gt;account set up and administration &lt;br&gt;delivering marketing and events communication &lt;br&gt;carrying out polls and surveys &lt;br&gt;internal research and development purposes &lt;br&gt;providing goods and services &lt;br&gt;legal obligations (eg prevention of fraud) &lt;br&gt;meeting internal audit requirements &lt;br&gt;&lt;br&gt;Please note this list is not exhaustive. You will need to record all purposes for which you process personal data.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;What legal basis do we have for processing your personal data?&lt;/h2&gt;Describe the relevant processing conditions contained within the GDPR. There are six possible legal grounds:  &lt;br&gt;consent &lt;br&gt;contract &lt;br&gt;legitimate interests &lt;br&gt;vital interests &lt;br&gt;public task  &lt;br&gt;legal obligation &lt;br&gt;&lt;br&gt;Provide detailed information on all grounds that apply to your processing, and why. If you rely on consent, explain how individuals can withdraw and manage their consent. If you rely on legitimate interests, explain clearly what these are. &lt;br&gt; &lt;br&gt;If you’re processing special category personal data, you will have to satisfy at least one of the six processing conditions, as well as additional requirements for processing under the GDPR. Provide information on all additional grounds that apply.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;When do we share personal data?&lt;/h2&gt;Explain that you will treat personal data confidentially and describe the circumstances when you might disclose or share it. Eg, when necessary to provide your services or conduct your business operations, as outlined in your purposes for processing. You should provide information on: &lt;br&gt;how you will share the data &lt;br&gt;what safeguards you will have in place &lt;br&gt;what parties you may share the data with and why &lt;br&gt; &lt;br&gt;&lt;h2&gt;Where do we store and process personal data?&lt;/h2&gt; If applicable, explain if you intend to store and process data outside of the data subject’s home country. Outline the steps you will take to ensure the data is processed according to your privacy policy and the applicable law of the country where data is located. &lt;br&gt; &lt;br&gt;If you transfer data outside the European Economic Area, outline the measures you will put in place to provide an appropriate level of data privacy protection. Eg contractual clauses, data transfer agreements, etc. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How do we secure personal data?&lt;/h2&gt; Describe your approach to data security and the technologies and procedures you use to protect personal information. For example, these may be measures: &lt;br&gt;to protect data against accidental loss &lt;br&gt;to prevent unauthorised access, use, destruction or disclosure &lt;br&gt;to ensure business continuity and disaster recovery &lt;br&gt;to restrict access to personal information &lt;br&gt;to conduct privacy impact assessments in accordance with the law and your business policies &lt;br&gt;to train staff and contractors on data security &lt;br&gt;to manage third party risks, through use of contracts and security reviews &lt;br&gt; &lt;br&gt;Please note this list is not exhaustive. You should record all mechanisms you rely on to protect personal data. You should also state if your organisation adheres to certain accepted standards or regulatory requirements. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How long do we keep your personal data for?&lt;/h2&gt; &lt;br&gt;Provide specific information on the length of time you will keep the information for in relation to each processing purpose. The GDPR requires you to retain data for no longer than reasonably necessary. Include details of your data or records retention schedules, or link to additional resources where these are published. &lt;br&gt; &lt;br&gt;If you cannot state a specific period, you need to set out the criteria you will apply to determine how long to keep the data for (eg local laws, contractual obligations, etc) &lt;br&gt; &lt;br&gt;You should also outline how you securely dispose of data after you no longer need it. &lt;br&gt;&lt;br&gt;&lt;h2&gt;Your rights in relation to personal data&lt;/h2&gt; Under the GDPR, you must respect the right of data subjects to access and control their personal data. In your privacy notice, you must outline their rights in respect of: &lt;br&gt;access to personal information  &lt;br&gt;correction and deletion &lt;br&gt;withdrawal of consent (if processing data on condition of consent) &lt;br&gt;data portability &lt;br&gt;restriction of processing and objection &lt;br&gt;lodging a complaint with the Information Commissioner’s Office &lt;br&gt; &lt;br&gt;You should explain how individuals can exercise their rights, and how you plan to respond to subject data requests. State if any relevant exemptions may apply and set out any identity verification procedures you may rely on. &lt;br&gt; &lt;br&gt;Include details of the circumstances where data subject rights may be limited, eg if fulfilling the data subject request may expose personal data about another person, or if you’re asked to delete data which you are required to keep by law.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of automated decision-making and profiling&lt;/h2&gt; Where you use profiling or other automated decision-making, you must disclose this in your privacy policy. In such cases, you must provide details on existence of any automated decision-making, together with information about the logic involved, and the likely significance and consequences of the processing of the individual. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How to contact us?&lt;/h2&gt; Explain how data subject can get in touch if they have questions or concerns about your privacy practices, their personal information, or if they wish to file a complaint. Describe all ways in which they can contact you – eg online, by email or postal mail. &lt;br&gt;&gt; &lt;br&gt;If applicable, you may also include information on: &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of cookies and other technologies&lt;/h2&gt; You may include a link to further information, or describe within the policy if you intend to set and use cookies, tracking and similar technologies to store and manage user preferences on your website, advertise, enable content or otherwise analyse user and usage data. Provide information on what types of cookies and technologies you use, why you use them and how an individual can control and manage them. &lt;br&gt; &lt;br&gt;Linking to other websites / third party content &lt;br&gt;If you link to external sites and resources from your website, be specific on whether this constitutes endorsement, and if you take any responsibility for the content (or information contained within) any linked website. &lt;br&gt;&lt;br&gt;You may wish to consider adding other optional clauses to your privacy policy, depending on your business’ circumstances.'),
(3, 'about', '&lt;h4&gt;1- Write about your website here.&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          &lt;br&gt;&lt;br&gt;          &lt;h4&gt;2- Random title&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dxzcolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `typings`
--

CREATE TABLE `typings` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `device_id` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT 'english',
  `avatar` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `src` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT 0,
  `age` int(11) NOT NULL DEFAULT 0,
  `about` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0,
  `last_active` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `is_pro` int(11) NOT NULL DEFAULT 0,
  `imports` int(11) NOT NULL DEFAULT 0,
  `uploads` int(11) NOT NULL DEFAULT 0,
  `wallet` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `balance` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `video_mon` int(10) NOT NULL DEFAULT 0,
  `age_changed` int(11) NOT NULL DEFAULT 0,
  `donation_paypal_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_upload_limit` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `two_factor` int(11) NOT NULL DEFAULT 0,
  `last_month` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `ip_address`, `password`, `first_name`, `last_name`, `gender`, `email_code`, `device_id`, `language`, `avatar`, `cover`, `src`, `country_id`, `age`, `about`, `google`, `facebook`, `twitter`, `instagram`, `active`, `admin`, `verified`, `last_active`, `registered`, `is_pro`, `imports`, `uploads`, `wallet`, `balance`, `video_mon`, `age_changed`, `donation_paypal_email`, `user_upload_limit`, `two_factor`, `last_month`) VALUES
(1, 'Shalawkoy', 'shalawkoyy@gmail.com', '103.81.182.188', 'c8906eec0cd714244f7d89b618e36a304962240e', 'Shalaw', 'koy', 'male', '', '', 'kurdish', 'upload/photos/2019/02/l3Pdw42XrWrK1hCDgmxM_20_8082e30106917e606d381cb66fc27648_image.jpg', 'upload/photos/2019/02/JUstHaGyTu1Uh18kTlbX_20_49eff23cab189945474092f88e0859ad_image.png', '', 102, 22, 'Web Designer&amp; Web Developer&amp; Programmer  <br>CEO &amp; Founder &amp; Owner MixPlay <br>CEO &amp; Founder &amp; Owner TorMix Net  <br>CTO at Scientific Level Company  <br>CTO at Collins International Institute-Erbil  <br>Former CEO at Shalaw IT  <br>Former Owner at It Center Soran  <br>Former Accountant &amp; Cashier at Golden Market  <br>i ❤ my Computer  <br>Unforgettable date 11\\8', 'Shalawkoy', 'shalawkoy.me', 'Shalawkoy', 'Shalawkoy', 1, 1, 1, 1553112719, '00/0000', 1, 3, 12666562, '5000', '5000', 0, 0, 'shalawkoyy@gmail.com', 'unlimited', 0, NULL),
(2, 'FarmanSmaquly', 'farmansmaquly@gmail.com', '130.193.234.91', '29e74ef759368a2af01cd3832757d19f49b4b8c7', 'farman', 'smaquly', 'male', '126bb0af03f309ea94eb1b69c434bfa0ab1f70c9', 'fc156151-c8f5-4356-8507-986c4918a75b', 'kurdish', 'upload/photos/2019/03/nODAIQkebXotCP48v16Q_01_2312e74a5f03e1f8ada2bf345c9c7e09_image.jpg', 'upload/photos/2019/03/FFr2TaYLckgAThPjsEfz_01_2312e74a5f03e1f8ada2bf345c9c7e09_image.jpg', '', 102, 0, '', 'https://plus.google.com/u/0/+FarmanSmaquly', 'https://www.facebook.com/FarmanSmaquly', 'https://twitter.com/Farman_Smaquly', 'https://www.instagram.com/farmansmaquly/', 1, 0, 1, 1552981831, '2019/2', 1, 0, 24280095, '0', '0', 0, 0, '', '1000000000', 0, NULL),
(3, 'Barzy', 'barzy@gmail.com', '130.193.255.168', '1f4a04e5543d8760660bb080226040b987b88d47', '', '', 'male', '8050539676d5edf557fda01de4588170d8d69699', '', 'kurdish', 'upload/photos/d-avatar.jpg', 'upload/photos/d-cover.jpg', '', 0, 0, NULL, '', '', '', '', 1, 0, 0, 1550843125, '2019/2', 0, 0, 0, '0', '0', 0, 0, '', '0', 0, NULL),
(4, 'SK_Music', 'redwan@gmail.com', '130.193.239.193', '1f4a04e5543d8760660bb080226040b987b88d47', 'SK', 'Music', 'male', 'bf585581203bce9c9bb8cf633588cf3483169b72', '', 'kurdish', 'upload/photos/2019/02/Oon1LQybVb2EEXIVAlZV_22_63028f3192c16b77a1cf72d1fe39de98_image.jpg', 'upload/photos/2019/02/GgkhjeA8mMjfp1vtdfKo_22_92bdc0c394187adaccfc57a9ed233eb8_image.jpg', '', 0, 25, 'SK MUSIC First MixPlay Channel', '', '', '', '', 1, 0, 0, 1550799983, '2019/2', 1, 16, 0, '0', '0', 0, 0, 'skmusic@gmail.com', 'unlimited', 0, NULL),
(5, 'ehsan_tech', 'ehsan@tormix.net', '159.255.162.2', '0203684055051bec20938455c2915f2ba7d9a746', 'Ehsan', 'IT', 'male', 'c659b1f1c8c2b1f8f8fe7edcbec3a3be', '309c6dae-5426-40c9-bc0c-63b8fb1594e4', 'kurdish_badini', 'upload/photos/2019/03/AdivONObRL8rptipvXWy_16_ac354e827d66d7f6bfd01312db83f4b9_image.jpeg', 'upload/photos/2019/02/jE1HPySc2vSUGR2XAwl6_23_efe6a5e3d4589d79278da297a79cfd21_image.jpg', '', 102, 17, 'I´M Moderator at tormix.net &amp;amp; Admin at department Badini &amp;amp; Persian &amp;amp; Admin at socials media TorMix &amp;amp; I´M Writer At Organization TechEye, &lt;br&gt; TorMix The best and largest social network on kurdistan &amp;amp; iraq', '', 'http://www.facebook.com/ehsan01IT/', 'http://www.twitter.com/IT_Frame1/', 'http://www.instagram.com/ehsan_tech1/', 1, 1, 1, 1553100883, '2019/2', 1, 17, 624053527, '0', '0', 0, 0, '', 'unlimited', 0, NULL),
(13, 'Aroo_music', 'hallogiyan098@gmail.com', '159.255.162.2', '3566647d7b18c5545e2a749345cdfbce8730e4bb', '', '', 'male', 'a04ae2e4823486bc65d0f85bf05bddecbbeeab92', '', 'kurdish', 'upload/photos/2019/03/zZASyjiJUaEJdBEpvGyb_05_cfdac1922b66128869d1ca5a8d9a586e_image.jpg', 'upload/photos/d-cover.jpg', '', 0, 0, NULL, '', '', '', '', 1, 0, 0, 1552325564, '2019/3', 0, 0, 1219223, '0', '0', 0, 0, '', '0', 0, NULL),
(18, 'gashbin', 'gashbinmhamad740@gmail.com', '', '4555f6cbe7c0275206b51d0619f66fb395ee33f8', '', '', 'male', 'e1951a0b5e271b6f5fafb8e75828669673d76be6', '1fd2362d-0b3a-4e83-b744-6c2fe52bcc8a', 'english', 'upload/photos/d-avatar.jpg', 'upload/photos/d-cover.jpg', '', 0, 0, NULL, '', '', '', '', 1, 0, 0, 1552770151, '2019/3', 0, 0, 0, '0', '0', 0, 0, '', '0', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_ads`
--

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT 0,
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT 1,
  `audience` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_ads`
--

INSERT INTO `user_ads` (`id`, `name`, `results`, `spent`, `status`, `audience`, `category`, `media`, `url`, `user_id`, `placement`, `posted`, `headline`, `description`, `location`, `type`) VALUES
(1, 'TorMix', 0, '0', 1, '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,238,239,240,241,242', 'video', 'upload/videos/2019/03/JtOUnQX3ehJq3yY7ZuYI_20_b1e7fceb0db252c088a36990508d17f0_video.mp4', 'https%3A%2F%2Ftormix.net', 1, '1', '1553043089', 'First Kurdish Social netwrk', 'TorMix First and biggest Kurdish Social network', '', '1'),
(2, 'TorMix', 0, '0', 1, '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,238,239,240,241,242', 'image', 'upload/photos/2019/03/x72FYg4EeqL6ljA4Iibg_20_805eb231ccbae7a59def9db7838b46c2_image.jpg', 'https%3A%2F%2Ftormix.net', 1, '2', '1553043275', 'Join TorMix Now !', 'TorMix First and biggest Kurdish Social Network !', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `usr_prof_fields`
--

CREATE TABLE `usr_prof_fields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `fid_2` varchar(32) NOT NULL DEFAULT '',
  `fid_3` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `verification_requests`
--

CREATE TABLE `verification_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(200) NOT NULL DEFAULT '',
  `message` text DEFAULT NULL,
  `media_file` text DEFAULT NULL,
  `time` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `short_id` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/thumbnail.jpg',
  `video_location` varchar(3000) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `youtube` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `vimeo` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `daily` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(100) NOT NULL DEFAULT '',
  `twitch` varchar(100) NOT NULL DEFAULT '',
  `twitch_type` varchar(50) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `time_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` int(11) NOT NULL DEFAULT 0,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(33) CHARACTER SET latin1 NOT NULL DEFAULT '00:00',
  `size` int(50) NOT NULL DEFAULT 0,
  `converted` int(5) NOT NULL DEFAULT 1,
  `category_id` varchar(100) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 0,
  `registered` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `privacy` int(11) NOT NULL DEFAULT 0,
  `age_restriction` int(11) NOT NULL DEFAULT 1,
  `type` varchar(100) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT 1,
  `240p` int(11) NOT NULL DEFAULT 0,
  `360p` int(11) NOT NULL DEFAULT 0,
  `480p` int(11) NOT NULL DEFAULT 0,
  `720p` int(11) NOT NULL DEFAULT 0,
  `1080p` int(11) NOT NULL DEFAULT 0,
  `2048p` int(11) NOT NULL DEFAULT 0,
  `4096p` int(11) NOT NULL DEFAULT 0,
  `sell_video` int(11) NOT NULL DEFAULT 0,
  `sub_category` varchar(100) NOT NULL DEFAULT '',
  `geo_blocking` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `user_id`, `short_id`, `title`, `description`, `thumbnail`, `video_location`, `youtube`, `vimeo`, `daily`, `facebook`, `twitch`, `twitch_type`, `time`, `time_date`, `active`, `tags`, `duration`, `size`, `converted`, `category_id`, `views`, `featured`, `registered`, `privacy`, `age_restriction`, `type`, `approved`, `240p`, `360p`, `480p`, `720p`, `1080p`, `2048p`, `4096p`, `sell_video`, `sub_category`, `geo_blocking`) VALUES
(567, '18pkPjo1oeZtzDl', 4, 'O7tARR', 'یەک ملیۆن.. ئۆژین نەوزاد ئەوینی تۆ - Ozhin Nawzad Awiny To', 'سەبسکرایبی چەناڵی نێت تیڤی بکەن لەیوتیوب بۆ ئەوەی خۆشترین پرۆگرام و گۆرانی ببینن <br>[a]www.youtube.com%2FNETTVKurd[/a] <br> <br>All rights reserved please don&#039;t re-upload our videos <br>مافی ئەم بەرهەمە بۆ نێت تیڤی پارێزراوە <br> <br>ئەم ڤیدیۆیە لای خۆت شەیر بکە <br>[a]https%3A%2F%2Fyoutu.be%2FbkrXWgD3TU0[/a] <br> <br>#NETTV', 'https://i.ytimg.com/vi/bkrXWgD3TU0/maxresdefault.jpg', '', 'bkrXWgD3TU0', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'nettv,netgram,koshki net,evin jin u jyan,avin aso,evin aso,sozan kamal,soran ismail,shvan hakim axa,aramo medya,shajwani kurdistan', '00:04:02', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(568, 'fcIi9Kyfd9at49z', 4, 'rzbHGv', 'Ozhin Nawzad Track1 ( Yaxwa Kwerbe Dw chawm ) Ga3day Ozhany Dalak', '', 'https://i.ytimg.com/vi/eDgvUjLHpUc/maxresdefault.jpg', '', 'eDgvUjLHpUc', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,nechyr,baghdadi,shirwan,abdulla,hiwa', '00:17:15', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(569, 'LsXrX4Luz2l4wng', 4, 'DJotjI', 'PUBG 34 KILLS Ozhin Nawzad Basi  Pubgy ئۆژین نەوزاد باسی یاری پەبگی34  Pubge  Kills World Reckord', '', 'https://i.ytimg.com/vi/oNLjKQnYYas/mqdefault.jpg', '', 'oNLjKQnYYas', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:12:48', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(570, 'ELjnKSpNC5lHabc', 4, 'kRS9Yt', 'ozhin nawzad w saywan xamzay (dakutin) 2017 new new', '2017', 'https://i.ytimg.com/vi/keP0RRWK2DQ/mqdefault.jpg', '', 'keP0RRWK2DQ', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:08:42', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(571, 'geCyBroQprIb9fu', 4, 'NOFJfk', 'Ozhin Nawzad (Base Roshtnakai) Danishtni Dabani Aqid Sardar - Track 1 - ARO', '- زۆر سوپاستان ده‌كه‌ین بۆ سه‌یركردنى ڤیدیۆكان  <br>- لایك و سه‌بسكرایب له‌ بیر مه‌كه‌ن بۆ بینینى به‌رهه‌م و ڤیدیۆى جوانتر <br>- ( تكایه‌ ئاگادار به‌ , به‌ دوباره‌ ئه‌پلۆد كردنى هه‌ر یه‌كیك له‌ ڤیدیۆكانم ئه‌وا كۆپى-ڕایت دێته‌ سه‌ر چه‌ناڵه‌كه‌ت', 'https://i.ytimg.com/vi/BJxVEDsK_-g/maxresdefault.jpg', '', 'BJxVEDsK_-g', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'ARO', '00:18:51', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(572, 'VTDQpBp3wB5lACL', 4, 'D6cKw8', 'ozhin nawzad zor twra bw la saf saf bazmy nayawa', '', 'https://i.ytimg.com/vi/xCBGmH_BqAA/mqdefault.jpg', '', 'xCBGmH_BqAA', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:03:04', 0, 1, '3', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(573, 'H36Wzo48hpWwyBE', 4, 'KqhtSL', 'Ozhin Nawzad ( Arabi + Badini Fwl Jawww ) Salyadi Baban - Track1', 'Taybat Ba #GOVARHENRY', 'https://i.ytimg.com/vi/MoceL4URQNQ/maxresdefault.jpg', '', 'MoceL4URQNQ', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,abdulla,hiwa,iraqi,barxa,nrt2', '00:10:56', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(574, '6caGEuOXwzLOZcL', 4, '2Bsdn4', 'Ozhin nawzad 2018 nawe kchan awazi taza', 'سبسکرابی چەنالەکە بکەن', 'https://i.ytimg.com/vi/Hq-DPM7HQ5I/mqdefault.jpg', '', 'Hq-DPM7HQ5I', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:12:05', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(575, 'SAZgTXT8fsZw3jj', 4, 'rVc5Gb', 'Ozhin nawzad mn baqad arzu asman bere yarekonakam', '', 'https://i.ytimg.com/vi/iNRLOHrGkzo/mqdefault.jpg', '', 'iNRLOHrGkzo', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:14:52', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(576, 'D2QOYlGvu8fpUC8', 4, '2anIPA', 'Ozhin Nawzad 2017 Track2 Ay Xwda Xafatbarm - Ga3day Hamay Hersh u Kozhin Xala Baxtyar', 'Snapchat  <br>[a]https%3A%2F%2Fwww.snapchat.com%2Fadd%2Fgovarhenry[/a]', 'https://i.ytimg.com/vi/_MCrfb4KXmw/maxresdefault.jpg', '', '_MCrfb4KXmw', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,shirwan,abdulla,hiwa', '00:13:30', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(577, 'ltfmCl678lAutsc', 4, 'upwpC2', 'Ozhin Nawzad 03 ( Lot Namaym u Lot Namaym ) Ga3day Shex Aro 7', '', 'https://i.ytimg.com/vi/3iPCXhQcS90/mqdefault.jpg', '', '3iPCXhQcS90', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,iraqi,ay law barxa,mnafasa,tabaqa,toni,barz', '00:09:21', 0, 1, '3', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(578, 'xQ4GEcXdYi5SPjF', 4, 'eexvEC', 'ئوزین نەوزاد خەفەتبارم ئەو کاتەی کەمن توم بیر دیتەوە 2019 ozhin nawzad shaze awaz', '', 'https://i.ytimg.com/vi/RrMgTinBXQE/mqdefault.jpg', '', 'RrMgTinBXQE', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:03:22', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(579, 'VvIFKwPk6AzMY1h', 4, '1sAOjo', 'Ozhin Nawzad 03 ( Mwalidi Kchan 1990 - 2002 ) Ga3day Hamay Aras', '', 'https://i.ytimg.com/vi/H69a1CW7IR8/maxresdefault.jpg', '', 'H69a1CW7IR8', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,iraqi,mnafasa,tabaqa,toni,barz,axr ton', '00:04:45', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2103, 'ZTxgfdXtB7ep7EM', 5, 'TuOOq9', 'Who Am I - No System Is Safe', 'Film Name: Who Am I  <br>Subject: No System Is Safe', 'https://i.ytimg.com/vi/wh2Ej4c4odE/mqdefault.jpg', '', 'wh2Ej4c4odE', '', '', '', '', '', 1552991498, '2019-03-19 10:31:38', 0, 'Who Am I,Hacker,system,Security', '01:41:48', 0, 1, '1', 32, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2104, 'oLGSEmdIh1OllgW', 5, 'sF5Soz', 'چۆن بزانین ئەو لینکەی کە بۆت دێت لینکی هاکە یان لینکێکی پاکە', 'خۆپاراستن', 'https://i.ytimg.com/vi/GiNMc2hVVPs/mqdefault.jpg', '', 'GiNMc2hVVPs', '', '', '', '', '', 1552992540, '2019-03-19 10:49:00', 0, 'Link HACKED,Link HACKED', '00:04:17', 0, 1, '12', 16, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(2105, 'hdtzQn5YSxlc8ET', 5, 'NrQYLL', 'خۆشترین گۆرانی فارسی مادر | ژێرنووس کراو', 'گۆرانی: دایە <br>ژێرنوس: کوردی <br>دیزاین: احسان فەرامەرز <br>مافی پارێزراو : MixPlay - Ehsan_Tech©', 'https://i.ytimg.com/vi/w8Jtj9Ihugs/mqdefault.jpg', '', 'w8Jtj9Ihugs', '', '', '', '', '', 1552992650, '2019-03-19 10:50:50', 0, '#Mother', '00:02:58', 0, 1, '3', 28, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2106, 'uF5xUzyhIMWkQon', 5, 'Tbg9yx', 'چۆنیەتی بڵۆک کردنی پەیوەندی و مەسێجە بێزارکەرەکان بەبێ ئەوەی وەحدەت لێ بڕوات!!!....', 'چۆنیەتی سڕکردنی پەیوەندی و مەسجە بێزارکەرەکان بەبێ ئەوەی وەحدەت لێ بڕوات. <br> <br>مافی پارێزراو: © TechEye.Org', 'https://i.ytimg.com/vi/_zb_r77hXNQ/maxresdefault.jpg', '', '_zb_r77hXNQ', '', '', '', '', '', 1552992882, '2019-03-19 10:54:42', 0, 'Blocked phone namber', '00:02:24', 0, 1, '12', 25, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2107, 'N6CSMuRPaMCmQGY', 5, 'arvuGP', 'بەرلەوەی کەسێک بڕواتە ناو ئەکاونتی فەیسبوکەکەت نامەیەک لە Messenger ەکەت ئاگادارت بکاتەوە؟ بینەربە!!', 'بەرلەوەی هاک بکێی خۆتی بۆ ئامادە بکە <br>[a]WWW.WorldITFrame.Tk[/a]', 'https://i.ytimg.com/vi/t-DDTB-PfGM/mqdefault.jpg', '', 't-DDTB-PfGM', '', '', '', '', '', 1552993067, '2019-03-19 10:57:47', 0, 'Security', '00:02:32', 0, 1, '12', 15, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2108, 'XcBuedhL2hjPwaq', 5, 'mRec3b', 'کۆنێکت کردنی دەسکی XBOX 306 بە مۆبایلەکەتەوە', 'لینکی سەرچاوەی ڤیدیۆکە↙  <br>[a]https%3A%2F%2Fyoutu.be%2FlrZ-xnzYVLA[/a]  <br>  <br>  <br>بە هیوای ســـــــــــــــوود  <br>لایک و سبسکرایب لەبیر مەکەن', 'https://i.ytimg.com/vi/15JfoLMpHik/maxresdefault.jpg', '', '15JfoLMpHik', '', '', '', '', '', 1552993283, '2019-03-19 11:01:23', 0, 'gaming', '00:05:43', 0, 1, '12', 22, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2109, 'zVilV8EKeju3oLY', 5, 'K5Nc8H', 'چۆنیەتی زیادکردنی لایک و فۆڵۆ و بینەری انستاگرام %100', 'تێبینی: ئەم ڤیدیۆیە دوورە لە هەموو جۆرە سێرڤەرێک و هێرشێکی ئەلیکتۆرنی و بە تەواوەتی باوڕپێکراوە بۆیە پێویست بە دوو دڵی ناکا', 'https://i.ytimg.com/vi/HoZuHd3qAsY/mqdefault.jpg', '', 'HoZuHd3qAsY', '', '', '', '', '', 1552993485, '2019-03-19 11:04:45', 0, 'instagram', '00:07:54', 0, 1, '12', 18, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2110, 'fcHnLB6kgnycpvs', 5, 'KJNC7F', 'دەستکاری کردنی وێنە بە شێوەیەکی خەیاڵی و زۆر جوان', 'لایک و سبسکرایب لەبیر مەکەن  <br>  <br>لینکی بەرنامە بەکارهاتووەکان⬇  <br>PicsArt⬇  <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.picsart.studio[/a]  <br>  <br>  <br>  <br>SketchBook⬇  <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.adsk.sketchbook[/a]  <br>  <br>  <br>  <br>بە هیوای سوود', 'https://i.ytimg.com/vi/Tlyzm2OCQj0/mqdefault.jpg', '', 'Tlyzm2OCQj0', '', '', '', '', '', 1552993649, '2019-03-19 11:07:29', 0, 'disign', '00:10:39', 0, 1, '12', 17, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2111, 'kjpLCLUBFA2ok7R', 5, '3GuB4z', 'چۆنیەت گۆڕینی پلەی ستۆری بۆ ئەمریکی بە ئاسانترین شێوە', 'لینکی بەرنامەکە بۆ Android↘   <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.psiphon3.subscription[/a]   <br>   <br>   <br>لینکی بەرنامەکە بۆ ios↘   <br>[a]http%3A%2F%2Fen.uptodown.com%2Fwindows%2Fsearch%2Fpsiphon-3-for-ios[/a]   <br>   <br>   <br>بە هیوای سوود', 'https://i.ytimg.com/vi/IopDbPFHOJE/maxresdefault.jpg', '', 'IopDbPFHOJE', '', '', '', '', '', 1552993878, '2019-03-19 11:11:18', 0, 'فێرکاری', '00:04:59', 0, 1, '12', 26, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2112, '9APdAev6bLQ3fNt', 5, '1siwEP', 'چونییه تی دروستکردنی فیسبوکی روسی', 'چونییه تی دروستکردنی فیسبوکی روسی به ئاسانترین شیوه  <br>  <br>  <br>  <br>بۆ ئاگادار بوون لە نوێترین هەواڵ و زانیاری سبسکرایبی کەناڵەکەم بکەن  <br>  <br>  <br>ب هیوای ســـــــــــــــــــــــوود  <br>  <br>ئەم ڤیدیۆیە مافی پارێزراوە لە کەناڵی چوارچێوەی ئایتی ،  <br>هەموو کەسێک ئازادە لە بڵاوکردنەوەی فێرکاریەکنمان بە مەرجێک ئاماژە بە سەرچاوەکەی بکات.  <br>  <br>  <br>ڤیدیۆی پێشوومان↙  <br>چۆنیەتی هێنانەوەی فەیسبووکی سووتاو↙  <br>[a]https%3A%2F%2Fyoutu.be%2FRKMW3WkKD1U[/a]  <br>  <br>ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ  <br>  <br>  <br>من لە تۆڕە کۆمەڵایەتیەکان  <br>  <br>Facebook 1↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2Fehsan01IT[/a]  <br>  <br>  <br>Facebook 2↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2Fehsan01IT[/a].Co  <br>  <br>  <br>Page ↙  <br>بۆ بینینی نوێترین هەواڵ و زانیاری دەربارەی ئەندرۆید لایکی پەیجەکەمان بکە☟  <br>[a]https%3A%2F%2Fwww.facebook.com%2Fandrokurd.official.page%2F[/a]  <br>  <br>  <br>instagram↙  <br>ئەکاونتی فەڕمی پەیجی ئەندرۆکورد لە ئینیستایگرام☟  <br>[a]https%3A%2F%2Fwww.instagram.com%2Fandrokurd_official%2F[/a]  <br>  <br>  <br>instagram↙  <br>[a]https%3A%2F%2Fwww.instagram.com%2Fehsan_tech1%2F[/a]  <br>  <br>  <br>Twitter↙  <br> [a]https%3A%2F%2Fmobile.twitter.com%2Fehsan_tech1[/a]  <br>  <br>  <br>Telegram↙  <br>[a]https%3A%2F%2Ft.me%2Fehsan_tech[/a]  <br>  <br>  <br>  <br>Snapchat↙  <br>[a]https%3A%2F%2Fwww.snapchat.com%2Fadd%2Fehsan_faramarz[/a]  <br>  <br>  <br>Linkedin↙  <br>[a]https%3A%2F%2Fwww.linkedin.com%2Fin%2Fehsan-faramarz-326457168[/a]  <br>  <br>  <br>  <br>Pinterest↙  <br>[a]https%3A%2F%2Fwww.pinterest.com%2Fehsan_tech1%2F[/a]  <br>  <br>  <br>گروپی (ئەندرۆکورد Androkurd) لە فەیسبووڪ جۆینی بکەن هەر کێشەیەکتان هەبوو لەوێ پێکەوە چارەی ئەکەین بەڕێوبەری گروپ Ehsan Faramarz ↘  <br>[a]https%3A%2F%2Fwww.facebook.com%2Fgroups%2F318659818667795%2F[/a]  <br>  <br>  <br>ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ  <br>  <br>  <br>بە سپۆنسەری ڕێکخراوی TechEye چاوی تەکنەڵۆژیا یێکەمین و گەورەترین ڕێکخراو لە عێراق و کوردستان   <br>  <br>تێک ئای لە تۆڕە کۆمەڵایەتیەکان  <br>  <br>Facebook↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2Ftecheye.org%2F[/a]  <br>  <br>  <br>بۆ زانیاری هەمەجۆر سەردانی ماڵپەڕی تێک ئای / چاوی تەکنەڵۆژیا بکەن↙  <br>[a]http%3A%2F%2Ftecheye.org[/a]  <br>  <br>ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ  <br>  <br>  <br>بەسپۆنسەری پەیجی کورد هاک :: Kurd Hack   <br>کورد هاک :: Kurd Hack لە تۆڕە کۆمەڵایەتیەکان   <br>  <br>Facebook Paege↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2FKurdish.Hack%2F[/a]  <br>  <br>  <br>  <br>ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ  <br>  <br>  <br>بۆ ئەوەی بینەری زانیاری سەرنجڕاکێشی مێژوو و تەکنەلۆژیا و زانیاری ئاینی بن سەردانی پەیج و گروپی دوونیای زانیاری World information بکەن لە فەیسبووک  <br>  <br>  <br>Facebook Page↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2FWorld.Information.DunyayZanyari%2F[/a]  <br>  <br>  <br>Group↙  <br>[a]https%3A%2F%2Fwww.facebook.com%2Fgroups%2FWorld.Information.DunyayZanyari%2F[/a]  <br>  <br>  <br>  <br>  <br>  <br>بە هیوای سوود', 'https://i.ytimg.com/vi/Wx3si_3WUsU/mqdefault.jpg', '', 'Wx3si_3WUsU', '', '', '', '', '', 1552994211, '2019-03-19 11:16:51', 0, 'فێرکاری', '00:11:39', 0, 1, '12', 20, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(581, 'T6VdNBClpomtMUe', 4, 'WBuePv', 'سەیری ئۆژین نەوزاد بکەن چی بۆ هەوادارەکانی اکات ozhin nawzad la w haraskani', 'بۆ بینینی بابەتی جوانتر سبسکرایبم بکەن', 'https://i.ytimg.com/vi/hjx2bCaFTc0/mqdefault.jpg', '', 'hjx2bCaFTc0', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:03:16', 0, 1, '3', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(582, 'oqJuM9HV66ofTIU', 4, 'NCPXq5', 'Ozhin Nawzad #Concert 2019', '', 'https://i.ytimg.com/vi/epr-mWmgudk/mqdefault.jpg', '', 'epr-mWmgudk', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:01:41', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(583, 'bqRMq8mgGCMqTdB', 4, 'Y2QiPn', 'دوو ملیۆن بینەر.. ئۆژین نه‌وزاد لەسناپچات پۆست ئەکەم - Ozhin Nawzad snapchat', 'سەبسکرایبی چەناڵی نێت تیڤی بکەن لەیوتیوب بۆ ئەوەی خۆشترین پرۆگرام و گۆرانی ببینن <br>[a]www.youtube.com%2FNETTVKurd[/a] <br> <br>All rights reserved please don&#039;t re-upload our videos <br>مافی ئەم بەرهەمە بۆ نێت تیڤی پارێزراوە <br> <br>ئەم ڤیدیۆیە لای خۆت شەیر بکە <br>[a]https%3A%2F%2Fyoutu.be%2FPaiHbumRvJM[/a] <br> <br>#NETTV #Evin_Jinu_Jyan #Ozhin_Nawzad', 'https://i.ytimg.com/vi/PaiHbumRvJM/maxresdefault.jpg', '', 'PaiHbumRvJM', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'nettv,netgram,koshki net,evin jin u jyan,avin zhn u zhyan,avin aso,evin aso,hamasha,shwan delon,hama najat,sarkar', '00:05:55', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(584, 'YkhOxA3lqNoZHOZ', 4, 'a4a7Bo', 'Ozhin Nawzad 04 ( ay dl ay dl - ashqana ) Ga3day Hamay Aras', '', 'https://i.ytimg.com/vi/jwb8y_ImF24/maxresdefault.jpg', '', 'jwb8y_ImF24', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'taza,xosh,kchan,kchi,iraqi,mnafasa,tabaqa,toni,barz,axr ton,govar henry', '00:08:08', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(585, 'uXL9pf7j6pbH6ym', 4, 'DptGG3', 'Ozhin Nawzad 2019 یەکەم دانیشتن دوای کۆنسێرتەکە', '', 'https://i.ytimg.com/vi/pfjiFq0rjE0/mqdefault.jpg', '', 'pfjiFq0rjE0', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:42', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(586, '3Wk9DwaC15k1xYP', 4, 'ucriJk', 'Ozhin Nawzad Track5 ( Fwl Jaw hhh Halparke ) Ga3day Hamay Shex Taha u Sarkoy Liwa Jamal', '', 'https://i.ytimg.com/vi/Yz8QOqtXwSc/maxresdefault.jpg', '', 'Yz8QOqtXwSc', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,iraqi,barxa,nrt2,ay law barxa,mnafasa', '00:12:00', 0, 1, '3', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(587, 'yBnnANvHUctTEIe', 4, 'aSv41Y', 'Ozhin Nawzad Track3 ( Amshaw Biri Tom Akrd ) Ga3day Hamay Aras - Zor Shazz', '', 'https://i.ytimg.com/vi/vSB1YsGnT7I/maxresdefault.jpg', '', 'vSB1YsGnT7I', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,hawramy,baghdady,baxdadi', '00:14:01', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(588, 'opMsY66ZomiE6xm', 4, 'sBAdR6', 'Ozhin nawzad 2019 New zor shaz ئۆژین نەوزاد زۆر شاز', '', 'https://i.ytimg.com/vi/EaT82_M15PY/mqdefault.jpg', '', 'EaT82_M15PY', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:57', 0, 1, '3', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(589, '7jrHSPL1eYF5rQ7', 4, '4ckMoi', 'Ozhin Nawzad 02 ( Har Toy Jwany Am Jila ) Salyadi Hama Bayari', '', 'https://i.ytimg.com/vi/06t2rWSuXWQ/maxresdefault.jpg', '', '06t2rWSuXWQ', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,abdulla,iraqi,barxa,nrt2,tabaqa', '00:15:18', 0, 1, '3', 5, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(590, 'hydzN4XwC4n9Aoo', 4, 'WjRyLS', 'Ozhin Nawzad La Barnamay Mewani Avin بزانە ئۆژین نەند دەزانێ', '', 'https://i.ytimg.com/vi/UPo9W7etHMQ/maxresdefault.jpg', '', 'UPo9W7etHMQ', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:02:22', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(591, 'hwW6iuJ6JAadie8', 4, 'WSF123', 'Ozhin Nawzad 05( yara dl shkawakam ) Ga3day Shex halmat u Mhamad xalid', '', 'https://i.ytimg.com/vi/Ao9pAa_oTHI/maxresdefault.jpg', '', 'Ao9pAa_oTHI', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,hawramy,baghdady,baxdadi', '00:07:22', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(592, 'HUcIjWRyC99Mw2u', 4, '2AJ43o', 'خەندە  -  لەگەڵ  -  ئۆژین نەوزاد  - دانیشتن   - ناکەم  - xanda  - ozhin nawzad', 'خەندە علی   ئامادە نییە   دانیشتن بکات لەگەڵ ئۆژین    -   خەندە وسارا      -  ئوزين  نه وزاد', 'https://i.ytimg.com/vi/AcYUtGd1AV8/mqdefault.jpg', '', 'AcYUtGd1AV8', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'Xanda,Xanda ali,Khanda ali,Xanda u sara,خه نده,خةنده,خةنده علي,ئوزين نةوزاد,ئوژین نوزاد,خەندە,خەندە عەلی', '00:00:35', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(593, 'CjyiktouBBoFVFe', 4, '4P2cLg', 'Ozhin Nawzad 02 ( Hala Hala - PUBG ) Ga3day Shex Aro 7', '', 'https://i.ytimg.com/vi/Q2nq8sTHDRw/maxresdefault.jpg', '', 'Q2nq8sTHDRw', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,iraqi,ay law barxa,mnafasa,tabaqa,toni,barz', '00:07:41', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(594, 'T1EvHfOu8to7Hrn', 4, '66d6wy', 'Ozhin nawzad 2019 ئۆژین نەوزاد پرچی زەردت وەک زنجیرێک', '', 'https://i.ytimg.com/vi/BUNhBtcJcaI/mqdefault.jpg', '', 'BUNhBtcJcaI', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:01:01', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(595, 'ru7KXkpZ9JmzNOe', 4, 'JoPa2N', 'Ozhin Nawzad [ Nawi Kchan in #Concert ] Zoor shaza', 'By Admin Ebo Gilly', 'https://i.ytimg.com/vi/sNPX9wMKWqA/mqdefault.jpg', '', 'sNPX9wMKWqA', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:01:33', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(596, 'l7LOscyiu6RYxE7', 4, 'iajI4w', 'ئۆژین نەوزاد تۆ جوانی وەک مانگە شەو Ozhin Nawzad 2019', '', 'https://i.ytimg.com/vi/r7hgSYVvp58/mqdefault.jpg', '', 'r7hgSYVvp58', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:35', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(597, '4bXYYCshpUua3dP', 4, '797wQL', 'Ozhin Nawzad Track1 ( Nawe Kchan + Shanya Anya - Ay xuda Xafatbarm ) Ahangi Qaladze', 'Taybat ba #GOVARHENRY <br>ئاهەنگی تایبەتی خێزانی لە قەڵادزێ', 'https://i.ytimg.com/vi/jCTIPd8s-0g/maxresdefault.jpg', '', 'jCTIPd8s-0g', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,abdulla,hiwa,iraqi,barxa,nrt2', '00:06:22', 0, 1, '3', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(598, 'Bm87y2a8vxe6mkv', 4, 'Lq94Zw', 'Ozhin Nawzad 2018 Track4 ( Awazi Yonani ) Ga3day Sara Sharazwry', '', 'https://i.ytimg.com/vi/ZEPmohixtUU/maxresdefault.jpg', '', 'ZEPmohixtUU', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,hawramy,baxdadi,baghdadi,shirwan,abdulla', '00:17:19', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(599, 'RyAXerYJyXutlRr', 4, '2KKbQt', 'OZhIn nawzad shaza(2)', '', 'https://i.ytimg.com/vi/2IEjtZkfWIo/mqdefault.jpg', '', '2IEjtZkfWIo', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:16', 0, 1, '3', 4, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(600, 'GTj3Q14LMtYNv4C', 4, '4qlY1z', 'ئۆژین نەوزاد زۆر شاز Ozhin nawzad 2019 zor shaz', '', 'https://i.ytimg.com/vi/GY-LJgJWpZk/mqdefault.jpg', '', 'GY-LJgJWpZk', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:24', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(601, 'wgym1mBZUlQlp2Z', 4, '5hgXoS', 'Ozhin Nawzad Track1 ( Ashqana Zor Xosh ) salyadi Goran', '', 'https://i.ytimg.com/vi/yJTiFBni9mA/maxresdefault.jpg', '', 'yJTiFBni9mA', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,nechyr,baghdadi,shirwan,abdulla,hiwa', '00:17:25', 0, 1, '3', 5, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(602, '1WmMTnPOzNUHMba', 4, 'CnUDFI', 'Ozhin Nawzad 03 ( Dktor Kwa Charay Xame  ) Ga3day Kawan Shex Kamal', 'Linky Trakakany Tr .. <br>Track1 / [a]https%3A%2F%2Fyoutu.be%2FseW4zlMv8do[/a] <br>Track2 / [a]https%3A%2F%2Fyoutu.be%2FnBqCMGNshLg[/a] <br>Track3 / [a]https%3A%2F%2Fyoutu.be%2FtdsldeVwr7g[/a] <br>Track4 / [a]https%3A%2F%2Fyoutu.be%2FW_regj4TEOc[/a] <br>Track5 / [a]https%3A%2F%2Fyoutu.be%2FY3HPcDVif_U[/a]', 'https://i.ytimg.com/vi/tdsldeVwr7g/maxresdefault.jpg', '', 'tdsldeVwr7g', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,shirwan,abdulla,hiwa', '00:09:47', 0, 1, '3', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(603, 'OO655rQStbYP3VZ', 4, 'urgMT3', 'Ozhin Nawzad Track2 ( Zoor Shaz ) Ga3day Dktor Ahmad', '', 'https://i.ytimg.com/vi/cjB0lZJsOEM/maxresdefault.jpg', '', 'cjB0lZJsOEM', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,abdulla,hiwa,iraqi,barxa,nrt2', '00:14:25', 0, 1, '3', 7, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(604, 'j3DaUBweZB2Z5UL', 4, 'YYisVL', 'Ozhin Nawzad ( Awazi Har To Jwani Am Jila - Shazz ) Ga3day Karzan Chawshin', '', 'https://i.ytimg.com/vi/UhD51AcK5pI/maxresdefault.jpg', '', 'UhD51AcK5pI', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,iraqi,mnafasa,tabaqa,toni,barz,axr ton', '00:16:58', 0, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(605, 'utP5cwJlShXqgag', 4, 'vwL4KT', 'Ozhin Nawzad 05 ( Lawo Lawo ) Salyadi Hama Bayari', '', 'https://i.ytimg.com/vi/ByPvAmbluJc/maxresdefault.jpg', '', 'ByPvAmbluJc', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,hawramy,baghdady,baxdadi', '00:05:28', 0, 1, '3', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(606, 'mEV7oXUwRUoXHte', 4, 'ryvFb4', 'Ozhin nawzad w safen  ahangi buk w zawa ئۆژین نەوزاد و سەفین ئاهەنگی بوک و زاوا', 'Created by VideoShow:[a]http%3A%2F%2Fvideoshowapp.com%2Ffree[/a]', 'https://i.ytimg.com/vi/6k1JCgQReDE/mqdefault.jpg', '', '6k1JCgQReDE', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:00:43', 0, 1, '3', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(607, 'iNnPNQkBFG6wPCh', 4, 'qF8HkU', 'ozhin nawzad barnamai miwani avinئۆژین نەوزاد  لە بەرنامەی ئەمەی میوانی ئەڤین', '', 'https://i.ytimg.com/vi/L8IdIYJZnEw/mqdefault.jpg', '', 'L8IdIYJZnEw', '', '', '', '', '', 1550800257, '2019-02-22 01:50:57', 0, '', '00:02:31', 0, 1, '3', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(608, 'HSepfHStyxe67W6', 4, 'YJBTcD', 'Ozhin nawzad 2019 zor shaz ئۆژین نەوزاد لەگەڵ دایکی', '', 'https://i.ytimg.com/vi/Q0VnmVY6U3s/maxresdefault.jpg', '', 'Q0VnmVY6U3s', '', '', '', '', '', 1550800292, '2019-02-22 01:51:32', 0, '', '00:00:57', 0, 1, '3', 5, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(609, 'uvRPaRFZwlX7xQD', 4, 'hnCpkx', 'Ozhin Nawzad 2019', '', 'https://i.ytimg.com/vi/0UkUJ5gaMJ0/mqdefault.jpg', '', '0UkUJ5gaMJ0', '', '', '', '', '', 1550800292, '2019-02-22 01:51:32', 0, '', '00:00:42', 0, 1, '3', 18, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(610, 'jmHEXPRr7rlRg9Z', 4, 'eD5FJA', 'OZHIN NAWZAD ( Ashqana Awazi Taza ) Ga3day Ara Soran u Balen Miksar - Track1', '', 'https://i.ytimg.com/vi/fcDYNHC7feU/maxresdefault.jpg', '', 'fcDYNHC7feU', '', '', '', '', '', 1550800292, '2019-02-22 01:51:32', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,necher,nechyr,hawramy,baghdady,baxdadi', '00:16:01', 0, 1, '3', 6, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2101, 'VfnmXo6djyEcqxD', 5, 'Ppo6tQ', 'İbrahim Tatlıses - Aramam', 'ibrahim Tatlıses - Aramam', 'upload/photos/2019/03/vqZ9HJW1rBokSDmEH7HV_16_24c56075b4f82021de157bc2985c8aca_image.jpg', 'upload/videos/2019/03/Z1HrbRvqiQ99pOSQxFfm_16_1473f4d51bc6896ac40f24dd41cbee86_video.mp4', '', '', '', '', '', '', 1552743229, '2019-03-16 13:33:49', 0, 'Turkish,Song,ibrahim Tatlıses,Music', '4:56', 16873407, 1, '3', 19, 1, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(612, 'OfD5poSLPs3yYYf', 4, 'PDBADj', 'Ozhin nawzad 2018 helin bmdare mache ئۆژین نەوزاد ٢٠١٨ ھێلین بمدەرێ ماچێ', '', 'https://i.ytimg.com/vi/TsXagvM8Sko/maxresdefault.jpg', '', 'TsXagvM8Sko', '', '', '', '', '', 1550800315, '2019-02-22 01:51:55', 0, '', '00:00:59', 0, 1, '3', 5, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(613, 'KVxaUdDDvr2kVLa', 4, '4EU21f', 'ozhin nawzad 2019  (hartoy jwane am jela)', '', 'https://i.ytimg.com/vi/WLcaMd7X2cc/maxresdefault.jpg', '', 'WLcaMd7X2cc', '', '', '', '', '', 1550800365, '2019-02-22 01:52:45', 0, '', '00:07:32', 0, 1, '3', 6, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(614, 'YfjCUe2AjmKVIVx', 4, 'L6BAw6', 'Ozhin Nawzad ( Mashalla Jwana Gasha ) Ga3day Mirkoy 7aji - Track3', '', 'https://i.ytimg.com/vi/SRnGui9ttCM/maxresdefault.jpg', '', 'SRnGui9ttCM', '', '', '', '', '', 1550800416, '2019-02-22 01:53:36', 0, 'awzi nwe,taza,xosh,kchan,kchi,kurd,abdulla,hiwa,iraqi,barxa,nrt2', '00:15:34', 0, 1, '3', 19, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2010, 'VzNKSq3njFEGGcQ', 1, '1GLt7B', 'پاره‌ی كۆبكه‌ره‌وه‌ له‌ ماڵه‌ی خۆتدا بیتكۆین به‌ كوردی - وانه‌ی یه‌كه‌م', 'بیتكۆین چیه‌ ؟ <br> <br>[a]https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D-mdUZ2-5DcI[/a] <br> <br>جزدانی كۆین به‌یس <br>[a]https%3A%2F%2Fwww.coinbase.com[/a] <br> <br>بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :)', 'https://i.ytimg.com/vi/GSv1iA6lIPM/maxresdefault.jpg', '', 'GSv1iA6lIPM', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:43', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2009, 'uEZfPFY3ozKPXUA', 1, '2vTcNx', 'باوكم دوای دایكم چی كرد زۆر كاریگه‌ره‌ شایه‌نی سه‌یر كردنه‌-ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/IcGpRhLq8eY/maxresdefault.jpg', '', 'IcGpRhLq8eY', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:04:58', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2008, 'YTbCjylGQ1qWU4r', 1, '1byuBE', 'چۆنیه‌تی داواكردنی سه‌حه‌ شینه‌كه‌ له‌ مۆبایل له‌ تۆڕمیكس', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/3bg7PJwNfu8/mqdefault.jpg', '', '3bg7PJwNfu8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:53', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2007, 'AxoOmevgqr8iLhN', 1, 'ZgvWQN', 'كچه‌كه‌ مردنی ده‌وێت كوڕه‌كه‌ش خۆشه‌ویستی-زۆر كاریگه‌ر ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/_zJblf7TUfo/maxresdefault.jpg', '', '_zJblf7TUfo', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:06:32', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2006, '1neGLXbOXdgS9y1', 1, 'NVBaKj', 'ئاگاداری نامه‌ و په‌یوه‌ندی و فه‌یس بووكی كه‌سی به‌رامبه‌ر به‌ چی ئه‌كات !!', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە.. <br>[a]https%3A%2F%2Fapkpure.com%2Fcouple-tracker-free-cell-phone-tracker-monitor%2Fcom.bettertomorrowapps.spyyourlovefree[/a]', 'https://i.ytimg.com/vi/zfvzzH6W4ZU/maxresdefault.jpg', '', 'zfvzzH6W4ZU', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:56', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2005, 'M1Y8QhDjmT3ALP5', 1, 'xII1IT', 'سی ساڵ زۆر كاریگه‌ر شایه‌نی سه‌یر كردنه‌ ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/oeE4wj0ZV1E/maxresdefault.jpg', '', 'oeE4wj0ZV1E', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:02:59', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2004, 'hiKScogtTb3k9vK', 1, 'e6wPsA', 'How To Make Money With Youtube چۆن له‌ ڕیگای یوتیوبه‌وه‌ پاره‌ به‌ ده‌ست دێنیت', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/KZtQnqk6zWw/maxresdefault.jpg', '', 'KZtQnqk6zWw', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:57', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2003, 'E97IEPXxwIPEOse', 1, 'aRrJgY', 'installing Wordpress in 1 min-دامه‌زراندنی وۆرد پڕێس به‌ 1 خوله‌ك', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]http%3A%2F%2Frmr-soft.com[/a]', 'https://i.ytimg.com/vi/THs8EbF5qAI/maxresdefault.jpg', '', 'THs8EbF5qAI', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:57', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2002, 'vkdRlT1hl5pYP16', 1, 'SIQbs6', 'دروست كردنی هه‌ژمار (ئه‌كاونت) له‌ تۆڕمیكس', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/2E3UcchUcmc/mqdefault.jpg', '', '2E3UcchUcmc', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:01', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(1990, 'qcuk8CL2SVdfSFk', 5, '8kLNYE', 'ENCA - BALAD', 'New Music Song Enca', 'upload/photos/2019/02/J4fTYOXe3lHaowF8IgN8_22_5febc29257a34b3ade75279baee7a12b_image.jpg', 'upload/videos/2019/02/4tYvkQrMSBhkjPQdzChM_22_644a205e702ef1efe4578454c0bd7cf7_video.mp4', '', '', '', '', '', '', 1550852163, '2019-02-22 16:16:03', 0, 'Music,New', '2:43', 36937963, 1, '3', 27, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(1991, 'jbngeSwPVvCWWCL', 5, 'vr1hlI', 'Sasy - Ostad | ساسی - اوستاد', 'ساسی - اوستاد   <br>  <br>لایک + پشتگیری = بەردەوامی ئێمە', 'upload/photos/2019/02/NggDrlX39otbAFHyddbC_23_4ade1b9f94aac3dfcdb16d8460355338_image.jpg', 'upload/videos/2019/02/MfgmCSpYtsND1NodZ6Zh_23_c06854f15c40b3320996f1ebde574147_video.mp4', '', '', '', '', '', '', 1550921976, '2019-02-23 11:39:36', 0, 'Music,Persian,فارسی', '3:19', 69293177, 1, '3', 1, 0, '2019/2', 0, 2, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(1988, 'IFfLuUrtWIiCPRk', 5, 'y64FM2', 'Morteza Pashaei', 'مرتضی پاشایی', 'upload/photos/2019/02/4qLGC2zaILnh5bfQU2wJ_22_6ea76ade135b54cfae7cb6eca15a259d_image.jpg', 'upload/videos/2019/02/1En8SzDtOYV68fq6s8Sz_22_c0b5214c54f2fe8d504a7356d66dc143_video.mp4', '', '', '', '', '', '', 1550849564, '2019-02-22 15:32:44', 0, 'music', '3:02', 90784452, 1, '3', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(1989, '3VESszECHzG1DRL', 5, 'xZwhWh', 'عبدالقهار زاخۆیی خاتراته', 'Abdulqahar Zaxoyi', 'upload/photos/2019/02/YnudCHZq9hNBJNyBSrGD_22_ae2b55f14fa0ba3801b49ec750437a8a_image.jpg', 'upload/videos/2019/02/PDNRh1D1mxhnGKnFc6d6_22_0a9c3218c994e49a4c752eff5b4441bd_video.mp4', '', '', '', '', '', '', 1550851408, '2019-02-22 16:03:28', 0, 'music', '5:17', 10209054, 1, '3', 4, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(1992, 'ej6npIU4zXLQcH4', 5, 'F4ThOn', 'How To Create TorMix Account | چۆنیەتی دروستکردنی هەژمار لە تۆڕمیکس', 'چۆنیەتی دروستکردنی هەژمار لە تۆڕی کۆمەڵایەتی کوردی تۆڕمیکس. <br> <br>تۆڕمیکس : یەکەمین و گەورەترین تۆڕی کۆمەڵایەتی کوردی  <br> <br> <br>How To Create TorMix Account  <br> <br>TorMix The Bes And Largest Kurdish Social Network', 'upload/photos/2019/02/WxwKrClOWKbT6MN85oXX_23_ccf351bcfc6273022f1fd5e0c4902ca5_image.jpg', 'upload/videos/2019/02/9jM2uvRU6tkjH6jXVzhB_23_31e1694cdab0451830cccef7463d0f64_video.mp4', '', '', '', '', '', '', 1550922510, '2019-02-23 11:48:30', 0, 'Social,Network,TorMix', '4:53', 60822912, 1, '12', 27, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(1993, 'K4hptu37qgKuVpZ', 5, 'mcuwYe', 'مرتضی پاشایی - حسرت', 'Morteza Pashaei - Hasrat', 'upload/photos/2019/02/EFDfzA71AExTPnqWYeJA_24_a909c68b55732551fa58448a2ffa5d59_image.jpg', 'upload/videos/2019/02/IQseSQPcDGIlIk1vj1rm_24_d630262473b5a0a21266c21f0277d88a_video.mp4', '', '', '', '', '', '', 1551010343, '2019-02-24 12:12:23', 0, 'Music,Song,Love', '3:45', 10046850, 1, '3', 26, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(1994, 'uPsebXDmrxGUdxI', 5, 'cSEez3', 'Helly Luv &amp; Ardian Bujupi - GUNS &amp; ROSES', 'helly luv &amp; ardian bujupi - guns &amp; roses <br> <br>New Video Clip', 'upload/photos/2019/02/PBYFAdHrfa392McrrPwm_24_ecda9b15f49e7aeae99a960abe0e2ec6_image.jpg', 'upload/videos/2019/02/3hEnM5HAXDJWUbH5i7d9_24_9cac1d2e8ae05667fd982199eda5f760_video.mp4', '', '', '', '', '', '', 1551015721, '2019-02-24 13:42:01', 0, 'Music,Song', '3:29', 60901571, 1, '3', 27, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(1996, 'AABWCY1Yw97dxtC', 1, 'YuSqRE', 'سكرین شۆت كردن له‌ سناپ چات بێ ئه‌وه‌ی كه‌س بزانێت.', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>https://play.google.com/store/apps/details?id=com.v_ware.snapsaver&amp;hl=en', 'https://i.ytimg.com/vi/YNNSYxMdI20/maxresdefault.jpg', '', 'YNNSYxMdI20', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:11', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(1997, 'RXdQc3fVfBUJ6gw', 1, 'jprDEv', 'Windows 10 And Kali Linux Dual Boot Kurdish Tutorial By Shalaw koy', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>[a]https%3A%2F%2Fsourceforge.net%2Fprojects%2Fwin32diskimager[/a] <br> <br>[a]https%3A%2F%2Fwww.kali.org%2Fdownloads[/a]', 'https://i.ytimg.com/vi/9Q_jqEpLdcQ/maxresdefault.jpg', '', '9Q_jqEpLdcQ', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:10:13', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(1998, 'Zd2rMFNpleMw1NW', 1, 'hhFUZP', 'Shalaw koy Tutorials Intro !', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن...  <br>  <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان.  <br>  <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد..  <br>  <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام  <br>  <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a]  <br>  <br>شاڵاو کۆیی :)', 'https://i.ytimg.com/vi/wpspEVRWvMo/maxresdefault.jpg', '', 'wpspEVRWvMo', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:27', 0, 1, 'other', 2, 1, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(1999, 'je9B6qvYsHuFDk7', 1, '5jj36H', 'دایكم درۆزنه‌ -ژێرنووسی كوردی-زۆر كاریگه‌ر', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/JoY2yWFHjiw/mqdefault.jpg', '', 'JoY2yWFHjiw', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:02:40', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2000, 'TBKaUcZkbQDPWlu', 1, 'qEP6Vd', 'باوكم درۆی كرد- زۆر كاریگه‌ر-ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/oB67rRPwSz8/maxresdefault.jpg', '', 'oB67rRPwSz8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:03:21', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2001, 'YXfWNu82xh8jKgS', 1, '5woEvs', 'جێگه ی شانازیه  یه كه مین تۆڕی كۆمه ڵایه تی به زمانی كوردی كرایەوە', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>[a]www.tormix.net[/a] <br> <br>Rawaz Slemany', 'https://i.ytimg.com/vi/L0XWTXB3xew/maxresdefault.jpg', '', 'L0XWTXB3xew', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:06:20', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2046, 'St4GHlD1P3coJsK', 1, 'hltVKL', 'Charasari Keshay File is too large for the destination file system Kurdi', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/E-qmGbpjhsY/mqdefault.jpg', '', 'E-qmGbpjhsY', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:36', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2042, 'icrx1Yo2C6aRWfz', 1, 'BvhKif', 'چۆنیه‌تی چوونه‌ده‌ره‌وه‌ له‌ هه‌موو گروپه‌كانی فه‌یس بووك به‌ یه‌ك كلیك كوردی', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>Facebook Toolkit <br>[a]https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Ftoolkit-for-facebook%2Ffcachklhcihfinmagjnlomehfdhndhep[/a]', 'https://i.ytimg.com/vi/IFP847mTRx4/mqdefault.jpg', '', 'IFP847mTRx4', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:03:39', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2043, 'k3PKsYGHuY3zh6n', 1, '2YdaYb', 'چۆنیه‌تی دروست كردنی ئه‌پڵ ئایدی له‌سه‌ر مۆبایل- How To Create Apple ID', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/IujduxuzTJ0/mqdefault.jpg', '', 'IujduxuzTJ0', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:06:13', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2044, 'GfrUiktE1i2ktiQ', 1, 'fgVjIz', 'چۆنیه‌تی به‌كارهێنانی فه‌یس تایم-كوردی', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/Xn4yesitbf8/maxresdefault.jpg', '', 'Xn4yesitbf8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:07', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2045, 'b7qkunepmGF8H4i', 1, 'UzMBS2', 'قسه‌كردن سه‌باره‌ت به‌ تۆڕمیكس له‌ ڕادیۆی ڕووداو', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/xydesGs9m0Y/mqdefault.jpg', '', 'xydesGs9m0Y', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:40:07', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2041, '6eVlnl3zXb2RQ9A', 1, 'FENqRG', 'چۆنیه‌تی ئه‌كتیڤ كردنی ئایفۆنی نوێ- how to set up new iphone', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/rwsnvNXUWyU/mqdefault.jpg', '', 'rwsnvNXUWyU', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:30', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO `videos` (`id`, `video_id`, `user_id`, `short_id`, `title`, `description`, `thumbnail`, `video_location`, `youtube`, `vimeo`, `daily`, `facebook`, `twitch`, `twitch_type`, `time`, `time_date`, `active`, `tags`, `duration`, `size`, `converted`, `category_id`, `views`, `featured`, `registered`, `privacy`, `age_restriction`, `type`, `approved`, `240p`, `360p`, `480p`, `720p`, `1080p`, `2048p`, `4096p`, `sell_video`, `sub_category`, `geo_blocking`) VALUES
(2040, 'GsAkJOBL2SYCUDH', 1, 'zATF5X', 'دروست کردنی Gmail لە ناو مۆبایل بە کوردی', '[a]Www.gmail.com[/a] <br>بە هیوای سوود', 'https://i.ytimg.com/vi/3yHAmnRTx-Q/maxresdefault.jpg', '', '3yHAmnRTx-Q', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, '', '00:08:25', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2036, 'BbvgBosn8YfZIxz', 1, 'Mohxt1', 'چۆنیه تی تۆماربوون له  تۆڕمیكس بۆ كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/vlmAyw3Nc3g/maxresdefault.jpg', '', 'vlmAyw3Nc3g', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:23', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2037, 'R2IKBcuuKmIqiEC', 1, 'NXcATT', 'چۆنیه تی دانانی كاڵا له  بازاڕی تۆڕمیكس بۆ فرۆشتن به  مۆبایل', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/JifBf3G-Q3M/maxresdefault.jpg', '', 'JifBf3G-Q3M', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:30', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2038, 'SI7TeWQUu93YBAX', 1, 'JzYiHP', 'How to install Linux Mint on VirtualBox-چۆنیه‌تی دابه‌زاندنی لینوكس مینت به‌ وه‌همی', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>Download Virtualbox :[a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a] <br>Download Linux Mint :[a]https%3A%2F%2Fwww.linuxmint.com%2Fdownload.php[/a]', 'https://i.ytimg.com/vi/5E4eakC4cEs/mqdefault.jpg', '', '5E4eakC4cEs', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:10:01', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2039, 'aBFQfYuSqepQpAD', 1, 'I6PhkH', 'له‌ ئه‌مریكاوه‌ سناپ بكه‌ !! گۆڕینی شوێنی سناپ چات به‌ كوردی', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>hola <br> <br>https://play.google.com/store/apps/details?id=org.hola.gpslocation&amp;hl=en', 'https://i.ytimg.com/vi/JeZlTt21ka4/mqdefault.jpg', '', 'JeZlTt21ka4', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:53', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2035, 'rLMJ2VbecFnLIT7', 1, '1wd2zn', 'كۆنترۆڵ كردن و بڵۆك كردنی ئه‌و كه‌سانه‌ی كار به‌ وایفای تۆ ده‌كه‌ن  بۆ یه‌كه‌م جار !!!', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/mv0cBovuQIA/mqdefault.jpg', '', 'mv0cBovuQIA', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:06', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2034, 'VsD7kZboHxe4M4O', 1, 'cH8CdJ', 'How to Install Red Hat Enterprise Linux 7 2 in Windows 8-چۆنیه‌تی دابه‌زاندنی ڕید هات', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>Download Virtualbox :[a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a] <br>Download Red Hat : [a]https%3A%2F%2Fwww.redhat.com%2Fen%2Ftechnologies%2Flinux-platforms%2Fenterprise-linux[/a]', 'https://i.ytimg.com/vi/EzJ07wCc8i0/mqdefault.jpg', '', 'EzJ07wCc8i0', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:10:01', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2033, 'n3w2P3Qcdi5OuAN', 1, 'T6klyO', 'پاره‌ كۆبكه‌ره‌وه‌ له‌ ماڵی خۆتدا ! بیتكۆین به‌ كوردی وانه‌ی سێ یه‌م !', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>بەستەری فاوسێتی دۆج کوین چەند دانەیەک وەرگرە بە خۆڕایی <br> <br>[a]https%3A%2F%2Ffreedoge.co.in%2F%3Fr%3D1251946[/a] <br> <br>وانەی پێشوو فاوسێت چیە؟ <br> <br>https://www.youtube.com/watch?v=2EUi4BtPDFg&amp;app=desktop', 'https://i.ytimg.com/vi/083T-hJ6g3g/mqdefault.jpg', '', '083T-hJ6g3g', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:14', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2032, '4tu2wFZNgWmB1Oy', 1, 'YyGJjZ', 'How To Hack any Wifi using wifislax easy way kurdish', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>DOwnload wifislax <br>[a]https%3A%2F%2Fmega.nz%2F%23%21A5gBEbzI%21H47ympOqbXwfBX3Qk9QGVGLeNlcu7ma451oyInf6WS4[/a]', 'https://i.ytimg.com/vi/JCqmy0n1kxE/mqdefault.jpg', '', 'JCqmy0n1kxE', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:03:06', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2031, 'IhBWWNwIkR72EQq', 1, 'Jsp2Rr', 'How to install elementary os in Windows 7-چۆنیه‌تی دابه‌زاندنی ئیلیمینتری له‌سه‌ر ویندۆز حه‌وت', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>Download Virtualbox :[a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a] <br>Download Elementary os :[a]https%3A%2F%2Felementary.io[/a]', 'https://i.ytimg.com/vi/YqS-vhJn8pQ/mqdefault.jpg', '', 'YqS-vhJn8pQ', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:03:28', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2028, 'nboTahTXTrfgXwk', 1, 'xQppJU', 'وانه‌ی یه‌كه‌م: دامه‌زراندنی ئافته‌ر ئیفێكت.', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/F0U3kHHL1UM/mqdefault.jpg', '', 'F0U3kHHL1UM', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:06:01', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2029, 'rbHLz9Wh9HFkCfR', 1, '', 'چۆنیه تی دانانی ڕیكلام له  تۆڕمیكس هه نگاو به  هه نگاو', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/F3FTKC4q0RY/mqdefault.jpg', '', 'F3FTKC4q0RY', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:04:00', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2030, 'sFBO4QBCNgFBuuF', 1, '83y66V', 'Install Linux Kali Linux on virtualbox in windows 7 چۆنیه‌تی دابه‌زاندنی كاڵی لینوكس به‌ وه‌همی له‌س', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>Download KaliLinux:[a]https%3A%2F%2Fwww.kali.org%2Fdownloads[/a] <br>Download Virtualbox:[a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a]', 'https://i.ytimg.com/vi/y1ngvTAsWq8/mqdefault.jpg', '', 'y1ngvTAsWq8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:09:08', 0, 1, 'other', 4, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2027, 'SLd46WELieGPz6N', 1, '', 'ڕاپۆرتێك سه باره ت به  تۆڕمیكس له  NRT', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/JI61SSc_GxE/maxresdefault.jpg', '', 'JI61SSc_GxE', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:38', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2026, 'oU2lrqo4FS6zJQq', 1, 'uujkDE', 'پاره‌ی كۆبكه‌ره‌وه‌ له‌ ماڵه‌ی خۆتدا بیتكۆین به‌ كوردی - وانه‌ی دووه‌م', 'له‌م لینكه‌وه‌ تۆمار بن و چه‌ند ساتۆشیه‌ك وه‌ربگرن به‌ خۆڕایی ! <br>[a]https%3A%2F%2Ffreebitco.in%2F%3Fr%3D7054173[/a] <br> <br>بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :)', 'https://i.ytimg.com/vi/xap5BwwLS64/maxresdefault.jpg', '', 'xap5BwwLS64', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:08:33', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2025, 'iJF3wQXZkSSQ4AS', 1, 'uJ8fHk', 'چۆنیه‌تی دروست كردنی لاپه‌ڕه‌ له‌ تۆڕمیكس به‌ مۆبایل', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/kCBASpZUwbk/mqdefault.jpg', '', 'kCBASpZUwbk', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:00', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2024, '4MxxVWlUPoPe5A1', 1, 'Qp8pvg', 'سه‌یڤ كردنی وێنه‌ و ڤیدیۆی ستۆری ئینستاگرام', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>https://play.google.com/store/apps/details?id=io.yoba.storysaverforinsta&amp;hl=en', 'https://i.ytimg.com/vi/RTsF7oNPoJU/mqdefault.jpg', '', 'RTsF7oNPoJU', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:29', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2023, 'E6qlec3DuioffuU', 1, 'Ccttgv', 'چۆنیه تی دروستی كردنی لاپه ڕه  له  تۆڕمیكس به  كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/IAK79g3s_ho/maxresdefault.jpg', '', 'IAK79g3s_ho', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:59', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2022, 'MDDXJQztIuDlvNK', 1, 'bcuPZJ', 'Official Promo Video of Tormix Network 2018', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/UdcwFrN12Pc/maxresdefault.jpg', '', 'UdcwFrN12Pc', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:41', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2021, 'jFhAXvyOkXQ5msX', 1, '', 'راپۆڕتێك سه باره ت به  تۆڕمیكس له  كوردستان 24', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/ZV9NMGYRXFM/maxresdefault.jpg', '', 'ZV9NMGYRXFM', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:42', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2017, 'OruyqdQvoBNCnzW', 1, 'JwHI8s', 'چيتر پيويست ت بة بةرنامةي بيگانة نابيت Tormix', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/tOaux5AdKHA/maxresdefault.jpg', '', 'tOaux5AdKHA', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:05:33', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2018, 'rg4NCTZvymMjY5p', 1, 'VwY4xU', 'چۆنیه تی تۆماربوون له  تۆڕمیكس بۆ كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/YMr7MdPy9gY/maxresdefault.jpg', '', 'YMr7MdPy9gY', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:24', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2019, 'iJLXF9Gx1gXPSJa', 1, 'AYQOeH', 'tormix فێرکاری بەرنامە و دابەزاندنی', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/fiQOSZn6EOc/mqdefault.jpg', '', 'fiQOSZn6EOc', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:14:58', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2020, 'E67rtYGxvuvbBVN', 1, '3Gam7a', 'وه رگرتنی سه حه  شینه كه  له  تۆڕمیكس بۆ كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/pZy--Zut7f8/maxresdefault.jpg', '', 'pZy--Zut7f8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:01', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2016, '1zKxVW17d6sKRYu', 1, 'iAC34z', 'چوونه‌ ناو كۆمپیوته‌ر و مۆبایلی كه‌سی به‌رامبه‌ر له‌ ڕیگای مۆبایلی خۆته‌وه‌ !!!', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2Fshalawkoy.me[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>team view PC <br>[a]https%3A%2F%2Fwww.teamviewer.com%2Fen%2Fdownload%2Fwindows[/a] <br>Team View Android <br>[a]https%3A%2F%2Fdownload.teamviewer.com%2Fdownload%2FTeamViewer.apk[/a] <br>Team View Quick Support <br>[a]https%3A%2F%2Fdownload.teamviewer.com%2Fdownload%2FTeamViewerQS.apk[/a]', 'https://i.ytimg.com/vi/4Tz15x9i__A/maxresdefault.jpg', '', '4Tz15x9i__A', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:05:36', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2015, '3hRQ3yPZwoe9IXx', 1, 'rnZgSn', 'چۆنیه تی دروستی كردنی كۆمه ڵه  له  تۆڕمیكس به  كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/dIJrhZuMVCo/maxresdefault.jpg', '', 'dIJrhZuMVCo', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:58', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2014, 'RMrzlNwxW6aUcIQ', 1, 'Nc6lIW', 'له‌ خۆته‌وه‌ بڕیار له‌سه‌ر هیچ كه‌سێك مه‌ده‌- ژێرنووسی كوردی زۆر كاریگه‌ر', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/f3_bFzuFb7s/maxresdefault.jpg', '', 'f3_bFzuFb7s', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:05:33', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2013, 'ylXqvTj4cWfMxPF', 1, 'V3M3xs', 'باوكه‌ نابیناكه‌ و كچه‌كه‌ی زۆر كاریگه‌ر ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/ocI7k0yheMc/maxresdefault.jpg', '', 'ocI7k0yheMc', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:02:53', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2012, 'T4fKC3RZyssLZ47', 1, 'ywVRDP', 'رۆژی دایكان زۆر كاریگه‌ر پێویسته‌ سه‌یری بكه‌یت ژێرنووسی كوردی', 'شاڵاو كۆیی-كورته‌ چیرۆك <br>تكایه‌ سه‌بسكرایبمان بكه‌ن و ڵایكی ڤیدیۆكانمان بكه‌ن بۆ ئه‌وه‌ی به‌رده‌وام بین... <br>Shalaw koy-Short Story <br>Please Subscribe us and Like our Video <br>---------------------------------------------------------------------------------------------------- <br> <br>Video,kurdi,kurdistan,zhernus,shalawkoy,flim,karegar,dltangi,gryan,comedy,karwan xabati,karwan sharawani,awat bokani,aram shaida,rebwar malazada,ary faroq,sarxel jaza,navid zardi,halwest,aram sharawani,goran inzibat,hawler,slemany,duhok,halabja,karkuk,nrt,net tv,evin aso,avin aso,avin jin u jyan,aramo,daniel madland,to jyawazi,mn jyawazm,zagros,rudaw,rwdaw,', 'https://i.ytimg.com/vi/hNmZM7DEaoI/maxresdefault.jpg', '', 'hNmZM7DEaoI', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Short Story,Shalaw koy,Kurdish,Touching,cherok,dltang,zhernus', '00:05:16', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2102, '1HblvxHx8zKNpOu', 5, 'xsXR9c', 'Baran - Be Jahanam | باران بە جهنم', 'آهنگ جدیدە هنرمند باران با اسم : بە جهنم  <br> <br>زیرنویس:: احسان فرامرز - سرپرست شبکە اجتماعی ترمیکس و مدیر بخش (بادینی- فارسی) و مدیر از شبکە اجتماعی میکس پلی <br> <br>انجمن حق نسخە برداری: میکس پلی &amp; ترمیکس &amp; چوارچێوەی ئایتی &amp; احسان فرامرز', 'upload/photos/2019/03/3elkbmZeagUgMPYbFnPX_16_a14e6fcd8f32417a2cb2ff13d869c713_image.jpg', 'upload/videos/2019/03/9G8cuWTeJ84e4clV11Xe_16_4c486afad6f4bdaef33e87ab802c8e77_video.mp4', '', '', '', '', '', '', 1552755078, '2019-03-16 16:51:18', 0, 'باران,موسیقی,آهنگ,بە جهنم,فارسی', '3:34', 93780657, 1, '3', 16, 1, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(2011, 'ZDxCM3aTqNvngz9', 1, 'Db2BOD', 'چۆنیه‌تی به‌ ده‌ست هێنانی پاره‌ ڕۆژانه‌ تاكو 100 دۆلار !!', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/ft1AQ_RfClk/mqdefault.jpg', '', 'ft1AQ_RfClk', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:21', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2100, 'McY2f6FR2bnBtSj', 5, 'Kblp4V', 'Sasy - Gentleman | ساسی جنتلمن', 'آهنگ جدید هنرمند ساسی Sasy - &quot;Gentleman&quot;', 'upload/photos/2019/03/OpXJVzdhgjjHqzMctQyH_15_b6d1c0539650dccacbb16fda9db04411_image.jpg', 'upload/videos/2019/03/QT16LadGjuClmXPup3Bf_15_b1c017c3c298923d5bca748d24b83a90_video.mp4', '', '', '', '', '', '', 1552666977, '2019-03-15 16:22:57', 0, 'Gentleman,Sasy,Persian', '3:06', 6767937, 1, '3', 17, 1, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(2116, 'nwlwGmGKyQPkDop', 5, 'Y27NZQ', 'چۆنییەتی گۆڕینی وێنە بۆ ئەفلام کارتۆن بە جوانترین شێوە', 'لینکی ئەپڵیکەیشنەکە بۆ وەگەڕخەڕی ئەندرۆید↙  <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.mt.mtxx.mtxx[/a]  <br>  <br>  <br>لینکی ئەپڵیکەیشنەکە بۆ سیستمی ios↙  <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Fmeitu%2Fid416048305%3Fmt%3D8[/a]  <br>  <br>  <br>  <br>بۆ ئاگادار بوون لە نوێترین هەواڵ و زانیاری سبسکرایبی کەناڵەکەم بکەن  <br>  <br>  <br>ئەم ڤیدیۆیە مافی پارێزراوە لە کەناڵی چوارچێوەی IT هەموو کەسێک ئازادە لە بڵاوکردنەوەی بابەتەکانمان بە مەرجێک ئاماژە بە سەرچاوەکەی بکات  <br>  <br>  <br>ڤیدیۆی پێشوومان↙  <br>لە یەک کاتژمێرا داهاتی مڵیۆنێرەکان چەند زیاد ئەکا؟!↙  <br>[a]https%3A%2F%2Fyoutu.be%2F99k9fgiTCDg[/a]  <br>  <br>بە هیوای سوود', 'https://i.ytimg.com/vi/ZQlDgb1Je-w/mqdefault.jpg', '', 'ZQlDgb1Je-w', '', '', '', '', '', 1553094437, '2019-03-20 15:07:17', 0, 'Design,Image,How To', '00:03:00', 0, 1, '12', 38, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2115, 'zdy1KVv7PTsejNF', 5, 'jPJMW2', 'NOURI- Where Do We Go From Here', 'NOURI - Where Do We Go From Here', 'https://i.ytimg.com/vi/4nqXCebsiAM/mqdefault.jpg', '', '4nqXCebsiAM', '', '', '', '', '', 1553093903, '2019-03-20 14:58:23', 0, 'Music,Song,English,Where,Do,We,Go,From,Here', '00:03:32', 0, 1, '3', 37, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2095, 'kw5DCDbV8881fES', 5, 'z2PkU3', 'ڕۆمی هەرکی - گوندۆ ئەز مام بێ دۆست و یار', 'ڕۆمی هەرکی - گوندۆ ئەز مام بێ دۆست و یار', 'upload/photos/2019/02/lk2BTCA8lfOqGthhXCzN_26_f88e61f7fb2afb6befd178ab9c60cf37_image.jpg', 'upload/videos/2019/02/WslN8OS1zHRBkVQeC4nd_26_797e7c2d695c584a4bea0c96eb441e13_video.mp4', '', '', '', '', '', '', 1551189611, '2019-02-26 14:00:11', 0, 'میوزیک,کوردی', '3:56', 20042503, 1, '1', 22, 1, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2094, 'QAWMTEXVsS1eaub', 5, 'vSIaSx', 'Ibrahim Tatlises - Türlü Türlü', 'Ibrahim Tatlises - Türlü Türlü', 'upload/photos/2019/02/Wi4TLLPNpCEtQOXIfAeB_26_23a400ac927595b9b9f0a0463599c10d_image.jpg', 'upload/videos/2019/02/nvZaJU8OVgDuWLHGhb8A_26_287179367ca3adec59886ec30f1ed7aa_video.mp4', '', '', '', '', '', '', 1551188028, '2019-02-26 13:33:48', 0, 'Music,Turkish', '3:49', 7347455, 1, '3', 23, 1, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(2089, 'rJcqSis5cxUpwRo', 1, 'GsURKo', 'دروست كردنی ئه‌لبووم بۆ وێنه‌كانت', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net', 'https://i.ytimg.com/vi/gWiOzji9pjs/maxresdefault.jpg', '', 'gWiOzji9pjs', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:01:15', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2088, 'vYsNHNEz5iKaYgj', 1, 'Tfp5OS', 'جه‌ژنی ڕه‌مه‌زانتان پیرۆز بێت', 'جه‌ژنی ڕه‌مه‌زانتان پیڕۆز... <br>به‌ هیواین په‌رستشی هه‌موو لایه‌ك قبوڵ بووبێت. <br>ئێستا له‌ تۆڕمیكس،پیرۆزبایی له‌ دۆست و هاوڕیانت بكه تۆش. <br>[a]www.TorMix.net[/a] <br>-Tormix First and biggest Kurdish Social Netowk', 'https://i.ytimg.com/vi/1l9bNW-uQYo/mqdefault.jpg', '', '1l9bNW-uQYo', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:17', 0, 1, 'other', 4, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2087, '8sDfJ3A5YhC5jEw', 1, 'y7yjDH', 'له‌ تۆڕمیكسه‌وه‌ جه‌ژنی قوربانتان پیرۆز بێت.', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/F3qpQ0Hn0_c/maxresdefault.jpg', '', 'F3qpQ0Hn0_c', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:35', 0, 1, 'other', 9, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2086, 'Z9XW9hJaMAmpleU', 1, 'eyyIkl', 'كێ 50 دۆلاری خه‌ڵاتی برده‌وه‌ ؟', 'كێ 50 دۆلاری خه‌ڵاتی برده‌وه‌ ؟ <br>#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/uFzb_WuOukE/mqdefault.jpg', '', 'uFzb_WuOukE', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:51', 0, 1, 'other', 4, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2085, '1CtZtkaTJoG2wZi', 1, 'Vd21l1', 'چۆنیه‌تی تۆماربوون له‌ تۆڕمیكس بۆ كۆمپیوته‌ر', 'تۆڕ میكس تۆڕێكی كۆمه‌ڵایه‌تی و بازرگانی كوردیه‌  <br>[a]www.Tormix.net[/a]', 'https://i.ytimg.com/vi/n78K4BnOW74/maxresdefault.jpg', '', 'n78K4BnOW74', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'Tormix,tormix.net,kurdish,social,network', '00:01:23', 0, 1, 'other', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2084, 'HLPiGKdr3VWJDYt', 1, 'uRA9Ck', 'چۆنیه‌تی دروست كردنی كۆمه‌ڵه‌ له‌ تۆڕمیكس به‌ مۆبایل', 'چۆنیه‌تی دروست كردنی كۆمه‌ڵه‌ له‌ تۆڕمیكس به‌ مۆبایل <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/B_nkkBvMjRU/mqdefault.jpg', '', 'B_nkkBvMjRU', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,kurdish,social,network,shalawkoy,kurdistan,kurdi', '00:00:56', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2083, 'TQOO2yFSSFhJdiS', 1, 'UB7inc', 'چۆنیه‌تی دروستی كردنی لاپه‌ڕه‌ له‌ تۆڕمیكس به‌ كۆمپیوته‌ر', 'چۆنیه‌تی دروستی كردنی لاپه‌ڕه‌ له‌ تۆڕمیكس به‌ كۆمپیوته‌ر <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/LgxZmONHFTQ/mqdefault.jpg', '', 'LgxZmONHFTQ', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,kurdish,social,network,shalawkoy,kurdistan,kurdi', '00:00:59', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2082, 'Ox9Moic8IIdFvla', 1, 'jG4hTe', 'په‌یامی هونه‌رمه‌ند هه‌قاڵ كاوانی بۆ پاڵپشتی تۆڕمیكس Hava Kawani', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net', 'https://i.ytimg.com/vi/mcGGAvnombM/maxresdefault.jpg', '', 'mcGGAvnombM', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:49', 0, 1, 'other', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2081, 'BJsquUAwgZbB2Dd', 1, 'iPg7di', 'چۆنیه‌تی زیاد كردنی به‌ڕێوه‌به‌ر بۆ لاپه‌ڕه‌ به‌ كۆمپیوته‌ر.', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net', 'https://i.ytimg.com/vi/cBHVuvnER6E/maxresdefault.jpg', '', 'cBHVuvnER6E', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:46', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2080, 'cWm4hp6YoJOkQ3R', 1, 'p3Xgsr', 'تۆرمیکس چیە؟ کێ دایناوە', 'چۆنیەتی خۆتۆمارکردن لەتۆرمیکس <br>[a]https%3A%2F%2Fyoutu.be%2FBpIOXpx9f7g[/a] <br> <br> <br>ئەندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>ئای ئۆ ئێس (ئایفۆن) <br>https://www.google.com/url?sa=t&amp;source=web&amp;rct=j&amp;url=https://itunes.apple.com/us/app/tormix-timeline/id1389794427%3Fmt%3D8&amp;ved=2ahUKEwjvx_eHpvzcAhUnp4sKHUuNAVkQFjADegQIAxAB&amp;usg=AOvVaw1ucbyxfFRd-VYX8W3NG_NX <br> <br> <br>سایت <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/HdPZhGKXg4M/mqdefault.jpg', '', 'HdPZhGKXg4M', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '', '00:00:49', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2070, 'ZOKJQEC4n3trzmN', 1, 'rvyIoh', 'چۆنیه‌تی تۆماربوون له‌ تۆڕمیكس بۆ مۆبایل', 'تۆڕ میكس تۆڕێكی كۆمه‌ڵایه‌تی و بازرگانی كوردیه‌  <br>[a]www.Tormix.net[/a]', 'https://i.ytimg.com/vi/BpIOXpx9f7g/mqdefault.jpg', '', 'BpIOXpx9f7g', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'Tormix,Social,kurdish,Tormix.net', '00:02:01', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2071, 'wBLlurbymyysLYb', 1, '2HwMIF', 'یەکەم تۆڕی کۆمەڵایەتی کوردی کە لە لایەن کورد دروستکراوە tormix', 'لینکی بەرنامەکە ⬇ <br> <br>[a]https%3A%2F%2Ftormix.net%2F%3Fref%3Dismailaso[/a]', 'https://i.ytimg.com/vi/VMDwgU-guW0/mqdefault.jpg', '', 'VMDwgU-guW0', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '', '00:11:24', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2072, 'Lxvu5YBOacNk8qD', 1, '1vhflq', 'گۆڕینی ستۆری ئایفۆن و دابه‌زاندنی ئه‌پڵیكه‌یشنی تۆڕمیكس', 'گۆڕینی ستۆری ئایفۆن و دابه‌زاندنی ئه‌پڵیكه‌یشنی تۆڕمیكس <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/U7E14VDZxIc/mqdefault.jpg', '', 'U7E14VDZxIc', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:02:51', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2073, '3gouruNYZtFiI1s', 1, 'KiZYlt', 'چۆنیه‌تی تۆماربوون له‌ تۆڕمیكس بۆ كۆمپیوته‌ر  ...', '┈╌╍═≡☰   ABDULLA KIFRE  ☰≡═╍╌┈    <br>یه‌كه‌مین تۆڕی كۆمه‌ڵایه‌تی به‌زمانی كوردی كرایەوە     <br>  چۆنیه‌تی تۆماربوون له‌ تۆڕمیكس بۆ كۆمپیوته‌ر      <br>[a]https%3A%2F%2Ftormix.net%2F[/a]', 'https://i.ytimg.com/vi/cUccyjHUtYY/mqdefault.jpg', '', 'cUccyjHUtYY', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '', '00:02:24', 0, 1, 'other', 12, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2074, 'tTRYsWyWYglzriM', 1, 'ib1kpx', 'دانانی رۆژانه‌ له‌ تۆڕمیكس به‌ كۆمپیوته‌ر', 'دانانی رۆژانه‌ له‌ تۆڕمیكس به‌ كۆمپیوته‌ر <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/m565XhLN-EY/mqdefault.jpg', '', 'm565XhLN-EY', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '', '00:00:51', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2075, '6qJxEPs1XggW5B9', 1, 'Zsrz99', 'وه‌رگرتنی سه‌حه‌ شینه‌كه‌ له‌ تۆڕمیكس بۆ كۆمپیوته‌ر', 'وه‌رگرتنی سه‌حه‌ شینه‌كه‌ له‌ تۆڕمیكس بۆ كۆمپیوته‌ر <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/X7LMVQM_TYI/mqdefault.jpg', '', 'X7LMVQM_TYI', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,kurdish,social,network,shalawkoy,kurdistan,kurdi', '00:01:00', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2076, 'qXFNzj3Ue3xtpNN', 1, 'OkjlUO', 'چۆنیه‌تی داواكردنی سه‌حه‌ شینه‌كه‌ له‌ تۆڕمیكس به‌ مۆبایل', 'چۆنیه‌تی داواكردنی سه‌حه‌ شینه‌كه‌ له‌ تۆڕمیكس به‌ مۆبایل <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/QCSynICN_2c/mqdefault.jpg', '', 'QCSynICN_2c', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,kurdish,social,network,shalawkoy,kurdistan,kurdi', '00:00:53', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2077, 'mVzyPw9U2Ljt9US', 1, 'jk5h1E', 'چۆنیه‌تی زیادكردنی به‌ڕیوه‌به‌ر بۆ كۆمه‌ڵه‌', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net', 'https://i.ytimg.com/vi/X8Xqpmasrdk/maxresdefault.jpg', '', 'X8Xqpmasrdk', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:42', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2078, 'eO3w2SzE2YpiqMy', 1, 'EiW6Sh', 'چۆنیه‌تی دانانی ڕیكلام له‌ تۆڕمیكس هه‌نگاو به‌ هه‌نگاو', 'چۆنیه‌تی دانانی ڕیكلام له‌ تۆڕمیكس <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/LV2SK51sVf4/maxresdefault.jpg', '', 'LV2SK51sVf4', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormixnet,tormix,kurdish,social,network,ads,shalawkoy', '00:04:00', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2079, 'bZaE1yDxGyFctfd', 1, 'ciimNm', 'تۆرمیکس چیە؟ کێ دایناوە', 'چۆنیەتی خۆتۆمارکردن لەتۆرمیکس <br>[a]https%3A%2F%2Fyoutu.be%2FBpIOXpx9f7g[/a] <br> <br> <br>ئەندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>ئای ئۆ ئێس (ئایفۆن) <br>https://www.google.com/url?sa=t&amp;source=web&amp;rct=j&amp;url=https://itunes.apple.com/us/app/tormix-timeline/id1389794427%3Fmt%3D8&amp;ved=2ahUKEwjvx_eHpvzcAhUnp4sKHUuNAVkQFjADegQIAxAB&amp;usg=AOvVaw1ucbyxfFRd-VYX8W3NG_NX <br> <br> <br>سایت <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/HdPZhGKXg4M/mqdefault.jpg', '', 'HdPZhGKXg4M', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '', '00:00:49', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2069, '8oMhhXU5BBUsijC', 1, 'Ote8f7', 'براوه‌كانی پاكێجی زێڕین له‌ تۆڕمیكس', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/vSEiN3cyx5A/maxresdefault.jpg', '', 'vSEiN3cyx5A', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:02:24', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2068, 'RzfaEI4OmslgQRL', 1, 'a3LoZk', 'قسه‌كردن سه‌باره‌ت به‌ تۆڕمیكس له‌ رادیۆی پێشكه‌وتن به‌رنامه‌ی ده‌نگی ته‌كنه‌لۆژیا', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net', 'https://i.ytimg.com/vi/ucLrIK8n4VA/mqdefault.jpg', '', 'ucLrIK8n4VA', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:18:48', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2066, 'hWDka8n4fG3IFNw', 1, 'SOpja2', 'دروست كردني لاپه‌ڕه‌ به‌ مۆبایل له‌ تۆڕمیكس', 'دروست كردني لاپه‌ڕه‌ به‌ مۆبایل له‌ تۆڕمیكس <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/X0r5OO1SgJE/mqdefault.jpg', '', 'X0r5OO1SgJE', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,kurdish,social,network,shalawkoy,kurdistan,kurdi', '00:00:59', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2067, 'F3cw2YOx3rlQ1X2', 1, 'lkjcE4', 'په‌یامی به‌ڕێز زاموا Zamwa بۆ پاڵپشتی تۆڕمیكس', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net <br> <br>بینه‌ری ته‌واوی ڤیدیۆكه‌ بن له‌م به‌سته‌ره‌ی خواره‌وه‌ <br>[a]https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D59gdU3Qz4lg[/a]', 'https://i.ytimg.com/vi/cFlLVZgBOf8/mqdefault.jpg', '', 'cFlLVZgBOf8', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:37', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2065, 'eXAJp9cJWBNnkXT', 1, 'fvbBDd', 'ئێکەمین تورا کومەلاتیا کوردی TorMix', 'TorMix تورەکا کومەلاتیا کوردیە وەکی فەیسبوکی و ئینستاگرامی <br>ژلایێ چەند گەنجەکێن کوردڤە هاتیە دروست کرن  <br> <br>.......Android....... <br>TorMix Timeline : <br> <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>TorMix messenger : <br> <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.messenger[/a] <br> <br>.......IOS........... <br>TorMix Timeline : <br> <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>TorMix messenger : <br> <br>[a]https%3A%2F%2Fitunes.apple.com%2Fgb%2Fapp%2Ftormix-messenger%2Fid1391922840%3Fmt%3D8[/a] <br>......................................................... <br> <br>instagram: [a]https%3A%2F%2Fwww.instagram.com%2Ffor_all_pro%2F[/a] <br> <br>Telegram : [a]https%3A%2F%2Ft.me%2FF4orAll[/a] <br> <br>Tormix : [a]https%3A%2F%2Ftormix.net%2FForAll[/a] <br> <br>............................... <br>TorMix <br>#tormix <br>tormix.net <br>تور میکس <br>توڕ میکس', 'https://i.ytimg.com/vi/QkMphkZHafc/mqdefault.jpg', '', 'QkMphkZHafc', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormix.net,تور میکس,توڕ میکس,for all,for all kurdish', '00:04:49', 0, 1, 'other', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2064, 'eyw3mORPX5Uxn6K', 1, 'm12ePF', 'په‌یامی كه‌ناڵی كورد نێت بۆ پاڵپشتی #تۆڕمیكس.', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>سه‌بسكرایبی كه‌نأڵی كورد نێت بكه‌ن له‌م لینكه‌ی خواره‌وه‌  <br>[a]https%3A%2F%2Fwww.youtube.com%2Fchannel%2FUCekEfdV9pTxY2Z41y9NZ86Q[/a]', 'https://i.ytimg.com/vi/kiGJIQmWVAg/mqdefault.jpg', '', 'kiGJIQmWVAg', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:42', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2062, '5mHp1UVVj84CKY6', 1, 'vH5Tnh', 'گه‌ڕانه‌وه‌ی وشه‌ی نهێنی له‌ تۆڕمیكس  بۆ وێب', 'گه‌ڕانه‌وه‌ی وشه‌ی نهێنی له‌ تۆڕمیكس  بۆ وێب <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/Edv6hnElUco/mqdefault.jpg', '', 'Edv6hnElUco', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:56', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO `videos` (`id`, `video_id`, `user_id`, `short_id`, `title`, `description`, `thumbnail`, `video_location`, `youtube`, `vimeo`, `daily`, `facebook`, `twitch`, `twitch_type`, `time`, `time_date`, `active`, `tags`, `duration`, `size`, `converted`, `category_id`, `views`, `featured`, `registered`, `privacy`, `age_restriction`, `type`, `approved`, `240p`, `360p`, `480p`, `720p`, `1080p`, `2048p`, `4096p`, `sell_video`, `sub_category`, `geo_blocking`) VALUES
(2063, 'W2y9ewqy5qWC33J', 1, 'PFdSRS', 'TorMix First And Largest Kurdish Social Network', 'TorMix First And Largest Kurdish Social Network <br>تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>[a]www.Tormix.net[/a]', 'https://i.ytimg.com/vi/fmCnQm27bGs/mqdefault.jpg', '', 'fmCnQm27bGs', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,kurdish,social,network,تۆڕمیكس,www.tormix.net', '00:00:07', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2061, '9mEeP7ZohxMVDCA', 1, 'QI1jfJ', 'How To Create‌ TorMix Account With Mobile - New Version', 'Please click Like+subscribe ❤ <br> <br>[a]https%3A%2F%2FWWW.TorMix.Net[/a]', 'https://i.ytimg.com/vi/l9jCaj7lA9Y/mqdefault.jpg', '', 'l9jCaj7lA9Y', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, '#how_to #TorMix #Account #kurdish #social #network', '00:04:54', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2060, '1eN5WaOMxBjZgLB', 1, 'SRRgzM', 'Official Promo Video of Tormix Network 2018', 'Official Promo Video of Tormix Network 2018 <br>Join Now  <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/B27AlHVVtIE/maxresdefault.jpg', '', 'B27AlHVVtIE', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:01:41', 0, 1, 'other', 3, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2054, 'DtwdscwLUmBieUn', 1, 'Qh8SJB', 'How to unfriend all facebook friends at once kurdish', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br> <br>[a]https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Ftoolkit-for-facebook%2Ffcachklhcihfinmagjnlomehfdhndhep[/a]', 'https://i.ytimg.com/vi/iFgBR0jYjXQ/mqdefault.jpg', '', 'iFgBR0jYjXQ', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:02:14', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2055, 'BOcsIgcmTCqCuHz', 1, 'UB7C39', 'چۆنیه‌تی به‌ده‌ست هێنانی پاره‌ رۆژانه‌ تا 100$ له‌ ریگای تۆڕمیكسه‌وه‌ !!', '[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/JldS3Wc14yw/mqdefault.jpg', '', 'JldS3Wc14yw', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'چۆنیه‌تی به‌ده‌ست هێنانی پاره‌ رۆژانه‌ تا 100$ له‌ ریگای تۆڕمیكسه‌وه‌ !!,tormix,tormix.net,tormixnet,kurdish,social,network,peshmerga,new,shalawkoy', '00:00:21', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2056, 'qyDuPmsFbtusmll', 1, 'ZepJbT', 'په‌یامی ڤیكتۆر ئه‌شكان بۆ تۆڕمیكس victor ashkan', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/bv0qAFBO23o/maxresdefault.jpg', '', 'bv0qAFBO23o', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:00:48', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2057, 'hBYZnfdfnZvchwZ', 1, 'bEYezd', 'په‌یامی ڕه‌وه‌ز سلێمانی بۆ تۆڕمیكس  Rawaz Slemani', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a]', 'https://i.ytimg.com/vi/QZ8dyQV2_8A/mqdefault.jpg', '', 'QZ8dyQV2_8A', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:01:00', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2058, '4SMxBNHFnpPzjmm', 1, '1ggvfA', 'په‌یامی مه‌به‌ست كینگ Mabast King بۆ پاڵپشتی تۆڕمیكس', '#تۆڕمیكس یه‌كه‌مین و گه‌وره‌ترین تۆڕی كۆمه‌ڵایه‌تی كوردی <br>ئێوه‌ش به‌شداربن ... <br>[a]www.TorMix.net[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئه‌ندرۆید <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.tormix.Timeline[/a] <br> <br>داگرتنی ئه‌پڵیكه‌یشن بۆ ئای ئۆ ئێس (ئایفۆن) <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Ftormix-timeline%2Fid1389794427%3Fmt%3D8[/a] <br> <br>داگرتنی په‌یامبه‌ر بۆ كۆمپیوته‌ر  <br>[a]https%3A%2F%2Ftormix.net%2Fdownload%2FTorMix_Desktop_Messenger.rar[/a] <br> <br>لاپه‌ڕه‌ی  دابه‌زاندنه‌كان. <br>[a]https%3A%2F%2Ftormix.net%2Fdownload[/a] <br> <br>بۆ زانیاری زیاتر په‌یوه‌ندیمان پێوه‌ بكه‌ن یاخود له‌ كاتی هه‌بوونی پرسیار و كێشه‌. <br>tormixnet@gmail.com <br>info@tormix.net <br> <br>لینكی ته‌واوی ڤیدیۆكه‌ <br>https://www.youtube.com/watch?v=vERMTzb5QbM&amp;t=10s', 'https://i.ytimg.com/vi/sH2INHos6gQ/maxresdefault.jpg', '', 'sH2INHos6gQ', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'tormix,tormixnet,تورمیكس,تۆڕمیكس,kurdish,social,network,peshmerga,kobani,afrin,shalawkoy', '00:05:35', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2059, 'kr2E4sfiEY155Nb', 1, 'H9nzWH', 'tormix فێرکاری بەرنامە و دابەزاندنی', 'Farman Smaquly Channel <br>Subscribe ! <br>Goran Inzibat , Aram Shaida , Shirwan Abdulla , Karwan Xabati , Karwan Sharawani , Rebwar Malazada , Xola Dom , Jegr Media Hussen , Barzan Ja3far , Goran Ayar , Mstafa Penjweni , Smail Sardashti , Mstafa Shewaw , Qadr Moryasi , Said Ali Sardashti , Qadr Mamandi , Ahmad Shamal , Hassan Zirak , Mhamadi Mamle , Kamaran Omar , Farhad Zirak , Mazhar Xalqi , Nasr Razazi , Najmadin Gholami , Kamal Muhammad , Rostam Sabir , Adnan Karim , Ardalan Bakr , Hama Jaza , Nuri Garmyani , Aras Rabati , Ari Faruq , Sarxell Jaza , Hawzhin Atta , Xalid Rambo , Nariman Mahmud , Haba , Sangar Kamal , Baxtyar Salh , Mikael , Shex Abdulla , Ali Mardan , Said Ibrahim Saqzi , Omar Saqzi , Karim Xaki , Said Ali Azxar Kurdistani , Aram Sharawani , Ibrahim Qadri , Yadulla Muhamadi , Raza Julakani , Zakaria Abdulla , Zyad Asaad , Ahmad Darwesh , Fatah Sawzawari , Pshtiwan Nawroly , Fazil 3anabi , Sarkawt Qurbani , Faxir Hariri , Sura Mahrum , Taha Haji , Sabah Haji , Mhamad Taqana , Jalal Said , Jalal Shrit , Faqe Mina , Bryar Talani , Yadgar Xalidi , Dler CD , Nechir Baxdadi , Hiwa Iraqi , Karwan Osman , Qadr Gagli , Omar Gagli , Lajani , Rahman Xorani , Ahmad Bekas , Said Faxradin , Sevar Rabati , Safae Sharefe , Shera Dukani , Nukta , Rasoli Nadri , Ako Sangawi Sala , Mahir Hassan , 3aba Shet , Sarbaz Jamal , Nariman Baban , Mahdi Jabari , Ainadin , Kazm Bashmaxi , Ata Qadaxy , Rahim Pur , Dler Garmyani , Tapl u Nay , Ata Ismail , Osman Xayat , Osman Hawrami , Tipi Baban , Marzia Fariqi , Laila Fariqi , Chopy Fatah , Homer Dzey , Hani , Dyari Qaradaxi , Sh3r , Honrawa Bast Hama Xarib. Aram Shaida Goran Inzibat Xella sarxell Shirwan abdulla sherwan abdulla saman omar kamaran omar kosar chaviland iphone google pc it to galaxy kurd kurdistan kobani peshmerga awat bokani barham shamami karwan xabati karwan sharawani hawa hawzhin atta evin net tv NRT TV new clip nwe Sardar Karkuki Faxir hariri govar miran golchi Barcelona Real Madrid PSY Gentle man Gamer Shara ibrahim Darun NRT2 Evin aso avin aso helly luv hozan alin iraq kurdish xosh nwe taza toni barz hastan be wastan samal salh afshin marivani afshin azari farsi persian shahram gulchin kamal gulchin ivan benjamin Shalaw farman hiwa karokh karwan gulan shahid darbaz and ft pitbul kazhe hawta mahammad hawta. <br>nrt tv knn tv new mwcha 2016 2015 jastn bebar film 2017 karwan xabati karwan sharawani sardashti mahabati karkuk karkwk tv hawrami shara ewarani nrt2 westgay taxi taza kon xosh zoor maqam arab kurd iraq kurdistan mp3 mpc obama meesi c ronaldo sherwan barham shamami meran ali slimani shwbat ferkari galaxy iphone comedy kurdish funny new tormix net  2018 2019', 'https://i.ytimg.com/vi/0MJ8EwrEphs/maxresdefault.jpg', '', '0MJ8EwrEphs', '', '', '', '', '', 1551082009, '2019-02-25 08:06:49', 0, 'Farman,Smaquly,kurd,kurdista,gorani,nwe,music,song,kurdish,subtitle,tormix', '00:14:58', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2053, 'z1cXjyIDF6RKNZA', 1, 'n9Td8O', 'چۆنیه‌تی دروست كردنی ئه‌پڵ ئایدی له‌سه‌ر كۆمپیوته‌ر-how to create Free Apple ID', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە...', 'https://i.ytimg.com/vi/uMYZH2Ojt6o/maxresdefault.jpg', '', 'uMYZH2Ojt6o', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:35', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2052, 'rHMhzNhnnJxVEZU', 1, 'EFapBv', 'دانانی ڕۆژانه‌ (ستۆری) له‌ تۆڕمیكس', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/MxXKTd_OUDc/mqdefault.jpg', '', 'MxXKTd_OUDc', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:51', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2051, 'l3l8VNlXd2exIIs', 1, 'GDwTMx', 'How to Install Wifislax 4 10 on VMware Kurdish', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>1-Download wifislax  <br>[a]https%3A%2F%2Fmega.nz%2F%23%21A5gBEbzI%21H47ympOqbXwfBX3Qk9QGVGLeNlcu7ma451oyInf6WS4[/a]', 'https://i.ytimg.com/vi/aUjlTbhT-8c/mqdefault.jpg', '', 'aUjlTbhT-8c', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:07:17', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2049, 'ILVvqxiiPcagafn', 1, '47A1HF', 'TorMix.net Promo', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/voZVvmH5c00/mqdefault.jpg', '', 'voZVvmH5c00', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:00:07', 0, 1, 'other', 2, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2050, '21mGQZOTmKGaHSU', 1, 'FGisyu', 'Install Parrot sec on virtualbox in windows 7-8 چۆنیه‌تی دابه‌زاندنی پاڕۆت به‌ وه‌همی له‌سه‌ر ویندۆز', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>پێداویستیەکانی لەم ڤیدیۆیە بەکارھاتووە... <br>Download Virtualbox: [a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a] <br>Download Parrot Sec: [a]https%3A%2F%2Fwww.parrotsec.org[/a]', 'https://i.ytimg.com/vi/49mUMic-nsk/mqdefault.jpg', '', '49mUMic-nsk', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:06:06', 0, 1, 'other', 0, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2048, 'zFcKhyXZO3tb6Tw', 1, 'x4ioSZ', 'چۆنیه تی دانانی كاڵا بۆ فرۆشتن له  بازاڕی تۆڕمیكس به  كۆمپیوته ر', 'بیرتان نەچێت سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن... <br> <br>سوپاس بۆ ڵایک کردنی ڤیدیۆکانمان. <br> <br>بۆ ھەبوونی ھەر پرسیار یان کێشەیەک سەبارەت بە -فەیس بووک-لینوکس-ویندۆز ...ھتد.. <br> <br>ئەتوانن لەم لینکەی خوارەوە لە ڕێگای فەیس بووەکەوە مەسجم بۆ بنێرن بە پێی توانا لە خزمەتان دام <br> <br>[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>شاڵاو کۆیی :) <br> <br>[a]www.tormix.net[/a]', 'https://i.ytimg.com/vi/Gji-izGrHS8/maxresdefault.jpg', '', 'Gji-izGrHS8', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Linux,Windows,Mac,Apple,microsoft,Ferkari,kurdi,game,Hack,Facebook,twitter', '00:01:33', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2096, 'NnA6yALez9E2WL9', 5, '5DywOf', 'Ahmad kaya - soyle', 'Ahmad kaya - soyle', 'upload/photos/2019/03/YOJ69JiLXd2w1sBQYCge_02_49e9985e702a74c6292d46f990f283a3_image.jpg', 'upload/videos/2019/03/WCckTdn8Jbl1qR4hHK7C_02_40229eafd93b806396dc372b29942287_video.mp4', '', '', '', '', '', '', 1551538875, '2019-03-02 15:01:15', 0, 'Music,Turkye,Song', '3:13', 84511263, 1, '3', 29, 1, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', ''),
(2047, 'MOfVsUEXT5GWD8Q', 1, 'Llbjx4', 'How To Install Fedora on Windows 7 Virtualbox-چۆنیەتی دابەزاندنی فیدۆرا لەسەر ویندۆز٧ بە وەھمی', 'How To Install Fedora on Windows 7 Virtualbox-چۆنیەتی دابەزاندنی فیدۆرا لەسەر ویندۆز٧ بە وەھمی <br> <br>Download Fedora:[a]https%3A%2F%2Fgetfedora.org[/a] <br>Download Virtualbox:[a]https%3A%2F%2Fwww.virtualbox.org%2Fwiki%2FDownloads[/a] <br>Facebook Account:[a]https%3A%2F%2Fwww.facebook.com%2FShalaw.TheSadboy[/a] <br> <br>سەبسکرایبمان بکە بۆ ئەوەی بەردەوام ئاگاداری فێرکاری نوێتر بن...', 'https://i.ytimg.com/vi/Y8ntsOS9Qo0/mqdefault.jpg', '', 'Y8ntsOS9Qo0', '', '', '', '', '', 1551081861, '2019-02-25 08:04:21', 0, 'Ferkai,ubuntu,kalilinux,shalawkoy,hack,wifi,kurd,kurdi,ferkari,fedora,windows', '00:12:18', 0, 1, 'other', 1, 0, '2019/2', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', ''),
(2113, 'YWHz5XqKIO4LyKf', 5, '1df3Sb', 'Adele - Rolling In The Deep', 'Adele - Rolling In The Deep', 'upload/photos/2019/03/9mueJDWuUCSsF9cl458Z_19_7cd13022a1afb2e6e5e7f26ebdaf3e47_image.jpg', 'upload/videos/2019/03/PKXNYmGzFPwEhkRdLf5L_19_781a9a03ca8432939ece9fb4a57b9862_video.mp4', '', '', '', '', '', '', 1553008262, '2019-03-19 15:11:02', 0, 'Adele,English,Music,Song,Video', '3:54', 32092982, 1, '3', 44, 1, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2117, 'FCW8ueeloAaQDvc', 5, 'Dps2O8', 'چۆنیەتی تەلخ کردنی دواوەی وێنە تەنها بە یەک کلیک', 'Link For Android↙ <br>[a]https%3A%2F%2Fplay.google.com%2Fstore%2Fapps%2Fdetails%3Fid%3Dcom.mt.mtxx.mtxx[/a] <br> <br> <br>Link For ios↙ <br>[a]https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Fmeitu%2Fid416048305%3Fmt%3D8[/a] <br> <br> <br>ڤیدیۆی پێشوومان↙ <br>چۆنیەتی گۆڕینی وێنە بۆ ئەفلام کارتۆن بە جوانترین شێوە↙ <br>[a]https%3A%2F%2Fyoutu.be%2FZQlDgb1Je-w[/a] <br> <br> <br>بە هیوای سوود', 'https://i.ytimg.com/vi/NdWrvpVJD2M/mqdefault.jpg', '', 'NdWrvpVJD2M', '', '', '', '', '', 1553094824, '2019-03-20 15:13:44', 0, 'Design,Image,How To', '00:05:12', 0, 1, '12', 28, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]'),
(2118, 'E8mx45Qw8pZEvUI', 5, 'aRvqlo', 'NAVID ZARDI - SARCHOPI', 'SARCHOPI  <br>   NAVID ZARDI  <br>  <br>LYRICS: HEME S. IBRAHIM  <br>MUSIC PRODUCER: ARYOS  <br>  <br>  <br>——————————————————  <br>SARCHOPI  <br>NAVID ZARDI  <br>LYRICS: HEME S. IBRAHIM  <br>LYRICS BADINI: ARDEWAN BRADOSTI  <br>EZ BERFIM  <br>LYRICS &amp; MELODY:FOLKLORE   <br>KELHORI LYRICS &amp; MELODY: ESMAIL MESQETI  <br>HEWRAMI LYRICS &amp; MELODY: FOLKLORE   <br>MUSIC PRODUCER: ARYOS  <br>KEMANCE: GORAN KAMIL  <br>JUMBUSH: GORAN KAMIL  <br>BALEBAN: JWANRO  <br>DEF ZERB: ZHENYAR  <br>VOCAL RECORDING: MAJID KAZMI  <br>MIX &amp; MASTERING: ARYOS', 'https://i.ytimg.com/vi/FNN8k3UJf5c/maxresdefault.jpg', '', 'FNN8k3UJf5c', '', '', '', '', '', 1553100360, '2019-03-20 16:46:00', 0, 'navid zardi sarchopi,navid zardi sarchopy,Navid Zardi sercopy,Navid Zardi halparke,HALPARKE kurdi,Aram sheyda,Hardi salami,To pirozi,XAYAL,Aryas Javan,Shahaz zamani,Miran ali,Shayay kurdi,Navid Zardi to,Mahabad,Slemani,Hawler,Raghse kordi,Nawid Zardi,Nevid zerdi,Zakaria abdullah,Dlakam,Lawa lawa,Navid Zardi bro,Ahange shad,Newroz,Nawroz,Sitak,Shaqlawa,Bgarewa,Shadmehr,Mohsen yeganeh,Halay,Halay music', '00:07:10', 0, 1, '3', 2, 0, '2019/3', 0, 1, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `videos_transactions`
--

CREATE TABLE `videos_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `paid_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `admin_com` varchar(11) NOT NULL DEFAULT '0',
  `currency` varchar(11) NOT NULL DEFAULT 'USD',
  `time` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_ads`
--

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL,
  `ad_link` varchar(400) NOT NULL DEFAULT '',
  `name` varchar(300) NOT NULL DEFAULT '',
  `ad_media` varchar(400) NOT NULL DEFAULT '',
  `ad_image` varchar(400) NOT NULL DEFAULT '',
  `skip_seconds` int(11) NOT NULL DEFAULT 0,
  `vast_type` varchar(30) NOT NULL DEFAULT '',
  `vast_xml_link` varchar(700) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT 0,
  `fingerprint` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `video_id`, `fingerprint`, `user_id`, `time`) VALUES
(1, 93, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550702508'),
(2, 99, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550702661'),
(3, 96, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550702677'),
(4, 99, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 0, '1550729172'),
(5, 99, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 3, '1550759643'),
(6, 98, '24e4481c17d9a6665088b77e79849762836e7ab7', 0, '1550793841'),
(7, 100, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798238'),
(8, 101, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798266'),
(9, 102, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798287'),
(10, 103, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798313'),
(11, 104, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798327'),
(12, 105, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798344'),
(13, 106, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798369'),
(14, 107, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798400'),
(15, 108, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798420'),
(16, 109, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798435'),
(17, 110, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798540'),
(18, 111, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798604'),
(19, 112, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798622'),
(20, 113, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798641'),
(21, 114, '24e4481c17d9a6665088b77e79849762836e7ab7', 4, '1550798660'),
(22, 614, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550800490'),
(23, 587, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550800742'),
(24, 828, '24e4481c17d9a6665088b77e79849762836e7ab7', 1, '1550801795'),
(25, 614, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 3, '1550803526'),
(26, 614, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 0, '1550838556'),
(27, 1988, 'adeeac62664deaa4cec52e73dab6d65706569d5c', 5, '1550849573'),
(28, 614, 'adeeac62664deaa4cec52e73dab6d65706569d5c', 5, '1550850586'),
(29, 1989, 'adeeac62664deaa4cec52e73dab6d65706569d5c', 5, '1550851413'),
(30, 1990, 'adeeac62664deaa4cec52e73dab6d65706569d5c', 5, '1550852168'),
(31, 1990, 'f02564f54701b553efa65adb3c3b235ee6c4614a', 0, '1550857740'),
(32, 611, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1550869377'),
(33, 1991, '281d0aa181ac6635546de7aac071a2ac9537ee98', 5, '1550921981'),
(34, 1992, '281d0aa181ac6635546de7aac071a2ac9537ee98', 5, '1550922514'),
(35, 1992, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1550953278'),
(36, 1993, 'ca384ba3e7bae44915c18fd26fbc2f713735477e', 5, '1551010349'),
(37, 1994, '281d0aa181ac6635546de7aac071a2ac9537ee98', 5, '1551015726'),
(38, 599, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551040532'),
(39, 1994, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551081084'),
(40, 1995, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551081653'),
(41, 2089, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551085908'),
(42, 2030, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551087525'),
(43, 2090, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551127012'),
(44, 2091, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551127166'),
(45, 2030, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551130976'),
(46, 2092, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551135441'),
(47, 2093, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551135692'),
(48, 1998, '6413fe7dcb3fd0ebf8f468d126a101f4e484ca46', 1, '1551135811'),
(49, 614, '238dfec1abca9944fd507f253fd2e9c41672adf6', 0, '1551175255'),
(50, 613, '238dfec1abca9944fd507f253fd2e9c41672adf6', 0, '1551175261'),
(51, 610, '238dfec1abca9944fd507f253fd2e9c41672adf6', 0, '1551175265'),
(52, 602, '238dfec1abca9944fd507f253fd2e9c41672adf6', 0, '1551175275'),
(53, 1990, '238dfec1abca9944fd507f253fd2e9c41672adf6', 0, '1551175427'),
(54, 1994, '1ee8bfbca0b230c9f6eafedf88741cb2ecf4a8cc', 0, '1551181309'),
(55, 2093, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551187339'),
(56, 2094, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551188030'),
(57, 2095, 'd6714f08fd9daf31c6b2730438e0f3dd8d21986c', 5, '1551189614'),
(58, 2088, 'a5a87939c47f95a8003d48075e4f1c64958323ca', 6, '1551192459'),
(59, 2005, '1d9254110e6218a7b3eb3e0e93839bd5f191f1ba', 5, '1551210697'),
(60, 2094, 'a5a87939c47f95a8003d48075e4f1c64958323ca', 9, '1551224234'),
(61, 2094, '715a5f34f01bd872af475af59b41f5c1959400ac', 0, '1551262995'),
(62, 2087, 'bb7c6f515a212b6107f0a571075f41105aab9169', 0, '1551371371'),
(63, 2087, 'b6f65597b0ed474aef2b03b2a777957fd2bc99db', 0, '1551371388'),
(64, 2055, 'b6f65597b0ed474aef2b03b2a777957fd2bc99db', 0, '1551371402'),
(65, 2083, '57d47a6245a5278f4514ece53063a5c50957362a', 0, '1551382048'),
(66, 2086, '57d47a6245a5278f4514ece53063a5c50957362a', 0, '1551382101'),
(67, 609, 'f0c732e6de0ee05d1685a2e32349530b47f47eea', 0, '1551391099'),
(68, 2095, 'f18ff3e1fcfb22b9a601a70c75aa0141a4fe9814', 2, '1551458064'),
(69, 2094, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469499'),
(70, 1994, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469554'),
(71, 1993, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469577'),
(72, 1990, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469633'),
(73, 1989, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469652'),
(74, 613, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469693'),
(75, 612, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469705'),
(76, 610, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469714'),
(77, 611, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469720'),
(78, 609, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469732'),
(79, 1992, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469793'),
(80, 2030, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469808'),
(81, 2084, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469866'),
(82, 2085, '13c48d8dd20bfff5c13c3fd86c3041d829e4ee74', 0, '1551469889'),
(83, 1990, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551482336'),
(84, 2096, '83f6e1326ac701852dbc7e9adb4c7b19097572ff', 5, '1551538879'),
(85, 2086, '1ed19a48449557781aef4fcd1c03a44c789c3940', 0, '1551563106'),
(86, 2096, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 1, '1551612575'),
(87, 603, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 1, '1551612584'),
(88, 2096, 'f577cc452a575cb5b02575fa001546d1ee8469dd', 0, '1551669353'),
(89, 609, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721175'),
(90, 614, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721181'),
(91, 608, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721214'),
(92, 612, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721278'),
(93, 606, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721340'),
(94, 600, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721410'),
(95, 599, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721487'),
(96, 596, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721520'),
(97, 588, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721576'),
(98, 589, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721656'),
(99, 601, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721703'),
(100, 603, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551721925'),
(101, 2096, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551722015'),
(102, 568, 'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb', 0, '1551722041'),
(103, 2097, '45c41a5515d0c38650b32c382350645dc24a2081', 11, '1551772460'),
(104, 2087, '45c41a5515d0c38650b32c382350645dc24a2081', 11, '1551773188'),
(105, 2086, '45c41a5515d0c38650b32c382350645dc24a2081', 11, '1551773204'),
(106, 1994, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551775919'),
(107, 2079, 'b90626efae0f46922e2f78371079b0585599da10', 11, '1551784326'),
(108, 2080, 'b90626efae0f46922e2f78371079b0585599da10', 11, '1551784331'),
(109, 2096, '1a520e7e2b360c46757e5cf60a6c892edd3a780a', 0, '1551796639'),
(110, 2089, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551808786'),
(111, 2087, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551821853'),
(112, 2086, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551823576'),
(113, 2085, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551824696'),
(114, 1992, '9864e63e17de1079f759e54e1e6024d0c3155da4', 0, '1551832084'),
(115, 2094, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1551869561'),
(116, 2096, '67a8406fb100ae185f5c38d2db99d4a27a925c30', 0, '1551880980'),
(117, 2097, '1d9254110e6218a7b3eb3e0e93839bd5f191f1ba', 5, '1551899943'),
(118, 2094, '3204483b36dff0c4cb564f123a46400c28f31965', 0, '1551907099'),
(119, 2074, '3204483b36dff0c4cb564f123a46400c28f31965', 0, '1551907156'),
(120, 614, 'efe017917369bb03394e13ac36c39a248aeed7d8', 0, '1552051655'),
(121, 612, 'efe017917369bb03394e13ac36c39a248aeed7d8', 0, '1552051678'),
(122, 1990, 'a99e4c0b37670492cd8307add083e161f2efb874', 0, '1552072090'),
(123, 2096, 'a99e4c0b37670492cd8307add083e161f2efb874', 0, '1552076790'),
(124, 609, 'a99e4c0b37670492cd8307add083e161f2efb874', 0, '1552077767'),
(125, 614, '371bf1211339dca660dc9c256ea2ef4b9e18cede', 0, '1552080289'),
(126, 614, '372d7a902a14e5efc8005019710ff61cacfd8088', 0, '1552080306'),
(127, 599, 'a99e4c0b37670492cd8307add083e161f2efb874', 0, '1552081744'),
(128, 1997, 'f741ce8d1e6a2968b92b204b46ac9f2aff22ba67', 14, '1552139411'),
(129, 614, 'edff4894ff922eb212477c1b3494c428d825f86d', 0, '1552157138'),
(130, 610, 'edff4894ff922eb212477c1b3494c428d825f86d', 0, '1552157172'),
(131, 605, 'edff4894ff922eb212477c1b3494c428d825f86d', 0, '1552157218'),
(132, 604, 'edff4894ff922eb212477c1b3494c428d825f86d', 0, '1552157242'),
(133, 609, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552161702'),
(134, 2098, '52539094369606f56dfada72a40b4ac891adc45e', 1, '1552167734'),
(135, 2060, '52539094369606f56dfada72a40b4ac891adc45e', 15, '1552167946'),
(136, 582, 'a99e4c0b37670492cd8307add083e161f2efb874', 0, '1552190819'),
(137, 2098, 'a0be6caa42e218dcc2f21cbd56e9a59f4d94145a', 5, '1552215747'),
(138, 609, 'ef9b38b06037fac91aa219a71d3b6c14804463a3', 0, '1552225266'),
(139, 2096, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552226172'),
(140, 2088, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552227459'),
(141, 2044, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552228544'),
(142, 594, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552233654'),
(143, 2069, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552240463'),
(144, 574, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552243304'),
(145, 2057, '9864e63e17de1079f759e54e1e6024d0c3155da4', 0, '1552243887'),
(146, 2058, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552247849'),
(147, 2064, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552249557'),
(148, 607, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552254097'),
(149, 2076, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552258073'),
(150, 578, 'eb16a5e7e784c69492bea816641b8de40feeb42b', 0, '1552259783'),
(151, 2049, '29391b81ea55d78a71c1c90984ef4cc3645a4c6e', 0, '1552268064'),
(152, 610, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552268878'),
(153, 2040, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552276834'),
(154, 600, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552277956'),
(155, 1989, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552280799'),
(156, 2082, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552281380'),
(157, 2000, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552284776'),
(158, 2023, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552286979'),
(159, 2072, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552287609'),
(160, 2025, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552290449'),
(161, 609, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552295395'),
(162, 2049, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552330959'),
(163, 575, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552392304'),
(164, 1997, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552396293'),
(165, 602, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552399689'),
(166, 2097, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552400822'),
(167, 580, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552420134'),
(168, 613, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552425244'),
(169, 2022, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552429794'),
(170, 595, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552431491'),
(171, 601, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552433208'),
(172, 2079, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552440255'),
(173, 589, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552483192'),
(174, 2074, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552500789'),
(175, 611, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552501358'),
(176, 2002, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552505335'),
(177, 608, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552505905'),
(178, 2070, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552507048'),
(179, 2067, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552507622'),
(180, 2003, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552508173'),
(181, 2066, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552508739'),
(182, 2017, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552511211'),
(183, 2011, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552511580'),
(184, 612, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552512149'),
(185, 2038, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552514755'),
(186, 2043, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552515327'),
(187, 2015, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552516478'),
(188, 2019, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552536918'),
(189, 569, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552540900'),
(190, 2078, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552547130'),
(191, 2087, 'fb2661eaf5ab9809629fb8544dd53f1ad7530faa', 0, '1552548244'),
(192, 2041, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552549416'),
(193, 2053, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552552256'),
(194, 2071, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552553377'),
(195, 2013, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552553948'),
(196, 2005, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552554679'),
(197, 583, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552555148'),
(198, 2062, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552583379'),
(199, 2077, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552583945'),
(200, 610, '659f2c7fe50c5c106bc11174480a3a813438220d', 0, '1552585119'),
(201, 608, '659f2c7fe50c5c106bc11174480a3a813438220d', 0, '1552585125'),
(202, 2099, '60375b57d42ce73a0097fdb76c3ca465100bc8c1', 16, '1552597502'),
(203, 606, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552610646'),
(204, 2080, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552618602'),
(205, 2047, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552648140'),
(206, 2009, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552653826'),
(207, 2100, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1552666980'),
(208, 2037, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552671418'),
(209, 2099, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552682241'),
(210, 2099, 'f10c5e54bd2ef9cc5abdd03328f4ff058b12327d', 0, '1552682261'),
(211, 589, '6d275becd0e176ad98760ddeb972c615751c3c50', 0, '1552683772'),
(212, 2048, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552687901'),
(213, 589, 'd59db41796fbdb842833c7f65109ff8c721f6a4b', 0, '1552693366'),
(214, 2035, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552696410'),
(215, 614, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552705248'),
(216, 601, '9a8a95e7a0a8bf2bcd3ab5ea11ba9001a8517fae', 0, '1552723790'),
(217, 608, '663a82259b78808382d15e18603e8a5a03c62158', 0, '1552727760'),
(218, 2068, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552733253'),
(219, 569, '7e2f450984f532a30a81d4a7aa011d0654ce690c', 0, '1552733472'),
(220, 2099, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1552737114'),
(221, 614, 'aaf9eca2696a4f64e59b1ff39a5676a7c9dae4f8', 0, '1552737194'),
(222, 2087, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1552737306'),
(223, 2094, 'd51a2a50585c267ed1d8defb9233ae474bf792be', 0, '1552737959'),
(224, 1990, 'd51a2a50585c267ed1d8defb9233ae474bf792be', 0, '1552738681'),
(225, 571, 'd51a2a50585c267ed1d8defb9233ae474bf792be', 0, '1552738705'),
(226, 607, 'd51a2a50585c267ed1d8defb9233ae474bf792be', 0, '1552738720'),
(227, 2100, 'd51a2a50585c267ed1d8defb9233ae474bf792be', 1, '1552739488'),
(228, 2101, 'b268373eaad15e2649283091473eb363574c2978', 5, '1552743232'),
(229, 2102, 'b268373eaad15e2649283091473eb363574c2978', 5, '1552755084'),
(230, 580, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1552756412'),
(231, 2102, '07f99a64f11a56de540442b895561a9f7420be77', 0, '1552756417'),
(232, 2032, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552771307'),
(233, 573, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552774133'),
(234, 574, 'bf5332f28b2342381c9dab66ebbdbea93ae77c85', 0, '1552774424'),
(235, 2054, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552784364'),
(236, 593, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552824326'),
(237, 2102, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 0, '1552825224'),
(238, 2102, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552825513'),
(239, 2102, 'e3207a59d5de788a14ae9fdc5b5ecfca15a784d0', 0, '1552825807'),
(240, 2102, '68695d3625667f65c085b75a0342a0e933b34d5c', 1, '1552825888'),
(241, 2102, '5603e590a37869f1d5a1a92274ab977242f1fe84', 0, '1552829160'),
(242, 2063, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552830173'),
(243, 570, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552844590'),
(244, 2101, '17b0086a321f31a845f2b0d7381b012be06829e5', 0, '1552850873'),
(245, 609, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1552850880'),
(246, 582, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552856518'),
(247, 579, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552858791'),
(248, 576, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552862767'),
(249, 2100, 'd097c21eb29bea2f94a593a9b69ce2de885b4cc6', 0, '1552863487'),
(250, 568, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552865609'),
(251, 588, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552867889'),
(252, 2052, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552871293'),
(253, 585, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552872991'),
(254, 603, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552881513'),
(255, 596, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552886624'),
(256, 598, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552887193'),
(257, 605, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 1, '1552887411'),
(258, 613, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 1, '1552887811'),
(259, 610, '391b7b0120d201a22267e5ef065ccfe0b6b58cc7', 1, '1552887835'),
(260, 2024, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552888327'),
(261, 2006, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552890628'),
(262, 2039, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552894006'),
(263, 1996, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552895724'),
(264, 2008, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1552901405'),
(265, 1990, '96af1bb896b8c303b2b44d7b068bc0c425726eb4', 0, '1552906967'),
(266, 2100, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552909342'),
(267, 591, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552921272'),
(268, 590, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552925247'),
(269, 609, 'cd72134906f80a405122d328d9a1e7ed8b079b23', 0, '1552925963'),
(270, 612, 'cd72134906f80a405122d328d9a1e7ed8b079b23', 0, '1552925993'),
(271, 594, 'f99602f17fbfc0a70651bf5459029a7e49aae59c', 0, '1552929896'),
(272, 608, 'f99602f17fbfc0a70651bf5459029a7e49aae59c', 0, '1552930137'),
(273, 584, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552930933'),
(274, 2060, '30aedd0be711abb4ab5607b5233fb6a96da3378a', 0, '1552933121'),
(275, 2071, '30aedd0be711abb4ab5607b5233fb6a96da3378a', 0, '1552933144'),
(276, 2096, '30aedd0be711abb4ab5607b5233fb6a96da3378a', 0, '1552933203'),
(277, 609, '74f408c01116144db8f58b54aaff2133b694cb0b', 0, '1552942312'),
(278, 613, '74f408c01116144db8f58b54aaff2133b694cb0b', 0, '1552942334'),
(279, 609, 'fa151c133caa55cc35952043abb53781569cbd9e', 0, '1552942356'),
(280, 609, '8ce1d728843f0ef940653b0a68017b9a68c68ded', 0, '1552942954'),
(281, 614, '8ce1d728843f0ef940653b0a68017b9a68c68ded', 0, '1552942989'),
(282, 605, '1a66dd200325db934fad2c394eb7dc342500aa5e', 0, '1552955027'),
(283, 2036, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552965578'),
(284, 2096, 'ce22b37046281700353b09029706f77a8779f650', 0, '1552985176'),
(285, 592, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1552991139'),
(286, 2103, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552991501'),
(287, 2104, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552992542'),
(288, 2105, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552992653'),
(289, 2106, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552992884'),
(290, 2107, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552993069'),
(291, 2108, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552993285'),
(292, 2109, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552993487'),
(293, 2110, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552993651'),
(294, 2111, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552993880'),
(295, 2112, 'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de', 5, '1552994213'),
(296, 578, '810d7dc99218d9135bebfe95e484b74f257a4df5', 0, '1552996773'),
(297, 609, 'f2ae38991b679bf143bce4d06689760d63be1942', 0, '1553000985'),
(298, 2113, '889f833b4e96ac474841e6730c0b3553b8513090', 5, '1553008270'),
(299, 2087, 'f5e1e44990b09a9c9bfc3e32e00c09bdaca63bc8', 0, '1553028008'),
(300, 2103, '68695d3625667f65c085b75a0342a0e933b34d5c', 1, '1553043297'),
(301, 2110, '68695d3625667f65c085b75a0342a0e933b34d5c', 1, '1553045288'),
(302, 2114, '68695d3625667f65c085b75a0342a0e933b34d5c', 1, '1553045408'),
(303, 567, '68695d3625667f65c085b75a0342a0e933b34d5c', 1, '1553045888'),
(304, 609, 'd00531561203a81dd12f395586835b0a67b0e70f', 0, '1553067824'),
(305, 2115, '889f833b4e96ac474841e6730c0b3553b8513090', 5, '1553093906'),
(306, 2116, '889f833b4e96ac474841e6730c0b3553b8513090', 5, '1553094440'),
(307, 2117, '889f833b4e96ac474841e6730c0b3553b8513090', 5, '1553094826'),
(308, 2118, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1553100361'),
(309, 2119, 'ba2a43b3de9fe71739a8f38ac58f116d9e441db9', 5, '1553100690'),
(310, 2119, 'b415d9e30cae5fd54cfe94acb9b540b5a64d97aa', 0, '1553100872'),
(311, 2020, '0d12c8e756f9a518a6543392bd77b2dbf5a19b68', 0, '1553104752'),
(312, 609, '77c8ef2c96f486366ea7f33607f7c6d0bff14dc0', 0, '1553110169'),
(313, 609, 'e777494c3a596acbce1e5b5788a0d5fa751b784a', 0, '1553112419'),
(314, 614, 'e777494c3a596acbce1e5b5788a0d5fa751b784a', 0, '1553112451'),
(315, 2095, 'e777494c3a596acbce1e5b5788a0d5fa751b784a', 0, '1553112467'),
(316, 588, 'e7825cd5e4a8d0e629271902c27b7edf0e74f287', 0, '1553131474'),
(317, 2118, '358e49b50aa55f7c960908b1031eed83a0b47889', 0, '1553177273'),
(318, 2103, '358e49b50aa55f7c960908b1031eed83a0b47889', 0, '1553177318'),
(319, 2113, '358e49b50aa55f7c960908b1031eed83a0b47889', 0, '1553177338'),
(320, 2088, '179a904cc161834a1eef12926e1a85c226522c21', 0, '1553180610'),
(321, 609, 'd0c6746aa51157d9d70d09dbae6be8cdb4232abd', 0, '1553190833'),
(322, 609, '9c523148e3598d9e4a88119a283f016d1758ff74', 0, '1553195187');

-- --------------------------------------------------------

--
-- Table structure for table `watch_later`
--

CREATE TABLE `watch_later` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `video_id` int(30) NOT NULL DEFAULT 0,
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_transactions`
--
ALTER TABLE `ads_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `announcement_views`
--
ALTER TABLE `announcement_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `banned`
--
ALTER TABLE `banned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `likes` (`likes`),
  ADD KEY `dis_likes` (`dis_likes`);

--
-- Indexes for table `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `type` (`type`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `reply_id` (`reply_id`);

--
-- Indexes for table `comm_replies`
--
ALTER TABLE `comm_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`(255));

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_key` (`lang_key`);

--
-- Indexes for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `type` (`type`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `privacy` (`privacy`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `seen` (`seen`),
  ADD KEY `time` (`time`),
  ADD KEY `from_deleted` (`from_deleted`),
  ADD KEY `to_deleted` (`to_deleted`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `type` (`type`),
  ADD KEY `seen` (`seen`),
  ADD KEY `notifier_id` (`notifier_id`),
  ADD KEY `time` (`time`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `sent_push` (`sent_push`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`),
  ADD KEY `type` (`type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `play_list`
--
ALTER TABLE `play_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `video_id` (`video_id`(255));

--
-- Indexes for table `profile_fields`
--
ALTER TABLE `profile_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_page` (`registration_page`),
  ADD KEY `active` (`active`),
  ADD KEY `profile_page` (`profile_page`);

--
-- Indexes for table `pt_posts`
--
ALTER TABLE `pt_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views` (`views`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `active` (`active`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `processing` (`processing`),
  ADD KEY `video_res` (`video_res`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `saved_videos`
--
ALTER TABLE `saved_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `platform` (`platform`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `site_ads`
--
ALTER TABLE `site_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placement` (`placement`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typings`
--
ALTER TABLE `typings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `password` (`password`),
  ADD KEY `last_active` (`last_active`),
  ADD KEY `admin` (`admin`),
  ADD KEY `active` (`active`),
  ADD KEY `registered` (`registered`),
  ADD KEY `is_pro` (`is_pro`),
  ADD KEY `wallet` (`wallet`),
  ADD KEY `balance` (`balance`),
  ADD KEY `video_mon` (`video_mon`);

--
-- Indexes for table `user_ads`
--
ALTER TABLE `user_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `location` (`location`(255)),
  ADD KEY `placement` (`placement`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category` (`category`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `verification_requests`
--
ALTER TABLE `verification_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_id_2` (`video_id`),
  ADD KEY `youtube_id` (`youtube`),
  ADD KEY `vimeo` (`vimeo`),
  ADD KEY `daily` (`daily`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `featured` (`featured`),
  ADD KEY `registered` (`registered`),
  ADD KEY `views` (`views`),
  ADD KEY `time` (`time`),
  ADD KEY `order1` (`category_id`,`id`),
  ADD KEY `order2` (`id`,`views`),
  ADD KEY `240p` (`240p`),
  ADD KEY `360p` (`360p`),
  ADD KEY `480p` (`480p`),
  ADD KEY `720p` (`720p`),
  ADD KEY `1080p` (`1080p`),
  ADD KEY `4096p` (`4096p`),
  ADD KEY `2048` (`2048p`),
  ADD KEY `privacy` (`privacy`),
  ADD KEY `short_id` (`short_id`),
  ADD KEY `age_restriction` (`age_restriction`),
  ADD KEY `approved` (`approved`),
  ADD KEY `twitch` (`twitch`),
  ADD KEY `sub_category` (`sub_category`),
  ADD KEY `geo_blocking` (`geo_blocking`),
  ADD KEY `sell_video` (`sell_video`);
ALTER TABLE `videos` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `videos` ADD FULLTEXT KEY `title` (`title`);
ALTER TABLE `videos` ADD FULLTEXT KEY `tags` (`tags`);

--
-- Indexes for table `videos_transactions`
--
ALTER TABLE `videos_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_ads`
--
ALTER TABLE `video_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fingerprint` (`fingerprint`(255)),
  ADD KEY `time` (`time`);

--
-- Indexes for table `watch_later`
--
ALTER TABLE `watch_later`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_transactions`
--
ALTER TABLE `ads_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_views`
--
ALTER TABLE `announcement_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banned`
--
ALTER TABLE `banned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comm_replies`
--
ALTER TABLE `comm_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `play_list`
--
ALTER TABLE `play_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `profile_fields`
--
ALTER TABLE `profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pt_posts`
--
ALTER TABLE `pt_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_videos`
--
ALTER TABLE `saved_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `site_ads`
--
ALTER TABLE `site_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `typings`
--
ALTER TABLE `typings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_ads`
--
ALTER TABLE `user_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_requests`
--
ALTER TABLE `verification_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2120;

--
-- AUTO_INCREMENT for table `videos_transactions`
--
ALTER TABLE `videos_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_ads`
--
ALTER TABLE `video_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `watch_later`
--
ALTER TABLE `watch_later`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
