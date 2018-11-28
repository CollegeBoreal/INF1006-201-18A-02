-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mwl_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mwl_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mwl_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mwl_schema` ;

-- -----------------------------------------------------
-- Table `mwl_schema`.`Dejeuner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Dejeuner` (
  `idDejeuner` INT NOT NULL,
  `Fruits_Legumes` VARCHAR(45) NULL,
  `Produits_Laitier` VARCHAR(45) NULL,
  `Produits_cerealiers` VARCHAR(45) NULL,
  `Viandes_substituts` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`idDejeuner`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Souper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Souper` (
  `idSouper` INT NOT NULL,
  `Fruits_Legumes` VARCHAR(45) NULL,
  `Viandes_substituts` VARCHAR(45) NULL,
  `Produits_cerealiers` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`idSouper`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Fruits_Legumes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Fruits_Legumes` (
  `idFruits_Legumes` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  `Souper_idSouper` INT NOT NULL,
  PRIMARY KEY (`idFruits_Legumes`),
  INDEX `fk_Fruits_Legumes_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  INDEX `fk_Fruits_Legumes_Souper1_idx` (`Souper_idSouper` ASC) VISIBLE,
  CONSTRAINT `fk_Fruits_Legumes_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fruits_Legumes_Souper1`
    FOREIGN KEY (`Souper_idSouper`)
    REFERENCES `mwl_schema`.`Souper` (`idSouper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Produits_Laitier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Produits_Laitier` (
  `idProduits_Laitier` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  PRIMARY KEY (`idProduits_Laitier`),
  INDEX `fk_Produits_Laitier_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  CONSTRAINT `fk_Produits_Laitier_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Viandes_substituts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Viandes_substituts` (
  `idViandes_substituts` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  `Souper_idSouper` INT NOT NULL,
  PRIMARY KEY (`idViandes_substituts`),
  INDEX `fk_Viandes_substituts_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  INDEX `fk_Viandes_substituts_Souper1_idx` (`Souper_idSouper` ASC) VISIBLE,
  CONSTRAINT `fk_Viandes_substituts_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Viandes_substituts_Souper1`
    FOREIGN KEY (`Souper_idSouper`)
    REFERENCES `mwl_schema`.`Souper` (`idSouper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Produits_cerealiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Produits_cerealiers` (
  `idProduits_cerealiers` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  `Souper_idSouper` INT NOT NULL,
  PRIMARY KEY (`idProduits_cerealiers`),
  INDEX `fk_Produits_cerealiers_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  INDEX `fk_Produits_cerealiers_Souper1_idx` (`Souper_idSouper` ASC) VISIBLE,
  CONSTRAINT `fk_Produits_cerealiers_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produits_cerealiers_Souper1`
    FOREIGN KEY (`Souper_idSouper`)
    REFERENCES `mwl_schema`.`Souper` (`idSouper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Adresse` (
  `idAdresse` INT NOT NULL,
  `Pays` VARCHAR(45) NULL,
  `Ville` VARCHAR(45) NULL,
  `Code_postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Commande` (
  `idCommande` INT NOT NULL,
  `Quantity` VARCHAR(45) NULL,
  `Payement` INT NULL,
  `Date` DATETIME NULL,
  `Adresse_idAdresse` INT NOT NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  `Souper_idSouper` INT NOT NULL,
  PRIMARY KEY (`idCommande`, `Adresse_idAdresse`),
  INDEX `fk_Commande_Adresse1_idx` (`Adresse_idAdresse` ASC) VISIBLE,
  INDEX `fk_Commande_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  INDEX `fk_Commande_Souper1_idx` (`Souper_idSouper` ASC) VISIBLE,
  CONSTRAINT `fk_Commande_Adresse1`
    FOREIGN KEY (`Adresse_idAdresse`)
    REFERENCES `mwl_schema`.`Adresse` (`idAdresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commande_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commande_Souper1`
    FOREIGN KEY (`Souper_idSouper`)
    REFERENCES `mwl_schema`.`Souper` (`idSouper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Client` (
  `idClient` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  `Payement` VARCHAR(45) NULL,
  `Commande_idCommande` INT NOT NULL,
  `Adresse_idAdresse` INT NOT NULL,
  PRIMARY KEY (`idClient`, `Commande_idCommande`),
  INDEX `fk_Client_Commande1_idx` (`Commande_idCommande` ASC) VISIBLE,
  INDEX `fk_Client_Adresse1_idx` (`Adresse_idAdresse` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Commande1`
    FOREIGN KEY (`Commande_idCommande`)
    REFERENCES `mwl_schema`.`Commande` (`idCommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Adresse1`
    FOREIGN KEY (`Adresse_idAdresse`)
    REFERENCES `mwl_schema`.`Adresse` (`idAdresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mwl_schema`.`Sauce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mwl_schema`.`Sauce` (
  `idSauce` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Dejeuner_idDejeuner` INT NOT NULL,
  `Souper_idSouper` INT NOT NULL,
  PRIMARY KEY (`idSauce`),
  INDEX `fk_Sauce_Dejeuner1_idx` (`Dejeuner_idDejeuner` ASC) VISIBLE,
  INDEX `fk_Sauce_Souper1_idx` (`Souper_idSouper` ASC) VISIBLE,
  CONSTRAINT `fk_Sauce_Dejeuner1`
    FOREIGN KEY (`Dejeuner_idDejeuner`)
    REFERENCES `mwl_schema`.`Dejeuner` (`idDejeuner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sauce_Souper1`
    FOREIGN KEY (`Souper_idSouper`)
    REFERENCES `mwl_schema`.`Souper` (`idSouper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
