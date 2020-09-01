-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2019 at 10:49 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ultrashop`
--

-- --------------------------------------------------------

-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `parent_id`) VALUES
(1, 'Escritórios', 0),
(2, 'Mesas e Secretárias', 1),
(3, 'Cadeiras de Escritório', 1),
(4, 'Iluminação', 1),
(5, 'Sala', 0),
(6, 'Sofás', 5),
(7, 'Mesas de centro e de apoio', 5);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(64) NOT NULL,
  `priority` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_code`, `country_name`, `priority`) VALUES
('br', 'Brasil', 0),
('de', 'Alemanha', 0),
('es', 'Espanha', 0),
('fr', 'França', 0),
('it', 'Itália ', 0),
('pt', 'Portugal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 6, 7, '429.00'),
(1, 7, 4, '79.00'),
(2, 3, 2, '69.99'),
(2, 6, 7, '429.00'),
(2, 7, 4, '79.00'),
(4, 3, 2, '69.99'),
(4, 6, 7, '429.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `payment_date`) VALUES
(1, 2, '2019-06-28 20:29:29', NULL),
(2, 2, '2019-06-28 20:32:09', NULL),
(3, 2, '2019-07-29 20:19:15', NULL),
(4, 2, '2019-07-29 20:30:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `image`, `price`, `stock`, `category_id`) VALUES
(1, 'KVRISTBRO', '<p>A pega no topo da mesa permite abri-la e aceder ao que está armazenado no cesto</P>', 'kvistbro-mesa-de-arrumacao-branco__0477822_PE618485_S4.webp', '29.99', 38, 7),
(2, 'LISTERBY', '<p>O freixo é um material natural resistente. A superfície tornou-se ainda mais duradoura graças a uma camada protetora de verniz, que também ajuda a manter o seu toque natural de madeira</p>', 'listerby-mesa-de-centro-castanho__0612069_PE685593_S4.webp', '129.00', 4, 7),
(3, 'MICKE', '<p>Graças à abertura atrás, é fácil ocultar os cabos e fichas, mantendo-os acessíveis.</p>', 'micke-secretaria-preto__0172811_PE327002_S4.webp', '69.99', 24, 2),
(4, 'MALM', '<p>Prateleira por baixo do tampo; mantém as extensões elétricas e os cabos ocultos, mas acessíveis.</p>', 'malm-secretaria-preto__0133380_PE288797_S4.webp', '129.00', 7, 2),
(5, 'HEMNES', '<p>As gavetas deslizam suavemente e incluem um travão para uma abertura segura, impedindo que caiam</p>', 'hemnes-comoda-c-gavetas-branco__0651109_PE706671_S4.webp', '99.00', 6, 2),
(6, 'FRIHETEN', '<p>Sofá, chaise longue e cama dupla num só. Espaço de arrumação por baixo da chaise longue. O assento bloqueia na posição aberta para que possa retirar em segurança os objetos guardados.</p>', 'friheten-sofa-cama-de-canto-c-arrumacao-cinz__0175610_PE328883_S4.webp', '429.00', 58, 6),
(7, 'MILLBERGET', '<p>Função basculante regulável; permite ajustar a resistência para se adaptar aos seus movimentos e peso.</p>', 'millberget-cadeira-giratoria-preto__0724719_PE734602_S4.webp', '79.00', 15, 3),
(8, 'LACK', 'A prateleira para guardar revistas e outros artigos ajuda-o a manter tudo organizado, libertando espaço sobre o tampo.', '57540_PE163122_S5.JPG', '19.99', 28, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(252) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(32) NOT NULL,
  `city` varchar(64) NOT NULL,
  `country` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `active`, `address`, `postal_code`, `city`, `country`, `phone`) VALUES
(1, 'Mariana', 'mc@sapo.pt', '$2y$10$Bw8lOf55Mb8MDhEw0IVos.4UASomds5qHDYtbW/rb8ROm7Bpf3MpW', 1, 'Depths of Hell', '123-456', 'Lisboa', 'pt', '213444555'),
(2, 'Ervin Howell', 'Shanna@melissa.tv', '$2y$10$A463NeQ.1pA6nnljvj6KQOSfqgk4qZdAxJv6sMV5jBzO36egWrAJe', 1, 'Victor Plains Suite 879', '90566-7771', 'Wisokyburgh', 'us', '010-692-6593 x09125'),
(3, 'Clementine Bauch', 'Nathan@yesenia.net', '$2y$10$QIi.iS9/di2xqRloVGkx3OkaHjxJk5uz.gD6LBfiDDVeGY5894Si.', 1, 'Douglas Extension Suite 847', '59590-4157', 'McKenziehaven', 'br', '1-463-123-4447'),
(14, 'Leanne Graham', 'Sincere@april.biz', '$2y$10$fnJdd895ClYXovaJJnhPq.ElAb2C0h.XctX422V66mQ/pVQV5AsM2', 1, 'Kulas Light Apt. 556', '92998-3874', 'Gwenborough', 'us', '1-770-736-8031 x56442'),
(15, 'Ervin Howell', 'Shanna@melissa.tv', '$2y$10$HgGwFr1TmabhPdAeRPBHROnmSw05XtmSw3Vv0qs9dUaKfiEAwxgTa', 1, 'Victor Plains Suite 879', '90566-7771', 'Wisokyburgh', 'us', '010-692-6593 x09125'),
(16, 'Clementine Bauch', 'Nathan@yesenia.net', '$2y$10$.I/A6gQYEA2pu8Zxk.5LnuXR6Tphvh5a0/hzeeU1vuTYu1j8iA6zi', 1, 'Douglas Extension Suite 847', '59590-4157', 'McKenziehaven', 'us', '1-463-123-4447'),
(17, 'Patricia Lebsack', 'Julianne.OConner@kory.org', '$2y$10$cPWPYevzGbLFm6TxEtrJzO8waKkKBwD62il3UQdkU9T.WqEsDLBWu', 1, 'Hoeger Mall Apt. 692', '53919-4257', 'South Elvis', 'us', '493-170-9623 x156'),
(18, 'Chelsey Dietrich', 'Lucio_Hettinger@annie.ca', '$2y$10$lJyGfRjsK2sAGe.vJ3S/feoC0Opv70O390aFz5Dm2sA9WWaQGMcU6', 1, 'Skiles Walks Suite 351', '33263', 'Roscoeview', 'us', '(254)954-1289'),
(19, 'Mrs. Dennis Schulist', 'Karley_Dach@jasper.info', '$2y$10$1Dynn0.IEq4rXpLNRjHK6u3/SI7nt7XC6qZlqwhnS4e0n9Iqkea0e', 1, 'Norberto Crossing Apt. 950', '23505-1337', 'South Christy', 'us', '1-477-935-8478 x6430'),
(20, 'Kurtis Weissnat', 'Telly.Hoeger@billy.biz', '$2y$10$cR4pMuuXAJ233QkuF.QrZ.ZHlMOt/lAHrFtu6DTB0ynDxZ65qrebq', 1, 'Rex Trail Suite 280', '58804-1099', 'Howemouth', 'us', '210.067.6132'),
(21, 'Nicholas Runolfsdottir V', 'Sherwood@rosamond.me', '$2y$10$TLXBJ2AyGMnXsJprFeijqu3abnGiK90H28R/Y3D2gypvlanyzJX2G', 1, 'Ellsworth Summit Suite 729', '45169', 'Aliyaview', 'us', '586.493.6943 x140'),
(22, 'Glenna Reichert', 'Chaim_McDermott@dana.io', '$2y$10$./BJP3ooBceK4fCAkSRmXecq52B3MMjeg5Q/toz/sVH3GX7oPOn82', 1, 'Dayna Park Suite 449', '76495-3109', 'Bartholomebury', 'us', '(775)976-6794 x41206'),
(23, 'Clementina DuBuque', 'Rey.Padberg@karina.biz', '$2y$10$c4ggyo8IJDORGaAgf.Q.4.UreTbe10GIrYVQtZ.R2WU31LLZ4Ntpm', 1, 'Kattie Turnpike Suite 198', '31428-2261', 'Lebsackbury', 'us', '024-648-3804'),
(24, 'Carlos António', 'coiso@cenas.pt', '', 0, 'Algures por aí', '1234-567', 'Cacém', 'pt', '213444555');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_code`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
