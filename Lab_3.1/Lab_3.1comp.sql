CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL DEFAULT 'Lviv',
  `street` varchar(40) NOT NULL,
  `building_no` int,
  PRIMARY KEY (`department_id`)
);

CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `position` varchar(15) NOT NULL,
  `employment_date` date NOT NULL,
  `department_id` int,
  `manager_id` int,
  `rate` float NOT NULL,
  `bonus` float,
  PRIMARY KEY (`employee_id`)
);

CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birth_date` date NOT NULL,
  `phone_number` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `discount` int,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(40) NOT NULL,
  `product_description` varchar(150) NOT NULL,
  `category` varchar(15) NOT NULL,
  `manufacture` varchar(30) NOT NULL,
  `product_type` varchar(15) NOT NULL,
  `amount` int NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE `orders` (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `transaction_type` int NOT NULL,
  `transaction_moment` datetime NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`orders_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`department_id`) REFERENCES `department`(`department_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` bigint(15) NOT NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT,
  `payment_method` INT NOT NULL,
  `transaction_moment` DATETIME NOT NULL,
  `status` varchar(10) NOT NULL
);

ALTER TABLE `orders` ADD `invoice_id` bigint(15) NOT NULL;
ALTER TABLE `orders` ADD `order_datetime` DATETIME NOT NULL;
ALTER TABLE `orders` ADD `quantity` INT NOT NULL;
ALTER TABLE `orders` DROP COLUMN `transaction_type`;
ALTER TABLE `orders` DROP COLUMN `transaction_moment`;
ALTER TABLE `orders` DROP COLUMN `amount`;

ALTER TABLE `customer` MODIFY `phone_number` BIGINT(15) NOT NULL;
ALTER TABLE `employee` MODIFY `position` varchar(30) NOT NULL;

ALTER TABLE `department` MODIFY `street` varchar(50) NOT NULL;
ALTER TABLE `department` MODIFY `building_no` INT(4);

ALTER TABLE `invoice` ADD PRIMARY KEY (`invoice_id`);

ALTER TABLE `orders` DROP FOREIGN KEY `orders_fk0`;
ALTER TABLE `orders` DROP FOREIGN KEY `orders_fk2`;
ALTER TABLE `orders` DROP COLUMN `employee_id`;
ALTER TABLE `orders` DROP COLUMN `customer_id`;
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk3` FOREIGN KEY (`invoice_id`) REFERENCES `invoice`(`invoice_id`);
ALTER TABLE `invoice` ADD CONSTRAINT `invoice_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `invoice` ADD CONSTRAINT `invoice_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

ALTER TABLE `department` ALTER `city` SET DEFAULT 'Lviv';
ALTER TABLE `employee` ADD UNIQUE (`user_name`);
