-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 05 Ιουν 2020 στις 22:52:21
-- Έκδοση διακομιστή: 10.4.8-MariaDB
-- Έκδοση PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `eshop`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `address_reciever` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_postal_code` mediumint(9) NOT NULL,
  `address_country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_phone` bigint(20) NOT NULL,
  `address_mobile` bigint(20) NOT NULL,
  `address_notes` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `addresses`
--

INSERT INTO `addresses` (`address_id`, `address_reciever`, `address_name`, `address_city`, `address_postal_code`, `address_country`, `address_phone`, `address_mobile`, `address_notes`) VALUES
(1, 'Βενιζέλου 52', 'Βενιζέλου 52', 'Θεσσαλονίκη', 56728, 'Ελλάδα', 2310569878, 6985477852, ''),
(2, 'Τσιμισκή 23', 'Τσιμισκή 23', 'Θεσσαλονίκη', 56458, 'Ελλάδα', 2310569876, 6987524825, ''),
(3, 'Καπαδοκίας 52', 'Καπαδοκίας 52', 'Αθήνα', 10444, 'Ελλάδα', 2105316368, 6984726685, ''),
(4, 'Σπύρου Κυπριανού 83-85', 'Σπύρου Κυπριανού 83-85', 'Λάρνακα', 0, 'Κύπρος', 35724828872, 0, '');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `basket`
--

CREATE TABLE `basket` (
  `basket_id` int(11) NOT NULL,
  `basket_user_id` int(11) NOT NULL,
  `basket_product_id` int(11) NOT NULL,
  `basket_timestamp` datetime NOT NULL,
  `basket_quantity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `basket`
--

