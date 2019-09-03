-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2019 at 01:11 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spicebox`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_name` varchar(254) NOT NULL DEFAULT ' ',
  `image` varchar(254) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `image`) VALUES
(65, 'Momo', 'momo.jpg'),
(67, 'Pizza', 'cpizza.jpg'),
(68, 'Pasta', 'cpasta.jpg'),
(70, 'Biriyani', 'cbiriyani.jpg'),
(71, 'Breakfast ', 'cbreakfast.jpg'),
(72, 'Snacks', 'csnacks.jpg'),
(73, 'Sandwich', 'sandwich.jpg'),
(75, 'Noodles', 'chowmein2.jpg'),
(76, 'Soup', 'soup.jpg'),
(77, 'Khaja Set', 'khaja.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `ticket_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `subject` varchar(254) NOT NULL DEFAULT ' ',
  `type_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(65000) NOT NULL DEFAULT ' ',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`ticket_id`, `user_id`, `subject`, `type_id`, `description`, `post_date`, `reply_status`) VALUES
(33, 2, 'Delivery', 3, 'I have written the delivery description. I hope you see the description and provide me the order', '2019-03-27 03:39:29', 1),
(35, 3, 'Services', 1, 'I love you description field in the delivery time', '2019-03-27 03:42:41', 1),
(36, 2, 'Hello there', 1, 'I love your website', '2019-03-31 06:17:23', 1),
(37, 5, 'Client service', 2, 'The client service is kind of slow', '2019-03-31 06:27:38', 1),
(38, 5, 'Thank you', 3, 'Thank you for editing my address', '2019-03-31 11:14:05', 1),
(39, 2, 'Client service', 3, 'Please give my order as soon as possible', '2019-04-02 16:45:08', 1),
(40, 2, 'Client service', 1, 'late reply', '2019-04-04 03:45:31', 1),
(41, 2, 'Hello', 3, 'Hello', '2019-04-13 14:18:16', 1),
(42, 5, 'Lots of love', 1, 'Hello . I love you new look', '2019-04-20 13:32:08', 1),
(43, 5, 'Fast Delivery', 1, 'Hello, in my office the lunch break is on 12 sharp. So please delivery the food at 12 pm sharp else i could be hungry for whole day', '2019-04-21 05:16:05', 1),
(44, 2, 'Order', 3, 'I have just given my order and i know its too early but i wanted my order to come in lunch time at a 1 o clock. Thank you', '2019-04-22 03:56:32', 1),
(46, 3, 'Good delivery service', 1, 'I love how fast you give our orders', '2019-04-22 07:42:15', 1),
(47, 2, 'First time', 1, 'Hello I m quite new in this system. I hope the food hear is great and the delivery system is good to', '2019-04-22 08:31:28', 1),
(48, 4, 'Client service', 2, 'You are very slow at giving reply to feedbacks', '2019-04-22 08:44:48', 0),
(49, 4, 'Lots of Love', 1, 'I love the new look of the website for you restaurant. It makes it quite easy for us to order food when ever we want. Thank you for the facility', '2019-04-23 01:35:48', 1),
(50, 4, 'Lots of Love', 1, 'I love the new look of the website for you restaurant. It makes it quite easy for us to order food when ever we want. Thank you for the facility', '2019-04-23 01:35:48', 1),
(51, 2, 'hello ', 3, 'This is a test feedback', '2019-04-25 01:54:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_types`
--

CREATE TABLE `feedback_types` (
  `type_id` int(10) NOT NULL,
  `type` varchar(254) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_types`
--

INSERT INTO `feedback_types` (`type_id`, `type`) VALUES
(1, 'Appreciation'),
(2, 'Complaint'),
(3, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `fooditems`
--

CREATE TABLE `fooditems` (
  `food_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL DEFAULT '0',
  `food_name` varchar(254) NOT NULL DEFAULT ' ',
  `description` varchar(65000) NOT NULL DEFAULT ' ',
  `price_per_piece` int(10) NOT NULL DEFAULT '0',
  `image` varchar(254) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditems`
--

INSERT INTO `fooditems` (`food_id`, `cat_id`, `food_name`, `description`, `price_per_piece`, `image`) VALUES
(25, 65, 'Veg Momos', 'Ingredients are flour, chopped cabbage, onions, carrots, peas, boiled potato, soy beans, ginger, garlic paste, black pepper powder, red chilly powder, garam masala, mustard oilasdfghjkl.;', 130, 'vegmomo.jpg'),
(26, 65, 'Buff Momo', 'Buff meat, onion, mustard oil, butter, ginger, garlic paste, salt, red chilly powder, turmeric  powder, coriander powder, black pepper, cumin powder', 150, 'chickenmomo.jpg'),
(27, 65, 'Chicken momo', 'Chicken piece, mustard oil, onions, cumin powder, red chilly powder, black pepper, turmeric powder, salt, garam masala, coriander powder, ginger, garlic paste', 180, 'buffmomo.jpg'),
(28, 65, 'Chicken C-Momo', 'Chicken meat, onion, ginger, garlic, mustard oil, butter, salt, red chilly powder, black pepper, cumin powder, coriander powder, turmeric powder, chilly sauce, tomato sauce,  cubed onion, capsicum slice, coriander pieces', 250, 'chmomo.jpg'),
(29, 65, 'Chicken Kothey', 'Chicken pieces, ginger garlic paste, onion, black pepper, turmeric powder, red chilly powder, mustard oil, butter, flour, base of momo is fried, coriander powder', 200, 'kothmomo.JPG'),
(30, 67, 'Veg Pizza', 'Thin and crunchy base, chicken meat, onions, tomatoes, broccoli, black olives, mozzarella cheese, chedder cheese, yak cheese', 200, 'vegpizza.jpg'),
(31, 67, 'Chicken Pizza', 'Thin and crunchy base,  chicken pieces, red tomato sauce, green capsicum, onion, salt, ginger garlic, mozzarella cheese, chedder cheese, yak cheese', 250, 'chickenpizza.jpg'),
(32, 67, 'Mix Pizza', 'Thin and crunchy base, onion, pumpkin, chicken pieces, red pizza sauce, basil leaves, salt, black pepper', 220, 'mixpizza.jpg'),
(33, 70, 'Veg Biriyani', 'Basmati rice, onion, carrot, green beans, potato,  green chilly, fried onions, curd,  cashew,  almond, peanuts, fresh coriander, salt, red chilly powder, turmeric powder, cumin powder, coriander powder, black pepper, biriyani masala, garam, masala', 300, 'vegbiri.jpeg'),
(34, 70, 'Chicken Biriyani', 'Basmati rice, chicken pieces, fresh coriander, onions, curd, fried onions, cashew, almond, peanuts, salt, red chilly powder, cumin powder, garam masala, chicken powder, biriyani masala, black pepper, coriander powder', 350, 'chickenbiri.jpg'),
(35, 70, 'Mutton Biriyani', 'Basmati rice, mutton pieces, fresh coriander, onions, curd, fried onions, cashew, almond, peanuts, salt, red chilly powder, cumin powder, garam masala, mutton powder, biriyani masala, black pepper, coriander powder', 350, 'muttonbiri.jpg'),
(36, 71, 'Sel-Roti and Tarkari', 'Sel-tori, poato, onion ,fresh coriander, tomato, salt, turmeric powder, cumin powder, garam masala, vegetable masala, chat masala, ginger garlic paste, red chilly powder', 100, 'sell.JPG'),
(37, 71, 'American Waffles', 'Waffles, vanilla ice-cream, chocolate syrup,  boiled eggs, cream coffee/orange juice', 300, 'waffles.jpg'),
(38, 72, 'Veg Pakoda', 'Onion chopped, carrot chopped, cabbage, chopped, green chilly chopped, salt, red chilly powder, corn flour,  vegetable stock', 100, 'vegpakoda.jpg'),
(39, 72, 'Alo Chop', 'Potato, chopped onions, fresh coriander, chat masala, salt, red chilly powder, vegetable masala', 100, 'alochop.jpg'),
(40, 73, 'Club Sandwich', 'Triple layer fried bread, chicken pieces, onions, tomato, mayonnaise, lettuce, coleslaw, chedder cheese, potato fries on the side ', 300, 'clubsand.jpg'),
(42, 73, 'Italian Sandwich', 'Long bread,  grill cheese, deep fried chicken slice, caramelised onion, chedder adn yak cheese', 300, 'italian.jpg'),
(43, 75, 'Hakka Noodles', 'Green capsicum, red capsicum, tomato, onion, carrot, ginger garlic paste, egg-less noodles, salt, black pepper, soy sauce, soy bean, red chilly powder, vegetable masala, garam masala', 150, 'hakka.jpg'),
(44, 75, 'Chicken Noodles', 'Big pieces of chicken meat, egg noodles, fresh coriander, red onions, dried mushrooms, salt, black pepper, coriander powder, red chilly powder, smoked paprika', 250, 'chickenno.jpg'),
(45, 76, 'Mushroom soup', 'Mushroom pieces,  rosemary, cream, milk,  salt, black pepper, corn flour ', 150, 'mushsoup.jpg'),
(46, 76, 'Sweet Corm Soup', 'Sweet corn, onion , fresh coriander, green onions, corn flour, vegetable stock, rosemary, salt, black pepper ', 150, 'sweetsoup.jpg'),
(47, 76, 'Chicken soup', 'Chicken pieces, fresh coriander, green onions, cream, milk, salt, black pepper, smoked paprika', 180, 'chickensoup.jpg'),
(48, 77, 'Veg Thakali', 'Rice;  cucumber, carrot, onion and green chilly pickle; moong dal; saag; aloo vegetable; rajwa/red beans curry; dried  green leaves pickle; lemon, raddish, cucumber and carrot piece', 300, 'vegthakal.jpg'),
(49, 77, 'Chicken Thakali', 'Rice, black pulse Dal,  chicken curry, raddish pickle, tomato chutney, aloo tarkari, saag tarkari, bean salad', 320, 'thakali.jpg'),
(50, 77, 'Newari Khana ', 'Bitten rice/ chiura,   black eyes beans, green leaves curry, pickled potato tarkari, boiled masala egg, chilly buffalo meat, bara,  carrot, cucumber and raddish pickle,  black beans with chopped ginger and garlic ', 320, 'newari.jpg'),
(51, 68, 'Mexican Pasta', 'Buff pieces, dried oregano, dried rosemary,  fresh garlic,  spiral flour pasta, tomato sauce, green onions, cheddar cheese', 250, 'mexpasta.jpg'),
(52, 65, 'nfshnfjrfhfshx', 'qwertyuiopoiuytresasdfghjklkjhgfdszxcvbnm', 120, 'chinesecarv.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL DEFAULT '0',
  `delivery_address` varchar(254) NOT NULL DEFAULT ' ',
  `description` varchar(65000) NOT NULL DEFAULT ' ',
  `ordered_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int(10) NOT NULL DEFAULT '0',
  `service` double(10,0) NOT NULL DEFAULT '0',
  `vat` decimal(10,0) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `delivery_address`, `description`, `ordered_date`, `total`, `service`, `vat`, `status`) VALUES
(64, 4, 'Swaraswatisthan, Lazimpat, Kathmandu', 'As soon as possible', '2019-04-22 04:11:08', 1070, 0, '1330', 1),
(65, 3, 'Lagankhel Chowk near the big tree', 'I want my order at 12 pm', '2019-04-22 04:35:02', 600, 0, '746', 1),
(66, 5, 'Japan', 'At around 6 pm in the evening', '2019-04-22 04:47:39', 1000, 0, '1243', 1),
(67, 2, 'Putalisadak', 'extra sauce', '2019-04-22 07:21:59', 3650, 0, '4537', 1),
(68, 4, 'Swaraswatisthan, Lazimpat, Kathmandu', 'At around 5 pm', '2019-04-22 07:29:43', 1190, 0, '1479', 1),
(69, 3, 'Lagankhel Chowk', '', '2019-04-22 07:40:23', 1150, 0, '1429', 1),
(70, 2, 'Budhanilkantha', 'Extra momo sauce', '2019-04-22 08:26:31', 760, 0, '945', 0),
(71, 4, 'Swaraswatisthan, Lazimpat, Kathmandu', 'Extra cheesy pizza with thin crust', '2019-04-22 08:41:52', 1150, 0, '1429', 0),
(72, 2, 'Patan Dhoka', 'at half an hour', '2019-03-01 08:53:49', 1000, 80, '100', 0),
(75, 2, 'Pulchowk Chowk', 'Extra 2 sauce for both the momo and the alu chop', '2019-04-23 01:25:19', 760, 76, '109', 1),
(76, 3, 'Lagankhel Chowk', 'Extra cheese', '2019-04-23 01:32:31', 1100, 110, '157', 1),
(77, 4, ' ', ' ', '2019-04-23 01:34:00', 0, 0, '0', 0),
(78, 4, ' ', ' ', '2019-04-23 01:34:00', 0, 0, '0', 0),
(79, 4, 'Swaraswatisthan, Lazimpat, Kathmandu', 'I want the order at 3 pm ', '2019-04-23 01:39:53', 1610, 161, '230', 0),
(80, 5, 'Patan Dhoka', 'Extra sandwich sauce  and the soup should be hot', '2019-04-23 01:42:20', 960, 96, '137', 0),
(81, 2, 'New Road Gate', 'fast Delivery', '2019-04-23 11:20:03', 1050, 105, '150', 0),
(82, 2, 'Patan Dhoka', 'Some vegetable curry ', '2019-04-23 13:21:40', 1360, 136, '194', 0),
(83, 2, 'Patan Dhoka', 'extra sauce', '2019-04-23 14:14:51', 500, 50, '72', 0),
(84, 5, 'Lagankhel Chowk', 'Extra sauce', '2019-04-24 10:04:48', 1590, 159, '227', 0),
(85, 2, 'Patan Dhoka', 'Extra Sauce', '2019-04-25 01:51:46', 1100, 110, '157', 1),
(86, 2, 'Lagankhel Chowk', 'Extra achar', '2019-04-25 03:24:46', 1080, 108, '154', 1),
(87, 2, 'Lagankhel Chowk near the big tree', 'Veg tarkari', '2019-04-26 01:54:14', 880, 88, '126', 0),
(88, 2, 'Lagankhel Chowk', 'Some vegetable curry ', '2019-05-04 00:57:22', 700, 70, '100', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `od_id` int(10) NOT NULL,
  `food_id` int(10) NOT NULL DEFAULT '0',
  `rate` int(10) NOT NULL DEFAULT '0',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `amount` int(10) NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`od_id`, `food_id`, `rate`, `quantity`, `amount`, `order_id`) VALUES
(87, 31, 250, 2, 500, 62),
(88, 26, 150, 3, 450, 63),
(89, 44, 250, 1, 250, 63),
(90, 27, 180, 4, 720, 64),
(91, 34, 350, 1, 350, 64),
(92, 42, 300, 1, 300, 65),
(93, 36, 100, 3, 300, 65),
(94, 51, 250, 4, 1000, 66),
(95, 31, 250, 3, 750, 67),
(96, 35, 350, 4, 1400, 67),
(98, 40, 300, 5, 1500, 67),
(100, 25, 120, 2, 240, 68),
(101, 31, 250, 2, 500, 68),
(102, 43, 150, 3, 450, 68),
(103, 51, 250, 3, 750, 69),
(104, 38, 100, 4, 400, 69),
(105, 25, 120, 1, 120, 70),
(107, 50, 320, 2, 640, 70),
(108, 31, 250, 3, 750, 71),
(109, 30, 200, 2, 400, 71),
(110, 51, 250, 4, 1000, 72),
(111, 51, 250, 2, 500, 73),
(112, 33, 300, 1, 300, 73),
(113, 51, 250, 4, 1000, 74),
(114, 35, 350, 1, 350, 74),
(115, 25, 120, 3, 360, 75),
(116, 30, 200, 1, 200, 75),
(118, 39, 100, 2, 200, 75),
(119, 51, 250, 2, 500, 76),
(120, 42, 300, 2, 600, 76),
(122, 34, 350, 1, 350, 77),
(123, 34, 350, 1, 350, 78),
(124, 37, 300, 2, 600, 78),
(125, 50, 320, 1, 320, 78),
(126, 34, 350, 1, 350, 79),
(127, 37, 300, 1, 300, 79),
(128, 50, 320, 3, 960, 79),
(129, 47, 180, 2, 360, 80),
(130, 40, 300, 2, 600, 80),
(131, 42, 300, 2, 600, 81),
(132, 43, 150, 3, 450, 81),
(133, 32, 220, 3, 660, 82),
(134, 34, 350, 2, 700, 82),
(135, 51, 250, 2, 500, 83),
(136, 34, 350, 3, 1050, 84),
(137, 27, 180, 3, 540, 84),
(138, 40, 300, 2, 600, 85),
(139, 51, 250, 2, 500, 85),
(140, 25, 120, 4, 480, 86),
(142, 33, 300, 2, 600, 86),
(143, 27, 180, 1, 180, 87),
(145, 35, 350, 2, 700, 87),
(146, 30, 200, 1, 200, 88),
(147, 51, 250, 2, 500, 88);

-- --------------------------------------------------------

--
-- Table structure for table `reply_feedbacks`
--

CREATE TABLE `reply_feedbacks` (
  `reply_id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(65000) NOT NULL DEFAULT ' ',
  `reply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply_feedbacks`
--

INSERT INTO `reply_feedbacks` (`reply_id`, `ticket_id`, `description`, `reply_date`) VALUES
(42, 31, 'Thank you sooo much', '2019-03-26 11:02:00'),
(43, 32, 'We are very sorry for the inconvenience. We  could  keep that in mind and it will never happen again', '2019-03-27 03:12:14'),
(44, 33, 'we will see through it. Thank you!!', '2019-03-27 03:44:43'),
(45, 33, 'we will see through it. Thank you!!', '2019-03-27 03:44:43'),
(46, 34, 'Thank you for appreciating it.', '2019-03-27 03:45:12'),
(47, 35, 'We will see through it....', '2019-03-27 03:45:34'),
(48, 36, 'Thank you so much for your appreciation', '2019-03-31 06:18:28'),
(49, 37, 'We will try our best to become fast as we can. and sorry for inconvinence', '2019-03-31 06:28:53'),
(50, 38, 'You welcome. We are very happy to help you', '2019-03-31 11:17:56'),
(51, 39, 'sure', '2019-04-04 03:09:30'),
(52, 40, 'will soon give reply', '2019-04-04 03:46:42'),
(53, 40, 'will soon give reply', '2019-04-04 03:46:43'),
(54, 41, 'Hello', '2019-04-13 14:18:58'),
(55, 42, 'Thank you so much for loving our new website love. Hope we are keeping you happy with out food as well', '2019-04-21 12:46:18'),
(56, 43, 'Sure, we will send your lunch at approximately 12pm. Thank you for ordering', '2019-04-21 13:29:37'),
(57, 44, 'Sure , We will record you order and send your order at exactly 1pm ', '2019-04-22 04:34:01'),
(58, 45, '', '2019-04-22 05:14:56'),
(59, 45, 'Thank you so much for loving our new look', '2019-04-22 05:15:15'),
(60, 46, 'Thank you so much ', '2019-04-22 07:54:35'),
(61, 46, 'Thank you so much ', '2019-04-22 07:54:35'),
(62, 51, 'Than you for the test feedback', '2019-04-25 01:55:34'),
(63, 50, 'thank you ', '2019-04-25 03:34:15'),
(64, 49, 'Thank you ', '2019-05-04 00:46:58'),
(65, 47, 'I love you enjoy our web application and be able to use it without any difficulty', '2019-05-04 02:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(254) NOT NULL DEFAULT ' ',
  `last_name` varchar(254) NOT NULL DEFAULT ' ',
  `address` varchar(254) NOT NULL DEFAULT ' ',
  `contact_no` varchar(254) NOT NULL DEFAULT ' ',
  `email` varchar(254) NOT NULL DEFAULT ' ',
  `password` varchar(254) NOT NULL DEFAULT ' ',
  `user_type` varchar(254) NOT NULL DEFAULT 'Customer'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `address`, `contact_no`, `email`, `password`, `user_type`) VALUES
(1, 'Mijala', 'Shakya', 'Lazimpat', '1234567890', 'mijala@gmail.com', 'ÕIRB~\rÜ›À%3ËÕ¿', 'Admin'),
(2, 'Sekiya', 'Shakya', 'Pulchowk', '2345678901', 'sekiya@gmail.com', '\Zç†fÁ‰XJ•ªÞ:•ÐÊ', 'Customer'),
(3, 'Mila', 'Bajracharya', 'Lalitpur', '2345678901', 'mila@gmail.com', 'žä@Ä\\÷+ù³\\ÈËˆŽ‡', 'Customer'),
(4, 'Sudishna', 'Shakya', 'Lazimpat', '2345678901', 'sudi@gmail.com', '5µŸUrÀmÐuø0Íµ‡Þ', 'Customer'),
(5, 'Alice', 'Sakura', 'Maharajgung', '3456789012', 'alice@gmail.com', '&Àh¸xY<y¿öÏ', 'Customer'),
(6, 'Manik ', 'Ratna Shakya', 'Lazimpat', '0987654321', 'manik@gmail.com', 'ñtñ’ûÃ®{¾þQðVçÒ’', 'Customer'),
(7, 'Sanu ', 'Kesari Bajracharya', 'Lazimpat', '9876543200', 'sanu@gmail.com', 'm¥ÄKpÒt©O@F÷‰O', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `feedback_types`
--
ALTER TABLE `feedback_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `fooditems`
--
ALTER TABLE `fooditems`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`od_id`);

--
-- Indexes for table `reply_feedbacks`
--
ALTER TABLE `reply_feedbacks`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `ticket_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `feedback_types`
--
ALTER TABLE `feedback_types`
  MODIFY `type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fooditems`
--
ALTER TABLE `fooditems`
  MODIFY `food_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `od_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `reply_feedbacks`
--
ALTER TABLE `reply_feedbacks`
  MODIFY `reply_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
