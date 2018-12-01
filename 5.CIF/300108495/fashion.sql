-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fashion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fashion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `fashion` ;

-- -----------------------------------------------------


-- -----------------------------------------------------

USE `fashion` ;

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`country` (
  `country_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(50) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 110
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`city` (
  `city_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  `country_id` SMALLINT(5) UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  INDEX `idx_fk_country_id` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `fashion`.`country` (`country_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 601
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`address` (
  `address_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `district` VARCHAR(20) NOT NULL,
  `city_id` SMALLINT(5) UNSIGNED NOT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `location` GEOMETRY NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  INDEX `idx_fk_city_id` (`city_id` ASC) VISIBLE,
  SPATIAL INDEX `idx_location` (`location`) VISIBLE,
  CONSTRAINT `fk_address_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `fashion`.`city` (`city_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 606
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `fashion`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`Store` (
  `idStore` INT(11) NOT NULL,
  `ManagerStaff` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idStore`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`payment` (
  `idpayment` INT(11) NOT NULL,
  `process` VARCHAR(45) NULL DEFAULT NULL,
  `info` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sakila`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`staff` (
  `staff_id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_id` SMALLINT(5) UNSIGNED NOT NULL,
  `picture` BLOB NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `store_id` TINYINT(3) UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `username` VARCHAR(16) NOT NULL,
  `password` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Store_idStore` INT NOT NULL,
  `payment_idpayment` INT(11) NOT NULL,
  PRIMARY KEY (`staff_id`, `Store_idStore`, `payment_idpayment`),
  INDEX `fk_staff_Store1_idx` (`Store_idStore` ASC) VISIBLE,
  INDEX `fk_staff_payment1_idx` (`payment_idpayment` ASC) VISIBLE,
  CONSTRAINT `fk_staff_Store1`
    FOREIGN KEY (`Store_idStore`)
    REFERENCES `fashion`.`Store` (`idStore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_payment1`
    FOREIGN KEY (`payment_idpayment`)
    REFERENCES `fashion`.`payment` (`idpayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`store` (
  `store_id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_staff_id` TINYINT(3) UNSIGNED NOT NULL,
  `address_id` SMALLINT(5) UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `idx_unique_manager` (`manager_staff_id` ASC) VISIBLE,
  INDEX `idx_fk_address_id` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `sakila`.`address` (`address_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff`
    FOREIGN KEY (`manager_staff_id`)
    REFERENCES `fashion`.`staff` (`staff_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;




-- -----------------------------------------------------
-- Table `fashion`.`Clothing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`Clothing` (
  `idClothing` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Shirts` VARCHAR(45) NULL DEFAULT NULL,
  `Outwear` VARCHAR(45) NULL DEFAULT NULL,
  `pants` VARCHAR(45) NULL DEFAULT NULL,
  `skirts` VARCHAR(45) NULL DEFAULT NULL,
  `dresses` VARCHAR(45) NULL DEFAULT NULL,
  `size` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  PRIMARY KEY (`idClothing`, `name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`address` (
  `idaddress` INT(11) NOT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idaddress`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`client` (
  `idclient` INT(11) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `payment_info` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idclient`, `firstname`, `lastname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`Shippement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`Shippement` (
  `idShippement` INT(11) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Price` INT(11) NULL DEFAULT NULL,
  `client_idclient` INT(11) NOT NULL,
  `client_firstname` VARCHAR(45) NOT NULL,
  `client_lastname` VARCHAR(45) NOT NULL,
  `address_idaddress` INT(11) NOT NULL,
  PRIMARY KEY (`idShippement`, `client_idclient`, `client_firstname`, `client_lastname`, `address_idaddress`),
  INDEX `fk_Shippement_client1_idx` (`client_idclient` ASC, `client_firstname` ASC, `client_lastname` ASC) VISIBLE,
  INDEX `fk_Shippement_address1_idx` (`address_idaddress` ASC) VISIBLE,
  CONSTRAINT `fk_Shippement_address1`
    FOREIGN KEY (`address_idaddress`)
    REFERENCES `fashion`.`address` (`idaddress`),
  CONSTRAINT `fk_Shippement_client1`
    FOREIGN KEY (`client_idclient` , `client_firstname` , `client_lastname`)
    REFERENCES `fashion`.`client` (`idclient` , `firstname` , `lastname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`Store` (
  `idStore` INT(11) NOT NULL,
  `ManagerStaff` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idStore`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`address_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`address_client` (
  `address_idaddress` INT(11) NOT NULL,
  `client_idclient` INT(11) NOT NULL,
  `client_firstname` VARCHAR(45) NOT NULL,
  `client_lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_idaddress`, `client_idclient`, `client_firstname`, `client_lastname`),
  INDEX `fk_address_has_client_client1_idx` (`client_idclient` ASC, `client_firstname` ASC, `client_lastname` ASC) VISIBLE,
  INDEX `fk_address_has_client_address1_idx` (`address_idaddress` ASC) VISIBLE,
  CONSTRAINT `fk_address_has_client_address1`
    FOREIGN KEY (`address_idaddress`)
    REFERENCES `fashion`.`address` (`idaddress`),
  CONSTRAINT `fk_address_has_client_client1`
    FOREIGN KEY (`client_idclient` , `client_firstname` , `client_lastname`)
    REFERENCES `fashion`.`client` (`idclient` , `firstname` , `lastname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`payment` (
  `idpayment` INT(11) NOT NULL,
  `process` VARCHAR(45) NULL DEFAULT NULL,
  `info` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`client_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`client_payment` (
  `client_idclient` INT(11) NOT NULL,
  `payment_idpayment` INT(11) NOT NULL,
  PRIMARY KEY (`client_idclient`, `payment_idpayment`),
  INDEX `fk_client_has_payment_payment1_idx` (`payment_idpayment` ASC) VISIBLE,
  INDEX `fk_client_has_payment_client_idx` (`client_idclient` ASC) VISIBLE,
  CONSTRAINT `fk_client_has_payment_client`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `fashion`.`client` (`idclient`),
  CONSTRAINT `fk_client_has_payment_payment1`
    FOREIGN KEY (`payment_idpayment`)
    REFERENCES `fashion`.`payment` (`idpayment`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`scarves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`scarves` (
  `idscarves` INT(11) NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `width` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `material_type` VARCHAR(45) NULL DEFAULT NULL,
  `style_name` VARCHAR(45) NULL DEFAULT NULL,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idscarves`, `length`, `width`),
  INDEX `_idx` (`length` ASC, `width` ASC) VISIBLE,
  CONSTRAINT `idoutfits`
    FOREIGN KEY (`idscarves`)
    REFERENCES `fashion`.`outfits` (`idoutfits`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fashion`.`outfits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`outfits` (
  `idoutfits` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `size` INT(11) NULL DEFAULT NULL,
  `style` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idoutfits`, `style`),
  INDEX `style_name_idx` (`style` ASC) VISIBLE,
  CONSTRAINT `idClothing`
    FOREIGN KEY (`idoutfits`)
    REFERENCES `fashion`.`Clothing` (`idClothing`),
  CONSTRAINT `style_name`
    FOREIGN KEY (`style`)
    REFERENCES `fashion`.`scarves` (`length`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

