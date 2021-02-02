-- -----------------------------------------------------
-- Schema Beauty&Beast
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Beauty&Beast` DEFAULT CHARACTER SET utf8 ;
USE `Beauty&Beast` ;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`customer` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address_street` VARCHAR(45) NOT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_state` VARCHAR(45) NOT NULL,
  `address_zip` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL DEFAULT "123",
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`business`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`customer_business` (
  `customer_ID` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `business_volume` INT NOT NULL,
  PRIMARY KEY (`customer_ID`),
  CONSTRAINT `fk_customer_business`
    FOREIGN KEY (`customer_ID`)
    REFERENCES `Beauty&Beast`.`customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`home`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`customer_home` (
  `customer_ID` INT NOT NULL,
  `marriage` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `income` INT NOT NULL,
  PRIMARY KEY (`customer_ID`),
  CONSTRAINT `fk_customer_home`
    FOREIGN KEY (`customer_ID`)
    REFERENCES `Beauty&Beast`.`customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`product` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `inventory_amount` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `active` ENUM('1', '0') NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`region` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `manager_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`store` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NOT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_state` VARCHAR(45) NOT NULL,
  `address_zip` VARCHAR(45) NOT NULL,
  `manager_name` VARCHAR(45) NOT NULL,
  `salesperson_amount` INT NOT NULL,
  `region_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_store_region`
    FOREIGN KEY (`region_ID`)
    REFERENCES `Beauty&Beast`.`region` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`salesperson` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address_street` VARCHAR(45) NOT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_state` VARCHAR(45) NOT NULL,
  `address_zip` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL DEFAULT "123",
  `job_title` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  `store_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_salesperson_store`
    FOREIGN KEY (`store_ID`)
    REFERENCES `Beauty&Beast`.`store` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`transaction` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` TIMESTAMP NOT NULL,
  `customer_ID` INT NOT NULL,
  `salesperson_ID` INT NOT NULL,
  `payment_amount` DECIMAL(10,2),
  `payment_method` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_transaction_customer` (`customer_ID`),
  KEY `fk_transaction_salesperson` (`salesperson_ID`),
  CONSTRAINT `fk_transaction_ID` 
    FOREIGN KEY (`ID`) 
    REFERENCES `itemSold` (`transaction_ID`) 
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_customer`
    FOREIGN KEY (`customer_ID`)
    REFERENCES `Beauty&Beast`.`customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_salesperson`
    FOREIGN KEY (`salesperson_ID`)
    REFERENCES `Beauty&Beast`.`salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Beauty&Beast`.`itemSold`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Beauty&Beast`.`itemSold` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_ID` INT NOT NULL,
  `product_ID` INT NOT NULL,
  `quantity` INT NOT NULL,
  `sale` DECIMAL(10,2),
  PRIMARY KEY (`ID`, `product_ID`),
  KEY `fk_order_product` (`product_ID`),
  KEY `fk_transaction_ID` (`transaction_ID`),
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`product_ID`)
    REFERENCES `Beauty&Beast`.`product` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