INSERT INTO `basket` (`basket_id`, `basket_user_id`, `basket_product_id`, `basket_timestamp`, `basket_quantity`) VALUES
(0, 0, 0, '0000-00-00 00:00:00', 126);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_photo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_short` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_alias`, `category_photo`, `category_description`, `category_short`) VALUES
(1, 'Collection', 'collection', '', 'collection', 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city_country_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `city_country_id`) VALUES
(1, 'Θεσσαλονίκη', 1),
(2, 'Αθήνα', 1),
(3, 'Λάρνακα', 2),
(4, 'Βερολίνο', 4),
(5, 'Μιλάνο', 3),
(6, 'Λονδίνο', 5),
(7, 'Τρίπολη ', 1),
(8, 'Καρδίτσα', 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_flag` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_flag`) VALUES
(1, 'Ελλάδα', 'http://icons.iconarchive.com/icons/custom-icon-design/flat-europe-flag/128/Greece-icon.png'),
(2, 'Κύπρο', 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/128/Cyprus-Flag-icon.png'),
(3, 'Ιταλία', 'https://icons.iconarchive.com/icons/wikipedia/flags/256/IT-Italy-Flag-icon.png'),
(4, 'Γερμανία', 'http://icons.iconarchive.com/icons/custom-icon-design/flat-europe-flag/128/Germany-icon.png'),
(5, 'Αγγλία', 'http://icons.iconarchive.com/icons/wikipedia/flags/128/GB-United-Kingdom-Flag-icon.png'),
(6, 'Γαλλία', 'http://icons.iconarchive.com/icons/custom-icon-design/all-country-flag/128/France-Flag-icon.png');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` int(11) NOT NULL,
  `order_address_id` int(11) NOT NULL,
  `order_created_id` int(11) NOT NULL,
  `order_payment_method` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `order_price` float NOT NULL,
  `order_notes` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `order_products`
--

CREATE TABLE `order_products` (
  `op_id` int(11) NOT NULL,
  `op_order_id` int(11) NOT NULL,
  `op_product_id` int(11) NOT NULL,
  `op_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `order_status`
--

CREATE TABLE `order_status` (
  `status_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_datetime` datetime NOT NULL,
  `order_tracking_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_small_description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` float NOT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `product_sale` float NOT NULL,
  `product_photo_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_sku` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_alias`, `product_small_description`, `product_description`, `product_price`, `product_sub_category_id`, `product_sale`, `product_photo_url`, `product_quantity`, `product_sku`) VALUES
(1, 'Γραβάτα Κίτρινη Μονόχρωμη, Μετάξι 100%', 'kitrini', 'Μονόχρωμη, μεταξωτή γραβάτα σε εκθαμβωτικό κίτρινο χρώμα. Classy, άκρως ποιοτική και κατασκευασμένη από 100% μετάξι, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή της.\r\nHa', 'Μονόχρωμη, μεταξωτή γραβάτα σε εκθαμβωτικό κίτρινο χρώμα. Classy, άκρως ποιοτική και κατασκευασμένη από 100% μετάξι, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή της.\r\nHand-made in Italy.', 40, 1, 0, 'img/products/tie/tieyellow.jpg', 10, 'CHR_7789'),
(2, 'Γραβάτα γκρι απαλό με μπλε και λευκό καρό, Μετάξι 100%', 'gravata-gkri-apalo-mple-leuko-karo-metaksi', 'Γκρι απαλό, μεταξωτή γραβάτα με λευκό και μπλε καρό σχέδιο, φτιαγμένη από 100% μετάξι.Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHa', 'Γκρι απαλό, μεταξωτή γραβάτα με λευκό και μπλε καρό σχέδιο, φτιαγμένη από 100% μετάξι.Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy', 39, 1, 0, 'img/products/tie/tiegrey.jpg', 9, 'ATT0075'),
(3, 'Γραβάτα γκρι με κόκκινο, λευκό και μπλε καρό, Μετάξι 100%', 'gravata-gkri-kokkino-leuko-mple-karo-metaksi', 'Γκρι, μεταξωτή γραβάτα με λευκό, μπλε κόκκινο καρό σχέδιο, φτιαγμένη από 100% μετάξι.Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHan', 'Γκρι, μεταξωτή γραβάτα με λευκό, μπλε κόκκινο καρό σχέδιο, φτιαγμένη από 100% μετάξι.Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy', 39, 1, 0, 'img/products/tie/tiewhitegrey.jpg', 8, 'ATT0071'),
(4, 'Γραβάτα Γκρι με Λαχούρι, Μετάξι 100%', 'gravata-gkri-me-lahouri', 'Γκρι, μεταξωτή γραβάτα με λαχούρι, σε ιδιαίτερο και εκλεπτυσμένο pattern.Άκρως ποιοτική και κατασκευασμένη από 100% μετάξι, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή τ', 'Γκρι, μεταξωτή γραβάτα με λαχούρι, σε ιδιαίτερο και εκλεπτυσμένο pattern.Άκρως ποιοτική και κατασκευασμένη από 100% μετάξι, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή της.\r\nHand-made in Italy', 39, 1, 0, 'img/products/tie/tie4.jpg', 5, 'ATT0030'),
(5, 'Γραβάτα γκρι με λευκά – μπλε dots, Μετάξι 100%', 'gravata-gkri-leuka-mple-dots-metakswti', 'Μοντέρνα και φίνα, μεταξωτή γραβάτα γκρι με λευκά – μπλε σχέδια fantasy – dots, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φιν', 'Μοντέρνα και φίνα, μεταξωτή γραβάτα γκρι με λευκά – μπλε σχέδια fantasy – dots, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy.', 39, 1, 0, 'img/products/tie/tie-5.jpg', 5, 'ATT0033'),
(6, 'Γραβάτα κόκκινη με μπλε, λευκό και πράσινο, Μετάξι 100%', 'gravata-kokkini-mple-leuko-prasino-metaksi', 'Κόκκινη, μεταξωτή γραβάτα με λευκό μπλε και πράσινο καρό σχέδιο, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεί', 'Κόκκινη, μεταξωτή γραβάτα με λευκό μπλε και πράσινο καρό σχέδιο, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\n\r\nHand-made in Italy.', 39, 1, 0, 'img/products/tie/tie-6.jpg', 6, 'ATT0064'),
(7, 'Γραβάτα γκρι με λευκό fantasy, Μετάξι 100%', 'ties-grey-white-fantasy', 'Μεταξωτή γραβάτα, γκρι με λευκό fantasy, σε σαγηνευτικό pattern, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεί', 'Μεταξωτή γραβάτα, γκρι με λευκό fantasy, σε σαγηνευτικό pattern, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy.', 40, 1, 0, 'img/products/tie/tie-7.jpg', 2, 'CHR_7780'),
(8, 'Γραβάτα γκρι με λευκό κόκκινο και σιέλ καρό, Μετάξι 100%', 'gravata-gkri-leuko-kokkino-siel-karo-metaksi', 'Γκρι, μεταξωτή γραβάτα με λευκό κόκινο και σιέλ μπλε καρό σχέδιο, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητε', 'Γκρι, μεταξωτή γραβάτα με λευκό κόκινο και σιέλ μπλε καρό σχέδιο, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy.', 40, 1, 0, 'img/products/tie/tie-8.jpg', 11, 'ATT0072'),
(9, 'Γραβάτα γκρι με μπλε – λευκά dots, Μετάξι 100%', 'gravata-gkri-mple-leuka-dots-metakswti', 'Μεταξωτή γραβάτα, σε πουά σχέδιο και με αρμονικό συνδυασμό χρωμάτων: γκρι με λευκά – μπλε dots. Άκρως ποιοτική και μοντέρνα, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή ', 'Μεταξωτή γραβάτα, σε πουά σχέδιο και με αρμονικό συνδυασμό χρωμάτων: γκρι με λευκά – μπλε dots. Άκρως ποιοτική και μοντέρνα, κάθε γραβάτα της Andrew’s Ties προσδίδει απαράμιλλη φινέτσα στο ντύσιμό σας, χάρη στην κομψή γραμμή της και στην προσεγμένη ύφανσή της.\r\nHand-made in Italy.', 39, 1, 0, 'img/products/tie/tie-9.jpg', 7, 'ATT0031'),
(10, 'Γραβάτα γκρι με μπλε και λευκό fantasy, Μετάξι 100%', 'gravata-gkri-mple--dots-metakswti', 'Μεταξωτή γραβάτα, γκρι με λευκό και μπλε fantasy, σε σαγηνευτικό pattern, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα κ', 'Μεταξωτή γραβάτα, γκρι με λευκό και μπλε fantasy, σε σαγηνευτικό pattern, φτιαγμένη από 100% μετάξι. Με υψηλή ποιότητα, ιδιαίτερη απαλότητα στην αίσθηση και εκλεπτυσμένη ύφανση, κάθε γραβάτα της Andrew’s Ties χαρίζει στο style σας μοναδική κλάση, φινέτσα και γοητεία.\r\nHand-made in Italy.', 39, 1, 0, 'img/products/tie/tie-10.jpg', 0, 'ATT0036'),
(11, 'Τιράντες καφέ σκούρο με καφέ δέρμα', 'tirantes-kafe-skouro-kafe-derma', 'Τιράντες καφέ σκούρο με καφέ δέρμα', 'Τιράντες καφέ σκούρο με καφέ δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-1.jpg', 2, 'HR0176'),
(12, 'Τιράντες μαύρες με μαύρο δέρμα', 'tirantes-maures-mauro-derma', 'Τιράντες μαύρες με μαύρο δέρμα', 'Τιράντες μαύρες με μαύρο δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-2.jpg', 3, 'HR0187'),
(13, 'Τιράντες μπεζ – καφέ με καφέ δέρμα', 'tirantes-mpez-kafe-kafe-derma', 'Τιράντες μπεζ – καφέ με καφέ δέρμα', 'Τιράντες μπεζ – καφέ με καφέ δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-3.jpg', 5, 'HR0185'),
(14, 'Τιράντες μπεζ σκούρο με καφέ δέρμα\r\n', 'tirantes-mpez-skouro-kafe-derma', 'Τιράντες μπεζ σκούρο με καφέ δέρμα\r\n', 'Τιράντες μπεζ σκούρο με καφέ δέρμα\r\n', 65, 2, 0, 'img/products/tirantes/tirantes-4.jpg', 6, 'HR0182'),
(15, 'Τιράντες μπλε σκούρο με καφέ δέρμα', 'tirantes-mple-skouro-kafe-derma', 'Τιράντες μπλε σκούρο με καφέ δέρμα', 'Τιράντες μπλε σκούρο με καφέ δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-5.jpg', 4, 'HR0173'),
(16, 'Τιράντες μπλε σκούρο με μαύρο δέρμα', 'tirantes-mple-skoyro-mauro-derma', 'Τιράντες μπλε σκούρο με μαύρο δέρμα', 'Τιράντες μπλε σκούρο με μαύρο δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-6.jpg', 2, 'HR0171'),
(17, 'Τιράντες μπορντό με λευκές ρίγες και μαύρο δέρμα', 'tirantes-mpornto-leukes-riges-mauro-derma', 'Τιράντες μπορντό με λευκές ρίγες και μαύρο δέρμα', 'Τιράντες μπορντό με λευκές ρίγες και μαύρο δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-7.jpg', 7, 'HR0179'),
(18, 'Τιράντες κόκκινες με μαύρο δέρμα', 'tirantes-kokkines-mauro-derma', 'Τιράντες κόκκινες με μαύρο δέρμα', 'Τιράντες κόκκινες με μαύρο δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-8.jpg', 1, 'HR0184'),
(19, 'Τιράντες μπορντό με μαύρο δέρμα', 'tirantes-mpornto-mauro-derma', 'Τιράντες μπορντό με μαύρο δέρμα', 'Τιράντες μπορντό με μαύρο δέρμα', 65, 2, 0, 'img/products/tirantes/tirantes-9.jpg', 4, 'HR0183'),
(20, 'Pochette βυσσινί μονόχρωμο, Μετάξι 100%', 'pochette-vissini-monoxromo-metakswto', 'Μεταξωτό pochette μονόχρωμο, σε βυσσινί απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made i', 'Μεταξωτό pochette μονόχρωμο, σε βυσσινί απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette1.jpg', 6, 'ATP0025'),
(21, 'Pochette γκρί μονόχρωμο, Μετάξι 100%', 'pochette-gkri-monoxromo-metaksoto', 'Μεταξωτό pochette μονόχρωμο, σε γκρί ανοιχτό τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made ', 'Μεταξωτό pochette μονόχρωμο, σε γκρί ανοιχτό τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette2.jpg', 4, 'ATP0005'),
(22, 'Pochette γκρι σκούρο μονόχρωμο, Μετάξι 100%', 'pochette-gkri-skouro-monoxromo-metakswto', 'Μεταξωτό pochette μονόχρωμο, σε γκρι απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in I', 'Μεταξωτό pochette μονόχρωμο, σε γκρι απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette3.jpg', 3, 'ATP0013'),
(23, 'Pochette Γκρι-Μαύρο με Λαχούρι, Μετάξι 100%', 'manthli-pochette-gkri-mauro', 'Μεταξωτό pochette με λαχούρι, σε χρώμα γκρι με μαύρο. Με εγγυημένα υψηλή ποιότητα και κατασκευασμένο από 100% μετάξι, το pochette της Andrew’s Ties υπόσχεται να ανανεώσει μοναδικά το look σας με το elegance και το άκρως γοητευτικό μοτίβο του.\r\nHand-made in', 'Μεταξωτό pochette με λαχούρι, σε χρώμα γκρι με μαύρο. Με εγγυημένα υψηλή ποιότητα και κατασκευασμένο από 100% μετάξι, το pochette της Andrew’s Ties υπόσχεται να ανανεώσει μοναδικά το look σας με το elegance και το άκρως γοητευτικό μοτίβο του.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette4.jpg', 8, 'ATP0028'),
(24, 'Pochette καφέ με μπλε fantasy, Μετάξι 100%', 'pochette-kafe-mple-fantasy-metakswto', 'Stylish και φίνο, μεταξωτό pochette, καφέ με μπλε – σιέλ σχέδια fantasy. Με εγγυημένα υψηλή ποιότητα και σαγηνευτική απαλότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν τέλεια την ιταλική κουλτούρα και τη μεσογειακή κομψότητα, αναβαθμίζοντας το', 'Stylish και φίνο, μεταξωτό pochette, καφέ με μπλε – σιέλ σχέδια fantasy. Με εγγυημένα υψηλή ποιότητα και σαγηνευτική απαλότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν τέλεια την ιταλική κουλτούρα και τη μεσογειακή κομψότητα, αναβαθμίζοντας το look σας.\r\nHand-made in Italy', 33, 3, 0, 'img/products/pochette/pochette5.jpg', 4, 'ATP0064'),
(25, 'Pochette καφέ μονόχρωμο, Μετάξι 100%', 'pochette-kafe-monoxromo-metaskwto', 'Μεταξωτό pochette μονόχρωμο, σε καφέ απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in I', 'Μεταξωτό pochette μονόχρωμο, σε καφέ απόχρωση. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette6.jpg', 2, 'ATP0016'),
(26, 'Pochette κίτρινο – πορτοκαλί μονόχρωμο, Μετάξι 100%', 'pochette-kitrino-portokali-monoxromo-metaksi', 'Μεταξωτό pochette μονόχρωμο, σε κίτρινο – μουσταρδί τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHan', 'Μεταξωτό pochette μονόχρωμο, σε κίτρινο – μουσταρδί τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette7.jpg', 5, 'ATP0017'),
(27, 'Pochette Κίτρινο Απαλό Μονόχρωμο, Μετάξι 100%', 'pochette-kitrino-monoxrwmo', 'Μεταξωτό pochette μονόχρωμο, σε κίτρινο ανοιχτό τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-ma', 'Μεταξωτό pochette μονόχρωμο, σε κίτρινο ανοιχτό τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette8.jpg', 4, 'ATP0003'),
(28, 'Pochette Κόκκινο Fantasy, Μετάξι 100%', 'manthli-pochette-kokkino', 'Μεταξωτό pochette με φλογερό κόκκινο χρώμα, σε άκρως εντυπωσιακό fantasy μοτίβο. Με εγγυημένα υψηλή ποιότητα και 100% μετάξι, κάθε pochette της Andrew’s Ties υπόσχεται να ανανεώσει μοναδικά το look σας με το elegance και τον άκρως γοητευτικό, ευρωπαϊκό αέρ', 'Μεταξωτό pochette με φλογερό κόκκινο χρώμα, σε άκρως εντυπωσιακό fantasy μοτίβο. Με εγγυημένα υψηλή ποιότητα και 100% μετάξι, κάθε pochette της Andrew’s Ties υπόσχεται να ανανεώσει μοναδικά το look σας με το elegance και τον άκρως γοητευτικό, ευρωπαϊκό αέρα του.\r\nHand-made in Italy', 29, 3, 0, 'img/products/pochette/pochette9.jpg', 5, 'ATP0108'),
(29, 'Pochette μαύρο μονόχρωμο, Μετάξι 100%', 'pochette-mavro-monoxromo', 'Μεταξωτό pochette μονόχρωμο, σε μαύρο τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Ital', 'Μεταξωτό pochette μονόχρωμο, σε μαύρο τόνο. Φτιαγμένα από 100% μετάξι και με εγγυημένα υψηλή ποιότητα, τα μαντήλια για το πέτο της Andrew’s Ties συνδυάζουν άψογα τη μεσογειακή κουλτούρα και το ιταλικό elegance, απογειώνοντας το στιλ σας.\r\nHand-made in Italy.', 29, 3, 0, 'img/products/pochette/pochette10.jpg', 1, 'ATP0014'),
(30, 'Παπιγιόν κεραμιδί με μπλε dots, Μετάξι 100%', 'papigion-keramidi-me-mple-dots-metaxoto', 'Παπιγιόν με βάση κεραμιδί και dots μπλε και σπασμένο λευκό. Ένα παπιγιόν που απογειώνει το outfit σας με το τόσο ιδιαίτερο χρώμα του. Ολομέταξο και φτιαγμένο με προσοχή, στο χέρι απο τους ειδικούς της Andrew’s Ties.\r\nHand-made in Italy', 'Παπιγιόν με βάση κεραμιδί και dots μπλε και σπασμένο λευκό. Ένα παπιγιόν που απογειώνει το outfit σας με το τόσο ιδιαίτερο χρώμα του. Ολομέταξο και φτιαγμένο με προσοχή, στο χέρι απο τους ειδικούς της Andrew’s Ties.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie1.jpg', 2, 'ATF0011'),
(31, 'Παπιγιόν μαύρο, Μετάξι 100%', 'papigion-mayro-metaksoto', 'Παπιγιόν μαύρο φτιαγμένο στο χέρι απο μετάξι υψηλής ποιότητας. Προσδίδει κύρος στο ντύσιμο και θεωρείται ένα απο τα πιο “βαριά” χρώματα για τον άνδρα. Εύκολο στους συνδυασμούς και must για τις εξόδους και όχι μόνο καθώς είναι στη κατηγορία των επίσημων χρω', 'Παπιγιόν μαύρο φτιαγμένο στο χέρι απο μετάξι υψηλής ποιότητας. Προσδίδει κύρος στο ντύσιμο και θεωρείται ένα απο τα πιο “βαριά” χρώματα για τον άνδρα. Εύκολο στους συνδυασμούς και must για τις εξόδους και όχι μόνο καθώς είναι στη κατηγορία των επίσημων χρωμάτων.\r\nHand-made in Italy', 39, 4, 0, 'img/products/bowtie/bowtie2.jpg', 1, ' ATF0007'),
(32, 'Παπιγιόν μπλε με ρίγες μωβ, Μετάξι 100%', 'papigion-mple-rige-mob', 'Παπιγιόν με βάση μπλε navy και ρίγες σε αποχρώσεις μωβ και απαλού ροζ. Φτιαγμένο στο χέρι απο μετάξι 100%. Καινούριο σχέδιο με ιδιαίτερες και μοντέρνες ρίγες σχεδόν μόνο απο τη μια του πλευρά, αυτό το καθιστά μοναδικό και μοντέρνο.\r\nHand-made in Italy', 'Παπιγιόν με βάση μπλε navy και ρίγες σε αποχρώσεις μωβ και απαλού ροζ. Φτιαγμένο στο χέρι απο μετάξι 100%. Καινούριο σχέδιο με ιδιαίτερες και μοντέρνες ρίγες σχεδόν μόνο απο τη μια του πλευρά, αυτό το καθιστά μοναδικό και μοντέρνο.\r\nHand-made in Italy', 39, 4, 0, 'img/products/bowtie/bowtie3.jpg', 3, 'ATF0013'),
(33, 'Παπιγιόν μπλε με σχέδια κόκκινα, Μετάξι 100%', 'papigion-mple-sxedia-kokkina-metaxoto', 'Παπιγιόν μπλε electric με σχέδια fantasy σε αποχρώσεις κόκκινου και κίτρινου. Θεωρείται κλασσικό και all season καθώς είναι εύκολο στο να συνδυαστεί. Κατασκευασμένο απο μετάξι 100% ολοκληρώνει το outfit σας ανεβάζοντας το κύρος του ντυσίματος.\r\nHand-made i', 'Παπιγιόν μπλε electric με σχέδια fantasy σε αποχρώσεις κόκκινου και κίτρινου. Θεωρείται κλασσικό και all season καθώς είναι εύκολο στο να συνδυαστεί. Κατασκευασμένο απο μετάξι 100% ολοκληρώνει το outfit σας ανεβάζοντας το κύρος του ντυσίματος.\r\nHand-made in Italy', 39, 4, 0, 'img/products/bowtie/bowtie4.jpg', 2, 'ATF0014'),
(34, 'Παπιγιόν μπλε πράσινο με καρό κίτρινο, Μετάξι 100%', 'papigion-mple-prasino-karo-kitrino-metaxoto', 'Μπλε καρό παπιγιόν με αποχρώσεις πράσινου στη βάση και κίτρινο καρό. Φτιαγμένο στο χέρι, απο μετάξι 100%. Ιδανικά σχεδιασμένο απο τους ειδικούς της Andrew’s Ties για να σας συνοδεύει παντού. Κάθε παπιγιόν έρχεται να συμπληρώσει το outfit σας με τη μοντέρνα', 'Μπλε καρό παπιγιόν με αποχρώσεις πράσινου στη βάση και κίτρινο καρό. Φτιαγμένο στο χέρι, απο μετάξι 100%. Ιδανικά σχεδιασμένο απο τους ειδικούς της Andrew’s Ties για να σας συνοδεύει παντού. Κάθε παπιγιόν έρχεται να συμπληρώσει το outfit σας με τη μοντέρνα σχεδίαση του και την απαλότητα στην υφή του.\r\nHand-made in Italy', 39, 4, 0, 'img/products/bowtie/bowtie5.jpg', 7, 'ATF0016'),
(35, 'Παπιγιόν Μπλε Σκούρο με Λευκό Πουά, Μετάξι 100%', 'papigion-mple-skouro-me-poua-leuko', 'Μεταξωτό παπιγιόν, εντυπωσιακό και φίνο, σε παιχνιδιάρικο σχέδιο dots και χρώμα μπλε σκούρο με λευκό. Με εγγυημένα υψηλή ποιότητα, άκρως μοδάτο και απόλυτα stylish, κάθε παπιγιόν της Andrew’s Ties αποτελεί το ιδανικό ανδρικό αξεσουάρ για τις εμφανίσεις σας', 'Μεταξωτό παπιγιόν, εντυπωσιακό και φίνο, σε παιχνιδιάρικο σχέδιο dots και χρώμα μπλε σκούρο με λευκό. Με εγγυημένα υψηλή ποιότητα, άκρως μοδάτο και απόλυτα stylish, κάθε παπιγιόν της Andrew’s Ties αποτελεί το ιδανικό ανδρικό αξεσουάρ για τις εμφανίσεις σας.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie6.jpg', 2, 'ATF0015'),
(36, 'Παπιγιόν ριγέ με κίτρινο και κόκκινο, Μετάξι 100%', 'papigion-rige-kitrino-kokkino-metaxoto', 'Παπιγιόν ριγέ, με βάση στις αποχρώσεις του κίτρινου, ρίγες κόκκινες και γκρι. Φτιαγμένο απο μετάξι 100%. Φωτεινό, για να κάνει contrast σε ένα σκουρόχρωμο σακάκι. Η λεπτομέρεια του κόκκινου κάνει τη διαφορά καθώς υπάρχει τόσο όσο χρειάζεται.\r\nHand-made in ', 'Παπιγιόν ριγέ, με βάση στις αποχρώσεις του κίτρινου, ρίγες κόκκινες και γκρι. Φτιαγμένο απο μετάξι 100%. Φωτεινό, για να κάνει contrast σε ένα σκουρόχρωμο σακάκι. Η λεπτομέρεια του κόκκινου κάνει τη διαφορά καθώς υπάρχει τόσο όσο χρειάζεται.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie7.jpg', 4, 'ATF0010'),
(37, 'Παπιγιόν σατινέ καφέ σκούρο, Μετάξι 100%', 'papigion-satine-kafe-skouro-metaxoto', 'Παπιγιόν σατινέ μονόχρωμο σε απόχρωση καφέ σκούρο. Μοναδική απαλότητα στην υφή φτιαγμένο απο μετάξι 100%. Κλασσικό και εύκολο στο να συνδυαστεί. Συμπληρώνει το outfit σας με μοναδικό τρόπο.\r\nHand-made in Italy', 'Παπιγιόν σατινέ μονόχρωμο σε απόχρωση καφέ σκούρο. Μοναδική απαλότητα στην υφή φτιαγμένο απο μετάξι 100%. Κλασσικό και εύκολο στο να συνδυαστεί. Συμπληρώνει το outfit σας με μοναδικό τρόπο.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie8.jpg', 3, 'ATF0006'),
(38, 'Παπιγιόν σατινέ λαδί, Μετάξι 100%', 'proion/papigion-satine-ladi-metaksi', 'Σατινέ παπιγιόν, κατασκευασμένο από μετάξι 100%, σε πράσινο χρώμα. Γουστόζικο, μοντέρνο και με εγγυημένα υψηλή ποιότητα, κάθε παπιγιόν της Andrew’s Ties έρχεται να συμπληρώσει μοναδικά το outfit σας με το κλασικό μονόχρωμο σχέδιό του και την απαλή υφή του.', 'Σατινέ παπιγιόν, κατασκευασμένο από μετάξι 100%, σε πράσινο χρώμα. Γουστόζικο, μοντέρνο και με εγγυημένα υψηλή ποιότητα, κάθε παπιγιόν της Andrew’s Ties έρχεται να συμπληρώσει μοναδικά το outfit σας με το κλασικό μονόχρωμο σχέδιό του και την απαλή υφή του.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie9.jpg\r\n', 5, 'ATF0001'),
(39, 'Παπιγιόν σατινέ μπορντό, Μετάξι 100%', 'papigion-satine-mpornto-metaxoto', 'Σατινέ παπιγιόν, φτιαγμένο απο μετάξι 100% σε χρώμα μπορντό. Μοντέρνο και γουστόζικο απο υψηλής ποιότητας μετάξι. Ιδιαίτερα απαλή αίσθηση στην υφή του, συμπληρώνει μοναδικά το outfit σας.\r\nHand-made in Italy', 'Σατινέ παπιγιόν, φτιαγμένο απο μετάξι 100% σε χρώμα μπορντό. Μοντέρνο και γουστόζικο απο υψηλής ποιότητας μετάξι. Ιδιαίτερα απαλή αίσθηση στην υφή του, συμπληρώνει μοναδικά το outfit σας.\r\nHand-made in Italy', 54, 4, 0, 'img/products/bowtie/bowtie10.jpg', 1, 'ATF004');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `review_user_id` int(11) NOT NULL,
  `review_product_id` int(11) NOT NULL,
  `review_stars` tinyint(4) NOT NULL,
  `review_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `stores`
--

CREATE TABLE `stores` (
  `stores_id` int(11) NOT NULL,
  `stores_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stores_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stores_country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stores_city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stores_latitude` float NOT NULL,
  `stores_longitute` float NOT NULL,
  `stores_photo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `stores_postal_code` mediumint(6) NOT NULL,
  `stores_phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(10) NOT NULL,
  `sub_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sub_category_alias` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sub_category_photo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sub_category_sort` tinyint(3) NOT NULL,
  `category_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `sub_category`
--

INSERT INTO `sub_category` (`id`, `sub_category_name`, `sub_category_alias`, `sub_category_photo`, `sub_category_sort`, `category_id`) VALUES
(1, 'Γραβάτες', 'gravates', 'img/categories/category-tie.jpg', 0, 1),
(2, 'Τιράντες', 'tirantes', 'img/categories/category-rantes.jpg', 0, 1),
(3, 'Μαντίλια για πέτο (Pochette) ', 'manthlia_pochette', 'img/categories/category-pochette.jpg', 0, 1),
(4, 'Παπιγιόν', 'papigion', 'img/categories/category-bowtie.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_gender` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_newsletter` smallint(6) NOT NULL,
  `user_active` int(11) NOT NULL DEFAULT 1,
  `user_created_at` date NOT NULL,
  `user_birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_first_name`, `user_last_name`, `user_gender`, `user_password`, `user_newsletter`, `user_active`, `user_created_at`, `user_birth_date`) VALUES
(1, 'vlasiadou.st@hotmail.gr', 'Λίνα', 'Βλασιάδου', 'Γυναίκα', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '2020-01-20', '1991-12-05'),
(2, 'gpap@gmail.com', 'Γιώργος', 'Παπαδόπουλος', 'Άντρας', '0a6f9ebaa55e21ce270b6df2e7d812c987d511ab0472d24b501622b5878f9e4b03011356f3c9f85b084cf763a995a93f142d5107fa9a92d8e60e78d3c96a614a', 0, 1, '2020-01-20', '1988-07-17'),
(3, 'kat@gmail.com', 'Κατερίνα', 'Κοντόσογλου', 'Γυναίκα', 'B28A7B021B48F7B389AB3418C986D08857824AE45E9298CB65B12770A41E28515678D3E3F990D06A6B937E0089BE7FE180F18002E9E8E14AED974D10D89D4CEA', 1, 1, '2020-01-28', '1989-03-01'),
(4, 'kmouratidis@gmail.com', 'Κώστας ', 'Μουρατίδης', 'Άντρας', 'FA585D89C851DD338A70DCF535AA2A92FEE7836DD6AFF1226583E88E0996293F16BC009C652826E0FC5C706695A03CDDCE372F139EFF4D13959DA6F1F5D3EABE', 1, 1, '2020-02-05', '1980-04-17'),
(5, 'lgermanos@hotmail.com', 'Λουκάς', 'Γερμανός', 'Άνδρας', 'B28A7B021B48F7B389AB3418C986D08857824AE45E9298CB65B12770A41E28515678D3E3F990D06A6B937E0089BE7FE180F18002E9E8E14AED974D10D89D4CEA', 1, 1, '2020-02-05', '1986-01-01'),
(6, 'lina@gmail.com', 'Iokasti', 'Vlasiadou', 'female', '81dc9bdb52d04dc20036dbd8313ed055', 0, 1, '2020-05-23', '1985-06-20'),
(7, 'tsak@gmail.com', 'Tzak', 'Tzak', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(8, 'tzoni@gmail.com', 'Tzoni', 'Tzoni', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(9, 'mpampis@gmail.com', 'Mpampis', 'mpampis', '', '609f46eb3d58efc1c87bd086c1faab866d8754d0b9f4727625316e4cba2381c2fd76550a2ba0e8344cf2601e23a0e1268883638bc53149fda956f24cc4bddef3', 0, 1, '0000-00-00', '0000-00-00'),
(13, 'kat@gmail.com', 'kat', 'kat', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(18, 'kouk@gmail.com', 'Kouk', 'kouk', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(21, 'kouk@gmail.com', 'Kouk', 'kouk', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(22, 'pipi@gmail.com', 'Pipi', 'pipi', '', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 0, 1, '0000-00-00', '0000-00-00'),
(23, 'pipi@gmail.com', 'Pipi', 'pipi', '', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79', 0, 1, '0000-00-00', '0000-00-00'),
(24, 'kat@gmail.com', 'kat', 'V', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(35, 'ddddddd@gmail.com', 'vla', 'lissssss', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(36, 'gl@gmail.com', 'glyka', 'glyka', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(37, 'tolis@gmail.com', 'tolis', 'tolis', '', '6256762ae1144d15ae0a67542c40887a4335e23097fd42afd9121c9bd495c6c1da96d74d38307a58bb60ea7bb84bd175d002ca42ce05499871af7bad2f8b8d0d', 0, 1, '0000-00-00', '0000-00-00'),
(38, 'pas@gmail.com', 'Mitsos', 'Papas', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(39, 'sakis@gmail.com', 'Sakis', 'sakis', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(40, 'kostas@gmail.com', 'Kwstas', 'Topalidis', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(41, 'spyros@gmail.com', 'Spyros', 'Topalidis', '', '741ca5e942a1653e92899b9332486b2459fa7ae1e91ffcd7c1b7cf10de2ac4f77fcc26c57d1275516a2efb6f61e693ff16924c05f844622eb0eb0ec50d837528', 0, 1, '0000-00-00', '0000-00-00'),
(43, 'petros@gmail.com', 'Petros', 'Topalidis', '', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 0, 1, '0000-00-00', '0000-00-00'),
(44, 'tsab@gmail.com', 'Akis', 'tsab', '', '5621002d81522b273d0a5c95a44e9e75f45e6e4b650688268ce340cba4992a876dc699e62750f4b8138ec9975d06f68408ba617a6b12b20e9d475201d92c1e5c', 0, 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `wishlists`
--

CREATE TABLE `wishlists` (
  `wish_id` int(11) NOT NULL,
  `wish_user_id` int(11) NOT NULL,
  `wish_product_id` int(11) NOT NULL,
  `wish_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Ευρετήρια για πίνακα `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Ευρετήρια για πίνακα `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Ευρετήρια για πίνακα `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Ευρετήρια για πίνακα `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Ευρετήρια για πίνακα `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`op_id`);

--
-- Ευρετήρια για πίνακα `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`status_id`,`order_id`);

--
-- Ευρετήρια για πίνακα `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Ευρετήρια για πίνακα `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Ευρετήρια για πίνακα `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Ευρετήρια για πίνακα `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`stores_id`);

--
-- Ευρετήρια για πίνακα `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Ευρετήρια για πίνακα `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wish_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT για πίνακα `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT για πίνακα `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT για πίνακα `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `order_products`
--
ALTER TABLE `order_products`
  MODIFY `op_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT για πίνακα `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `stores`
--
ALTER TABLE `stores`
  MODIFY `stores_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT για πίνακα `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wish_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
