-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema datamart
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema datamart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `datamart` DEFAULT CHARACTER SET utf8 ;
USE `datamart` ;

-- -----------------------------------------------------
-- Table `datamart`.`Produits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamart`.`Produits` ;

CREATE TABLE IF NOT EXISTS `datamart`.`Produits` (
  `idProduits` INT NOT NULL,
  `Nom Prod` VARCHAR(45) NULL,
  `CatProd` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduits`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `datamart`.`Temps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamart`.`Temps` ;

CREATE TABLE IF NOT EXISTS `datamart`.`Temps` (
  `jours` DATETIME NOT NULL,
  `Mois` INT NULL,
  PRIMARY KEY (`jours`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `datamart`.`Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamart`.`Clients` ;

CREATE TABLE IF NOT EXISTS `datamart`.`Clients` (
  `idClients` VARCHAR(5) NOT NULL,
  `Nom Client` VARCHAR(45) NULL,
  `Pays` VARCHAR(45) NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `datamart`.`Ventes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamart`.`Ventes` ;

CREATE TABLE IF NOT EXISTS `datamart`.`Ventes` (
  `QuantiteVentes` DOUBLE NOT NULL,
  `MontantVentes` DOUBLE NOT NULL,
  `Temps_jours` DATETIME NOT NULL,
  `Produits_idProduits` INT NOT NULL,
  `Clients_idClients` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Temps_jours`, `Produits_idProduits`, `Clients_idClients`),
  INDEX `fk_Ventes_Temps_idx` (`Temps_jours` ASC) VISIBLE,
  INDEX `fk_Ventes_Clients1_idx` (`Clients_idClients` ASC) VISIBLE,
  INDEX `fk_Ventes_Produits1_idx` (`Produits_idProduits` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
