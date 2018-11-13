-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema premiere
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema premiere
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `premiere` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adresse` (
  `idadresse` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal code` INT NULL,
  PRIMARY KEY (`idadresse`))
ENGINE = InnoDB;

USE `premiere` ;

-- -----------------------------------------------------
-- Table `premiere`.`Tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Tarif` (
  `id` INT(11) NOT NULL,
  `idTarif` INT(11) NULL DEFAULT NULL,
  `Commande_Dejeuner` INT(11) NULL DEFAULT NULL,
  `Commande_Souper` INT(11) NULL DEFAULT NULL,
  `Commande_Client_idClient` INT(11) NULL DEFAULT NULL,
  `Commande_Client_idCommande` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premiere`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Commande` (
  `id` INT(11) NOT NULL,
  `Dejeuner_id` INT(11) NULL DEFAULT NULL,
  `Souper_id` INT(11) NULL DEFAULT NULL,
  `Client_idClient` INT(11) NULL DEFAULT NULL,
  `Client_idCommande` INT(11) NULL DEFAULT NULL,
  `date` DATETIME NULL,
  `Tarif_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Tarif_id`),
  INDEX `fk_Commande_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  CONSTRAINT `fk_Commande_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `premiere`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premiere`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Client` (
  `id` INT(11) NOT NULL,
  `idClient` INT(11) NULL DEFAULT NULL,
  `idCommande` INT(11) NULL DEFAULT NULL,
  `Commande_id` INT(11) NOT NULL,
  `adresse_idadresse` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  `payement` INT NULL,
  `Tarif_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Commande_id`, `adresse_idadresse`, `Tarif_id`),
  INDEX `fk_Client_Commande_idx` (`Commande_id` ASC) VISIBLE,
  INDEX `fk_Client_adresse1_idx` (`adresse_idadresse` ASC) VISIBLE,
  INDEX `fk_Client_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Commande`
    FOREIGN KEY (`Commande_id`)
    REFERENCES `premiere`.`Commande` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_adresse1`
    FOREIGN KEY (`adresse_idadresse`)
    REFERENCES `mydb`.`adresse` (`idadresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `premiere`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premiere`.`Dejeuner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Dejeuner` (
  `id` INT(11) NOT NULL,
  `Proteines` INT(11) NULL DEFAULT NULL,
  `Fruits` VARCHAR(255) NULL DEFAULT NULL,
  `Sauces` VARCHAR(255) NULL DEFAULT NULL,
  `Glucides` VARCHAR(255) NULL DEFAULT NULL,
  `Produits_laitiers` VARCHAR(255) NULL DEFAULT NULL,
  `Commande_id` INT(11) NOT NULL,
  `Commande_Tarif_id` INT(11) NOT NULL,
  `Tarif_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Tarif_id`),
  INDEX `fk_Dejeuner_Commande1_idx` (`Commande_id` ASC, `Commande_Tarif_id` ASC) VISIBLE,
  INDEX `fk_Dejeuner_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dejeuner_Commande1`
    FOREIGN KEY (`Commande_id` , `Commande_Tarif_id`)
    REFERENCES `premiere`.`Commande` (`id` , `Tarif_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dejeuner_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `premiere`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `premiere`.`Souper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Souper` (
  `id` INT(11) NOT NULL,
  `Proteines` INT(11) NULL DEFAULT NULL,
  `Legumes` VARCHAR(255) NULL DEFAULT NULL,
  `Glucides` VARCHAR(255) NULL DEFAULT NULL,
  `Sauces` VARCHAR(255) NULL DEFAULT NULL,
  `Commande_id` INT(11) NOT NULL,
  `Commande_Tarif_id` INT(11) NOT NULL,
  `Tarif_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `Tarif_id`),
  INDEX `fk_Souper_Commande1_idx` (`Commande_id` ASC, `Commande_Tarif_id` ASC) VISIBLE,
  INDEX `fk_Souper_Tarif1_idx` (`Tarif_id` ASC) VISIBLE,
  CONSTRAINT `fk_Souper_Commande1`
    FOREIGN KEY (`Commande_id` , `Commande_Tarif_id`)
    REFERENCES `premiere`.`Commande` (`id` , `Tarif_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Souper_Tarif1`
    FOREIGN KEY (`Tarif_id`)
    REFERENCES `premiere`.`Tarif` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
