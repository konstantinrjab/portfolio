-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 13 2018 г., 17:34
-- Версия сервера: 5.7.22-0ubuntu0.16.04.1
-- Версия PHP: 7.2.7-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `accounting`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Масло'),
(1, 'Шины');

-- --------------------------------------------------------

--
-- Структура таблицы `category_parameter`
--

CREATE TABLE `category_parameter` (
  `category_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_parameter`
--

INSERT INTO `category_parameter` (`category_id`, `parameter_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) UNSIGNED DEFAULT '0',
  `date_of_last_delivery` date DEFAULT NULL,
  `purchase_price` int(11) UNSIGNED DEFAULT '0',
  `selling_price` int(11) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `category_id`, `code`, `name`, `quantity`, `date_of_last_delivery`, `purchase_price`, `selling_price`) VALUES
(2, 1, 'ША200', 'Шины 200', 19, '2018-06-23', 1300, 1500),
(3, 1, 'ША300', 'Шины 300', 0, '2018-06-24', 900, 1100),
(4, 2, 'S1040', 'SHELL 10W-40', 9, NULL, 200, 250);

-- --------------------------------------------------------

--
-- Структура таблицы `item_parameter`
--

CREATE TABLE `item_parameter` (
  `item_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `item_parameter`
--

INSERT INTO `item_parameter` (`item_id`, `parameter_id`, `value`) VALUES
(2, 1, ''),
(3, 1, '185/60');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1530023186),
('m180609_130826_create_category_table', 1530023187),
('m180609_131816_create_item_table', 1530023187),
('m180609_133320_create_parameter_table', 1530023187),
('m180609_134841_create_junction_table_for_category_and_parameter_tables', 1530023187),
('m180609_134941_create_junction_table_for_item_and_parameter_tables', 1530023187),
('m180612_094635_add_required_columns_to_item_table', 1530023187),
('m180614_203622_create_purchase_table', 1530023187),
('m180616_174702_create_sale_table', 1530023187);

-- --------------------------------------------------------

--
-- Структура таблицы `parameter`
--

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `parameter`
--

INSERT INTO `parameter` (`id`, `name`) VALUES
(1, 'Размер');

-- --------------------------------------------------------

--
-- Структура таблицы `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` int(11) UNSIGNED DEFAULT NULL,
  `count` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` int(11) UNSIGNED DEFAULT NULL,
  `count` int(11) UNSIGNED NOT NULL,
  `purchaser` varchar(255) DEFAULT NULL,
  `paid` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sale`
--

INSERT INTO `sale` (`id`, `item_id`, `date`, `price`, `count`, `purchaser`, `paid`) VALUES
(2, 2, '2018-06-27', 4500, 3, '', 4500),
(3, 4, '2018-06-27', 250, 1, '', 250);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `category_parameter`
--
ALTER TABLE `category_parameter`
  ADD PRIMARY KEY (`category_id`,`parameter_id`),
  ADD KEY `idx-category_parameter-category_id` (`category_id`),
  ADD KEY `idx-category_parameter-parameter_id` (`parameter_id`);

--
-- Индексы таблицы `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx-item-category_id` (`category_id`);

--
-- Индексы таблицы `item_parameter`
--
ALTER TABLE `item_parameter`
  ADD PRIMARY KEY (`item_id`,`parameter_id`),
  ADD KEY `idx-item_parameter-item_id` (`item_id`),
  ADD KEY `idx-item_parameter-parameter_id` (`parameter_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-purchase-item` (`item_id`);

--
-- Индексы таблицы `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-sale-item_id` (`item_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `parameter`
--
ALTER TABLE `parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_parameter`
--
ALTER TABLE `category_parameter`
  ADD CONSTRAINT `fk-category_parameter-category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-category_parameter-parameter_id` FOREIGN KEY (`parameter_id`) REFERENCES `parameter` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk-item-category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `item_parameter`
--
ALTER TABLE `item_parameter`
  ADD CONSTRAINT `fk-item_parameter-item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-item_parameter-parameter_id` FOREIGN KEY (`parameter_id`) REFERENCES `parameter` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk-purchase-item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk-sale-item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
