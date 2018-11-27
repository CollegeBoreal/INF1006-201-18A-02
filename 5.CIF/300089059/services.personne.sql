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
-- Table `services_personnes`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Clients` (
  `idClients` INT(11) NOT NULL,
  `genres` VARCHAR(45) NULL DEFAULT NULL,
  `prenom` VARCHAR(45) NULL DEFAULT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `age` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `contact` VARCHAR(45) NULL DEFAULT NULL,
  `tarif` INT(11) NULL DEFAULT NULL,
  `services` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`Tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Tarif` (
  `idTarif` INT(11) NOT NULL,
  `temps` VARCHAR(45) NULL DEFAULT NULL,
  `forfait` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTarif`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`Horaires`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Horaires` (
  `idHoraires` INT(11) NOT NULL,
  `Tarif_idTarif` INT(11) NOT NULL,
  PRIMARY KEY (`idHoraires`),
  INDEX `fk_Horaires_Tarif1_idx` (`Tarif_idTarif` ASC) VISIBLE,
  CONSTRAINT `fk_Horaires_Tarif1`
    FOREIGN KEY (`Tarif_idTarif`)
    REFERENCES `services_personnes`.`Tarif` (`idTarif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`Zone_geographique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Zone_geographique` (
  `idZone_geographique` INT(11) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `code_postal` VARCHAR(45) NULL DEFAULT NULL,
  `province` VARCHAR(45) NULL DEFAULT NULL,
  `Tarif_idTarif` INT(11) NOT NULL,
  PRIMARY KEY (`idZone_geographique`),
  INDEX `fk_Zone_geographique_Tarif1_idx` (`Tarif_idTarif` ASC) VISIBLE,
  CONSTRAINT `fk_Zone_geographique_Tarif1`
    FOREIGN KEY (`Tarif_idTarif`)
    REFERENCES `services_personnes`.`Tarif` (`idTarif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Services` (
  `idServices` INT(11) NOT NULL,
  `noms` VARCHAR(45) NULL DEFAULT NULL,
  `tarif` INT(11) NULL DEFAULT NULL,
  `Clients_idClients` INT(11) NOT NULL,
  `Zone_geographique_idZone_geographique` INT(11) NOT NULL,
  PRIMARY KEY (`idServices`),
  INDEX `fk_Services_Clients_idx` (`Clients_idClients` ASC) VISIBLE,
  INDEX `fk_Services_Zone_geographique1_idx` (`Zone_geographique_idZone_geographique` ASC) VISIBLE,
  CONSTRAINT `fk_Services_Clients`
    FOREIGN KEY (`Clients_idClients`)
    REFERENCES `services_personnes`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Services_Zone_geographique1`
    FOREIGN KEY (`Zone_geographique_idZone_geographique`)
    REFERENCES `services_personnes`.`Zone_geographique` (`idZone_geographique`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `services_personnes`.`Langues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `services_personnes`.`Langues` (
  `idLangues` VARCHAR(45) NOT NULL,
  `noms` VARCHAR(45) NULL DEFAULT NULL,
  `Services_idServices` INT(11) NOT NULL,
  PRIMARY KEY (`idLangues`),
  INDEX `fk_Langues_Services1_idx` (`Services_idServices` ASC) VISIBLE,
  CONSTRAINT `fk_Langues_Services1`
    FOREIGN KEY (`Services_idServices`)
    REFERENCES `services_personnes`.`Services` (`idServices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
