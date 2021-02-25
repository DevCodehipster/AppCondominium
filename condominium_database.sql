-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-02-2021 a las 20:36:43
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `condominium_database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_list`
--

CREATE TABLE `account_list` (
  `id_account` int(11) NOT NULL COMMENT 'Account ID',
  `account_bank` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Account bank',
  `account_number` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Account number',
  `account_clabe` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Account CLABE',
  `account_name` varchar(300) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Account fullname',
  `account_payment_reference` varchar(20) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Account payment reference',
  `account_creation_date` datetime NOT NULL COMMENT 'Account creation date',
  `account_created_by` int(11) NOT NULL COMMENT 'Account created by user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condominiums`
--

CREATE TABLE `condominiums` (
  `id_condominium` int(11) NOT NULL COMMENT 'Condominium ID',
  `condominium_name` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Condominium name',
  `condominium_creation_date` datetime NOT NULL COMMENT 'Condominium creation date',
  `condominium_created_by` int(11) NOT NULL COMMENT 'Condominium created by user',
  `condominium_last_modification_date` datetime NOT NULL COMMENT 'Condominium last modification date',
  `condominium_last_modication_by` int(11) NOT NULL COMMENT 'Condominium last modification by user',
  `condominium_status` int(11) NOT NULL COMMENT 'Condominium status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL COMMENT 'Message ID',
  `message_text` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Message text',
  `message_type` int(11) NOT NULL COMMENT 'Message type',
  `message_image` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Message image',
  `message_referenced_to` int(11) NOT NULL COMMENT 'Message linked to another message',
  `message_creation_date` datetime NOT NULL COMMENT 'Message creation date',
  `message_created_by` int(11) NOT NULL COMMENT 'Message created by user',
  `message_status` char(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Message status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_list`
--

CREATE TABLE `payment_list` (
  `id_payment` int(11) NOT NULL COMMENT 'Payment ID',
  `payment_type_id` int(11) NOT NULL COMMENT 'Payment type',
  `payment_made_date` datetime NOT NULL COMMENT 'Date of made payment',
  `payment_made_by` int(11) NOT NULL COMMENT 'User that made payment',
  `payment_quantity` float NOT NULL COMMENT 'Quantity of payment',
  `payment_status` int(11) NOT NULL COMMENT 'Payment status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_types`
--

CREATE TABLE `payment_types` (
  `id_payment_type` int(11) NOT NULL COMMENT 'Payment type ID',
  `payment_type_name` varchar(200) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Payment name',
  `payment_type_creation_date` datetime NOT NULL COMMENT 'Payment creation date',
  `payment_type_created_by` int(11) NOT NULL COMMENT 'Payment created by user',
  `payment_type_status` char(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Payment status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL COMMENT 'User ID',
  `condominium_id` int(11) NOT NULL COMMENT 'User condomominium ID',
  `username` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Username',
  `user_password` text COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User password',
  `user_names` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User names',
  `user_lastnames` varchar(50) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User lastname',
  `user_email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User email',
  `user_type` char(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User type',
  `user_creation_date` datetime NOT NULL COMMENT 'User creation date',
  `user_created_by` int(11) NOT NULL COMMENT 'User created by user',
  `user_last_modification_date` datetime NOT NULL COMMENT 'User last modification date',
  `user_last_modification_by` int(11) NOT NULL COMMENT 'User last modified by user',
  `user_status` char(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'User status 1.- Active 2.- Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account_list`
--
ALTER TABLE `account_list`
  ADD PRIMARY KEY (`id_account`),
  ADD KEY `account_created_by` (`account_created_by`);

--
-- Indices de la tabla `condominiums`
--
ALTER TABLE `condominiums`
  ADD PRIMARY KEY (`id_condominium`),
  ADD KEY `condominium_created_by` (`condominium_created_by`),
  ADD KEY `condominium_last_modication_by` (`condominium_last_modication_by`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD KEY `message_created_by` (`message_created_by`);

--
-- Indices de la tabla `payment_list`
--
ALTER TABLE `payment_list`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `payment_type_id` (`payment_type_id`),
  ADD KEY `payment_made_by` (`payment_made_by`);

--
-- Indices de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id_payment_type`),
  ADD KEY `payment_type_created_by` (`payment_type_created_by`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `condominium_id` (`condominium_id`),
  ADD KEY `user_last_modification_by` (`user_last_modification_by`),
  ADD KEY `user_created_by` (`user_created_by`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account_list`
--
ALTER TABLE `account_list`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Account ID';

--
-- AUTO_INCREMENT de la tabla `condominiums`
--
ALTER TABLE `condominiums`
  MODIFY `id_condominium` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Condominium ID';

--
-- AUTO_INCREMENT de la tabla `payment_list`
--
ALTER TABLE `payment_list`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Payment ID';

--
-- AUTO_INCREMENT de la tabla `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id_payment_type` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Payment type ID';

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User ID';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `condominiums`
--
ALTER TABLE `condominiums`
  ADD CONSTRAINT `condominiums_ibfk_1` FOREIGN KEY (`condominium_created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `condominiums_ibfk_2` FOREIGN KEY (`condominium_last_modication_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`message_created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payment_list`
--
ALTER TABLE `payment_list`
  ADD CONSTRAINT `payment_list_ibfk_1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `payment_list_ibfk_2` FOREIGN KEY (`payment_made_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payment_types`
--
ALTER TABLE `payment_types`
  ADD CONSTRAINT `payment_types_ibfk_1` FOREIGN KEY (`payment_type_created_by`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`condominium_id`) REFERENCES `condominiums` (`id_condominium`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
