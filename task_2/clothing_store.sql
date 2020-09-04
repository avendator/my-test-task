-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 09 2020 г., 16:23
-- Версия сервера: 8.0.15
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `clothing_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(1, 'clothes', NULL),
(2, 'men', 1),
(3, 'women', 1),
(4, 'dresses', 3),
(5, 'accessories', 2),
(6, 'belts', 5),
(7, 'footwear', 2),
(8, 'outerwear', 2),
(9, 'underwear', 2),
(10, 'hats', 2),
(11, 'bags', 5),
(12, 'socks', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(1, 't-shirt', '10'),
(2, 'belt', '5'),
(3, 'socks', '3'),
(4, 'sunglasses', '3'),
(5, 'hat', '5'),
(6, 'cap', '5'),
(7, 'hoodie', '5'),
(8, 'shirt', '5'),
(9, 'sweetshirt', '5'),
(10, 'dress', '5'),
(11, 'jeans', '5'),
(12, 'polo', '15'),
(13, 'shorts', '8'),
(14, 'suite', '50'),
(15, 'pants', '15'),
(16, 'trousers', '12'),
(17, 'bag', '7'),
(18, 'vest', '20'),
(19, 't-shirt', '20'),
(20, 't-shirt', '25'),
(21, 'sunglasses', '10'),
(22, 'belt', '10'),
(23, 'belt', '13'),
(24, 'underpants', '5'),
(25, 'shoes', '50'),
(26, 'boots', '5');

-- --------------------------------------------------------

--
-- Структура таблицы `relationships`
--

CREATE TABLE `relationships` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `relationships`
--

INSERT INTO `relationships` (`id`, `product_id`, `category_id`) VALUES
(1, 3, 9),
(2, 1, 8),
(3, 2, 6),
(4, 24, 9),
(5, 4, 5),
(6, 5, 10),
(7, 6, 10),
(8, 7, 8),
(9, 8, 8),
(10, 9, 8),
(11, 10, 4),
(12, 11, 8),
(13, 12, 8),
(14, 13, 8),
(15, 14, 8),
(16, 15, 8),
(17, 16, 8),
(18, 17, 11),
(19, 18, 8),
(20, 20, 8),
(21, 21, 5),
(22, 22, 6),
(23, 23, 6),
(24, 25, 7),
(25, 26, 7),
(26, 7, 2),
(27, 18, 2),
(28, 23, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `relationships`
--
ALTER TABLE `relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
