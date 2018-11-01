-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema premiere
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema premiere
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `premiere` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `premiere` ;

-- -----------------------------------------------------
-- Table `premiere`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Client` (
  `id` INT(11) NOT NULL,
  `idClient` INT(11) NOT NULL,
  `idCommande` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `idClient`, `idCommande`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premiere`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Commande` (
  `id` INT(11) NOT NULL,
  `Dejeuner_id` INT(11) NOT NULL,
  `Souper_id` INT(11) NOT NULL,
  `Client_idClient` INT(11) NULL DEFAULT NULL,
  `Client_idCommande` INT(11) NULL DEFAULT NULL,
  `tarif` VARCHAR(45) NOT NULL,
  `Client_id` INT(11) NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`id`, `tarif`, `Client_id`, `Dejeuner_id`, `Souper_id`),
  INDEX `fk_Commande_Client1_idx` (`Client_id` ASC) VISIBLE,
  CONSTRAINT `fk_Commande_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `premiere`.`Client` (`id`)
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
  PRIMARY KEY (`id`),
  INDEX `fk_Dejeuner_Commande1_idx` (`Commande_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dejeuner_Commande1`
    FOREIGN KEY (`Commande_id`)
    REFERENCES `premiere`.`Commande` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
  PRIMARY KEY (`id`),
  INDEX `fk_Souper_Commande_idx` (`Commande_id` ASC) VISIBLE,
  CONSTRAINT `fk_Souper_Commande`
    FOREIGN KEY (`Commande_id`)
    REFERENCES `premiere`.`Commande` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `premiere`.`Tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `premiere`.`Tarif` (
  `id` INT(11) NOT NULL,
  `idTarif` INT(11) NULL DEFAULT NULL,
  `Commande_id` INT(11) NOT NULL,
  `Commande_tarif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `Commande_id`, `Commande_tarif`),
  INDEX `fk_Tarif_Commande1_idx` (`Commande_id` ASC, `Commande_tarif` ASC) VISIBLE,
  CONSTRAINT `fk_Tarif_Commande1`
    FOREIGN KEY (`Commande_id` , `Commande_tarif`)
    REFERENCES `premiere`.`Commande` (`id` , `tarif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
