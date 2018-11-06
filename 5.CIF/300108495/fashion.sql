-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fashion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fashion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fashion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `fashion` ;

-- -----------------------------------------------------
-- Table `fashion`.`Clothing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`Clothing` (
  `idClothing` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Shirts` VARCHAR(45) NULL,
  `Outwear` VARCHAR(45) NULL,
  `pants` VARCHAR(45) NULL,
  `skirts` VARCHAR(45) NULL,
  `dresses` VARCHAR(45) NULL,
  `size` INT NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`idClothing`, `name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fashion`.`outfits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`outfits` (
  `idoutfits` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `size` INT NULL,
  `style` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idoutfits`, `style`),
  INDEX `style_name_idx` (`style` ASC) VISIBLE,
  CONSTRAINT `idClothing`
    FOREIGN KEY (`idoutfits`)
    REFERENCES `fashion`.`Clothing` (`idClothing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `style_name`
    FOREIGN KEY (`style`)
    REFERENCES `fashion`.`scarves` (`length`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fashion`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`client` (
  `idclient` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `payment_info` INT NULL,
  PRIMARY KEY (`idclient`, `firstname`, `lastname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fashion`.`scarves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`scarves` (
  `idscarves` INT NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `width` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NULL,
  `material_type` VARCHAR(45) NULL,
  `style_name` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  PRIMARY KEY (`idscarves`, `length`, `width`),
  INDEX `_idx` (`length` ASC, `width` ASC) VISIBLE,
  CONSTRAINT `idoutfits`
    FOREIGN KEY (`idscarves`)
    REFERENCES `fashion`.`outfits` (`idoutfits`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ``
    FOREIGN KEY (`length` , `width`)
    REFERENCES `fashion`.`client` (`firstname` , `firstname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fashion`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`payment` (
  `idpayment` INT NOT NULL,
  `client_info` VARCHAR(45) NULL,
  PRIMARY KEY (`idpayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fashion`.`shippment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fashion`.`shippment` (
  `idshippment` INT NOT NULL,
  `client_address` INT NULL,
  `contract` VARCHAR(45) NULL,
  `date_of_shippement` DATE NULL,
  PRIMARY KEY (`idshippment`),
  INDEX `idclient_idx` (`client_address` ASC) VISIBLE,
  CONSTRAINT `idclient`
    FOREIGN KEY (`client_address`)
    REFERENCES `fashion`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client_address`
    FOREIGN KEY (`client_address`)
    REFERENCES `fashion`.`payment` (`idpayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
