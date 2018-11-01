-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema service_a_la_personne
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema service_a_la_personne
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `service_a_la_personne` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `service_a_la_personne` ;

-- -----------------------------------------------------
-- Table `service_a_la_personne`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_a_la_personne`.`client` (
  `idcategorie` INT(11) NOT NULL,
  `femme` VARCHAR(45) NULL DEFAULT NULL,
  `homme` VARCHAR(45) NULL DEFAULT NULL,
  `jeunes` VARCHAR(45) NULL DEFAULT NULL,
  `seniors` VARCHAR(45) NULL DEFAULT NULL,
  `tarif_prix` INT(11) NULL DEFAULT NULL,
  `service_proposer` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcategorie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `service_a_la_personne`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_a_la_personne`.`service` (
  `idcategorie` INT(11) NOT NULL,
  `restauration` VARCHAR(45) NULL DEFAULT NULL,
  `courses` VARCHAR(45) NULL DEFAULT NULL,
  `discussion` VARCHAR(45) NULL DEFAULT NULL,
  `garderie` VARCHAR(45) NULL DEFAULT NULL,
  `soutient_scolaire` VARCHAR(45) NULL DEFAULT NULL,
  `vigilance` VARCHAR(45) NULL DEFAULT NULL,
  `pet` VARCHAR(45) NULL DEFAULT NULL,
  `soin` VARCHAR(45) NULL DEFAULT NULL,
  `langue` VARCHAR(45) NULL DEFAULT NULL,
  `soutien_administratif` VARCHAR(45) NULL DEFAULT NULL,
  `bricolage` VARCHAR(45) NULL DEFAULT NULL,
  `autres` VARCHAR(45) NULL DEFAULT NULL,
  `entretien_du_domicile` VARCHAR(45) NULL DEFAULT NULL,
  `tarif_prix` INT(11) NULL DEFAULT NULL,
  `client_idcategorie` INT(11) NOT NULL,
  PRIMARY KEY (`idcategorie`, `client_idcategorie`),
  INDEX `fk_service_client_idx` (`client_idcategorie` ASC) VISIBLE,
  CONSTRAINT `fk_service_client`
    FOREIGN KEY (`client_idcategorie`)
    REFERENCES `service_a_la_personne`.`client` (`idcategorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `service_a_la_personne`.`tarif`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `service_a_la_personne`.`tarif` (
  `idcategorie` INT(11) NOT NULL,
  `heures` VARCHAR(45) NULL DEFAULT NULL,
  `forfait` VARCHAR(45) NULL DEFAULT NULL,
  `abonement` VARCHAR(45) NULL DEFAULT NULL,
  `service_idcategorie` INT(11) NOT NULL,
  `service_client_idcategorie` INT(11) NOT NULL,
  PRIMARY KEY (`idcategorie`, `service_idcategorie`, `service_client_idcategorie`),
  INDEX `fk_tarif_service1_idx` (`service_idcategorie` ASC, `service_client_idcategorie` ASC) VISIBLE,
  CONSTRAINT `fk_tarif_service1`
    FOREIGN KEY (`service_idcategorie` , `service_client_idcategorie`)
    REFERENCES `service_a_la_personne`.`service` (`idcategorie` , `client_idcategorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
