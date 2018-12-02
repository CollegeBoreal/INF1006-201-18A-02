-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema services_personnes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema services_personnes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `services_personnes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `services_personnes` ;

-- -----------------------------------------------------
-- Table `services_personnes`.`CLIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`CLIENTS` (
  `idclient` INT(11) NOT NULL,
  `genres` VARCHAR(45) NULL DEFAULT NULL,
  `prenom` VARCHAR(45) NULL DEFAULT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `age` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `contact` VARCHAR(45) NULL DEFAULT NULL,
  `tarif` INT(11) NULL DEFAULT NULL,
  `services` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`LANGUES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`LANGUES` (
  `idlangues` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlangues`),
  UNIQUE INDEX `noms_UNIQUE` (`nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`HORAIRES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`HORAIRES` (
  `idhoraires` INT(11) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `LANGUES_idlangues` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhoraires`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE,
  INDEX `fk_HORAIRES_LANGUES1_idx` (`LANGUES_idlangues` ASC) VISIBLE,
  CONSTRAINT `fk_HORAIRES_LANGUES1`
    FOREIGN KEY (`LANGUES_idlangues`)
    REFERENCES `services_personnes`.`LANGUES` (`idlangues`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`SERVICES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`SERVICES` (
  `idservices` INT(11) NOT NULL,
  `noms` VARCHAR(45) NOT NULL,
  `tarif` INT(11) NOT NULL,
  `CLIENTS_idclient` INT(11) NOT NULL,
  PRIMARY KEY (`idservices`),
  UNIQUE INDEX `noms_UNIQUE` (`noms` ASC) VISIBLE,
  INDEX `fk_SERVICES_CLIENTS_idx` (`CLIENTS_idclient` ASC) VISIBLE,
  CONSTRAINT `fk_SERVICES_CLIENTS`
    FOREIGN KEY (`CLIENTS_idclient`)
    REFERENCES `services_personnes`.`CLIENTS` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`TARIF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`TARIF` (
  `idtarif` INT(11) NOT NULL,
  `temps` VARCHAR(45) NULL DEFAULT NULL,
  `forfait` VARCHAR(45) NULL DEFAULT NULL,
  `SERVICES_idservices` INT(11) NOT NULL,
  `HORAIRES_idhoraires` INT(11) NOT NULL,
  PRIMARY KEY (`idtarif`),
  INDEX `fk_TARIF_SERVICES1_idx` (`SERVICES_idservices` ASC) VISIBLE,
  INDEX `fk_TARIF_HORAIRES1_idx` (`HORAIRES_idhoraires` ASC) VISIBLE,
  CONSTRAINT `fk_TARIF_SERVICES1`
    FOREIGN KEY (`SERVICES_idservices`)
    REFERENCES `services_personnes`.`SERVICES` (`idservices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TARIF_HORAIRES1`
    FOREIGN KEY (`HORAIRES_idhoraires`)
    REFERENCES `services_personnes`.`HORAIRES` (`idhoraires`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`ZONE_GEOGRAPHIQUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`ZONE_GEOGRAPHIQUE` (
  `idzone_geographique` INT(11) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `code_postal` VARCHAR(45) NULL DEFAULT NULL,
  `province` VARCHAR(45) NULL DEFAULT NULL,
  `tarif` INT(11) NULL DEFAULT NULL,
  `CLIENTS_idclient` INT(11) NOT NULL,
  PRIMARY KEY (`idzone_geographique`),
  INDEX `fk_ZONE_GEOGRAPHIQUE_CLIENTS1_idx` (`CLIENTS_idclient` ASC) VISIBLE,
  CONSTRAINT `fk_ZONE_GEOGRAPHIQUE_CLIENTS1`
    FOREIGN KEY (`CLIENTS_idclient`)
    REFERENCES `services_personnes`.`CLIENTS` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
