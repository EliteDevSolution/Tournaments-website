-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2019 at 01:11 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `playtubefinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_transactions`
--

CREATE TABLE `ads_transactions` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL DEFAULT '0',
  `video_owner` int(11) NOT NULL DEFAULT '0',
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
  `text` text,
  `time` int(32) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_views`
--

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `announcement_id` int(11) NOT NULL DEFAULT '0'
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
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci,
  `time` int(11) NOT NULL DEFAULT '0',
  `pinned` enum('0','1') CHARACTER SET utf8 DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dis_likes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(30) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comm_replies`
--

CREATE TABLE `comm_replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(15) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `text` text,
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
(3, 'title', 'PlayTube'),
(4, 'name', 'PlayTube'),
(5, 'keyword', 'playtube,video sharing'),
(6, 'email', 'deendoughouz@gmail.com'),
(7, 'description', 'PlayTube is a PHP Video Sharing Script, PlayTube is the best way to start your own video sharing script!'),
(8, 'validation', 'off'),
(9, 'recaptcha', 'off'),
(10, 'recaptcha_key', ''),
(11, 'language', 'english'),
(12, 'google_app_ID', ''),
(13, 'google_app_key', ''),
(14, 'facebook_app_ID', ''),
(15, 'facebook_app_key', ''),
(16, 'twitter_app_ID', ''),
(17, 'twitter_app_key', ''),
(18, 'yt_api', 'AIzaSyBTwxpmr5EraHyEolTDPiSx7axFS-0CE5s'),
(19, 'seo_link', 'on'),
(20, 'comment_system', 'default'),
(21, 'smtp_or_mail', 'mail'),
(22, 'smtp_host', ''),
(23, 'smtp_username', ''),
(24, 'smtp_password', ''),
(25, 'smtp_encryption', 'TLS'),
(26, 'smtp_port', ''),
(27, 'delete_account', 'on'),
(28, 'total_videos', '2'),
(29, 'total_views', '4'),
(30, 'total_users', '1'),
(31, 'total_subs', '0'),
(32, 'total_comments', '0'),
(33, 'total_likes', '0'),
(34, 'total_dislikes', '0'),
(35, 'total_saved', '0'),
(36, 'last_admin_collection', '1547295033'),
(37, 'user_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_users&quot;:0}]'),
(38, 'videos_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:2},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]'),
(39, 'upload_system', 'on'),
(40, 'import_system', 'on'),
(41, 'resize_video', 'on'),
(42, 'autoplay_system', 'on'),
(43, 'embed_system', 'on'),
(44, 'history_system', 'on'),
(45, 'user_registration', 'on'),
(46, 'verification_badge', 'on'),
(47, 'comments_default_num', '40'),
(48, 'vimeo_api_key', ''),
(49, 'fb_login', 'off'),
(50, 'tw_login', 'off'),
(51, 'plus_login', 'off'),
(52, 'wowonder_app_ID', ''),
(53, 'wowonder_app_key', ''),
(54, 'wowonder_domain_uri', ''),
(55, 'wowonder_site_name', ''),
(56, 'wowonder_login', 'off'),
(57, 'wowonder_img', ''),
(58, 'google', ''),
(59, 'last_created_sitemap', '12-06-2018'),
(60, 'is_ok', '1'),
(61, 'pro_pkg_price', '10'),
(62, 'payment_currency', 'USD'),
(63, 'go_pro', 'off'),
(64, 'paypal_id', ''),
(65, 'paypal_secret', ''),
(66, 'paypal_mode', 'sandbox'),
(67, 'last_backup', '00-00-0000'),
(68, 'user_ads', 'on'),
(69, 'rss_export', 'on'),
(70, 'max_upload', '1000000000'),
(71, 's3_upload', 'off'),
(72, 's3_bucket_name', ''),
(73, 'amazone_s3_key', ''),
(74, 'amazone_s3_s_key', ''),
(75, 'region', 'us-east-1'),
(76, 'ad_v_price', '0.1'),
(77, 'ad_c_price', '0.5'),
(78, 'pub_price', '0.02'),
(79, 'usr_v_mon', 'on'),
(80, 'apps_api_id', '0f2b298ef068473d5c15f153f8582f55'),
(81, 'apps_api_key', '3d1be7b6057b593773a9859e013efaa2'),
(82, 'ffmpeg_system', 'off'),
(83, 'ffmpeg_binary_file', 'ffmpeg'),
(84, 'user_max_upload', '1000000000'),
(85, 'user_max_import', '100'),
(86, 'convert_speed', 'fast'),
(87, 'night_mode', 'night_default'),
(88, 'server', 'ajax'),
(89, 'article_system', 'on'),
(90, 'ftp_host', ''),
(91, 'ftp_port', ''),
(92, 'ftp_username', ''),
(93, 'ftp_password', ''),
(94, 'ftp_upload', 'off'),
(95, 'ftp_endpoint', ''),
(96, 'ftp_path', './'),
(97, 'watermark', ''),
(98, 'ftp_host', 'localhost'),
(99, 'ftp_port', '21'),
(100, 'ftp_username', ''),
(101, 'ftp_password', ''),
(102, 'ftp_upload', 'off'),
(103, 'ftp_endpoint', 'storage.wowonder.com'),
(104, 'ftp_path', './'),
(105, 'watermark', ''),
(106, 'download_videos', 'on'),
(107, 'facebook_import', 'off'),
(108, 'donate_system', 'on'),
(109, 'approve_videos', 'off'),
(110, 'videos_upload_limit', '0'),
(111, 'sell_videos_system', 'on'),
(112, 'admin_com_sell_videos', '1'),
(113, 'who_sell', 'users'),
(114, 'auto_approve_', 'yes'),
(115, 'com_type', '0'),
(116, 'upload_system_type', '0'),
(117, 'max_upload_all_users', '1000000000'),
(118, 'max_upload_free_users', '1000000000'),
(119, 'max_upload_pro_users', '1000000000'),
(120, 'player_type', 'default'),
(121, 'two_factor_setting', 'on'),
(122, 'queue_count', '0'),
(123, 'popular_channels', 'on'),
(124, 'twitch_api', 'twb88q5mhne1gsrwvkhtlugvrqniks'),
(125, 'twitch_import', 'on'),
(126, 'geo_blocking', 'on'),
(127, 'server_key', '1312a113c58715637a94437389326a49'),
(128, 'earn_from_ads', 'on'),
(129, 'push', '1'),
(130, 'push_id', ''),
(131, 'push_key', ''),
(132, 'recurring_payment', 'off');
-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `english` text,
  `arabic` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dutch` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `french` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `german` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `russian` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `spanish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `turkish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`) VALUES
(1, 'login', '', 'Login', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Anmeldung', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç'),
(2, 'search_keyword', '', 'Search for videos', 'البحث عن مقاطع الفيديو', 'Zoek naar video\'s', 'Rechercher des vidéos', 'Suche nach Videos', 'Поиск видео', 'Buscar videos', 'Videoları arayın'),
(3, 'register', '', 'Register', 'تسجيل', 'Registreren', 'registre', 'Neu registrieren', 'регистр', 'Registro', 'Kayıt olmak'),
(4, 'invalid_request', '', 'Invalid request', 'طلب غير صالح', 'Ongeldig verzoek', 'Requête invalide', 'Ungültige Anfrage', 'Неверный запрос', 'Solicitud no válida', 'Geçersiz istek'),
(5, 'please_check_details', '', 'Please check the details', 'يرجى التحقق من التفاصيل', 'Controleer de details', 'Vérifiez les détails', 'Bitte überprüfen Sie die Details', 'Пожалуйста, проверьте детали', 'Por favor verifique los detalles', 'Lütfen ayrıntıları kontrol edin'),
(6, 'email_sent', '', 'E-mail sent successfully', 'تم إرسال البريد الإلكتروني بنجاح', 'E-mail is succesvol verzonden', 'E-mail envoyé avec succès', 'Email wurde erfolgreich Versendet', 'Письмо успешно отправлено', 'E-mail enviado correctamente', 'E-posta başarıyla gönderildi'),
(7, 'email_not_exist', '', 'E-mail not exist', 'البريد الإلكتروني غير موجود', 'E-mail bestaat niet', 'E-mail n\'existe pas', 'E-Mail existiert nicht', 'Электронная почта не существует', 'E-mail no existe', 'E-posta yok'),
(8, 'reset_password', '', 'Reset Password', 'إعادة تعيين كلمة المرور', 'Wachtwoord opnieuw instellen', 'réinitialiser le mot de passe', 'Passwort zurücksetzen', 'Сброс пароля', 'Restablecer la contraseña', 'Şifreyi yenile'),
(9, 'account_is_not_active', '', 'Your account is not active yet, please confirm your E-mail.', 'حسابك غير نشط حتى الآن، يرجى تأكيد بريدك الإلكتروني.', 'Uw account is nog niet actief, bevestig alstublieft uw e-mail.', 'Votre compte n\'est pas encore actif, confirmez votre e-mail.', 'Ihr Konto ist noch nicht aktiv, bitte bestätigen Sie Ihre E-Mail.', 'Ваша учетная запись еще не активирована, пожалуйста, подтвердите свой E-mail.', 'Su cuenta aún no está activa, por favor confirme su E-mail.', 'Hesabınız henüz aktif değil, lütfen e-postanızı onaylayın.'),
(10, 'resend_email', '', 'Resend E-mail', 'إعادة إرسال البريد الإلكتروني', 'Email opnieuw verzenden', 'Ré-envoyer l\'email', 'E-Mail zurücksenden', 'Повторно отправить E-mail', 'Reenviar email', 'Elektronik postayı tekrar gönder'),
(11, 'invalid_username_or_password', '', 'Invalid username or password', 'خطأ في اسم المستخدم أو كلمة مرور', 'ongeldige gebruikersnaam of wachtwoord', 'Nom d\'utilisateur ou mot de passe invalide', 'ungültiger Benutzername oder Passwort', 'неправильное имя пользователя или пароль', 'usuario o contraseña invalido', 'Geçersiz kullanıcı adı veya şifre'),
(12, 'gender', '', 'Gender', 'جنس', 'Geslacht', 'Le genre', 'Geschlecht', 'Пол', 'Género', 'Cinsiyet'),
(13, 'gender_is_invalid', '', 'Gender is invalid', 'الجنس غير صالح', 'Geslacht is ongeldig', 'Le sexe n\'est pas valable', 'Geschlecht ist ungültig', 'Пол недействителен', 'Género no válido', 'Cinsiyet geçersiz'),
(14, 'country', '', 'Country', 'بلد', 'land', 'Pays', 'Land', 'Страна', 'País', 'ülke'),
(15, 'username_is_taken', '', 'Username is taken', 'اسم المستخدم ماخوذ', 'Gebruikersnaam is in gebruik', 'Le nom d\'utilisateur est pris', 'Benutzername ist vergeben', 'Имя пользователя', 'El nombre de usuario se ha tomado', 'kullanıcı adı alınmış'),
(16, 'username_characters_length', '', 'Username must be between 5 / 32', 'يجب أن يكون اسم المستخدم بين 5/32', 'Gebruikersnaam moet tussen 5/32 zijn', 'Le nom d\'utilisateur doit être compris entre 5/32', 'Benutzername muss zwischen 5/32 liegen', 'Имя пользователя должно быть от 5/32', 'El nombre de usuario debe estar entre 5/32', 'Kullanıcı adı 5/32 arasında olmalıdır'),
(17, 'username_invalid_characters', '', 'Invalid username characters', 'أحرف اسم المستخدم غير صالحة', 'Ongeldige gebruikersnaam karakters', 'Caractères d\'identifiant non valides', 'Ungültige Benutzernamen', 'Неверные символы имени пользователя', 'Caracteres de usuario no válidos', 'Geçersiz kullanıcı adı karakterleri'),
(18, 'email_exists', '', 'This e-mail is already in use', 'هذا البريد استخدم من قبل', 'Deze email is al in gebruik', 'Cet e-mail est déjà utilisée', 'Diese E-Mail-Adresse wird schon verwendet', 'Этот электронный адрес уже используется', 'Este correo electrónico ya está en uso', 'Bu e-posta zaten kullanılıyor'),
(19, 'email_invalid_characters', '', 'E-mail is invalid', 'البريد الإلكتروني غير صالح', 'Email is ongeldig', 'Le courriel est invalide', 'E-Mail ist ungültig', 'Недействительный адрес электронной почты', 'El correo electrónico es invalido', 'E-posta geçersiz'),
(20, 'password_not_match', '', 'Password not match', 'كلمة المرور غير متطابقة', 'Wachtwoord niet overeenkomen', 'Le mot de passe ne correspond pas', 'Passwort nicht übereinstimmen', 'Пароль не соответствует', 'La contraseña no coincide', 'Şifre eşleşmiyor'),
(21, 'password_is_short', '', 'Password is too short', 'كلمة المرور قصيرة جدا', 'Wachtwoord is te kort', 'Le mot de passe est trop court', 'Das Passwort ist zu kurz', 'Пароль слишком короткий', 'La contraseña es demasiado corta', 'Şifre çok kısa'),
(22, 'reCaptcha_error', '', 'Please Check the re-captcha.', 'يرجى التحقق من إعادة كابتشا.', 'Controleer alstublieft de re-captcha.', 'Vérifiez le re-captcha.', 'Bitte überprüfen Sie das Re-Captcha.', 'Проверьте перехват.', 'Por favor, compruebe la re-captcha.', 'Lütfen yeniden captcha\'yı kontrol edin.'),
(23, 'successfully_joined_desc', '', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.', 'التسجيل بنجاح! لقد أرسلنا إليك رسالة إلكترونية، يرجى التحقق من البريد الوارد / الرسائل غير المرغوب فيها للتحقق من حسابك.', 'Registratie gelukt! Wij hebben u een email gestuurd, Controleer uw inbox / spam om uw account te verifiëren.', 'Inscription réussi! Nous vous avons envoyé un courriel, vérifiez votre boîte de réception / spam pour vérifier votre compte.', 'Registrierung erfolgreich! Wir haben Ihnen eine E-Mail geschickt, bitte überprüfen Sie Ihren Posteingang / Spam, um Ihr Konto zu bestätigen.', 'Регистрация прошла успешно! Мы отправили вам электронное письмо. Пожалуйста, проверьте свой почтовый ящик / спам, чтобы подтвердить свою учетную запись.', '¡Registro exitoso! Te hemos enviado un correo electrónico, verifica tu bandeja de entrada / spam para verificar tu cuenta.', 'Kayıt başarılı! Size bir e-posta gönderdik. Hesabınızı doğrulamak için lütfen gelen kutunuzu / spam\'inizi kontrol edin.'),
(24, 'change_password', '', 'Change Password', 'تغيير كلمة السر', 'Verander wachtwoord', 'Changer le mot de passe', 'Passwort ändern', 'Изменить пароль', 'Cambia la contraseña', 'Şifre değiştir'),
(25, '404_desc', '', 'The page you were looking for doesn\'t exist.', 'الصفحة التي كنت تبحث عنها غير موجودة.', 'De pagina die u zocht, bestaat niet.', 'La page que vous recherchiez n\'existe pas.', 'Die Seite, die Sie gesucht haben, existiert nicht.', 'Страница, которую вы искали, не существует.', 'La página que buscabas no existe.', 'Aradığınız sayfa mevcut değil.'),
(26, '404_title', '', '404, page not found', '404، لم يتم العثور على الصفحة', '404 pagina niet gevonden', '404 Page non trouvée', '404 Seite nicht gefunden', '404 Страница не найдена', '404 Pagina no encontrada', '404 Sayfa Bulunamadı'),
(27, 'your_email_address', '', 'Your E-mail address', 'عنوان بريدك  الإلكتروني', 'Jouw e-mailadres', 'Votre adresse email', 'Deine Emailadresse', 'Ваш адрес электронной почты', 'Tu correo electrónico', 'E'),
(28, 'request_new_password', '', 'Request new password', 'طلب كلمة مرور جديدة', 'Vraag nieuw wachtwoord aan', 'Demander un nouveau mot de passe', 'Fordere ein neues Passwort an', 'Запросить новый пароль', 'Pide nueva contraseña', 'yeni şifre isteği'),
(29, 'got_your_password', '', 'Got your password?', 'هل حصلت على كلمة المرور؟', 'Heb je je wachtwoord ontvangen?', 'Vous avez votre mot de passe?', 'Haben Sie Ihr Passwort?', 'Получил пароль?', '¿Tienes tu contraseña?', 'Şifreniz var mı?'),
(30, 'login_', '', 'Log In', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Einloggen', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç'),
(31, 'please_wait', '', 'Please wait..', 'أرجو الإنتظار..', 'Even geduld aub..', 'S\'il vous plaît, attendez..', 'Warten Sie mal..', 'Пожалуйста, подождите..', 'Por favor espera..', 'Lütfen bekle..'),
(32, 'welcome_back', '', 'Welcome back!', 'مرحبا بعودتك!', 'Welkom terug!', 'Nous saluons le retour!', 'Willkommen zurück!', 'Добро пожаловать!', '¡Dar una buena acogida!', 'Tekrar hoşgeldiniz!'),
(33, 'username', '', 'Username', 'اسم المستخدم', 'Gebruikersnaam', 'Nom d\'utilisateur', 'Benutzername', 'имя пользователя', 'Nombre de usuario', 'Kullanıcı adı'),
(34, 'password', '', 'Password', 'كلمه السر', 'Wachtwoord', 'Mot de passe', 'Passwort', 'пароль', 'Contraseña', 'Parola'),
(35, 'forgot_your_password', '', 'Forgot your password?', 'نسيت رقمك السري؟', 'Je wachtwoord vergeten?', 'Mot de passe oublié?', 'Haben Sie Ihr Passwort vergessen?', 'Забыли пароль?', '¿Olvidaste tu contraseña?', 'Parolanızı mı unuttunuz?'),
(36, 'sign_up', '', 'Sign Up!', 'سجل!', 'Aanmelden!', 'S\'inscrire!', 'Anmelden!', 'Зарегистрироваться!', '¡Regístrate!', 'Kaydol!'),
(37, 'new_here', '', 'New here?', 'جديد هنا؟', 'Nieuw hier?', 'Nouveau ici?', 'Neu hier?', 'Новенький тут?', '¿Nuevo aquí?', 'Burada yeni?'),
(38, 'lets_get_started', '', 'Let\'s get started!', 'هيا بنا نبدأ!', 'Laten we beginnen!', 'Commençons!', 'Lass uns anfangen!', 'Давайте начнем!', '¡Empecemos!', 'Başlayalım!'),
(39, 'email_address', '', 'E-mail address', 'عنوان البريد الإلكتروني', 'E-mailadres', 'Adresse e-mail', 'E-Mail-Addresse', 'Адрес электронной почты', 'Dirección de correo electrónico', 'E'),
(40, 'confirm_password', '', 'Confirm Password', 'تأكيد كلمة المرور', 'bevestig wachtwoord', 'Confirmez le mot de passe', 'Bestätige das Passwort', 'Подтвердите Пароль', 'Confirmar contraseña', 'Şifreyi Onayla'),
(41, 'male', '', 'Male', 'الذكر', 'Mannetje', 'Mâle', 'Männlich', 'мужчина', 'Masculino', 'Erkek'),
(42, 'female', '', 'Female', 'إناثا', 'Vrouw', 'Femelle', 'Weiblich', 'женский', 'Hembra', 'Kadın'),
(43, 'already_have_account', '', 'Already have an account?', 'هل لديك حساب بالفعل؟', 'Heeft u al een account?', 'Vous avez déjà un compte?', 'Hast du schon ein Konto?', 'У вас уже есть учетная запись?', '¿Ya tienes una cuenta?', 'Zaten hesabınız var mı?'),
(44, 'home', '', 'Home', 'الصفحة الرئيسية', 'Huis', 'Accueil', 'Zuhause', 'Главная', 'Casa', 'Ev'),
(45, 'upload', '', 'Upload', 'تحميل', 'Uploaden', 'Télécharger', 'Hochladen', 'Загрузить', 'Subir', 'Yükleme'),
(46, 'terms_of_use', '', 'Terms of use', 'تعليمات الاستخدام', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation', 'Nutzungsbedingungen', 'Условия эксплуатации', 'Términos de Uso', 'Kullanım Şartları'),
(47, 'privacy_policy', '', 'Privacy Policy', 'سياسة الخصوصية', 'Privacybeleid', 'Politique de confidentialité', 'Datenschutz-Bestimmungen', 'политика конфиденциальности', 'Política de privacidad', 'Gizlilik Politikası'),
(48, 'about_us', '', 'About us', 'معلومات عنا', 'Over ons', 'À propos de nous', 'Über uns', 'О нас', 'Sobre nosotros', 'Hakkımızda'),
(49, 'language', '', 'Language', 'لغة', 'Taal', 'La langue', 'Sprache', 'язык', 'Idioma', 'Dil'),
(50, 'copyright', '', 'Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.', 'حقوق الطبع والنشر © {{DATE}} {{CONFIG name}}. كل الحقوق محفوظة.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle rechten voorbehouden.', 'Copyright © {{DATE}} {{CONFIG name}}. Tous les droits sont réservés.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle Rechte vorbehalten.', 'Copyright © {{DATE}} {{CONFIG name}}. Все права защищены.', 'Copyright © {{DATE}} {{CONFIG name}}. Todos los derechos reservados.', 'Telif Hakkı © {{DATE}} {{CONFIG name}}. Her hakkı saklıdır.'),
(51, 'profile', '', 'Profile', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Профиль', 'Perfil', 'Profil'),
(52, 'edit', '', 'Edit', 'تصحيح', 'Bewerk', 'modifier', 'Bearbeiten', 'редактировать', 'Editar', 'Düzenleme'),
(53, 'settings', '', 'Settings', 'إعدادات', 'instellingen', 'Paramètres', 'Einstellungen', 'настройки', 'Ajustes', 'Ayarlar'),
(54, 'log_out', '', 'Log out', 'الخروج', 'Uitloggen', 'Connectez - Out', 'Ausloggen', 'Выйти', 'Cerrar sesión', 'Çıkış Yap'),
(55, 'featured_video', '', 'Featured video', 'فيديو متميز', 'Aanbevolen video', 'Vidéo en vedette', 'Empfohlenes Video', 'Продвигаемое Видео', 'Vídeo destacado', 'Öne çıkan video'),
(56, 'subscribe', '', 'Subscribe', 'الاشتراك', 'abonneren', 'Souscrire', 'Abonnieren', 'Подписывайся', 'Suscribir', 'Abone ol'),
(57, 'views', '', 'Views', 'المشاهدات', 'Bekeken', 'Vues', 'Ansichten', 'Просмотры', 'vistas', 'Görünümler'),
(58, 'save', '', 'Save', 'حفظ', 'Save', 'sauvegarder', 'sparen', 'Сохранить', 'Salvar', 'Kayıt etmek'),
(59, 'share', '', 'Share', 'شارك', 'Delen', 'Partager', 'Aktie', 'Поделиться', 'Compartir', 'Pay'),
(60, 'embed', '', 'Embed', 'تضمين', 'insluiten', 'Intégrer', 'Einbetten', 'встраивать', 'Empotrar', 'gömmek'),
(61, 'report', '', 'Report', 'أبلغ عن', 'Rapportere', 'rapport', 'Bericht', 'Отчет', 'Informe', 'Rapor'),
(62, 'published_on', '', 'Published on ', 'نشرت في', 'gepubliceerd op', 'Publié le', 'Veröffentlicht auf', 'Опубликован в', 'Publicado en', 'yayınlandı'),
(63, 'in', '', 'In', 'في', 'In', 'Dans', 'Im', 'В', 'En', 'İçinde'),
(64, 'top_videos', '', 'Top videos', 'أهم مقاطع الفيديو', 'Top video\'s', 'Top videos', 'Top Videos', 'Лучшие видеоролики', 'Los mejores videos', 'En iyi videolar'),
(65, 'trending', '', 'Trending', 'الشائع', 'Trending', 'Tendances', 'Trending', 'Trending', 'Tendencias', 'Trend'),
(66, 'explore_more', '', 'Explore more', 'استكشاف المزيد', 'Ontdek meer', 'Explorez plus', 'Erkunde mehr', 'Узнайте больше', 'Explora más', 'Daha fazla keşfedin'),
(67, 'year', '', 'year', 'عام', 'jaar', 'an', 'Jahr', 'год', 'año', 'yıl'),
(68, 'month', '', 'month', 'شهر', 'maand', 'mois', 'Monat', 'месяц', 'mes', 'ay'),
(69, 'day', '', 'day', 'يوم', 'dag', 'journée', 'Tag', 'день', 'día', 'gün'),
(70, 'hour', '', 'hour', 'ساعة', 'uur', 'heure', 'Stunde', 'час', 'hora', 'saat'),
(71, 'minute', '', 'minute', 'اللحظة', 'minuut', 'minute', 'Minute', 'минут', 'minuto', 'dakika'),
(72, 'second', '', 'second', 'ثانيا', 'tweede', 'seconde', 'zweite', 'второй', 'segundo', 'ikinci'),
(73, 'years', '', 'years', 'سنوات', 'jaar', 'années', 'Jahre', 'лет', 'años', 'yıl'),
(74, 'months', '', 'months', 'الشهور', 'maanden', 'mois', 'Monate', 'месяцы', 'meses', 'ay'),
(75, 'days', '', 'days', 'أيام', 'dagen', 'journées', 'Tage', 'дней', 'días', 'günler'),
(76, 'hours', '', 'hours', 'ساعات', 'uur', 'heures', 'Std.', 'часов', 'horas', 'saatler'),
(77, 'minutes', '', 'minutes', 'الدقائق', 'notulen', 'minutes', 'Protokoll', 'минут', 'minutos', 'dakika'),
(78, 'seconds', '', 'seconds', 'ثواني', 'seconden', 'secondes', 'Sekunden', 'секунд', 'segundos', 'saniye'),
(79, 'time_ago', '', 'ago', 'منذ', 'geleden', 'depuis', 'vor', 'тому назад', 'hace', 'önce'),
(80, 'url_not_supported', '', 'URL not supported.', 'عنوان ورل غير متوافق.', 'URL niet ondersteund.', 'URL non prise en charge.', 'URL wird nicht unterstützt.', 'URL не поддерживается.', 'URL no es compatible.', 'URL desteklenmiyor.'),
(81, 'no_more_comments', '', 'No more comments found', 'لم يتم العثور على مزيد من التعليقات', 'Er zijn nog geen reacties gevonden', 'Plus de commentaires ont été trouvés', 'Keine weiteren Kommentare gefunden', 'Больше комментариев не найдено', 'No se encontraron comentarios', 'Başka yorum bulunamadı'),
(82, 'video_not_found_please_try_again', '', 'Video not found, please refresh the page and try again.', 'لم يتم العثور على الفيديو، يرجى تحديث الصفحة وإعادة المحاولة.', 'Video niet gevonden, vernieuw de pagina en probeer het opnieuw.', 'Vidéo non trouvée, actualisez la page et réessayez.', 'Video nicht gefunden, bitte aktualisieren Sie die Seite und versuchen Sie es erneut.', 'Видео не найдено, обновите страницу и повторите попытку.', 'No se encontró el video, actualice la página e inténtelo de nuevo.', 'Video bulunamadı, lütfen sayfayı yenileyin ve tekrar deneyin.'),
(83, 'saved', '', 'Saved', 'حفظ', 'lagret', 'Enregistré', 'gespeichert', 'Сохраненный', 'guardado', 'kaydedilmiş'),
(84, 'no_comments_found', '', 'No comments found', 'لم يتم العثور على تعليقات', 'Geen reacties gevonden', 'Aucun commentaire trouvé', 'Keine Kommentare gefunden', 'Комментариев нет', 'No se encontraron comentarios', 'Hiçbir yorum bulunamadı'),
(85, 'import', '', 'Import', 'استيراد', 'Importeren', 'Importer', 'Einführen', 'Импортировать', 'Importar', 'İthalat'),
(86, 'import_new_video', '', 'Import new video', 'استيراد فيديو جديد', 'Nieuwe video importeren', 'Importer une nouvelle vidéo', 'Neues Video importieren', 'Импортировать новое видео', 'Importar nuevo video', 'Yeni video aktar'),
(87, 'video_url', '', 'Video URL', 'عنوان الفيديو', 'Video URL', 'URL de la vidéo', 'Video-URL', 'URL видео', 'URL del vídeo', 'Video URL\'si'),
(88, 'url_desc', '', 'YouTube, Dailymotion, Vimeo URLs', 'يوتيوب، دايليموتيون، فيميو عناوين المواقع', 'YouTube, Dailymotion, Vimeo URLs', 'YouTube, Dailymotion, URL de Vimeo', 'YouTube, Dailymotion, Vimeo URLs', 'URL-адреса YouTube, Dailymotion, Vimeo', 'URL de YouTube, Dailymotion, Vimeo', 'YouTube, Dailymotion, Vimeo URL\'leri'),
(89, 'fetch_Video', '', 'Fetch Video', 'جلب الفيديو', 'Haal video', 'Fetch Video', 'Video abrufen', 'Извлечение видео', 'Obtener video', 'Video getir'),
(90, 'video_title', '', 'Video Title', 'عنوان مقطع الفيديو', 'Video Titel', 'titre de la vidéo', 'Videotitel', 'Название видео', 'Titulo del Video', 'video başlığı'),
(91, 'video_title_help', '', 'Your video title, 2 - 55 characters', 'عنوان الفيديو، من 2 إلى 55 حرفا', 'Je videotitel, 2 - 55 tekens', 'Votre titre vidéo, 2 à 55 caractères', 'Ihr Videotitel, 2 - 55 Zeichen', 'Название вашего видео, 2 - 55 символов', 'Su título de vídeo, 2 - 55 caracteres', 'Video başlığınız, 2 - 55 karakter'),
(92, 'video_descritpion', '', 'Video Description', 'وصف الفيديو', 'video beschrijving', 'description de vidéo', 'Videobeschreibung', 'описание видео', 'Descripción del video', 'Video Açıklaması'),
(93, 'category', '', 'Category', 'فئة', 'categorie', 'Catégorie', 'Kategorie', 'категория', 'categoría', 'kategori'),
(94, 'tags', '', 'Tags', 'الكلمات', 'Tags', 'Mots clés', 'Tags', 'Теги', 'Etiquetas', 'Etiketler'),
(95, 'tags_help', '', 'Tags, seprated by comma', 'الكلمات، سيبراتد بواسطة فاصلة', 'Tags gescheiden door komma\'s', 'Tags, séparés par virgule', 'Tags, gefolgt von Komma', 'Теги, разделенные запятой', 'Etiquetas, seprated by comma', 'Etiketler, virgülle ayrılmış'),
(96, 'publish', '', 'Publish', 'نشر', 'Publiceren', 'Publier', 'Veröffentlichen', 'Публиковать', 'Publicar', 'yayınlamak'),
(97, 'upload_new_video', '', 'Upload new video', 'تحميل فيديو جديد', 'Nieuwe video uploaden', 'Télécharger une nouvelle vidéo', 'Neues Video hochladen', 'Загрузить новое видео', 'Subir nuevo video', 'Yeni video yükle'),
(98, 'choose_new_file', '', 'Choose video file..', 'اختيار ملف فيديو ..', 'Kies een videobestand ..', 'Choisissez le fichier vidéo ..', 'Videodatei auswählen', 'Выберите видеофайл.', 'Elige un archivo de video ..', 'Video dosyasını seçin ..'),
(99, 'thumbnail', '', 'Thumbnail', 'صورة مصغرة', 'thumbnail', 'La vignette', 'Miniaturansicht', 'Thumbnail', 'Miniatura', 'başparmak tırnağı'),
(100, 'successfully_uplaoded', '', 'successfully uploaded.', 'تم تحميلها بنجاح.', 'succesvol geüpload.', 'téléchargé avec succès.', 'erfolgreich hochgeladen', 'успешно загружен.', 'cargado con éxito.', 'başarıyla yüklendi.'),
(101, 'reply', '', 'Reply', 'الرد', 'Antwoord', 'Répondre', 'Antworten', 'Ответить', 'Respuesta', 'Cevap'),
(102, 'show_more', '', 'Show more', 'أظهر المزيد', 'Laat meer zien', 'Montre plus', 'Zeig mehr', 'Показать больше', 'Mostrar más', 'Daha fazla göster'),
(103, 'comments', '', 'Comments', 'تعليقات', 'Comments', 'commentaires', 'Bemerkungen', 'Комментарии', 'Comentarios', 'Yorumlar'),
(104, 'write_your_comment', '', 'Write your comment..', 'اكتب تعليقك ..', 'Schrijf je reactie ..', 'Écrivez votre commentaire ..', 'Schreiben Sie Ihren Kommentar ..', 'Написать комментарий ..', 'Escriba su comentario ..', 'Yorumunuzu yazın ..'),
(105, 'fb_comments', '', 'Facebook Comments', 'تعليقات الفيسبوك', 'Facebook Reacties', 'Commentaires de Facebook', 'Facebook Kommentare', 'Комментарии Facebook', 'Comentarios de Facebook', 'Facebook Yorumları'),
(106, 'related_videos', '', 'Related Videos', 'فيديوهات ذات علاقة', 'Relaterte videoer', 'Vidéos connexes', 'Ähnliche Videos', 'Похожие видео', 'Videos relacionados', 'İlgili videolar'),
(107, 'delete_confirmation', '', 'Are you sure you want to delete your comment?', 'هل تريد بالتأكيد حذف تعليقك؟', 'Weet u zeker dat u uw reactie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer votre commentaire?', 'Bist du sicher, dass du deinen Kommentar löschen möchtest?', 'Вы уверены, что хотите удалить свой комментарий?', '¿Seguro que quieres eliminar tu comentario?', 'Yorumu silmek istediğinizden emin misiniz?'),
(108, 'subscribed', '', 'Subscribed', 'المشترك', 'geabonneerd', 'Souscrit', 'Gezeichnet', 'подписной', 'Suscrito', 'Abone'),
(109, 'no_videos_found_subs', '', 'No videos found, subscribe to get started!', 'لم يتم العثور على مقاطع فيديو، اشترك في الخطوات الأولى!', 'Geen video\'s gevonden, schrijf je in om te beginnen!', 'Aucune vidéo n\'a été trouvée, inscrivez-vous pour commencer!', 'Keine Videos gefunden, abonnieren, um loszulegen!', 'Видео не найдено, подписаться, чтобы начать работу!', 'No videos encontrados, suscríbase para empezar!', 'Hiçbir video bulunamadı, başlamak için abone olun!'),
(110, 'subscriptions', '', 'Subscriptions', 'الاشتراكات', 'abonnementen', 'Abonnements', 'Abonnements', 'Подписки', 'Suscripciones', 'Abonelikler'),
(111, 'no_videos_found_history', '', 'No videos found, watch to get started!', 'لم يتم العثور على مقاطع فيديو، يمكنك مشاهدة الخطوات الأولى!', 'Geen video\'s gevonden, kijk om te beginnen!', 'Aucune vidéo n\'a été trouvée, regardez pour commencer!', 'Keine Videos gefunden, schau, um loszulegen!', 'Видео не найдено, следите, чтобы начать!', 'No se han encontrado vídeos, ¡mira para empezar!', 'Hiçbir video bulunamadı, başlamak için izleyin!'),
(112, 'history', '', 'History', 'التاريخ', 'Geschiedenis', 'Histoire', 'Geschichte', 'история', 'Historia', 'tarih'),
(113, 'no_videos_found_liked', '', 'No videos found, like to get started!', 'لم يتم العثور على مقاطع فيديو، مثل البدء!', 'Geen video\'s gevonden, graag aan de slag!', 'Aucune vidéo trouvée, n\'aime la mise en route!', 'Keine Videos gefunden, wie los!', 'Видео не найдено, как начать!', 'No se han encontrado vídeos, ¡como para empezar!', 'Hiçbir video bulunamadı, başlamak gibi!'),
(114, 'liked_videos', '', 'Liked videos', 'أعجبت مقاطع الفيديو', 'Verwachte video\'s', 'Vidéos aimées', 'Mochte Videos', 'Понравившиеся видео', 'Videos que me gustaron', 'Beğenilen videolar'),
(115, 'latest_videos', '', 'Latest videos', 'أحدث مقاطع الفيديو', 'Laatste video\'s', 'Dernières vidéos', 'Neueste Videos', 'Последние видео', 'Últimos vidéos', 'En yeni videolar'),
(116, 'no_videos_found_for_now', '', 'No videos found for now!', 'لم يتم العثور على مقاطع فيديو في الوقت الحالي!', 'Er zijn nog geen video\'s gevonden!', 'Aucune vidéo trouvée pour l\'instant!', 'Bisher keine Videos gefunden!', 'Видео не найдено пока!', 'No se encontraron videos por ahora!', 'Şuan için bir video bulunamadı!'),
(117, 'no_more_videos_to_show', '', 'No more videos to show', 'لا مزيد من مقاطع الفيديو المراد عرضها', 'Nog geen video\'s om te laten zien', 'Plus de vidéos à afficher', 'Keine Videos mehr zu zeigen', 'Больше нет видео для показа', 'No hay más videos para mostrar', 'Gösterilecek daha fazla video yok'),
(118, 'categories', '', 'Categories', 'الاقسام', 'Categorieën', 'Catégories', 'Kategorien', 'категории', 'Categorías', 'Kategoriler'),
(119, 'video_already_exist', '', 'Video is already exist', 'الفيديو موجود من قبل', 'Video bestaat al', 'La vidéo existe déjà', 'Video ist bereits vorhanden', 'Видео уже существует', 'El video ya existe', 'Video zaten var'),
(120, 'video_saved', '', 'Video successfully updated', 'تم تحديث الفيديو بنجاح', 'Video is succesvol bijgewerkt', 'Vidéo mise à jour avec succès', 'Video erfolgreich aktualisiert', 'Видео успешно обновлено', 'Video actualizado correctamente', 'Video başarıyla güncellendi'),
(121, 'manage_videos', '', 'Manage Videos', 'إدارة مقاطع الفيديو', 'Beheer video\'s', 'Gérer les vidéos', 'Videos verwalten', 'Управление видео', 'Administrar vídeos', 'Videoları Yönet'),
(122, 'search', '', 'Search', 'بحث', 'Zoeken', 'Chercher', 'Suche', 'Поиск', 'Buscar', 'Arama'),
(123, 'manage', '', 'Manage', 'يدير', 'beheren', 'Gérer', 'Verwalten', 'управлять', 'Gestionar', 'yönetme'),
(124, 'edit_video', '', 'Edit video', 'تحرير الفيديو', 'Bewerk video', 'Éditer vidéo', 'Video bearbeiten', 'Редактировать видео', 'Editar video', 'Videoyu düzenle'),
(125, 'delete_video_confirmation', '', 'Are you sure you want to delete this video? This action can\'t be undo', 'هل تريد بالتأكيد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء', 'Weet u zeker dat u deze video wilt verwijderen? Deze actie kan niet worden ongedaan gemaakt', 'Êtes-vous sûr de vouloir supprimer cette vidéo? Cette action ne peut pas annuler', 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden', 'Вы действительно хотите удалить это видео? Это действие не может быть отменено', '¿Seguro que quieres eliminar este video? No se puede deshacer esta acción', 'Bu videoyu silmek istediğinizden emin misiniz? Bu işlem geri alınamaz'),
(126, 'manage_my_videos', '', 'Manage My Videos', 'إدارة مقاطع الفيديو الخاصة بي', 'Beheer mijn video\'s', 'Gérer mes vidéos', 'Verwalten Sie meine Videos', 'Управление видео', 'Administrar mis videos', 'Videolarımı Yönet'),
(127, 'delete_videos', '', 'Delete video', 'حذف الفيديو', 'Video verwijderen', 'Supprimer la vidéo', 'Video löschen', 'Удалить видео', 'Eliminar vídeo', 'Videoyu sil'),
(128, 'search_results', '', 'Search Results', 'نتائج البحث', 'Zoekresultaten', 'Résultats de la recherche', 'Suchergebnisse', 'результаты поиска', 'Resultados de la búsqueda', 'arama sonuçları'),
(129, 'status', '', 'Status', 'وضع', 'staat', 'Statut', 'Status', 'статус', 'estatus', 'durum'),
(130, 'active', '', 'Active', 'نشيط', 'Actief', 'actif', 'Aktiv', 'активный', 'Activo', 'Aktif'),
(131, 'inactive', '', 'Inactive', 'غير نشط', 'Inactief', 'Inactif', 'Inaktiv', 'Неактивный', 'Inactivo', 'etkisiz'),
(132, 'type', '', 'Type', 'اكتب', 'Type', 'Type', 'Art', 'Тип', 'Tipo', 'tip'),
(133, 'user', '', 'User', 'المستعمل', 'Gebruiker', 'Utilisateur', 'Benutzer', 'пользователь', 'Usuario', 'kullanıcı'),
(134, 'admin', '', 'Admin', 'مشرف', 'beheerder', 'Admin', 'Administrator', 'Администратор', 'Administración', 'yönetim'),
(135, 'verification', '', 'Verification', 'التحقق', 'Verificatie', 'Vérification', 'Überprüfung', 'верификация', 'Verificación', 'Doğrulama'),
(136, 'verified', '', 'Verified', 'التحقق', 'geverifieerd', 'Vérifié', 'Verifiziert', 'проверенный', 'Verificado', 'Doğrulanmış'),
(137, 'not_verified', '', 'Not verified', 'لم يتم التحقق منه', 'niet geverifieerd', 'non vérifié', 'Nicht verifiziert', 'не подтверждено', 'No verificado', 'Doğrulanmadı'),
(138, 'setting_updated', '', 'Settings successfully updated!', 'تم تحديث الإعدادات بنجاح!', 'Instellingen succesvol bijgewerkt!', 'Les paramètres ont été mis à jour avec succès!', 'Einstellungen erfolgreich aktualisiert!', 'Настройки успешно обновлены!', 'Configuración actualizada con éxito!', 'Ayarlar başarıyla güncellendi!'),
(139, 'first_name', '', 'First Name', 'الاسم الاول', 'Voornaam', 'Prénom', 'Vorname', 'Имя', 'Nombre de pila', 'İsim'),
(140, 'last_name', '', 'Last Name', 'الكنية', 'Achternaam', 'Nom de famille', 'Familienname, Nachname', 'Фамилия', 'Apellido', 'Soyadı'),
(141, 'about_profile', '', 'About', 'حول', 'Over', 'Sur', 'Über', 'Около', 'Acerca de', 'hakkında'),
(142, 'facebook', '', 'Facebook', 'فيس بوك', 'Facebook', 'Facebook', 'Facebook', 'facebook', 'Facebook', 'Facebook'),
(143, 'google_plus', '', 'Google+', 'في + Google', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+'),
(144, 'twitter', '', 'Twitter', 'تغريد', 'tjilpen', 'Gazouillement', 'Twitter', 'щебет', 'Gorjeo', 'heyecan'),
(145, 'current_password', '', 'Current Passowrd', 'باسورد الحالي', 'Huidige Passowrd', 'Passowrd actuel', 'Aktuelles Passowrd', 'Текущий Passowrd', 'Passowrd actual', 'Geçerli Geçiş'),
(146, 'new_password', '', 'New Passowrd', 'جديد باسورد', 'Nieuwe Passowrd', 'New Passowrd', 'Neue Passowrd', 'Новый Passowrd', 'Nuevo pasatiempo', 'Yeni Passowrd'),
(147, 'confirm_new_password', '', 'Confirm new password', 'تأكيد كلمة المرور الجديدة', 'Bevestig nieuw wachtwoord', 'Confirmer le nouveau mot de passe', 'Bestätige neues Passwort', 'Подтвердите новый пароль', 'Confirmar nueva contraseña', 'Yeni şifreyi onayla'),
(148, 'current_password_dont_match', '', 'Current password doesn\'t match.', 'كلمة المرور الحالية غير متطابقة.', 'Huidig ​​wachtwoord komt niet overeen.', 'Le mot de passe actuel ne correspond pas.', 'Aktuelles Passwort stimmt nicht überein.', 'Текущий пароль не соответствует.', 'La contraseña actual no coincide.', 'Geçerli şifre uyuşmuyor.'),
(149, 'new_password_dont_match', '', 'New password doesn\'t match.', 'كلمة المرور الجديدة غير متطابقة.', 'Nieuw wachtwoord komt niet overeen.', 'Le nouveau mot de passe ne correspond pas.', 'Neues Passwort stimmt nicht überein.', 'Новый пароль не соответствует.', 'La nueva contraseña no coincide.', 'Yeni şifre uyuşmuyor.'),
(150, 'avatar', '', 'Avatar', 'الصورة الرمزية', 'avatar', 'Avatar', 'Benutzerbild', 'Аватар', 'Avatar', 'Avatar'),
(151, 'cover', '', 'Cover', 'غطاء، يغطي', 'deksel', 'Couverture', 'Abdeckung', 'Обложка', 'Cubrir', 'kapak'),
(152, 'your_account_was_deleted', '', 'Your account was deleted', 'تم حذف حسابك', 'Uw account is verwijderd', 'Votre compte a été supprimé', 'Ihr Konto wurde gelöscht', 'Ваша учетная запись была удалена', 'Se ha eliminado tu cuenta.', 'Hesabınız silindi'),
(153, 'avatar_and_cover', '', 'Avatar & Cover', 'الصورة الرمزية والغطاء', 'Avatar & Cover', 'Avatar et couverture', 'Avatar & Cover', 'Аватар & Cover', 'Avatar y portada', 'Avatar & Kapak'),
(154, 'general', '', 'General', 'جنرال لواء', 'Algemeen', 'Général', 'General', 'Генеральная', 'General', 'Genel'),
(155, 'delete_account', '', 'Delete account', 'حذف الحساب', 'Account verwijderen', 'Supprimer le compte', 'Konto löschen', 'Удалить аккаунт', 'Borrar cuenta', 'Hesabı sil'),
(156, 'general_settings', '', 'General Settings', 'الاعدادات العامة', 'Algemene instellingen', 'réglages généraux', 'Allgemeine Einstellungen', 'общие настройки', 'Configuración general', 'Genel Ayarlar'),
(157, 'password_settings', '', 'Password Settings', 'إعدادات كلمة المرور', 'Wachtwoordinstellingen', 'Paramètres du mot de passe', 'Kennworteinstellungen', 'Настройки пароля', 'Configuración de la contraseña', 'Şifre Ayarları'),
(158, 'profile_settings', '', 'Profile Settings', 'إعدادات الملف الشخصي', 'Profielinstellingen', 'Paramètres de profil', 'Profileinstellungen', 'Настройки профиля', 'Configuración de perfil', 'Profil ayarları'),
(159, 'videos', '', 'Videos', 'أشرطة فيديو', 'Videos', 'Vidéos', 'Videos', 'Видео', 'Videos', 'Videolar'),
(160, 'up_next', '', 'Up next', 'التالي', 'Volgende', 'Suivant', 'Als nächstes', 'Следующий', 'Hasta la próxima', 'Bir sonraki'),
(161, 'autoplay', '', 'Autoplay', 'تشغيل تلقائي', 'Automatisch afspelen', 'Lecture automatique', 'Automatisches Abspielen', 'Автовоспроизведение', 'Auto reproducción', 'Otomatik oynatma'),
(162, 'featured', '', 'Featured', 'متميز', 'Uitgelicht', 'En vedette', 'Vorgestellt', 'Рекомендуемые', 'Destacados', 'Öne çıkan'),
(163, 'saved_videos', '', 'Saved Videos', 'مقاطع الفيديو المحفوظة', 'Opgeslagen video\'s', 'Vidéos sauvegardées', 'Gespeicherte Videos', 'Сохраненные видео', 'Videos guardados', 'Kaydedilen Videolar'),
(164, 'my_channel', '', 'My Channel', 'قناتي', 'Mijn kanaal', 'Ma chaîne', 'Mein Kanal', 'Мой канал', 'Mi canal', 'Benim kanalım'),
(165, 'add_to', '', 'Add to', 'إضافة إلى', 'Legg til i', 'Ajouter à', 'Hinzufügen zu', 'Добавить в', 'Agregar a', 'Ekle'),
(166, 'add_to_pl', '', 'Add to playlist', 'إضافة إلى قائمة التشغيل', 'Legg til i spilleliste', 'Ajouter à la playlist', 'Zu Playlist hinzufügen', 'Добавить в плейлист', 'Agregar a lista de reproducción', 'Çalma listesine ekle'),
(167, 'create_new', '', 'Create new', 'إنشاء جديد', 'Opprett ny', 'Créer un nouveau', 'Neu erstellen', 'Создать новый', 'Crear nuevo', 'Yeni oluştur'),
(168, 'close', '', 'Close', 'قريب', 'Lukk', 'Fermer', 'Schließen', 'Закрыть', 'cerca', 'yakın'),
(169, 'removed_from', '', 'Removed from', 'تمت الإزالة من', 'Fjernet fra', 'Retiré de', 'Entfernt von', 'Удалено из', 'Eliminado de', 'Kaldırıldı'),
(170, 'added_to', '', 'Added to', 'تمت الإضافة إلى', 'Lagt til', 'Ajouté à', 'Hinzugefügt zu', 'Добавлено в', 'Agregado a', 'Eklendi'),
(171, 'create_new_pl', '', 'Create new playlist', 'إنشاء قائمة تشغيل جديدة', 'Opprett ny spilleliste', 'Créer une nouvelle playlist', 'Neue Playlist erstellen', 'Создать новый плейлист', 'Crear nueva lista de reproducción', 'Yeni çalma listesi oluştur'),
(172, 'pl_name', '', 'Playlist name', 'اسم قائمة التشغيل', 'Spilleliste navn', 'Nom de la liste de lecture', 'Playlist-Name', 'Название плейлиста', 'Nombre de la lista de reproducción', 'Çalma listesi adı'),
(173, 'privacy', '', 'Privacy', 'خصوصية', 'personvern', 'Confidentialité', 'Privatsphäre', 'Приватность', 'intimidad', 'gizlilik'),
(174, 'description', '', 'Description', 'وصف', 'beschrijving', 'Description', 'Beschreibung', 'Описание', 'descripción', 'tanım'),
(175, 'create', '', 'Create', 'خلق', 'Opprett', 'Créer', 'Erstellen', 'создать', 'crear', 'oluşturmak'),
(176, 'cancel', '', 'Cancel', 'إلغاء', 'Avbryt', 'Annuler', 'Abbrechen', 'отменить', 'cancelar', 'iptal'),
(177, 'pl_name_required', '', 'Play list name is required.', 'اسم قائمة التشغيل مطلوب.', 'Spillelistenavn er nødvendig.', 'Le nom de la liste de lecture est requis.', 'Der Name der Wiedergabeliste ist erforderlich.', 'Введите имя плейлиста', 'Se requiere el nombre de la lista de reproducción.', 'Çalma listesi adı gerekiyor.'),
(178, 'play_lists', '', 'PlayLists', 'قوائم التشغيل', 'spillelister', 'PlayLists', 'PlayLists', 'плейлисты', 'las listas de reproducción', 'çalma'),
(179, 'delete', '', 'Delete', 'حذف', 'Slett', 'Supprimer', 'Löschen', 'удалять', 'borrar', 'silmek'),
(180, 'confirmation', '', 'Confirmation!', 'تأكيد!', 'Bekreftelse!', 'Confirmation!', 'Bestätigung!', 'Подтверждение!', 'Confirmación!', 'Onay!'),
(181, 'confirm_delist', '', 'Are you sure you want to delete this PlayList?', 'هل تريد بالتأكيد حذف قائمة التشغيل هذه؟', 'Er du sikker på at du vil slette denne PlayList?', 'Êtes-vous sûr de vouloir supprimer cette PlayList?', 'Möchten Sie diese PlayList wirklich löschen?', 'Вы действительно хотите удалить этот список воспроизведения?', '¿Estás seguro de que quieres eliminar esta PlayList?', 'Bu Oynatma Listesini silmek istediğinizden emin misiniz?'),
(182, 'yes_del', '', 'Yes,delete it!', 'نعم، حذفه!', 'Ja, slett det!', 'Oui, supprimez-le!', 'Ja, löschen Sie es!', 'Да, удалите его!', 'Sí, ¡bórralo!', 'Evet, sil şunu!'),
(183, 'deleted', '', 'Deleted!', 'حذف!', 'Slettet!', 'Supprimé!', 'Gelöscht!', 'Удаляется!', 'Borrado!', 'Silinen!'),
(184, 'was_deleted', '', 'has been deleted!', 'تم حذف!', 'har blitt slettet!', 'a été supprimé!', 'wurde gelöscht!', 'был удален!', 'ha sido eliminado', 'silindi!'),
(185, 'no_lists_found', '', 'No PlayLists Found!', 'لم يتم العثور على قوائم تشغيل!', 'Ingen spillelister funnet!', 'Aucune liste de lecture trouvée!', 'Keine PlayLists gefunden!', 'Нет списков воспроизведения!', 'No se encontraron listas de reproducción', 'Hiç PlayList Bulunamadı!'),
(186, 'public', '', 'Public', 'جمهور', 'offentlig', 'Public', 'Öffentlichkeit', 'Публичный', 'público', 'kamu'),
(187, 'private', '', 'Private', 'خاص', 'privat', 'Privé', 'Privat', 'Приватный', 'privado', 'özel'),
(188, 'сreated', '', 'Created', 'مكون', 'laget', 'établi', 'Erstellt', 'созданный', 'creado', 'düzenlendi'),
(189, 'pl_сreated', '', 'PlayList was successful added!', 'تمت إضافة قائمة التشغيل بنجاح!', 'Spilleliste ble lagt til!', 'PlayList a été ajouté avec succès!', 'PlayList wurde erfolgreich hinzugefügt!', 'Плейлист был успешно добавлен!', '¡La lista de reproducción se agregó con éxito!', 'Çalma listesi başarıyla eklendi!'),
(190, 'pl_saved', '', 'PlayList was successful saved!', 'تم حفظ قائمة التشغيل بنجاح!', 'Spillelisten ble lagret!', 'PlayList a été enregistré avec succès!', 'PlayList wurde erfolgreich gespeichert!', 'Плейлист был успешно сохранен!', '¡La lista de reproducción se guardó con éxito!', 'Çalma listesi başarıyla kaydedildi!'),
(191, 'watch_later', '', 'Watch later', 'سأشاهده لاحقا', 'Se senere', 'Regarder plus tard', 'Später ansehen', 'Посмотреть позже', 'Ver despues', 'Daha sonra izle'),
(192, 'articles', '', 'Articles', 'مقالات', 'Artikler', 'Des articles', 'Artikel', 'Статьи', 'Artículos', 'Makaleler'),
(193, 'search_articles', '', 'Search for articles', 'البحث عن المقالات', 'Søk etter artikler', 'Rechercher des articles', 'Suche nach Artikeln', 'Поиск статей', 'Buscar artículos', 'Makaleleri ara'),
(194, 'most_popular', '', 'Most popular', 'الأكثر شعبية', 'Mest populær', 'Le plus populaire', 'Am beliebtesten', 'Самый популярный', 'Más popular', 'En popüler'),
(195, 'no_result_for', '', 'Sorry, no results found for', 'آسف، لا توجد نتائج ل', 'Beklager, ingen resultater funnet for', 'Désolé, aucun résultat trouvé pour', 'Leider wurden keine Ergebnisse für', 'Извините, результатов не найдено', 'Lo sentimos, no se encontraron resultados para', 'Üzgünüz, bunun hakkında bir sonuç yok'),
(196, 'no_post_found', '', 'No posts found!', 'لم يتم العثور على أية مشاركات!', 'Ingen innlegg funnet!', 'Aucun article trouvé!', 'Keine Einträge gefunden!', 'Сообщений не найдено!', '¡No se han encontrado publicaciones!', 'Gönderi bulunamadı!'),
(197, 'related_articles', '', 'Related Articles', 'مقالات ذات صلة', 'Relaterte artikler', 'Articles Liés', 'In Verbindung stehende Artikel', 'Статьи по Теме', 'Artículos relacionados', 'İlgili Makaleler'),
(198, 'share_to', '', 'Share to', 'مشاركة في', 'Del til', 'Partager à', 'Teilen mit', 'Поделиться с', 'Compartir a', 'Paylaş'),
(199, 'no_more_articles', '', 'No more Articles', 'لا مزيد من المقالات', 'Ingen flere artikler', 'Plus d\'articles', 'Keine Artikel mehr', 'Нет статей', 'No más artículos', 'Artık Makale Yok'),
(200, 'go_pro', '', 'Go Pro', 'الذهاب للمحترفين', 'Bli profesjonell', 'Go Pro', 'Go pro', 'Стать pro', 'Hazte profesional', 'Yanlışa git'),
(201, 'buy_pro_pkg', '', 'Discover more features with {{SITE_NAME}} Pro package!', 'اكتشاف المزيد من الميزات مع {{SITE_NAME}} حزمة برو!', 'Oppdag flere funksjoner med {{SITE_NAME}} Pro pakke!', 'Découvrez plus de fonctionnalités avec le package {{SITE_NAME}} Pro!', 'Entdecken Sie weitere Funktionen mit dem {{SITE_NAME}} Pro-Paket!', 'Узнайте больше о функциях с пакетом {{SITE_NAME}} Pro!', 'Descubre más funciones con el {{SITE_NAME}} paquete Pro!', '{{SITE_NAME}} Pro paketi ile daha fazla özellik keşfedin!'),
(202, 'free_mbr', '', 'Free Member', 'عضو مجاني', 'Gratis medlem', 'Membre gratuit', 'Freies Mitglied', 'Свободный член', 'miembro gratuito', 'Ücretsiz Üye'),
(203, 'pro_mbr', '', 'Pro Member', 'عضو برو', 'Pro-medlem', 'Membre Pro', 'Pro-Mitglied', 'Про член', 'Pro miembro', 'Pro Üyesi'),
(204, 'upload_1gb_limit', '', 'Upload up to 1GB limit', 'تحميل حد يصل إلى 1 غيغابايت', 'Last opp opptil 1 GB grense', 'Importer jusqu\'à 1 Go de limite', 'Bis zu 1 GB limitieren', 'Загружать ограничение до 1 ГБ', 'Carga hasta 1GB de límite', '1GB limitine kadar yükle'),
(205, 'ads_will_show_up', '', 'Videos ads will show up', 'ستظهر إعلانات مقاطع الفيديو', 'Videoannonser vises', 'Les annonces vidéo s\'affichent', 'Videos werden geschaltet', 'Появятся видеообъявления', 'Los anuncios de videos aparecerán', 'Videolar reklamları gösterilir'),
(206, 'not_featured_videos', '', 'Not featured videos', 'مقاطع الفيديو غير المميزة', 'Ikke kjennetegnet videoer', 'Vidéos non présentées', 'Nicht vorgestellte Videos', 'Не показано видео', 'Videos no destacados', 'Özellikli video yok'),
(207, 'no_verified_badge', '', 'No verified badge', 'لم يتم التحقق من شارة', 'Ingen bekreftet merke', 'Aucun badge vérifié', 'Kein bestätigtes Abzeichen', 'Нет подтвержденного значка', 'Sin insignia verificada', 'Doğrulanmış rozet yok'),
(208, 'stay_free', '', 'Stay Free', 'ابق حرا', 'Forbli fri', 'Reste libre', 'Bleibe frei', 'Оставайся свободным', 'Mantente Libre', 'Bedava Kal'),
(209, 'upgrade', '', 'Upgrade', 'تطوير', 'Oppgradering', 'Surclassement', 'Aktualisierung', 'Обновить', 'Mejorar', 'yükseltmek'),
(210, 'upload_1tr_limit', '', 'Upload up to 1000GB', 'تحميل ما يصل إلى 1000 غيغابايت', 'Last opp opptil 1000 GB', 'Télécharger jusqu\'à 1000Go', 'Bis zu 1000 GB hochladen', 'Загрузите до 1000 ГБ', 'Carga hasta 1000GB', '1000GB\'a kadar yükle'),
(211, 'ads_wont_show_up', '', 'No ads will show up', 'لن تظهر أية إعلانات', 'Ingen annonser vil dukke opp', 'Aucune annonce ne s\'affichera', 'Es werden keine Anzeigen geschaltet', 'Объявления не будут отображаться', 'No se mostrarán anuncios', 'Hiçbir reklam gösterilmez'),
(212, 'ur_are_featured', '', 'Featured videos', 'مقاطع الفيديو الخاصة بك واردة', 'Dine videoer er omtalt', 'Vos vidéos sont en vedette', 'Ihre Videos sind gekennzeichnet', 'Ваши видеоролики', 'Tus videos son presentados', 'Videolarınız öne çıkıyor'),
(213, 'verified_badge', '', 'Verified badge', 'تم التحقق من الشارة', 'Verifisert merketegn', 'Badge vérifié', 'Bestätigter Ausweis', 'Проверенный значок', 'Insignia verificada', 'Doğrulanmış rozet'),
(214, 'congratulations', '', 'Congratulations!', 'تهانينا!', 'Gratulerer!', 'Toutes nos félicitations!', 'Glückwünsche!', 'Поздравления!', '¡Felicitaciones!', 'Tebrik ederiz!'),
(215, 'uare_pro', '', 'You have successfully upgraded you profile to PRO user!', 'لقد نجحت في ترقية ملفك الشخصي إلى مستخدم برو!', 'Du har oppgradert profilen din til PRO-brukeren!', 'Vous avez mis à jour votre profil avec succès vers l\'utilisateur PRO!', 'Sie haben Ihr Profil erfolgreich auf den PRO-Benutzer aktualisiert!', 'Вы успешно обновили свой профиль до пользователя PRO!', '¡Ha actualizado su perfil con éxito a usuario PRO!', 'Profilinizi PRO kullanıcılarına başarıyla yükselttiniz!'),
(216, 'start_features', '', 'Start browsing new features', 'ابدأ تصفح الميزات الجديدة', 'Begynn å bla gjennom nye funksjoner', 'Commencer à parcourir les nouvelles fonctionnalités', 'Suche nach neuen Funktionen', 'Начать просмотр новых функций', 'Comienza a navegar por nuevas funciones', 'Yeni özelliklere göz atmaya başlayın'),
(217, 'import_limit_reached_upgrade', '', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'لقد وصلت إلى حد الاستيراد، وترقية إلى الموالية لاستيراد أشرطة الفيديو غير محدود!', 'Du har nådd importgrensen din, oppgrader til pro for å importere ubegrensede videoer!', 'Vous avez atteint votre limite d\'importation, passez à pro pour importer des vidéos illimitées!', 'Sie haben Ihr Importlimit erreicht, aktualisieren Sie auf Pro, um unlimitierte Videos zu importieren!', 'Вы достигли своего лимита импорта, обновляете pro для импорта неограниченного количества видео!', '¡Has alcanzado tu límite de importación, actualízate a pro para importar videos ilimitados!', 'İçe aktarma limitinize ulaştınız, sınırsız videoları içe aktarmak için yanlızca yükseltin!'),
(218, 'upload_limit_reached_upgrade', '', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'لقد وصلت إلى حد التحميل، وترقية إلى الموالية لتحميل أشرطة الفيديو غير محدود!', 'Du har nådd opplastingsgrensen din, oppgrader til pro for å laste opp ubegrensede videoer!', 'Vous avez atteint votre limite de téléchargement, passez à pro pour télécharger des vidéos illimitées!', 'Du hast dein Upload-Limit erreicht, aktualisiere auf Pro, um unlimitierte Videos hochzuladen!', 'Вы достигли предела загрузки, обновляете до Pro для загрузки неограниченного количества видео!', 'Has alcanzado el límite de carga y actualízate a profesional para subir videos ilimitados.', 'Yükleme limitinize ulaştınız, sınırsız video yüklemek için profesyonelliğe geçin!'),
(219, 'import_limit_reached', '', 'You have reached your import limit', 'لقد وصلت إلى حد الاستيراد', 'Du har nådd importgrensen din', 'Vous avez atteint votre limite d\'importation', 'Sie haben Ihr Importlimit erreicht', 'Вы достигли своего предела импорта', 'Has alcanzado tu límite de importación', 'İçe aktarma limitinize ulaştınız.'),
(220, 'upload_limit_reached', '', 'You have reached your upload limit', 'لقد وصلت إلى حد التحميل', 'Du har nådd opplastingsgrensen din', 'Vous avez atteint votre limite de téléchargement', 'Du hast dein Upload-Limit erreicht', 'Вы достигли предела загрузки', 'Has alcanzado tu límite de carga', 'Yükleme limitinize ulaştınız.'),
(221, 'upgrade_now', '', 'Upgrade Now?', 'تحديث الآن؟', 'Oppgrader nå?', 'Mettre à jour maintenant?', 'Jetzt upgraden?', 'Обнови сейчас?', '¿Actualizar ahora?', 'Şimdi Yükselt?'),
(222, 'error', '', 'Error!', 'خطأ!', 'Feil!', 'Erreur!', 'Fehler!', 'Ошибка!', '¡Error!', 'Hata!'),
(223, 'error_msg', '', 'Something went wrong Please try again later!', 'هناك شئ خاطئ، يرجى المحاولة فى وقت لاحق!', 'Noe gikk galt. Prøv igjen senere!', 'Quelque chose c\'est mal passé. Merci d\'essayer plus tard!', 'Etwas ist schief gelaufen Bitte versuche es später noch einmal!', 'Что-то пошло не так. Пожалуйста, повторите попытку позже!', 'Algo salió mal. ¡Inténtalo de nuevo más tarde!', 'Bir şeyler yanlış oldu. Lütfen sonra tekrar deneyiniz!'),
(224, 'oops', '', 'Oops', 'وجه الفتاة', 'Oops', 'Oops', 'Hoppla', 'Ой', 'Uy', 'Hata'),
(225, 'write_a_reply', '', 'Write a comment and press ENTER', 'اكتب تعليق واضغط إنتر', 'Schrijf een reactie en druk op ENTER', 'Ecrire un commentaire et appuyez sur ENTER', 'Schreiben Sie einen Kommentar und drücken Sie ENTER.', 'Напишите комментарий и нажмите клавишу ВВОД', 'Escribe un comentario y presiona ENTER', 'Yorum yazın ve ENTER tuşuna basın'),
(226, 'file_is_too_big', '', 'File is too big, Max upload size is', 'الملف كبير جدا، الحد الأقصى لحجم التحميل هو', 'Bestand is te groot, Max upload grootte is', 'Le fichier est trop grand, la taille maximale de téléchargement est', 'Datei ist zu groß, Max Upload-Größe ist', 'Файл слишком большой, максимальный размер загрузки', 'El archivo es demasiado grande, el tamaño máximo de carga es', 'Dosya çok büyük, Maks. Yükleme boyutu'),
(227, 'ads', '', 'Advertising', 'إعلان', 'Advertising', 'Publicité', 'Werbung', 'реклама', 'publicidad', 'reklâm'),
(228, 'wallet', '', 'Wallet', 'محفظة', 'portemonnee', 'Portefeuille', 'Geldbörse', 'бумажник', 'billetera', 'cüzdan'),
(229, 'name', '', 'Name', 'اسم', 'naam', 'Nom', 'Name', 'имя', 'nombre', 'isim'),
(230, 'results', '', 'Results', 'النتائج', 'resultaten', 'Résultats', 'Ergebnisse', 'результаты', 'resultados', 'sonuçlar'),
(231, 'spent', '', 'Spent', 'أمضى', 'besteed', 'Dépensé', 'Ausgegeben', 'потраченное', 'gastado', 'harcanmış'),
(232, 'action', '', 'Action', 'عمل', 'actie', 'Action', 'Aktion', 'действие', 'acción', 'eylem'),
(233, 'clicks', '', 'Clicks', 'نقرات', 'klikken', 'Clics', 'Klicks', 'Щелчки', 'clics', 'Tıklanma'),
(234, 'create_ad', '', 'Create ad', 'إنشاء إعلان', 'Maak een advertentie', 'Créer une annonce', 'Anzeige erstellen', 'Создать объявление', 'Crear anuncio', 'Reklam oluştur'),
(235, 'my_balance', '', 'MY BALANCE', 'ماي بالانس', 'MIJN EVENWICHT', 'MON ÉQUILIBRE', 'MEINE BALANCE', 'МОЙ БАЛАНС', 'MI EQUILIBRIO', 'MY BALANCE'),
(236, 'replenish_my_balance', '', 'Replenish My Balance', 'ريبلينيش بلدي التوازن', 'Vervult mijn saldo', 'Réapprovisionner mon équilibre', 'Füllen Sie mein Gleichgewicht auf', 'Пополнить баланс', 'Reponer mi saldo', 'Bakiyemi yenile'),
(237, 'amount', '', 'Amount', 'كمية', 'bedrag', 'Montant', 'Betrag', 'Сумма', 'cantidad', 'miktar'),
(238, 'replenish', '', 'Replenish', 'سد النقص', 'bijvullen', 'Régénérer', 'Auffüllen', 'Пополнить', 'reponer', 'doldurmak'),
(239, 'create_new_ad', '', 'Create new ad', 'إنشاء إعلان جديد', 'Maak een nieuwe advertentie', 'Créer une nouvelle annonce', 'Neue Anzeige erstellen', 'Создать новое объявление', 'Crear nuevo anuncio', 'Yeni reklam oluştur'),
(240, 'title', '', 'Title', 'لقب', 'titel', 'Titre', 'Titel', 'Название', 'título', 'başlık'),
(241, 'select_media', '', 'Select Media', 'حدد الوسائط', 'Selecteer media', 'Sélectionner un média', 'Medien auswählen', 'Выбрать носитель', 'Seleccionar medios', 'Medya Seç'),
(242, 'pricing', '', 'Pricing', 'التسعير', 'pricing', 'Tarification', 'Preise', 'Ценообразование', 'la fijación de precios', 'Fiyatlandırma'),
(243, 'placement', '', 'Placement', 'وضع', 'plaatsing', 'Placement', 'Platzierung', 'Размещение', 'colocación', 'yerleştirme'),
(244, 'traget_audience', '', 'Target Audience', 'الجمهور المستهدف', 'Doelgroep', 'Public cible', 'Zielgruppe', 'Целевая аудитория', 'Audiencia objetivo', 'Hedef Kitle'),
(245, 'video_ad', '', 'Videos (Format Video / Image)', 'مقاطع الفيديو (تنسيق الفيديو / الصورة)', 'Video\'s (video / afbeelding opmaken)', 'Vidéos (format vidéo / image)', 'Videos (Format Video / Bild)', 'Видео (формат видео / изображение)', 'Videos (Formato de video / imagen)', 'Videolar (Biçim Video / Resim)'),
(246, 'page_ad', '', 'Sidebar (Format Image)', 'الشريط الجانبي (تنسيق الصورة)', 'Zijbalk (opmaakafbeelding)', 'Barre latérale (format image)', 'Seitenleiste (Bild formatieren)', 'Боковая панель (формат изображения)', 'Barra lateral (Imagen de formato)', 'Kenar Çubuğu (Biçim Resim)'),
(247, 'cost_click', '', 'Pay Per Click', 'الدفع لكل نقرة', 'Betaal per klik', 'Payer par clic', 'Zahlen pro Klick', 'Оплатить за клик', 'Pago por clic', 'Tıklama Başı Ödeme'),
(248, 'cost_view', '', 'Pay Per Impression', 'الدفع لكل ظهور', 'Betaal per indruk', 'Pay Per Impression', 'Bezahlen pro Eindruck', 'Оплатить за показ', 'Pago por impresión', 'Gösterim Başı Ödeme');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`) VALUES
(249, 'invalid_name', '', 'Name must be between 5/32', 'يجب أن يكون الاسم بين 5/32', 'Naam moet tussen 5/32 zijn', 'Le nom doit être entre 5/32', 'Name muss zwischen 5/32 liegen', 'Имя должно быть от 5/32', 'El nombre debe estar entre 5/32', 'Ad 5/32 arasında olmalıdır'),
(250, 'invalid_url', '', 'The URL is invalid. Please enter a valid URL', 'عنوان ورل غير صالح. الرجاء إدخال عنوان ورل صالح', 'De URL is ongeldig. Voer een geldige URL in', 'L\'URL est invalide. Veuillez entrer une URL valide', 'Die URL ist ungültig. Bitte geben Sie eine gültige URL ein', 'Недопустимый URL. Введите действительный URL-адрес', 'La URL no es válida. Por favor ingrese una URL válida', 'URL geçersiz. Lütfen geçerli bir URL girin'),
(251, 'invalid_ad_title', '', 'Ad title must be between 5/100', 'يجب أن يكون عنوان الإعلان بين 5/100', 'De advertentietitel moet tussen 5/100 zijn', 'Le titre de l\'annonce doit être compris entre 5/100', 'Der Anzeigentitel muss zwischen 5/100 liegen', 'Название объявления должно быть от 5/100', 'El título del anuncio debe estar entre 5/100', 'Reklam başlığı 5/100 arasında olmalıdır.'),
(252, 'invalid_videoad_media', '', 'Media file is invalid. Please select a valid image / video', 'ملف الوسائط غير صالح. الرجاء تحديد صورة / فيديو صالح', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding / video', 'Le fichier multimédia est invalide. Veuillez sélectionner une image / vidéo valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild / Video aus', 'Недопустимый файл мультимедиа. Выберите действительное изображение / видео', 'El archivo multimedia no es válido. Seleccione una imagen / video válido', 'Medya dosyası geçersiz. Lütfen geçerli bir resim / video seçin'),
(253, 'invalid_pagead_media', '', 'Media file is invalid. Please select a valid image', 'ملف الوسائط غير صالح. الرجاء تحديد صورة صالحة', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier multimédia est invalide. Veuillez sélectionner une image valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл мультимедиа. Выберите действительное изображение', 'El archivo multimedia no es válido. Seleccione una imagen válida', 'Medya dosyası geçersiz. Lütfen geçerli bir resim seçin'),
(254, 'edit_ad', '', 'Edit ad', 'تعديل الإعلان', 'Advertentie bewerken', 'Modifier l\'annonce', 'Anzeige bearbeiten', 'Изменить объявление', 'Editar anuncio', 'Reklamı düzenle'),
(255, 'by', '', 'By', 'بواسطة', 'door', 'Par', 'Von', 'по', 'por', 'tarafından'),
(256, 'more_info', '', 'More Info', 'مزيد من المعلومات', 'Meer info', 'Plus d\'infos', 'Mehr Infos', 'Дополнительная информация', 'Más información', 'Daha Fazla Bilgi'),
(257, 'monetization', '', 'Monetization', 'تسييل', 'monetization', 'Monétisation', 'Monetarisierung', 'монетизация', 'monetización', 'Para Kazanma'),
(258, 'monetization_settings', '', 'Monetization Settings', 'إعدادات تحقيق الدخل', 'Instellingen voor inkomsten genereren', 'Paramètres de monétisation', 'Monetarisierungseinstellungen', 'Настройки монетизации', 'Configuración de monetización', 'Para Kazandırma Ayarları'),
(259, 'withdrawals', '', 'Withdrawals', 'السحب', 'onttrekkingen', 'Retraits', 'Abhebungen', 'Изъятия', 'Los retiros', 'Çekme'),
(260, 'balance', '', 'Available balance', 'الرصيد المتاح', 'Beschikbare balans', 'Solde disponible', 'Verfügbare Bilanz', 'Доступный баланс', 'Saldo disponible', 'Kullanılabilir bakiye'),
(261, 'min', '', 'Min', 'دقيقة', 'min', 'Min', 'Min', 'мин', 'min', 'min'),
(262, 'submit_withdrawal_request', '', 'Submit withdrawal request', 'إرسال طلب السحب', 'Verzoek tot opname indienen', 'Envoyer une demande de retrait', 'Abhebungsanfrage einreichen', 'Отправить запрос', 'Enviar solicitud', 'Istek gönder'),
(263, 'cant_request_withdrawal', '', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'لا يمكنك إرسال طلب', 'U kunt geen aanvraag indienen', 'Vous ne pouvez pas soumettre une demande', 'Sie können keine Anfrage senden', 'Вы не можете отправить запрос до тех пор, пока предыдущий запрос не будет одобрен / отклонен', 'No puede enviar la solicitud hasta que la solicitud anterior haya sido aprobada / rechazada', 'Önceki istek onaylanana / reddedilene kadar istekte bulunamazsınız'),
(264, 'withdrawal_request_amount_is', '', 'Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:', 'رصيدك هو {{بالانس}}، الحد الأدنى لطلب السحب هو 50:', 'Uw saldo is {{BALANCE}}, het minimum opnameverzoek is 50:', 'Votre solde est {{BALANCE}}, la demande de retrait minimum est de 50:', 'Ihr Guthaben ist {{BALANCE}}, die Mindestanzahl der Auszahlungen beträgt 50:', 'Ваш баланс {{BALANCE}}, минимальный запрос на изъятие составляет 50:', 'Su saldo es {{BALANCE}}, la solicitud mínima de retiro es 50:', 'Bakiyeniz {{BALANCE}}, minimum para çekme isteği 50\'dir:'),
(265, 'min_withdrawal_request_amount_is', '', 'The minimum withdrawal request is 50:', 'الحد الأدنى لطلب السحب هو 50:', 'Het minimale opnameverzoek is 50:', 'La demande de retrait minimum est de 50:', 'Die minimale Auszahlungsanforderung ist 50:', 'Минимальный запрос на изъятие составляет 50:', 'La solicitud mínima de retiro es 50:', 'Minimum para çekme talebi 50\'dir:'),
(266, 'withdrawal_request_sent', '', 'Your withdrawal request has been successfully sent!', 'تم إرسال طلب السحب بنجاح!', 'Uw opnameverzoek is met succes verzonden!', 'Votre demande de retrait a bien été envoyée!', 'Ihre Auszahlungsanfrage wurde erfolgreich versendet!', 'Ваш запрос на удаление был успешно отправлен!', '¡Su solicitud de retiro ha sido enviada con éxito!', 'Çekilme isteğiniz başarıyla gönderildi!'),
(267, 'enabled', '', 'Enabled', 'تمكين', 'ingeschakeld', 'Activé', 'Aktiviert', 'Включено', 'Activado', 'Etkin'),
(268, 'disabled', '', 'Disabled', 'معاق', 'invalide', 'Désactivé', 'Deaktiviert', 'Выключено', 'discapacitado', 'engelli'),
(269, 'withdrawals_history', '', 'Withdrawals History', 'انسحابات التاريخ', 'Opnames geschiedenis', 'Historique des retraits', 'Abhebungen Geschichte', 'История изъятий', 'Historia de Retiros', 'Para Çekme Tarihi'),
(270, 'rejected', '', 'Rejected', 'مرفوض', 'verworpen', 'Rejeté', 'Abgelehnt', 'отвергнуто', 'rechazado', 'reddedilen'),
(271, 'accepted', '', 'Accepted', 'قبلت', 'geaccepteerd', 'Accepté', 'Akzeptiert', 'Принято', 'aceptado', 'kabul'),
(272, 'requested_at', '', 'Requested at', 'طلب في', 'Gevraagd om', 'Demandé à', 'Angefordert bei', 'Запрошено на', 'Solicitado en', 'Adresinden istendi'),
(273, 'confirm_delete_ad', '', 'Are you sure you want to delete this ad?', 'هل تريد بالتأكيد حذف هذا الإعلان؟', 'Weet je zeker dat je deze advertentie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer cette annonce?', 'Möchten Sie diese Anzeige wirklich löschen?', 'Вы уверены, что хотите удалить это объявление?', '¿Seguro que quieres eliminar este anuncio?', 'Bu reklamı silmek istediğinizden emin misiniz?'),
(274, 'ad_published', '', 'Your ad has been published successfully', 'إعلانك هنا', 'Uw advertentie is hier', 'Votre annonce est ici', 'Ihre Anzeige ist hier', 'Ваше объявление успешно опубликовано', 'Su anuncio ha sido publicado con éxito', 'Reklamınız başarıyla yayınlandı'),
(275, 'ad_saved', '', 'Your changes to the ad were successfully saved', 'تغييراتك إلى الأفضل', 'Uw wijzigingen in de beste', 'Vos changements au meilleur', 'Ihre Änderungen an den besten', 'Ваши изменения в объявлении были успешно сохранены', 'Sus cambios en el anuncio se guardaron con éxito', 'Reklamdaki değişiklikler başarıyla kaydedildi'),
(276, 'pending', '', 'Pending', 'ريثما', 'in afwachting van', 'en attente', 'anstehend', 'в ожидании', 'pendiente', 'kadar'),
(277, 'balance_is_0', '', 'Your current wallet balance is: 0, please top up your wallet to continue.', 'رصيد المحفظة الحالي هو: 0، يرجى متابعة محفظتك للمتابعة.', 'Uw huidige portemonneebalans is: 0, vul uw portemonnee aan om door te gaan.', 'Votre solde de portefeuille actuel est: 0, veuillez compléter votre portefeuille pour continuer.', 'Ihre aktuelle Brieftasche Gleichgewicht ist: 0, bitte nach oben Ihre Brieftasche, um fortzufahren.', 'Ваш текущий баланс кошелька: 0, пожалуйста, пополните свой кошелек, чтобы продолжить.', 'Su saldo de cartera actual es: 0, por favor, recargue su cartera para continuar.', 'Mevcut cüzdan bakiyeniz: 0, devam etmek için lütfen cüzdanınızı doldurun.'),
(278, 'top_up', '', 'Top Up', 'أشحن', 'Top Up', 'Remplir', 'Nachfüllen', 'Пополнить', 'Completar', 'Ekleyin'),
(279, 'earn_mon', '', 'Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!', 'اربح ({{CONFIG pub_price}} {{CONFIG payment_currency}}) لكل إعلان يتم النقر عليه من مقاطع الفيديو التابعة لك', 'Verdien ({{CONFIG pub_price}} {{CONFIG payment_currency}}) voor elke advertentieklik die je krijgt van je video\'s!', 'Gagnez ({{CONFIG pub_price}} {{CONFIG payment_currency}}) pour chaque annonce que vous recevez de vos vidéos!', 'Verdiene ({{CONFIG pub_price}} {{CONFIG payment_currency}}) für jeden Werbeclick, den du aus deinen Videos erhältst!', 'Заработайте ({{CONFIG pub_price}} {{CONFIG payment_currency}}) для каждого рекламного клика, который вы получаете от своих видео!', 'Gane ({{CONFIG pub_price}} {{CONFIG payment_currency}}) por cada clic publicitario que obtenga de sus videos.', 'Videolarınızdan aldığınız her bir reklam tıklaması için {{CONFIG pub_price}} {{CONFIG payment_currency}} kazanın!'),
(280, 'get_verified', '', 'Get verified', 'الحصول على التحقق', 'Wordt geverifieerd', 'Être vérifié', 'Verifiziert werden', 'Пройти проверку', 'Verifícate', 'Onaylanmış olmak'),
(281, 'u_are_verified', '', 'Congratulations, you are verified. Thanks for verifying your ID', 'تهانينا، لقد تم إثبات ملكيتك. نشكرك على إثبات هويتك', 'Gefeliciteerd, je bent geverifieerd. Bedankt voor het verifiëren van uw ID', 'Félicitations, vous êtes vérifié. Merci d\'avoir vérifié votre identifiant', 'Herzlichen Glückwunsch, du bist verifiziert. Vielen Dank für die Bestätigung Ihrer ID', 'Поздравляем, вы подтверждены. Спасибо, что подтвердили свой идентификатор', 'Felicidades, estás verificado. Gracias por verificar tu ID', 'Tebrikler, doğrulanmışsın. Kimliğinizi doğruladığınız için teşekkür ederiz'),
(282, 'verif_request_received', '', 'Your request was received and is pending approval', 'تم استلام طلبك وهو في انتظار الموافقة', 'Uw aanvraag is ontvangen en wacht op goedkeuring', 'Votre demande a été reçue et est en attente d\'approbation', 'Ihre Anfrage wurde empfangen und steht noch aus.', 'Ваш запрос был получен и находится на рассмотрении', 'Su solicitud fue recibida y está pendiente de aprobación', 'Talebiniz alındı ve onay bekliyor'),
(283, 'upload_id', '', 'Upload Passport or ID', 'تحميل جواز السفر أو الهوية', 'Upload paspoort of ID', 'Télécharger un passeport ou un identifiant', 'Reisepass oder ID hochladen', 'Загрузить паспорт или идентификатор', 'Cargar pasaporte o ID', 'Pasaport veya Kimliği Yükle'),
(284, 'select_id', '', 'Please select a recent picture of your passport or id', 'يرجى تحديد صورة حديثة لجواز السفر أو الهوية', 'Selecteer een recente foto van uw paspoort of id', 'Veuillez sélectionner une photo récente de votre passeport ou identifiant', 'Bitte wählen Sie ein aktuelles Bild Ihres Passes oder Ihrer ID', 'Пожалуйста, выберите последнее изображение своего паспорта или идентификатора', 'Seleccione una foto reciente de su pasaporte o identificación', 'Lütfen pasaportunuzun veya kimlik numaranızın son bir resmini seçin'),
(285, 'choose_file', '', 'Choose File', 'اختر ملف', 'Kies bestand', 'Choisir le fichier', 'Datei wählen', 'Выберите файл', 'Elija el archivo', 'Dosya seçin'),
(286, 'submit_request', '', 'Submit request', 'تقديم الطلب', 'Aanvraag indienen', 'Envoyer la demande', 'Anfrage einreichen', 'Отправить запрос', 'Enviar peticion', 'İstek gönderin'),
(287, 'submit_verif_request_error', '', 'You can not submit verification request until the previous requests has been accepted / rejected', 'لا يمكنك إرسال طلب التحقق إلى أن يتم قبول الطلبات السابقة أو رفضها', 'U kunt geen verificatieverzoek indienen totdat de vorige verzoeken zijn geaccepteerd / afgewezen', 'Vous ne pouvez pas soumettre de demande de vérification tant que les demandes précédentes n\'ont pas été acceptées / rejetées', 'Sie können keine Überprüfungsanfrage senden, bis die vorherigen Anforderungen akzeptiert / abgelehnt wurden.', 'Вы не можете отправить запрос на подтверждение до тех пор, пока предыдущие запросы не будут приняты / отклонены', 'No puede enviar solicitud de verificación hasta que las solicitudes anteriores hayan sido aceptadas / rechazadas', 'Önceki istekler kabul / reddedilene kadar doğrulama isteği gönderemezsiniz.'),
(288, 'ivalid_last_name', '', 'Last name is too long!', 'اسم العائلة طويل جدا!', 'Achternaam is te lang!', 'Le nom de famille est trop long!', 'Nachname ist zu lang!', 'Фамилия слишком длинная!', '¡El apellido es demasiado largo!', 'Soyadı çok uzun!'),
(289, 'ivalid_image_file', '', 'The Image file is Not valid.please select a valid picture!', 'ملف الصورة غير صالح.الرجاء تحديد صورة صالحة!', 'Het afbeeldingsbestand is niet geldig. Selecteer een geldige foto!', 'Le fichier Image n\'est pas valide. Veuillez sélectionner une image valide!', 'Die Bilddatei ist nicht gültig. Bitte wählen Sie ein gültiges Bild aus!', 'Файл изображения недействителен. Выберите правильное изображение!', 'El archivo de imagen no es válido. ¡Por favor seleccione una imagen válida!', 'Resim dosyası geçerli değil. Geçerli bir resim seçin!'),
(290, 'ivalid_id_file', '', 'The passport/ID picture must be an image', 'يجب أن تكون صورة الجواز / الهوية صورة', 'Het paspoort / ID-beeld moet een afbeelding zijn', 'L\'image du passeport / ID doit être une image', 'Das Pass / ID-Bild muss ein Bild sein', 'Паспорт / удостоверение личности должно быть изображением', 'El pasaporte / foto de identificación debe ser una imagen', 'Pasaport / kimlik resmi bir resim olmalıdır.'),
(291, 'verif_request_sent', '', 'Your request was successfully sent and will be in the near future reviwed!', 'تم إرسال طلبك بنجاح وسوف تكون في المستقبل القريب ريفيويد!', 'Uw aanvraag is met succes verzonden en zal in de nabije toekomst worden herzien!', 'Votre demande a été envoyée avec succès et sera dans un futur proche reviwed!', 'Ihre Anfrage wurde erfolgreich versendet und wird in naher Zukunft reviwed sein!', 'Ваш запрос был успешно отправлен и будет в ближайшее время изменен!', 'Su solicitud fue enviada con éxito y será reviwed en el futuro cercano.', 'Talebiniz başarıyla gönderildi ve yakın gelecekte yeniden incelenecek!'),
(292, 'unknown_error', '', 'Error: an unknown error occurred. Please try again later', 'خطأ: حدث خطأ غير معروف. الرجاء معاودة المحاولة في وقت لاحق', 'Fout: er is een onbekende fout opgetreden. Probeer het later opnieuw', 'Erreur: une erreur inconnue s\'est produite. Veuillez réessayer plus tard', 'Fehler: Ein unbekannter Fehler ist aufgetreten. Bitte versuche es später noch einmal', 'Ошибка: произошла неизвестная ошибка. Пожалуйста, повторите попытку позже', 'Error: se produjo un error desconocido. Por favor, inténtelo de nuevo más tarde', 'Hata: Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz'),
(293, 'ivalid_thumb_file', '', 'Thumbnail image file is invalid. Please select a valid image', 'ملف الصورة المصغرة غير صالح. الرجاء تحديد صورة صالحة', 'Miniatuurafbeeldingsbestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier d\'image miniature est invalide. Veuillez sélectionner une image valide', 'Miniaturbilddatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл изображения миниатюр. Выберите действительное изображение', 'El archivo de imagen en miniatura no es válido. Seleccione una imagen válida', 'Küçük resim dosyası geçersiz. Lütfen geçerli bir resim seçin'),
(294, 'hide', '', 'Hide', 'إخفاء', 'Verbergen', 'Cacher', 'Verbergen', 'Спрятать', 'Esconder', 'Saklamak'),
(295, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj'),
(296, 'notifications', '', 'Notifications', 'إخطارات', 'Varsler', 'Notifications', 'Benachrichtigungen', 'Уведомления', 'Notificaciones', 'Bildirimler'),
(297, 'subscribed_u', '', 'subscribed to your channel', 'مشترك في قناتك', 'abonnerer på kanalen din', 'abonné à votre chaîne', 'abonniert deinen Kanal', 'подписался на ваш канал', 'suscrito a tu canal', 'kanalınıza abone'),
(298, 'unsubscribed_u', '', 'unsubscribed from your channel', 'غير مشترك من قناتك', 'avmeldt fra kanalen din', 'désabonné de votre chaîne', 'von deinem Kanal abgemeldet', 'отписался с вашего канала', 'anulado de su canal', 'kanalınızdan aboneliğiniz iptal edildi'),
(299, 'liked_ur_video', '', 'liked your video', 'أعجبك الفيديو', 'likte videoen din', 'aimé votre vidéo', 'mochte dein Video', 'понравилось ваше видео', 'me gustó tu video', 'videonuzu beğendim'),
(300, 'disliked_ur_video', '', 'disliked your video', 'لم يعجبك الفيديو', 'Mislikte videoen din', 'n\'aimait pas votre vidéo', 'hat dein Video nicht gefallen', 'не понравилось ваше видео', 'disgustó tu video', 'videonun beğenilmediğini'),
(301, 'commented_ur_video', '', 'commented on your video', 'علق على الفيديو التابع لك', 'kommenterte videoen din', 'a commenté votre vidéo', 'hat dein Video kommentiert', 'прокомментировал ваше видео', 'comentó tu video', 'videonuza yorum yaptı'),
(302, 'liked_ur_comment', '', 'liked your comment', 'أحب تعليقك', 'likte din kommentar', 'aimé ton commentaire', 'mochte deinen Kommentar', 'понравился ваш комментарий', 'le gustó su comentario', 'Yorumu beğeniyor'),
(303, 'disliked_ur_comment', '', 'disliked your comment', 'لم يعجبك تعليقك', 'Mislikte din kommentar', 'n\'aimait pas ton commentaire', 'hat deinen Kommentar nicht gefallen', 'не понравился ваш комментарий', 'disgustado su comentario', 'yorumunu beğenmedi'),
(304, 'replied_2ur_comment', '', 'replied to your comment', 'أجاب على تعليقك', 'svarte på din kommentar', 'a répondu à votre commentaire', 'antwortete auf deinen Kommentar', 'ответил на ваш комментарий', 'respondió a tu comentario', 'senin yorumuna cevap verdi'),
(305, 'cancel_report', '', 'Cancel Report', 'إلغاء التقرير', 'Avbryt rapport', 'Annuler le rapport', 'Bericht abbrechen', 'Отменить отчет', 'Cancelar informe', 'Raporu İptal Et'),
(306, 'no_more_videos', '', 'No more videos found', 'لم يتم العثور على مزيد من مقاطع الفيديو', 'Ingen flere videoer funnet', 'Plus de vidéos trouvées', 'Keine weiteren Videos gefunden', 'Больше видео не найдено', 'No se encontraron más videos', 'Başka video bulunamadı'),
(307, 'load_more', '', 'Load more', 'تحميل المزيد', 'Last mer', 'Charger plus', 'Mehr laden', 'Показать больше', 'Carga más', 'Daha fazla yükle'),
(308, 'report_zs_video', '', 'Report this video', 'ابلغ عن هذا الفيديو', 'Rapporter denne videoen', 'Signaler cette vidéo', 'Melde dieses Video', 'Сообщить об этом видео', 'Reporta este video', 'Bu videoyu rapor et'),
(309, 'write_vr_summary', '', 'Please write a summary of what this video was about', 'يرجى كتابة ملخص عن هذا الفيديو', 'Vennligst skriv et sammendrag av hva denne videoen handlet om', 'S\'il vous plaît écrire un résumé de ce que cette vidéo était sur', 'Bitte schreibe eine Zusammenfassung darüber, worum es in diesem Video ging', 'Пожалуйста, напишите резюме того, о чем это видео было', 'Por favor, escribe un resumen de lo que este video fue sobre', 'Lütfen bu videonun neye ait olduğunu özetleyin'),
(310, 'submit', '', 'Submit', 'خضع', 'Sende inn', 'Soumettre', 'einreichen', 'Отправить', 'Enviar', 'Gönder'),
(311, 'thank_u', '', 'Thank you', 'شكرا لكم', 'Takk skal du ha', 'Je vous remercie', 'Vielen Dank', 'Спасибо', 'Gracias', 'teşekkür ederim'),
(312, 'we_received_ur_rep', '', 'We have received your report!', 'لقد تلقينا تقريرك!', 'Vi har mottatt din rapport!', 'Nous avons reçu votre rapport!', 'Wir haben Ihren Bericht erhalten!', 'Мы получили ваш отчет!', '¡Hemos recibido su informe!', 'Raporunuzu aldık!'),
(313, 'report_canceled', '', 'Your report has been canceled!', 'تم إلغاء تقريرك!', 'Rapporten din er kansellert!', 'Votre rapport a été annulé!', 'Ihr Bericht wurde storniert!', 'Ваш отчет отменен!', '¡Su informe ha sido cancelado!', 'Raporunuz iptal edildi!'),
(314, 'comment_pinned', '', 'Comment pinned to top', 'تم تعليق التعليق إلى الأعلى', 'Kommentar festet til toppen', 'Commentaire épinglé en haut', 'Kommentar nach oben gepinnt', 'Комментарий прикреплен к верхней части', 'Comentario anclado al principio', 'Yorum en üste sabitlendi'),
(315, 'comment_unpinned', '', 'Comment unpinned', 'تم إلغاء تثبيت التعليق', 'Kommentar unpinned', 'Commentaire détaché', 'Kommentar nicht gepinnt', 'Комментарий откреплен', 'Comentario sin fijar', 'Sabitsiz yorum'),
(316, 'porcessing_video', '', 'Processing your video - this may take a few minutes', 'معالجة الفيديو - قد يستغرق ذلك بضع دقائق', 'Je video verwerken - dit kan een paar minuten duren', 'Traitement de votre vidéo - cela peut prendre quelques minutes', 'Verarbeitung deines Videos - dies kann einige Minuten dauern', 'Обработка вашего видео - это может занять несколько минут', 'Procesando su video: esto puede demorar unos minutos', 'Videonuzu işlemek - bu birkaç dakika alabilir'),
(317, 'video_thumbs', '', 'Video thumbnails', 'الصور المصغرة الفيديو', 'Videominiaturen', 'vignettes vidéo', 'Video-Miniaturansichten', 'Видео эскизы', 'Miniaturas de vídeo', 'Video küçük resimleri'),
(318, 'ur_video_porcessing', '', 'This video is being converted to few resolutions, it may take a few minutes.', 'يتم تحويل الفيديو، قد يستغرق بضع دقائق', 'Video wordt geconverteerd, dit kan enkele minuten duren', 'La vidéo est convertie, cela peut prendre quelques minutes', 'Video wird konvertiert, es kann einige Minuten dauern', 'Видео конвертируется, это может занять несколько минут', 'El video se convierte, puede tomar unos minutos', 'Video dönüştürülür, birkaç dakika sürebilir.'),
(319, 'this_video_porcessing', '', 'This video is being processed, please come back in few minutes', 'تتم معالجة هذا الفيديو، يرجى العودة في غضون بضع دقائق', 'Deze video wordt verwerkt. Kom over een paar minuten terug', 'Cette vidéo est en cours de traitement, revenez dans quelques minutes', 'Dieses Video wird gerade bearbeitet. Bitte kommen Sie in ein paar Minuten zurück', 'Это видео обрабатывается, пожалуйста, вернитесь через несколько минут', 'Este video está siendo procesado, vuelve en unos minutos', 'Bu video işleniyor, lütfen birkaç dakika içinde geri dönün'),
(320, 'mode', '', 'Mode', 'الوضع', 'mode', 'Mode', 'Modus', 'Режим', 'Modo', 'kip'),
(321, 'day_mode', '', 'Day mode', 'وضع اليوم', 'Dagmodus', 'Mode jour', 'Tagesmodus', 'Дневной режим', 'Modo día', 'Gün modu'),
(322, 'night_mode', '', 'Night mode', 'الوضع الليلي', 'Nachtstand', 'Mode nuit', 'Nacht-Modus', 'Ночной режим', 'Modo nocturno', 'Gece modu'),
(323, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Сортировать по', 'Ordenar por', 'Göre sırala'),
(324, 'top_commnets', '', 'Top Comments', 'أعلى تعليقات', 'Top Reacties', 'Meilleures Commentaires', 'Beste Kommentare', 'Лучшие комментарии', 'Top Comentarios', 'En Çok Yorumlananlar'),
(325, 'last_commnets', '', 'Latest comments', 'أحدث تعليقات', 'Laatste Reacties', 'Derniers Commentaires', 'Neueste Kommentare', 'Последние комментарии', 'Últimos comentarios', 'Son Yorumlar'),
(326, 'darg_drop_video', '', 'Drag & Drop video', 'سحب وإسقاط الفيديو', 'Video slepen en neerzetten', 'Drag & Drop vidéo', 'Video per Drag & Drop', 'Перетащите сюда видео', 'Arrastrar y soltar video', 'Sürükle ve Bırak video'),
(327, 'click_2choose_file', '', 'click to select a file', 'انقر لتحديد ملف', 'klik om een bestand te selecteren', 'cliquez pour sélectionner un fichier', 'Klicken Sie, um eine Datei auszuwählen', 'нажмите, чтобы выбрать файл', 'haga clic para seleccionar un archivo', 'bir dosya seçmek için tıklayın'),
(328, 'or', '', 'or', 'أو', 'of', 'ou', 'oder', 'или', 'o', 'veya'),
(329, 'contact_us', '', 'Contact us', 'اتصل بنا', 'Neem contact met ons op', 'Contactez nous', 'Kontaktiere uns', 'Свяжитесь с нами', 'Contáctenos', 'Bizimle iletişime geçin'),
(330, 'email', '', 'E-mail', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail'),
(331, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', 'Ajout d&#039;une nouvelle vidéo', 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi'),
(332, 'added_new_video', '', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', NULL, 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi'),
(333, 'messages', '', 'Messages', 'رسائل', 'berichten', 'messages', 'Mitteilungen', 'Сообщения', 'Mensajes', 'Mesajlar'),
(334, 'are_you_sure_you_want_delete_chat', '', 'Are you sure that you want to delete the conversation?', 'هل تريد بالتأكيد حذف المحادثة؟', 'Weet je zeker dat je het gesprek wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer la conversation?', 'Möchten Sie die Unterhaltung wirklich löschen?', 'Вы уверены, что хотите удалить разговор?', '¿Estás seguro de que quieres eliminar la conversación?', 'Sohbeti silmek istediğinizden emin misiniz?'),
(335, 'no_messages_found_hi', '', 'No messages were found, say Hi!', 'لم يتم العثور على رسائل، ويقول مرحبا!', 'Er zijn geen berichten gevonden, bijvoorbeeld Hallo!', NULL, 'Keine Nachrichten gefunden, sagen Hallo!', 'Сообщения не найдены, скажите Привет!', 'No se encontraron mensajes, decir Hola!', 'Mesaj bulunamadı, merhaba deyin!'),
(336, 'no_messages_found_channel', '', 'No messages were found, please choose a channel to chat.', 'لم يتم العثور على أية رسائل، يرجى اختيار قناة للدردشة.', 'Er zijn geen berichten gevonden. Kies een kanaal om te chatten.', NULL, 'Es wurden keine Nachrichten gefunden. Wähle einen Chat-Kanal aus.', 'Сообщения не найдены, выберите канал для чата.', 'No se encontraron mensajes, elija un canal para chatear.', 'Hiçbir mesaj bulunamadı, lütfen sohbet etmek için bir kanal seçin.'),
(337, 'no_match_found', '', 'No match found', 'لا يوجد تطابق', 'Geen overeenkomst gevonden', 'Pas de résultat trouvé', 'Keine Übereinstimmung gefunden', 'Не найдено совпадений', 'No se encontraron coincidencias', 'Eşleşme bulunamadı'),
(338, 'message', '', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj'),
(339, 'write_message', '', 'Write your message and hit enter..', 'اكتب رسالتك واضغط على إنتر ..', 'Schrijf je bericht en druk op enter ..', 'Rédigez votre message et appuyez sur Entrée.', 'Schreibe deine Nachricht und drücke Enter.', 'Напишите свое сообщение и нажмите enter.', 'Escriba su mensaje y presione enter ...', 'Mesajınızı yazın ve enter tuşuna basın ..'),
(346, 'channels', '', 'Channels', 'قنوات', 'kanalen', 'Chaînes', 'Kanäle', 'каналы', 'Canales', 'Kanallar'),
(347, 'recent_articles', '', 'Most recent articles', 'أحدث المقالات', 'Meest recente artikelen', 'Articles les plus récents', 'Neueste Artikel', 'Последние статьи', 'Artículos más recientes', 'En yeni makaleler'),
(348, 'read_more', '', 'Read more', 'اقرأ أكثر', 'Lees verder', 'Lire la suite', 'Weiterlesen', 'Прочитайте больше', 'Lee mas', 'Daha fazla oku'),
(349, 'removed_history', '', 'Removed from History', 'تمت إزالته من السجل', 'Verwijderd uit de geschiedenis', NULL, 'Aus dem Verlauf entfernt', 'Удалено из истории', 'Eliminado de la historia', 'Geçmişten kaldırıldı'),
(350, 'show_less', '', 'Show less', 'عرض أقل', 'Vis mindre', 'Montre moins', 'Zeige weniger', 'Показывай меньше', 'Muestra menos', 'Daha az göster'),
(351, 'no_users_found', '', 'No users found', 'لم يتم العثور على أي مستخدم', 'Geen gebruikers gevonden', 'Aucun utilisateur trouvé', 'Keine Benutzer gefunden', 'Пользователи не найдены', 'No se encontraron usuarios', 'Kullanıcı bulunamadı'),
(352, 'social_links', '', 'Social links', 'روابط اجتماعية', 'Sociale links', 'Liens sociaux', 'Soziale Verbindungen', 'Социальные ссылки', 'Vínculos sociales', 'Sosyal bağlantılar'),
(353, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'На этом веб-сайте используются файлы cookie, чтобы вы могли получить лучший опыт на нашем веб-сайте.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.', 'Bu web sitesi, web sitemizde en iyi deneyimi yaşamanızı sağlamak için çerezleri kullanır.'),
(354, 'cookie_dismiss', '', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', 'Понял!', '¡Lo tengo!', 'Anladım!'),
(355, 'cookie_link', '', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Выучить больше', 'Aprende más', 'Daha fazla bilgi edin'),
(356, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Пожалуйста, соглашайтесь с Условиями использования и Политикой конфиденциальности', 'Acepta los Términos de uso y la Política de privacidad', 'Lütfen Kullanım Koşulları ve Gizlilik Politikasını kabul edin'),
(357, 'terms_agreement', '', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Создав свою учетную запись, вы соглашаетесь с нашими', 'Al crear su cuenta, usted acepta nuestra', 'Hesabınızı oluşturarak,'),
(358, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'У вас нет уведомлений', 'No tienes ninguna notificación', 'Bildiriminiz yok'),
(359, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'У вас нет уведомлений', 'No tienes ninguna notificación', 'Bildiriminiz yok'),
(360, 'cookie_message', '', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'На этом веб-сайте используются файлы cookie, чтобы вы могли получить лучший опыт на нашем веб-сайте.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.', 'Bu web sitesi, web sitemizde en iyi deneyimi yaşamanızı sağlamak için çerezleri kullanır.'),
(361, 'cookie_dismiss', '', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', 'Понял!', '¡Lo tengo!', 'Anladım!'),
(362, 'cookie_link', '', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Выучить больше', 'Aprende más', 'Daha fazla bilgi edin'),
(363, 'terms_accept', '', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Пожалуйста, соглашайтесь с Условиями использования и Политикой конфиденциальности', 'Acepta los Términos de uso y la Política de privacidad', 'Lütfen Kullanım Koşulları ve Gizlilik Politikasını kabul edin'),
(364, 'terms_agreement', '', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Создав свою учетную запись, вы соглашаетесь с нашими', 'Al crear su cuenta, usted acepta nuestra', 'Hesabınızı oluşturarak,'),
(365, 'no_notifications', '', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'У вас нет уведомлений', 'No tienes ninguna notificación', 'Bildiriminiz yok'),
(366, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'Unlisted', 'No estante en la lista', 'Liste dışı'),
(367, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Это видео конфиденциально, только издатель может его просмотреть.', 'Este es un video privado, solo el editor puede verlo.', 'Bu video özel, sadece yayıncı bunu görüntüleyebilir.'),
(368, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(369, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'оригинал', 'Original', 'orijinal'),
(370, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Ограничение возраста', 'Restricción de edad', 'Yaş kısıtlaması'),
(371, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Все возрасты могут просматривать это видео', 'Todas las edades pueden ver este video', 'Her yaştan bu videoyu görüntüleyebilir'),
(372, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Только +18', 'Solo +18', 'Sadece +18'),
(373, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'Вам не разрешается менять свой возраст более одного раза', 'No puedes cambiar tu edad más de una vez', 'Yaşınızı bir kereden fazla değiştiremezsiniz'),
(374, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Это видео ограничено для зрителей под +18', 'Este video está restringido para menores de 18 años.', 'Bu video, +18 yaşın altındaki görüntüleyenler için kısıtlanmış'),
(375, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Создайте учетную запись или авторизуйтесь, чтобы подтвердить свой возраст.', 'Crea una cuenta o inicia sesión para confirmar tu edad.', 'Yaşınızı onaylamak için bir hesap oluşturun veya giriş yapın.'),
(376, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Пожертвование PayPal Email', 'Donación Correo electrónico de PayPal', 'Bağış PayPal Email'),
(377, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Скачать', 'Descargar', 'İndir'),
(378, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'жертвовать', 'Donar', 'bağışlamak'),
(379, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Это видео просматривается, пожалуйста, зайдите позже.', 'Este video está siendo revisado, por favor revise más tarde.', 'Bu video inceleniyor, lütfen daha sonra tekrar kontrol edin.'),
(380, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Вы достигли предела загрузки.', 'Has alcanzado tu límite de carga.', 'Yükleme sınırınıza ulaştınız.'),
(381, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Пожалуйста, удалите некоторые из ваших видеороликов, которые могут загрузить больше.', 'Elimina algunos de tus videos para poder subir más.', 'Lütfen daha fazla yükleme yapabileceğiniz videolarınızın bir kısmını silin.'),
(382, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'Unlisted', 'No estante en la lista', 'Liste dışı'),
(383, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Это видео конфиденциально, только издатель может его просмотреть.', 'Este es un video privado, solo el editor puede verlo.', 'Bu video özel, sadece yayıncı bunu görüntüleyebilir.'),
(384, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(385, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'оригинал', 'Original', 'orijinal'),
(386, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Ограничение возраста', 'Restricción de edad', 'Yaş kısıtlaması'),
(387, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Все возрасты могут просматривать это видео', 'Todas las edades pueden ver este video', 'Her yaştan bu videoyu görüntüleyebilir'),
(388, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Только +18', 'Solo +18', 'Sadece +18'),
(389, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'Вам не разрешается менять свой возраст более одного раза', 'No puedes cambiar tu edad más de una vez', 'Yaşınızı bir kereden fazla değiştiremezsiniz'),
(390, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Это видео ограничено для зрителей под +18', 'Este video está restringido para menores de 18 años.', 'Bu video, +18 yaşın altındaki görüntüleyenler için kısıtlanmış'),
(391, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Создайте учетную запись или авторизуйтесь, чтобы подтвердить свой возраст.', 'Crea una cuenta o inicia sesión para confirmar tu edad.', 'Yaşınızı onaylamak için bir hesap oluşturun veya giriş yapın.'),
(392, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Пожертвование PayPal Email', 'Donación Correo electrónico de PayPal', 'Bağış PayPal Email'),
(393, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Скачать', 'Descargar', 'İndir'),
(394, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'жертвовать', 'Donar', 'bağışlamak'),
(395, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Это видео просматривается, пожалуйста, зайдите позже.', 'Este video está siendo revisado, por favor revise más tarde.', 'Bu video inceleniyor, lütfen daha sonra tekrar kontrol edin.'),
(396, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Вы достигли предела загрузки.', 'Has alcanzado tu límite de carga.', 'Yükleme sınırınıza ulaştınız.'),
(397, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Пожалуйста, удалите некоторые из ваших видеороликов, которые могут загрузить больше.', 'Elimina algunos de tus videos para poder subir más.', 'Lütfen daha fazla yükleme yapabileceğiniz videolarınızın bir kısmını silin.'),
(398, 'unlisted', '', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'Unlisted', 'No estante en la lista', 'Liste dışı'),
(399, 'video_private_text', '', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Это видео конфиденциально, только издатель может его просмотреть.', 'Este es un video privado, solo el editor puede verlo.', 'Bu video özel, sadece yayıncı bunu görüntüleyebilir.'),
(400, 'instagram', '', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(401, 'original', '', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'оригинал', 'Original', 'orijinal'),
(402, 'age_restriction', '', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Ограничение возраста', 'Restricción de edad', 'Yaş kısıtlaması'),
(403, 'all_ages', '', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Все возрасты могут просматривать это видео', 'Todas las edades pueden ver este video', 'Her yaştan bu videoyu görüntüleyebilir'),
(404, 'only_18', '', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Только +18', 'Solo +18', 'Sadece +18'),
(405, 'not_allowed_change_age', '', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'Вам не разрешается менять свой возраст более одного раза', 'No puedes cambiar tu edad más de una vez', 'Yaşınızı bir kereden fazla değiştiremezsiniz'),
(406, 'age_restrict_text', '', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Это видео ограничено для зрителей под +18', 'Este video está restringido para menores de 18 años.', 'Bu video, +18 yaşın altındaki görüntüleyenler için kısıtlanmış'),
(407, 'age_restrcit_text_2', '', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Создайте учетную запись или авторизуйтесь, чтобы подтвердить свой возраст.', 'Crea una cuenta o inicia sesión para confirmar tu edad.', 'Yaşınızı onaylamak için bir hesap oluşturun veya giriş yapın.'),
(408, 'donation_paypal_email', '', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Пожертвование PayPal Email', 'Donación Correo electrónico de PayPal', 'Bağış PayPal Email'),
(409, 'download', '', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Скачать', 'Descargar', 'İndir'),
(410, 'donate', '', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'жертвовать', 'Donar', 'bağışlamak'),
(411, 'video_approve_text', '', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Это видео просматривается, пожалуйста, зайдите позже.', 'Este video está siendo revisado, por favor revise más tarde.', 'Bu video inceleniyor, lütfen daha sonra tekrar kontrol edin.'),
(412, '_reached_upload_limit', '', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Вы достигли предела загрузки.', 'Has alcanzado tu límite de carga.', 'Yükleme sınırınıza ulaştınız.'),
(413, 'delete_some_videos', '', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Пожалуйста, удалите некоторые из ваших видеороликов, которые могут загрузить больше.', 'Elimina algunos de tus videos para poder subir más.', 'Lütfen daha fazla yükleme yapabileceğiniz videolarınızın bir kısmını silin.'),
(414, 'other', 'Other', 'Other', 'آخر', 'anders', 'Autre', 'Andere', 'Другой', 'Otro', 'Diğer'),
(415, 'no_more_s_to_show', 'No more subscriptions', 'No more subscriptions', 'لا مزيد من الاشتراكات', 'Geen abonnementen meer', 'Pas plus d\'abonnements', 'Keine weiteren Abonnements', 'Нет больше подписок', 'No mas suscripciones', 'Başka abonelik yok'),
(416, 'sell_videos', 'Sell videos at any price', 'Sell videos at any price', 'بيع أشرطة الفيديو بأي ثمن', 'Verkoop video\'s voor elke prijs', 'Vendre des vidéos à tout prix', 'Verkaufen Sie Videos um jeden Preis', 'Продавать видео по любой цене', 'Vende videos a cualquier precio', 'Videoları herhangi bir fiyattan satmak'),
(417, 'set_p_v', 'Price (Leave empty for free videos)', 'Price (Leave empty for free videos)', 'حدد سعرًا للمشاهد', 'Stel een prijs in voor de kijker', 'Fixer un prix pour le spectateur', 'Legen Sie einen Preis für den Viewer fest', 'Установить цену для зрителя', 'Establecer un precio para el espectador', 'Görüntüleyici için bir fiyat belirleme'),
(418, 'p_m_than_', 'Minimum price you can set is', 'Minimum price you can set is', 'أقل سعر يمكنك تعيينه هو', 'Minimumprijs die u kunt instellen is', 'Le prix minimum que vous pouvez définir est', 'Mindestpreis, den Sie einstellen können, ist', 'Минимальная цена, которую вы можете установить,', 'El precio mínimo que puede establecer es', 'Ayarlayabileceğiniz minimum fiyat:');
INSERT INTO `langs` (`id`, `lang_key`, `type`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`) VALUES
(419, 'pay_to_see', 'This video is being sold, you have to purchase the video to watch it.', 'This video is being sold, you have to purchase the video to watch it.', 'يتم بيع هذا الفيديو ، يجب عليك شراء الفيديو لمشاهدته.', 'Deze video wordt verkocht, je moet de video kopen om deze te bekijken.', 'Cette vidéo est en vente, vous devez acheter la vidéo pour la regarder.', 'Dieses Video wird verkauft, Sie müssen es kaufen, um es anzusehen.', 'Это видео продается, вы должны купить видео, чтобы посмотреть его.', 'Este video se está vendiendo, tienes que comprar el video para verlo.', 'Bu video satılıyor, izlemek için videoyu satın almanız gerekiyor.'),
(420, 'pay', 'Purchase', 'Purchase', 'دفع', 'Betalen', 'Payer', 'Zahlen', 'платить', 'Paga', 'ödeme'),
(421, 'paid_videos', 'Paid Videos', 'Paid Videos', 'مقاطع الفيديو المدفوعة', 'Betaalde video\'s', 'Vidéos payées', 'Bezahlte Videos', 'Платные видео', 'Videos de pago', 'Ücretli Videolar'),
(422, 'no_videos_found_paid', 'No paid videos found', 'No paid videos found', 'لم يتم العثور على مقاطع فيديو مدفوعة', 'Geen betaalde video\'s gevonden', 'Aucune vidéo payée trouvée', 'Keine bezahlten Videos gefunden', 'Платные видео не найдены', 'No se encontraron videos pagados', 'Ücretli video bulunamadı'),
(423, 'transactions', 'Transactions', 'Transactions', 'المعاملات', 'transacties', 'Transactions', 'Transaktionen', 'операции', 'Actas', 'işlemler'),
(424, 'id', 'ID', 'ID', 'هوية شخصية', 'ID kaart', 'ID', 'ICH WÜRDE', 'Я БЫ', 'CARNÉ DE IDENTIDAD', 'İD'),
(425, 'payer_name', 'Payer Name', 'Payer Name', 'اسم المدفوع', 'Naam betaler', 'Nom du payeur', 'Name des Zahlers', 'Имя плательщика', 'Nombre del pagador', 'Ödeme adı'),
(426, 'video', 'Video', 'Video', 'فيديو', 'Video', 'Vidéo', 'Video', 'видео', 'Vídeo', 'Video'),
(427, 'site_com', 'Site Commission', 'Site Commission', 'لجنة الموقع', 'Site Commissie', 'Commission de chantier', 'Standortkommission', 'Комиссия сайта', 'Comisión del sitio', 'Site Komisyonu'),
(428, 'time', 'Time', 'Time', 'زمن', 'Tijd', 'Temps', 'Zeit', 'Время', 'Hora', 'zaman'),
(429, 'paid_to_see', 'purchased your video', 'purchased your video', 'اشتريت الفيديو الخاص بك', 'heb je video gekocht', 'acheté votre vidéo', 'kaufte dein video', 'купил ваше видео', 'compré tu video', 'videonuzu satın aldı'),
(430, 'video_price', 'This video price is:', 'This video price is:', 'سعر الفيديو هذا هو:', 'Deze videoprijs is:', 'Le prix de cette vidéo est:', 'Dieser Videopreis beträgt:', 'Цена этого видео:', 'El precio de este video es:', 'Bu video fiyatı:'),
(431, 'purchased', 'Purchases', 'Purchases', 'اشترى', 'Gekocht', 'Acheté', 'Gekauft', 'купленный', 'Comprado', 'satın alındı'),
(432, 'balance_', 'Balance', 'Balance', 'توازن', 'Balans', 'Équilibre', 'Balance', 'Остаток средств', 'Equilibrar', 'Denge'),
(433, 'video_price_error', 'The video price should be numeric and greater than', 'The video price should be numeric and greater than', 'يجب أن يكون سعر الفيديو رقميًا وأكبر من', 'De videoprijs moet numeriek en groter zijn dan', 'Le prix de la vidéo doit être numérique et supérieur à', 'Der Videopreis sollte numerisch und größer als sein', 'Цена видео должна быть числовой и превышать', 'El precio del video debe ser numérico y mayor que', 'Video fiyatı sayısal ve daha büyük olmalıdır'),
(434, 'video_verified', 'This video is verified by our team', 'This video is verified by our team', 'تم التحقق من هذا الفيديو بواسطة فريقنا', 'Deze video wordt geverifieerd door ons team', 'Cette vidéo est vérifiée par notre équipe', 'Dieses Video wird von unserem Team überprüft', 'Это видео проверено нашей командой', 'Este video es verificado por nuestro equipo.', 'Bu video ekibimiz tarafından doğrulandı'),
(435, 'video_not_available', 'This video is no longer available', 'This video is no longer available', 'هذا المقطع لم يعد متوفرا', 'Deze video is niet langer beschikbaar', 'Cette vidéo n\'est plus disponible', 'Dieses Video ist nicht mehr verfügbar', 'Это видео больше не доступно', 'Este video ya no está disponible', 'Bu video artık mevcut değil'),
(436, 'admin_can_see', 'You have access to all videos, paid and free as you are an admin.', 'You have access to all videos, paid and free as you are an admin.', 'لديك حق الوصول إلى جميع مقاطع الفيديو ، مدفوعة ومجانية كما كنت مسؤولا.', 'Je hebt toegang tot alle video\'s, betaald en gratis als je een beheerder bent.', 'Vous avez accès à toutes les vidéos, payantes et gratuites, car vous êtes un administrateur.', 'Sie haben Zugriff auf alle Videos, bezahlt und kostenlos, da Sie ein Administrator sind.', 'У вас есть доступ ко всем видео, платным и бесплатным, поскольку вы являетесь администратором.', 'Tienes acceso a todos los videos, de pago y gratis como eres administrador.', 'Tüm videolara, yönetici olduğunuzdan ücretli ve ücretsiz erişebilirsiniz.'),
(437, 'net_earn', 'Net earnings', 'Net earnings', 'صافي الأرباح', 'Netto inkomen', 'Bénéfice net', 'Nettoverdienst', 'Чистая выручка', 'Ganancias netas', 'Net kazançlar'),
(438, 'user_upload_limit', 'User Upload Limit', 'User Upload Limit', 'حد تحميل المستخدم', 'Gebruikers upload limiet', 'Limite de téléchargement utilisateur', 'Benutzer-Upload-Limit', 'Предел загрузки пользователя', 'Límite de carga del usuario', 'Kullanıcı Yükleme Sınırı'),
(439, 'user_reached_upload_limit', 'You have reached your maximum upload limit, if you wish to increase it', 'You have reached your maximum upload limit, if you wish to increase it', 'لقد وصلت إلى الحد الأقصى للتحميل ، إذا كنت ترغب في زيادته', 'U heeft uw maximale uploadlimiet bereikt, als u deze wilt verhogen', 'Vous avez atteint votre limite maximale de téléchargement, si vous souhaitez l\'augmenter', 'Sie haben Ihr maximales Upload-Limit erreicht, wenn Sie es erhöhen möchten', 'Вы достигли максимального лимита загрузки, если хотите увеличить его', 'Has alcanzado tu límite máximo de carga, si deseas aumentarlo', 'Artırmak isterseniz, maksimum yükleme sınırınıza ulaştınız'),
(440, 'please_contact', 'please contact us', 'please contact us', 'الرجاء التواصل معنا', 'Gelieve ons te contacteren', 'Contactez nous s\'il vous plait', 'bitte kontaktieren Sie uns', 'пожалуйста свяжитесь с нами', 'por favor contáctenos', 'lütfen bizimle iletişime geçin'),
(441, '_reached_max_limit', 'You have reached your maximum upload limit', 'You have reached your maximum upload limit', 'لقد وصلت إلى الحد الأقصى للتحميل', 'U heeft uw maximale uploadlimiet bereikt', 'Vous avez atteint votre limite de téléchargement maximale', 'Sie haben Ihr maximales Upload-Limit erreicht', 'Вы достигли максимального ограничения загрузки', 'Has alcanzado tu límite máximo de subida.', 'Maksimum yükleme sınırınıza ulaştınız'),
(442, 'upload_up', 'Upload up to', 'Upload up to', 'تحميل حتى', 'Upload tot', 'Télécharger jusqu\'à', 'Laden Sie bis zu', 'Загрузить до', 'Subir hasta', 'Kadar yükle'),
(443, 'upload_up_no_limit', 'Upload unlimited videos', 'Upload unlimited videos', 'تحميل مقاطع فيديو غير محدودة', 'Upload onbeperkt video\'s', 'Télécharger des vidéos illimitées', 'Lade unbegrenzt Videos hoch', 'Загружайте неограниченное количество видео', 'Subir videos ilimitados', 'Sınırsız video yükle'),
(444, 'two_factor', 'Two-factor authentication', 'Two-factor authentication', 'توثيق ذو عاملين', 'Twee-factor-authenticatie', 'Authentification à deux facteurs', 'Zwei-Faktor-Authentifizierung', 'Двухфакторная аутентификация', 'Autenticación de dos factores', 'İki faktörlü kimlik doğrulama'),
(445, 'disable', 'Disable', 'Disable', 'تعطيل', 'onbruikbaar maken', 'Désactiver', 'Deaktivieren', 'запрещать', 'Inhabilitar', 'Devre dışı'),
(446, 'enable', 'Enable', 'Enable', 'مكن', 'in staat stellen', 'Activer', 'Aktivieren', 'включить', 'Habilitar', 'etkinleştirme'),
(447, 'sent_two_factor_email', 'We have sent you the confirmation code to your email address.', 'We have sent you the confirmation code to your email address.', 'لقد أرسلنا إليك رمز التأكيد إلى عنوان بريدك الإلكتروني.', 'We hebben je de bevestigingscode gestuurd naar je e-mailadres.', 'Nous vous avons envoyé le code de confirmation à votre adresse e-mail.', 'Wir haben Ihnen den Bestätigungscode an Ihre E-Mail-Adresse gesendet.', 'Мы отправили вам код подтверждения на ваш адрес электронной почты.', 'Le hemos enviado el código de confirmación a su dirección de correo electrónico.', 'Size e-posta adresinize onay kodunu gönderdik.'),
(448, 'confirm_code', 'Confirmation Code', 'Confirmation Code', 'تأكيد الكود', 'Bevestigingscode', 'Code de confirmation', 'Bestätigungscode', 'Код для подтверждения', 'Código de confirmación', 'Onay kodu'),
(449, 'wrong_confirm_code', 'Wrong confirmation code', 'Wrong confirmation code', 'رمز تأكيد خطأ', 'Foutieve bevestigingscode', 'Mauvais code de confirmation', 'Falscher Bestätigungscode', 'Неверный код подтверждения', 'Código de confirmación incorrecto', 'Yanlış onay kodu'),
(450, 'two_factor_description', 'Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your passw', 'Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your password and a 6-digit security code sent to your email to log in.', 'قم بتشغيل تسجيل الدخول المكوَّن من خطوتين لتحسين مستوى أمان حسابك ، وبمجرد تشغيله ، ستستخدم كل من كلمة المرور ورمز الحماية المكون من 6 أرقام والمرسلين إلى بريدك الإلكتروني لتسجيل الدخول.', 'Schakel login in 2 stappen in om de beveiliging van uw account te verbeteren. Als u eenmaal bent ingeschakeld, gebruikt u zowel uw wachtwoord als een uit 6 cijfers bestaande beveiligingscode die naar uw e-mailadres is gestuurd om u aan te melden.', 'Activez la connexion en deux étapes pour renforcer la sécurité de votre compte. Une fois activé, vous utiliserez votre mot de passe et un code de sécurité à 6 chiffres envoyé à votre adresse e-mail pour vous connecter.', 'Aktivieren Sie die Anmeldung in zwei Schritten, um die Sicherheit Ihres Kontos zu erhöhen. Nach dem Einschalten verwenden Sie sowohl Ihr Passwort als auch einen 6-stelligen Sicherheitscode, der an Ihre E-Mail gesendet wird, um sich anzumelden.', 'Включите двухэтапную регистрацию, чтобы повысить уровень безопасности своей учетной записи. После включения вы будете использовать для входа в свой пароль и 6-значный код безопасности, отправленный на вашу электронную почту.', 'Active el inicio de sesión en dos pasos para aumentar la seguridad de su cuenta. Una vez que lo haya activado, utilizará su contraseña y un código de seguridad de 6 dígitos enviado a su correo electrónico para iniciar sesión.', 'Hesabınızın güvenliğini artırmak için 2 adımlı giriş özelliğini açın. Açıldıktan sonra, giriş yapmak için e-postanıza gönderilen şifrenizi ve 6 basamaklı bir güvenlik kodunu kullanacaksınız.'),
(451, 'upload_date', 'Upload Date', 'Upload Date', 'تاريخ الرفع', 'Upload datum', 'Date de dépôt', 'Hochladedatum', 'Дата загрузки', 'Fecha de carga', 'Yükleme tarihi'),
(452, 'last_hour', 'Last hour', 'Last hour', 'الساعة الأخيرة', 'Laatste uur', 'Dernière heure', 'Letzte Stunde', 'Последний час', 'Ultima hora', 'Son saat'),
(453, 'today', 'Today', 'Today', 'اليوم', 'Vandaag', 'Aujourd\'hui', 'Heute', 'сегодня', 'Hoy', 'Bugün'),
(454, 'this_week', 'This week', 'This week', 'هذا الاسبوع', 'Deze week', 'Cette semaine', 'Diese Woche', 'На этой неделе', 'Esta semana', 'Bu hafta'),
(455, 'this_month', 'This month', 'This month', 'هذا الشهر', 'Deze maand', 'Ce mois-ci', 'Diesen Monat', 'Этот месяц', 'Este mes', 'Bu ay'),
(456, 'this_year', 'This year', 'This year', 'هذا العام', 'Dit jaar', 'Cette année', 'Dieses Jahr', 'В этом году', 'Este año', 'Bu yıl'),
(457, 'video_studio', 'Video Studio', 'Video Studio', 'فيديو ستوديو', 'Video Studio', 'Studio vidéo', 'Videostudio', 'Видеостудия', 'Estudio de video', 'Video Stüdyosu'),
(458, 'view_analytics', 'View Analytics', 'View Analytics', 'عرض التحليلات', 'Bekijk Analytics', 'Voir Analytics', 'Analytics anzeigen', 'Просмотр аналитики', 'Ver Analytics', 'Analytics\'i görüntüle'),
(459, 'likes', 'Likes', 'Likes', 'الإعجابات', 'sympathieën', 'Aime', 'Likes', 'Нравится', 'Gustos', 'Seviyor'),
(460, 'dislikes', 'Dislikes', 'Dislikes', 'يكره', 'Houdt niet van', 'N\'aime pas', 'Abneigungen', 'Не нравится', 'Aversiones', 'Beğenmeme'),
(461, 'video_analytics', 'Video Analytics', 'Video Analytics', 'تحليلات الفيديو', 'Video Analytics', 'Analyse vidéo', 'Video Analytics', 'Видео Аналитика', 'Video Analytics', 'Video Analizi'),
(462, 'total_likes', 'Total Likes', 'Total Likes', 'مجموع يحب', 'Totaal houdt van', 'Total de J\'aime', 'Likes insgesamt', 'Всего лайков', 'Me gusta en total', 'Toplam Beğeniler'),
(463, 'total_dislikes', 'Total Dislikes', 'Total Dislikes', 'مجموع يكره', 'Totaal houdt niet van', 'Total n\'aime pas', 'Total Abneigungen', 'Всего не нравится', 'Aversiones totales', 'Toplam Sevmediğim'),
(464, 'total_views', 'Total Views', 'Total Views', 'عدد المشاهدات', 'Totaal aantal weergaven', 'Vues totales', 'Gesamtansichten', 'Всего просмотров', 'Vistas totales', 'Toplam görüntülenme'),
(465, 'view_report', 'View report', 'View report', 'عرض التقرير', 'Bekijk rapport', 'Voir le rapport', 'Zeige Bericht', 'Посмотреть отчет', 'Vista del informe', 'Raporu görüntüle'),
(466, 'dashboard', 'Dashboard', 'Dashboard', 'لوحة القيادة', 'Dashboard', 'Tableau de bord', 'Instrumententafel', 'Приборная доска', 'Tablero', 'gösterge paneli'),
(467, 'latest_comments', 'Latest Comments', 'Latest Comments', 'أحدث تعليقات', 'laatste Reacties', 'Derniers Commentaires', 'neueste Kommentare', 'Последние комментарии', 'últimos comentarios', 'son Yorumlar'),
(468, 'total_comments', 'Total Comments', 'Total Comments', 'مجموع التعليقات', 'Totaal commentaar', 'Total des commentaires', 'Kommentare insgesamt', 'Всего комментариев', 'Total de comentarios', 'Toplam Yorumlar'),
(469, 'total_comments_today', 'Comments Today', 'Comments Today', 'مجموع التعليقات اليوم', 'Totaal aantal reacties vandaag', 'Total des commentaires aujourd\'hui', 'Kommentare heute insgesamt', 'Всего комментариев сегодня', 'Total de comentarios hoy', 'Bugün Toplam Yorum'),
(470, 'total_comments_month', 'Comments This Month', 'Comments This Month', 'مجموع التعليقات هذا الشهر', 'Totaal aantal reacties deze maand', 'Total des commentaires ce mois-ci', 'Kommentare insgesamt in diesem Monat', 'Всего комментариев в этом месяце', 'Total de comentarios este mes', 'Bu Ayın Toplam Yorumu'),
(471, 'total_comments_year', 'Comments This Year', 'Comments This Year', 'مجموع التعليقات هذا العام', 'Totaal aantal reacties dit jaar', 'Total des commentaires cette année', 'Kommentare insgesamt in diesem Jahr', 'Всего комментариев в этом году', 'Total de comentarios de este año', 'Bu Yanda Toplam Yorum'),
(472, 'edit_comment', 'Edit Comment', 'Edit Comment', 'تعديل التعليق', 'Commentaar bewerken', 'Modifier le commentaire', 'Kommentar bearbeiten', 'Редактировать комментарий', 'Editar comentario', 'Yorumu Düzenle'),
(473, 'channel_analytics', 'Channel Analytics', 'Channel Analytics', 'تحليلات القناة', 'Kanaalanalyses', 'Analyse de canal', 'Channel Analytics', 'Канальная аналитика', 'Analítica de canales', 'Kanal Analizi'),
(474, 'total_sub', 'Total Subscribers', 'Total Subscribers', 'مجموع المشتركين', 'Totaal aantal abonnees', 'Nombre total d\'abonnés', 'Abonnenten insgesamt', 'Всего подписчиков', 'Total de suscriptores', 'Toplam Aboneler'),
(475, 'the_most_viewed', 'Most Viewed Videos', 'Most Viewed Videos', 'معظم الفيديوهات التي تمت مشاهدتها', 'Meest bekeken video\'s', 'Vidéos les plus visionnées', 'Meistgesehene Videos', 'Самые популярные видео', 'Videos más vistos', 'En Çok İzlenen Videolar'),
(476, 'the_most_liked', 'Most Liked Videos', 'Most Liked Videos', 'أحب معظم الفيديوهات', 'Meest populaire video\'s', 'Vidéos les plus appréciées', 'Meistgeliebte Videos', 'Самые популярные видео', 'Videos que mas me gustaron', 'En Çok İzlenen Videolar'),
(477, 'the_most_disliked', 'Most Disliked Videos', 'Most Disliked Videos', 'مقاطع الفيديو الأكثر إعجابًا', 'Meest gehate video\'s', 'Vidéos les plus détestées', 'Beliebteste Videos', 'Самые популярные видео', 'Los videos más disgustados', 'En Beğenilmeyen Videolar'),
(478, 'the_most_commented', 'Most Commented Videos', 'Most Commented Videos', 'مقاطع الفيديو الأكثر تعليقًا', 'De meeste video\'s met commentaar', 'Vidéos les plus commentées', 'Meist kommentierte Videos', 'Самые комментируемые видео', 'Videos más comentados', 'En Çok Yorumlanan Videolar'),
(479, 'last_month', 'This month compared to last month', 'This month compared to last month', 'الشهر الماضي', 'Vorige maand', 'Le mois dernier', 'Im vergangenen Monat', 'Прошлый месяц', 'El mes pasado', 'Geçen ay'),
(480, 'subscribers', 'Subscribers', 'Subscribers', 'مشتركين', 'abonnees', 'Les abonnés', 'Abonnenten', 'Подписчики', 'Suscriptores', 'Aboneler'),
(481, 'total_earn', 'Total Earnings', 'Total Earnings', 'الأرباح الكلية', 'totale winst', 'Total des gains', 'Gesamteinnahmen', 'Общий доход', 'Ganancias Totales', 'toplam kazanç'),
(482, 'earnings', 'Earnings', 'Earnings', 'أرباح', 'verdiensten', 'Gains', 'Verdienste', 'прибыль', 'Ganancias', 'Kazanç'),
(483, 'ur_video_queue', 'Your video is being added to queue, please check back in few minutes.', 'Your video is being added to queue, please check back in few minutes.', 'تتم إضافة الفيديو الخاص بك إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Je video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Votre vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier dans quelques minutes.', 'Ihr Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Ваше видео добавляется в очередь, пожалуйста, проверьте его через несколько минут.', 'Su video se está agregando a la cola, por favor, vuelva en unos minutos.', 'Videonuz sıraya ekleniyor, lütfen birkaç dakika içinde tekrar kontrol edin.'),
(484, 'this_video_queue', 'This video is being added to queue, please check back in few minutes.', 'This video is being added to queue, please check back in few minutes.', 'تتم إضافة هذا الفيديو إلى قائمة الانتظار ، يرجى التحقق مرة أخرى في غضون بضع دقائق.', 'Deze video wordt aan de wachtrij toegevoegd. Probeer het over enkele minuten opnieuw.', 'Cette vidéo est en train d\'être ajoutée à la file d\'attente. Veuillez vérifier à nouveau dans quelques minutes.', 'Dieses Video wird zur Warteschlange hinzugefügt. Bitte versuchen Sie es in wenigen Minuten noch einmal.', 'Это видео добавляется в очередь, пожалуйста, зайдите через несколько минут.', 'Este video se está agregando a la cola, por favor revise de nuevo en unos minutos.', 'Bu video kuyruğa ekleniyor, lütfen birkaç dakika içinde tekrar kontrol edin.'),
(485, 'sort_by', 'Sort By', 'Sort By', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Сортировать по', 'Ordenar por', 'Göre sırala'),
(486, 'assign_to_user', 'Assign To User', 'Assign To User', 'تعيين للمستخدم', 'Toewijzen aan gebruiker', 'Assigner à l\'utilisateur', 'Einem Benutzer zuweisen', 'Назначить пользователю', 'Asignar a usuario', 'Kullanıcıya Atama'),
(487, 'user_not_exists', 'User is not exist', 'User is not exist', 'المستخدم غير موجود', 'Gebruiker bestaat niet', 'L\'utilisateur n\'est pas exister', 'Benutzer ist nicht vorhanden', 'Пользователь не существует', 'El usuario no existe', 'Kullanıcı mevcut değil'),
(488, 'popular_channels', 'Popular Channels', 'Popular Channels', 'القنوات الشعبية', 'Populaire kanalen', 'Chaînes populaires', 'Beliebte Kanäle', 'Популярные каналы', 'Canales populares', 'Popüler Kanallar'),
(489, 'no_more_channels_to_show', 'No more channels to show', 'No more channels to show', 'لا مزيد من القنوات لإظهارها', 'Geen kanalen meer om te laten zien', 'Plus de chaînes à montrer', 'Keine Kanäle mehr zu zeigen', 'Нет больше каналов для показа', 'No hay más canales para mostrar.', 'Gösterilecek başka kanal yok'),
(490, 'no_channels_found_for_now', 'No channels found', 'No channels found', 'لم يتم العثور على قنوات', 'Geen kanalen gevonden', 'Aucune chaîne trouvée', 'Keine Channels gefunden', 'Каналы не найдены', 'No se encontraron canales', 'Kanal bulunamadı'),
(491, 'filter_by', 'Filter By', 'Filter By', 'مصنف بواسطة', 'Filteren op', 'Filtrer par', 'Filtern nach', 'Сортировать по', 'Filtrado por', 'Tarafından filtre'),
(492, 'sub_category', 'Sub Category', 'Sub Category', 'الفئة الفرعية', 'Subcategorie', 'Sous catégorie', 'Unterkategorie', 'Подкатегория', 'Subcategoría', 'Alt Kategori'),
(493, 'none', 'None', 'None', 'لا شيء', 'Geen', 'Aucun', 'Keiner', 'Никто', 'Ninguna', 'Yok'),
(494, 'all', 'All', 'All', 'الكل', 'Allemaal', 'Tout', 'Alles', 'Все', 'Todos', 'Herşey'),
(495, 'video_not_available_location', 'This video is not available in your location.', 'This video is not available in your location.', 'هذا الفيديو غير متوفر في موقعك.', 'Deze video is niet beschikbaar op jouw locatie.', 'Cette vidéo n\'est pas disponible dans votre région.', 'Dieses Video ist an Ihrem Standort nicht verfügbar.', 'Это видео недоступно в вашем регионе.', 'Este video no está disponible en tu ubicación.', 'Bu video bulunduğunuz yerde mevcut değil.'),
(496, 'geo_blocking', 'Geo Blocking', 'Geo Blocking', 'جيو الحظر', 'Geo-blokkering', 'Blocage géographique', 'Geo-Blocking', 'Geo Blocking', 'Bloqueo geográfico', 'Coğrafi Engelleme'),
(497, 'unknown_location', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.', 'موقعك غير معروف ، لذا تم حظر هذا الفيديو.يجوز لك إعادة المحاولة لاحقًا.', 'Uw locatie is onbekend, dus deze video is geblokkeerd. kunt het later opnieuw proberen.', 'Votre position est inconnue, cette vidéo a donc été bloquée. Vous pouvez réessayer plus tard.', 'Ihr Standort ist unbekannt, daher wurde dieses Video gesperrt. Sie können es später erneut versuchen.', 'Ваше местоположение неизвестно, поэтому это видео было заблокировано. Вы можете попробовать позже.', 'Su ubicación es desconocida, por lo que este video fue bloqueado. Puedes intentarlo más tarde.', 'Konumunuz bilinmiyor, bu nedenle bu video engellendi. Daha sonra tekrar deneyebilirsiniz.'),
(498, 'ads_earnings', 'Ads Earnings', 'Ads Earnings', 'أرباح الإعلانات', 'Inkomsten uit advertenties', 'Revenu des annonces', 'Werbeeinnahmen', 'Доходы от рекламы', 'Ganancias de los anuncios', 'Reklam Kazançları'),
(499, 'videos_earnings', 'Video Earnings', 'Video Earnings', 'أرباح الفيديو', 'Video-inkomsten', 'Vidéos Gains', 'Videos Einnahmen', 'Видео Заработок', 'Videos de ganancias', 'Videolar Kazançları'),
(500, 'sales_earnings', 'Sales Earning', 'Sales Earning', 'كسب المبيعات', 'Verkoop verdienen', 'Ventes', 'Verkäufe verdienen', 'Доход от продаж', 'Ventas ganando', 'Satış Kazançları'),
(501, 'ads_analytics', 'Ads Analytics', 'Ads Analytics', 'تحليلات الإعلانات', 'Analytics voor advertenties', 'Analyse des annonces', 'Anzeigenanalysen', 'Рекламная аналитика', 'Ads Analytics', 'Reklam Analizi'),
(502, 'all_time', 'All Time', 'All Time', 'كل الوقت', 'Altijd', 'Tout le temps', 'Alle zeit', 'Все время', 'Todo el tiempo', 'Her zaman'),
(503, 'analytics', 'Analytics', 'Analytics', 'تحليلات', 'Analytics', 'Analytique', 'Analytics', 'аналитика', 'Analítica', 'analitik'),
(504, '1', 'category', 'Film & Animation', 'فيلم والرسوم المتحركة', 'Film & Animatie', 'Film et animation', 'Film & Animation', 'Фильм и анимация', 'Cine y Animación', 'Film ve Animasyon'),
(505, '3', 'category', 'Music', 'موسيقى', 'Muziek', 'La musique', 'Musik', 'Музыка', 'Música', 'Müzik'),
(506, '4', 'category', 'Pets & Animals', 'الحيوانات الأليفة الحيوانات', 'Huisdieren en dieren', 'Animaux et animaux', 'Haustiere und Tiere', 'Домашние животные', 'Animales de compañía', 'Hayvanlar ve Hayvanlar'),
(507, '5', 'category', 'Sports', 'رياضات', 'Sport', 'Des sports', 'Sport', 'Виды спорта', 'Deportes', 'Spor Dalları'),
(508, '6', 'category', 'Travel & Events', 'السفر والأحداث', 'Reizen & Evenementen', 'Voyages et événements', 'Reise & Veranstaltungen', 'Путешествия и события', 'Viajes y Eventos', 'Seyahat ve Etkinlikler'),
(509, '7', 'category', 'Gaming', 'الألعاب', 'gaming', 'Gaming', 'Spiel', 'азартные игры', 'Juego de azar', 'kumar'),
(510, '8', 'category', 'People & Blogs', 'الناس والمدونات', 'Mensen & blogs', 'Personnes et Blogs', 'Leute & Blogs', 'Люди и блоги', 'Personas y blogs', 'Kişiler ve Bloglar'),
(511, '9', 'category', 'Comedy', 'كوميديا', 'Komedie', 'Comédie', 'Komödie', 'комедия', 'Comedia', 'Komedi'),
(512, '10', 'category', 'Entertainment', 'وسائل الترفيه', 'vermaak', 'Divertissement', 'Unterhaltung', 'Развлекательная программа', 'Entretenimiento', 'Eğlence'),
(513, '11', 'category', 'News & Politics', 'الأخبار والسياسة', 'Nieuws & Politiek', 'Nouvelles et politique', 'Nachrichten & Politik', 'Новости и политика', 'Noticias y Política', 'Haberler ve Politika'),
(514, '12', 'category', 'How-to & Style', 'كيف تصمم', 'How-To & Style', 'Comment styliser', 'How-To & Style', 'How-to & Style', 'Cómo hacer y estilo', 'Nasıl Yapılır ve Stil'),
(515, '13', 'category', 'Non-profits & Activism', 'غير الربحية والنشاط', 'Non-profit & Activisme', 'Organismes à but non lucratif et activisme', 'Non-Profits & Aktivismus', 'Неприбыль и активизм', 'Sin fines de lucro y activismo', 'Kâr amacı gütmeyenler & Aktivizm');

-- --------------------------------------------------------

--
-- Table structure for table `likes_dislikes`
--

CREATE TABLE `likes_dislikes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `id` int(11) NOT NULL,
  `list_id` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `privacy` int(11) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(3000) NOT NULL DEFAULT '',
  `time` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seen` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `from_deleted` int(11) NOT NULL DEFAULT '0',
  `to_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `text` text,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(200) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT '0',
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
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_fields`
--

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `options` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` text COLLATE utf8_unicode_ci,
  `length` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT '0',
  `profile_page` int(11) NOT NULL DEFAULT '0',
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
  `text` text,
  `tags` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `shared` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_res` varchar(20) NOT NULL DEFAULT '',
  `processing` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `video_id` int(15) NOT NULL DEFAULT '0',
  `article_id` int(15) NOT NULL DEFAULT '0',
  `ad_id` int(15) NOT NULL DEFAULT '0',
  `comment_id` int(20) NOT NULL DEFAULT '0',
  `reply_id` int(25) NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `time` varchar(50) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_videos`
--

CREATE TABLE `saved_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_ads`
--

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active` int(11) NOT NULL DEFAULT '0'
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
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `type` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
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
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
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
  `country_id` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `about` text COLLATE utf8_unicode_ci,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '0',
  `verified` int(11) NOT NULL DEFAULT '0',
  `last_active` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `is_pro` int(11) NOT NULL DEFAULT '0',
  `imports` int(11) NOT NULL DEFAULT '0',
  `uploads` int(11) NOT NULL DEFAULT '0',
  `wallet` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `balance` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `video_mon` int(10) NOT NULL DEFAULT '0',
  `age_changed` int(11) NOT NULL DEFAULT '0',
  `donation_paypal_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_upload_limit` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `two_factor` int(11) NOT NULL DEFAULT '0',
  `last_month` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `user_ads`
--

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT '0',
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `audience` text,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usr_prof_fields`
--

CREATE TABLE `usr_prof_fields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `fid_2` varchar(32) NOT NULL DEFAULT '',
  `fid_3` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `verification_requests`
--

CREATE TABLE `verification_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `message` text,
  `media_file` text,
  `time` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `short_id` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `thumbnail` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/thumbnail.jpg',
  `video_location` varchar(3000) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `youtube` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `vimeo` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `daily` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(100) NOT NULL DEFAULT '',
  `twitch` varchar(100) NOT NULL DEFAULT '',
  `twitch_type` varchar(50) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '0',
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `duration` varchar(33) CHARACTER SET latin1 NOT NULL DEFAULT '00:00',
  `size` int(50) NOT NULL DEFAULT '0',
  `converted` int(5) NOT NULL DEFAULT '1',
  `category_id` varchar(100) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `privacy` int(11) NOT NULL DEFAULT '0',
  `age_restriction` int(11) NOT NULL DEFAULT '1',
  `type` varchar(100) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT '1',
  `240p` int(11) NOT NULL DEFAULT '0',
  `360p` int(11) NOT NULL DEFAULT '0',
  `480p` int(11) NOT NULL DEFAULT '0',
  `720p` int(11) NOT NULL DEFAULT '0',
  `1080p` int(11) NOT NULL DEFAULT '0',
  `2048p` int(11) NOT NULL DEFAULT '0',
  `4096p` int(11) NOT NULL DEFAULT '0',
  `sell_video` int(11) NOT NULL DEFAULT '0',
  `sub_category` varchar(100) NOT NULL DEFAULT '',
  `geo_blocking` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `videos_transactions`
--

CREATE TABLE `videos_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `paid_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
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
  `skip_seconds` int(11) NOT NULL DEFAULT '0',
  `vast_type` varchar(30) NOT NULL DEFAULT '',
  `vast_xml_link` varchar(700) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `fingerprint` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watch_later`
--

CREATE TABLE `watch_later` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(30) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT '0'
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comm_replies`
--
ALTER TABLE `comm_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=517;
--
-- AUTO_INCREMENT for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `play_list`
--
ALTER TABLE `play_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile_fields`
--
ALTER TABLE `profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pt_posts`
--
ALTER TABLE `pt_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `saved_videos`
--
ALTER TABLE `saved_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site_ads`
--
ALTER TABLE `site_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_ads`
--
ALTER TABLE `user_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `watch_later`
--
ALTER TABLE `watch_later`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
