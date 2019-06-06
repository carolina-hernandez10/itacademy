-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2019 at 01:19 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glasses`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL,
  `nameCustomer` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `registerDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `nameCustomer`, `address`, `mobile`, `email`, `registerDate`) VALUES
(1, 'Maria Lopez', 'Calle Pelai,2 7 3', '617803456', 'maria@mail.com', '2019-06-06'),
(2, 'Claudia Perez', 'Calle Rosello 3 6 2', '607495837', 'claudia@mail.com', '2019-06-06'),
(3, 'Laura Morat', 'Calle Buenos Aires 3, 2 2', '634029384', 'laura@mail.com', '2019-06-06'),
(4, 'Pedro Milano', 'Calle Diputacio 605, 3 5', '609382719', 'pedro@mail.com', '2019-06-06'),
(5, 'Daniel Hidalgo', 'Calle Pablo Neruda 4, 2 3', '620938467', 'daniel@mail.com', '2019-06-06'),
(6, 'Ignaci Vilaseca', 'Avinguda Sarria 230, 5 2', '980738492', 'ignaci@mail.com', '2019-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `customerrecommendations`
--

CREATE TABLE `customerrecommendations` (
  `dateIntroducing` date DEFAULT NULL,
  `Customer_idCustomer` int(11) NOT NULL,
  `Customer_idCustomerRecommend` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customerrecommendations`
--

INSERT INTO `customerrecommendations` (`dateIntroducing`, `Customer_idCustomer`, `Customer_idCustomerRecommend`) VALUES
('2019-06-06', 1, 6),
('2019-06-06', 1, 5),
('2019-06-06', 1, 3),
('2019-06-06', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `idEmployee` int(11) NOT NULL,
  `nameEmployee` varchar(45) DEFAULT NULL,
  `emailEmployee` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`idEmployee`, `nameEmployee`, `emailEmployee`) VALUES
(1, 'Albert', 'albert.glasses@mail.com'),
(2, 'Luis', 'luis.glasses@mail.com'),
(3, 'Sergio', 'sergio.glasses@mail.com'),
(4, 'Alba', 'alba.glasses@mail.com'),
(5, 'Lucia', 'lucia.glasses@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `frame`
--

CREATE TABLE `frame` (
  `idFrame` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `frameColor` varchar(45) DEFAULT NULL,
  `glassColor` varchar(45) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frame`
--

INSERT INTO `frame` (`idFrame`, `type`, `frameColor`, `glassColor`, `price`) VALUES
(1, 'Montura Completa Plastico', 'Azul', 'Transparente', '100'),
(2, 'Montura Parcial Plastico', 'Azul', 'Transparente', '100'),
(3, 'Montura Invisible', 'Azul', 'Transparente', '100'),
(4, 'Montura Completa Aluminio', 'Azul', 'Transparente', '100'),
(5, 'Montura Invisible', 'Verde', 'Transparente', '100'),
(6, 'Montura Completa Plastico', 'Roja', 'Transparente', '100'),
(7, 'Montura Parcial Plastico', 'Roja', 'Transparente', '100'),
(8, 'Montura Invisible', 'Roja', 'Transparente', '100'),
(9, 'Montura Completa Aluminio', 'Roja', 'Transparente', '100'),
(10, 'Montura Invisible', 'Morada', 'Transparente', '100'),
(11, 'Montura Completa Plastico', 'Verde', 'Transparente', '100'),
(12, 'Montura Parcial Plastico', 'Verde', 'Transparente', '100'),
(13, 'Montura Invisible', 'Verde', 'Transparente', '100'),
(14, 'Montura Completa Aluminio', 'Verde', 'Transparente', '100'),
(15, 'Montura Invisible', 'Rosa', 'Transparente', '100');

-- --------------------------------------------------------

--
-- Table structure for table `glasses`
--

CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `glassesGraduationRE` varchar(8) DEFAULT NULL,
  `glassesGraduationLE` varchar(8) DEFAULT NULL,
  `Frame_idFrame` int(11) NOT NULL,
  `Provider_idProvider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `glasses`
--

INSERT INTO `glasses` (`idGlasses`, `brand`, `glassesGraduationRE`, `glassesGraduationLE`, `Frame_idFrame`, `Provider_idProvider`) VALUES
(1, 'Vogue', '-1.5', '-1.5', 1, 2),
(2, 'Prada', '-2.5', '-2.5', 2, 1),
(3, 'Ray-Ban', '-3.5', '-3.5', 3, 2),
(4, 'Guess', '-4.5', '-4.5', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `Customer_idCustomer` int(11) NOT NULL,
  `Employee_idEmployee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`idInvoice`, `date`, `Customer_idCustomer`, `Employee_idEmployee`) VALUES
(1, '2019-06-06 10:40:40', 1, 1),
(2, '2019-06-06 10:40:40', 2, 3),
(3, '2019-06-06 10:40:40', 3, 2),
(4, '2019-06-06 10:40:40', 4, 5),
(5, '2019-06-06 10:40:40', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `idInvoiceDetail` int(11) NOT NULL,
  `Glasses_idGlasses` int(11) NOT NULL,
  `Invoice_idInvoice` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoicedetail`
--

INSERT INTO `invoicedetail` (`idInvoiceDetail`, `Glasses_idGlasses`, `Invoice_idInvoice`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `idProvider` int(11) NOT NULL,
  `nameProvider` varchar(60) DEFAULT NULL,
  `addressStreet` varchar(45) DEFAULT NULL,
  `addressNumber` int(11) DEFAULT NULL,
  `addressFloor` int(11) DEFAULT NULL,
  `addressDoor` int(11) DEFAULT NULL,
  `addressCity` varchar(45) DEFAULT NULL,
  `addressCP` int(11) DEFAULT NULL,
  `addressCountry` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(45) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`idProvider`, `nameProvider`, `addressStreet`, `addressNumber`, `addressFloor`, `addressDoor`, `addressCity`, `addressCP`, `addressCountry`, `mobilePhone`, `fax`, `NIF`) VALUES
(1, 'Multiopticas', 'Calle Argenter', 200, 1, 1, 'Barcelona', 8012, 'Spain', '932903798', 932280799, '203920234-A'),
(2, 'LAFAM', 'Calle Viladomat', 320, 1, 1, 'Barcelona', 8012, 'Spain', '932903798', 932280799, '203920234-A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Indexes for table `customerrecommendations`
--
ALTER TABLE `customerrecommendations`
  ADD KEY `FK_Customer` (`Customer_idCustomer`) USING BTREE,
  ADD KEY `FK_CustomerRecommendations` (`Customer_idCustomerRecommend`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indexes for table `frame`
--
ALTER TABLE `frame`
  ADD PRIMARY KEY (`idFrame`);

--
-- Indexes for table `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `FK_Provider` (`Provider_idProvider`),
  ADD KEY `FK_Frame` (`Frame_idFrame`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`idInvoice`),
  ADD KEY `FK_Customer` (`Customer_idCustomer`),
  ADD KEY `FK_Employee` (`Employee_idEmployee`);

--
-- Indexes for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD PRIMARY KEY (`idInvoiceDetail`),
  ADD KEY `FK_Glasses` (`Glasses_idGlasses`),
  ADD KEY `FK_Invoice` (`Invoice_idInvoice`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`idProvider`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `idCustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `idEmployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `frame`
--
ALTER TABLE `frame`
  MODIFY `idFrame` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `glasses`
--
ALTER TABLE `glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  MODIFY `idInvoiceDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `idProvider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `FK_Frame` FOREIGN KEY (`Frame_idFrame`) REFERENCES `frame` (`idFrame`),
  ADD CONSTRAINT `FK_Provider` FOREIGN KEY (`Provider_idProvider`) REFERENCES `provider` (`idProvider`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK_Customer` FOREIGN KEY (`Customer_idCustomer`) REFERENCES `customer` (`idCustomer`),
  ADD CONSTRAINT `FK_Employee` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `employee` (`idEmployee`);

--
-- Constraints for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD CONSTRAINT `FK_Glasses` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `glasses` (`idGlasses`),
  ADD CONSTRAINT `FK_Invoice` FOREIGN KEY (`Invoice_idInvoice`) REFERENCES `invoice` (`idInvoice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
