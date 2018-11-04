-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mostafa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mostafa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mostafa` DEFAULT CHARACTER SET utf8 ;
USE `mostafa` ;

-- -----------------------------------------------------
-- Table `mostafa`.`Charcuterie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Charcuterie` (
  `Charcuterie_id` INT NOT NULL AUTO_INCREMENT,
  `Boeuf` VARCHAR(45) NULL,
  `Agneau` VARCHAR(45) NULL,
  `Poulet` VARCHAR(45) NULL,
  `Poisson` VARCHAR(45) NULL,
  PRIMARY KEY (`Charcuterie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Legumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Legumes` (
  `Legumes_id` INT NOT NULL,
  `Pomme_ de_ terre` VARCHAR(45) NULL,
  `Carottes` VARCHAR(45) NULL,
  `Onions` VARCHAR(45) NULL,
  `Citron` VARCHAR(45) NULL,
  `Olives` VARCHAR(45) NULL,
  `Courgette` VARCHAR(45) NULL,
  PRIMARY KEY (`Legumes_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Fruits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Fruits` (
  `Fruits_id` INT NOT NULL,
  `Raisins` VARCHAR(45) NULL,
  `Prune` VARCHAR(45) NULL,
  `Amandes` VARCHAR(45) NULL,
  PRIMARY KEY (`Fruits_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Plats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Plats` (
  `Plat_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Plat_id`),
  CONSTRAINT `Charcuterie_id`
    FOREIGN KEY (`Plat_id`)
    REFERENCES `mostafa`.`Charcuterie` (`Charcuterie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Legumes_id`
    FOREIGN KEY (`Plat_id`)
    REFERENCES `mostafa`.`Legumes` (`Legumes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fruits_id`
    FOREIGN KEY (`Plat_id`)
    REFERENCES `mostafa`.`Fruits` (`Fruits_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Clients` (
  `Clients_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` INT NOT NULL,
  PRIMARY KEY (`Clients_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Comandes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Comandes` (
  `Comande_id` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Comande_id`),
  CONSTRAINT `Plat_id`
    FOREIGN KEY (`Comande_id`)
    REFERENCES `mostafa`.`Plats` (`Plat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Client_id`
    FOREIGN KEY (`Comande_id`)
    REFERENCES `mostafa`.`Clients` (`Clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mostafa`.`Tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Tarif` (
  `Tarif_id` INT NOT NULL AUTO_INCREMENT,
  `Taille` INT NOT NULL,
  `Quantite` INT NOT NULL,
  PRIMARY KEY (`Tarif_id`),
  CONSTRAINT `Plat_id`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `mostafa`.`Plats` (`Plat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mostafa`.`Ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mostafa`.`Ventes` (
  `Vente_id` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Vente_id`),
  CONSTRAINT `Commande_id`
    FOREIGN KEY (`Vente_id`)
    REFERENCES `mostafa`.`Comandes` (`Comande_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Client_id`
    FOREIGN KEY (`Vente_id`)
    REFERENCES `mostafa`.`Clients` (`Clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tarif_id`
    FOREIGN KEY (`Vente_id`)
    REFERENCES `mostafa`.`Tarif` (`Tarif_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
