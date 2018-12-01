-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restafrique
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restafrique
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restafrique` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
USE `restafrique` ;

-- -----------------------------------------------------
-- Table `restafrique`.`TARRIFS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`TARRIFS` (
  `tarrif_plat` INT NOT NULL,
  `tarrif_delivraison` INT NULL,
  `tarrif` INT NOT NULL,
  PRIMARY KEY (`tarrif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`VENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`VENTES` (
  `vente` INT NOT NULL,
  `vente_plat` INT NOT NULL,
  PRIMARY KEY (`vente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`PLATS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`PLATS` (
  `plat` INT NOT NULL,
  `entrée` VARCHAR(45) NOT NULL,
  `plat_principal` VARCHAR(45) NOT NULL,
  `dessert` VARCHAR(45) NOT NULL,
  `boisson` VARCHAR(45) NOT NULL,
  `prix` INT NOT NULL,
  PRIMARY KEY (`plat`, `prix`),
  INDEX `fk_tarrifs_idx` (`prix` ASC) VISIBLE,
  CONSTRAINT `fk_tarrifs`
    FOREIGN KEY (`prix`)
    REFERENCES `restafrique`.`TARRIFS` (`tarrif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventes`
    FOREIGN KEY (`plat`)
    REFERENCES `restafrique`.`VENTES` (`vente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`INGREDIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`INGREDIENTS` (
  `ingredient` INT NOT NULL,
  `ingredient_plat` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_ingredients`
    FOREIGN KEY (`ingredient`)
    REFERENCES `restafrique`.`PLATS` (`plat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`CLIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`CLIENTS` (
  `client` INT NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `addresse` VARCHAR(45) NOT NULL,
  `téléphone` INT NOT NULL,
  PRIMARY KEY (`client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`COMMANDES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`COMMANDES` (
  `commande` INT NOT NULL,
  `commande_client` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`commande`),
  CONSTRAINT `fk_clients`
    FOREIGN KEY (`commande`)
    REFERENCES `restafrique`.`CLIENTS` (`client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plats`
    FOREIGN KEY (`commande`)
    REFERENCES `restafrique`.`PLATS` (`plat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`FRUITS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`FRUITS` (
  `fruit` INT NOT NULL,
  `fruit_plat` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_fruits`
    FOREIGN KEY (`fruit`)
    REFERENCES `restafrique`.`PLATS` (`plat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`ADDRESSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`ADDRESSES` (
  `addresse` INT NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `address_client` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`addresse`, `address_client`),
  CONSTRAINT `fk_clients`
    FOREIGN KEY (`addresse`)
    REFERENCES `restafrique`.`CLIENTS` (`client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restafrique`.`DELIVRAISONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restafrique`.`DELIVRAISONS` (
  `delivraison` INT NOT NULL,
  `addresse_client` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivraison`),
  CONSTRAINT `fk_addresse`
    FOREIGN KEY (`delivraison`)
    REFERENCES `restafrique`.`ADDRESSES` (`addresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
