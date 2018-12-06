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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ZONE_GEOGRAPHIQUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ZONE_GEOGRAPHIQUE` (
  `idzone_geographique` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `code_postal` VARCHAR(45) NULL,
  `province` VARCHAR(45) NULL,
  PRIMARY KEY (`idzone_geographique`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SERVICES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SERVICES` (
  `idservice` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `tarif` VARCHAR(45) NULL,
  `client` VARCHAR(45) NULL,
  `ZONE_GEOGRAPHIQUE_idzone_geographique` INT NOT NULL,
  PRIMARY KEY (`idservice`),
  INDEX `fk_SERVICES_ZONE_GEOGRAPHIQUE1_idx` (`ZONE_GEOGRAPHIQUE_idzone_geographique` ASC) VISIBLE,
  CONSTRAINT `fk_SERVICES_ZONE_GEOGRAPHIQUE1`
    FOREIGN KEY (`ZONE_GEOGRAPHIQUE_idzone_geographique`)
    REFERENCES `mydb`.`ZONE_GEOGRAPHIQUE` (`idzone_geographique`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HORAIRES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HORAIRES` (
  `idhoraires` INT NOT NULL,
  PRIMARY KEY (`idhoraires`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TARIF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TARIF` (
  `idtarif` INT NOT NULL,
  `durer` VARCHAR(45) NOT NULL,
  `forfait` VARCHAR(45) NOT NULL,
  `service` VARCHAR(45) NOT NULL,
  `reduction` VARCHAR(45) NULL,
  `SERVICES_idservice` INT NOT NULL,
  `HORAIRES_idhoraires` INT NOT NULL,
  PRIMARY KEY (`idtarif`),
  UNIQUE INDEX `service_UNIQUE` (`service` ASC) VISIBLE,
  UNIQUE INDEX `forfait_UNIQUE` (`forfait` ASC) VISIBLE,
  UNIQUE INDEX `temps_UNIQUE` (`durer` ASC) VISIBLE,
  INDEX `fk_TARIF_SERVICES1_idx` (`SERVICES_idservice` ASC) VISIBLE,
  INDEX `fk_TARIF_HORAIRES1_idx` (`HORAIRES_idhoraires` ASC) VISIBLE,
  CONSTRAINT `fk_TARIF_SERVICES1`
    FOREIGN KEY (`SERVICES_idservice`)
    REFERENCES `mydb`.`SERVICES` (`idservice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TARIF_HORAIRES1`
    FOREIGN KEY (`HORAIRES_idhoraires`)
    REFERENCES `mydb`.`HORAIRES` (`idhoraires`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CLIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTS` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NOT NULL,
  `tarif` VARCHAR(45) NOT NULL,
  `SERVICES_idservice` INT NOT NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `tarif_UNIQUE` (`tarif` ASC) VISIBLE,
  UNIQUE INDEX `genres_UNIQUE` (`nom` ASC) VISIBLE,
  UNIQUE INDEX `prenom_UNIQUE` (`prenom` ASC) VISIBLE,
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE,
  UNIQUE INDEX `age_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `contact_UNIQUE` (`telephone` ASC) VISIBLE,
  INDEX `fk_CLIENTS_SERVICES_idx` (`SERVICES_idservice` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENTS_SERVICES`
    FOREIGN KEY (`SERVICES_idservice`)
    REFERENCES `mydb`.`SERVICES` (`idservice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LANGUES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LANGUES` (
  `idlangue` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `CLIENTS_idclient` INT NOT NULL,
  PRIMARY KEY (`idlangue`),
  INDEX `fk_LANGUES_CLIENTS1_idx` (`CLIENTS_idclient` ASC) VISIBLE,
  CONSTRAINT `fk_LANGUES_CLIENTS1`
    FOREIGN KEY (`CLIENTS_idclient`)
    REFERENCES `mydb`.`CLIENTS` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
