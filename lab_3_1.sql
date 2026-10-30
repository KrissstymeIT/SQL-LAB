-- Laboratory work 3.1
-- Physical database model: company

CREATE DATABASE IF NOT EXISTS company;
USE company;
-- Create invoice table
CREATE TABLE IF NOT EXISTS `invoice` (
    `invoice_id` BIGINT NOT NULL,
    `employee_id` INT NOT NULL,
    `customer_id` INT,
    `payment_method` INT NOT NULL,
    `transaction_moment` DATETIME NOT NULL,
    `status` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`invoice_id`)
);

-- Update orders table
ALTER TABLE `orders`
ADD COLUMN `invoice_id` BIGINT NOT NULL;

ALTER TABLE `orders`
ADD COLUMN `order_datetime` DATETIME NOT NULL;

ALTER TABLE `orders`
ADD COLUMN `quantity` INT NOT NULL;

ALTER TABLE `orders`
DROP COLUMN `transaction_type`;

ALTER TABLE `orders`
DROP COLUMN `transaction_moment`;

ALTER TABLE `orders`
DROP COLUMN `amount`;

-- Update customer and employee attributes
ALTER TABLE `customer`
MODIFY COLUMN `phone_number` BIGINT NOT NULL;

ALTER TABLE `employee`
MODIFY COLUMN `position` VARCHAR(30) NOT NULL;

-- Update department constraints
ALTER TABLE `department`
MODIFY COLUMN `street` VARCHAR(50) NOT NULL;

ALTER TABLE `department`
MODIFY COLUMN `building_no` INT NULL;

-- Add foreign keys for invoice and orders

ALTER TABLE `invoice`
ADD CONSTRAINT `fk_invoice_employee`
FOREIGN KEY (`employee_id`)
REFERENCES `employee` (`employee_id`);

ALTER TABLE `invoice`
ADD CONSTRAINT `fk_invoice_customer`
FOREIGN KEY (`customer_id`)
REFERENCES `customer` (`customer_id`);

ALTER TABLE `orders`
ADD CONSTRAINT `fk_orders_invoice`
FOREIGN KEY (`invoice_id`)
REFERENCES `invoice` (`invoice_id`);

-- Add UNIQUE constraint
ALTER TABLE `employee`
ADD CONSTRAINT `uq_employee_username`
UNIQUE (`user_name`);

-- Set default city
ALTER TABLE `department`
ALTER COLUMN `city` SET DEFAULT 'Lviv';
