SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
CREATE SCHEMA IF NOT EXISTS `ventes_datamart` DEFAULT CHARACTER SET latin1 COLLATE 
latin1_swedish_ci ;
USE `ventes_datamart` ;
-- -----------------------------------------------------
-- Table `ventes_datamart`.`Temps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_datamart`.`Temps` (
 `jours` DATETIME NOT NULL ,
 `Mois` INT NULL ,
 PRIMARY KEY (`jours`) )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ventes_datamart`.`Produits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_datamart`.`Produits` (
 `idProduits` INT NOT NULL ,
 `NomProd` VARCHAR(45) NULL ,
 `CatProd` VARCHAR(45) NULL ,
 PRIMARY KEY (`idProduits`) )
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ventes_datamart`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_datamart`.`Clients` (
 `idClients` VARCHAR(5) NOT NULL ,
 `NomClient` VARCHAR(45) NULL ,
 `Pays` VARCHAR(45) NULL ,
 PRIMARY KEY (`idClients`) )
ENGINE = InnoDB;
4/21
-- -----------------------------------------------------
-- Table `ventes_datamart`.`Ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_datamart`.`Ventes` (
 `QuantiteVentes` INT NOT NULL ,
 `MontantVentes` DOUBLE NOT NULL ,
 `Temps_jours` DATETIME NOT NULL ,
 `Produits_idProduits` INT NOT NULL ,
 `Clients_idClients` VARCHAR(5) NOT NULL ,
 PRIMARY KEY (`Temps_jours`, `Produits_idProduits`, `Clients_idClients`) ,
 INDEX `fk_Ventes_Produits1` (`Produits_idProduits` ASC) ,
 INDEX `fk_Ventes_Clients1` (`Clients_idClients` ASC) ,
 CONSTRAINT `fk_Ventes_Temps`
 FOREIGN KEY (`Temps_jours` )
 REFERENCES `ventes_datamart`.`Temps` (`jours` )
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Ventes_Produits1`
 FOREIGN KEY (`Produits_idProduits` )
 REFERENCES `ventes_datamart`.`Produits` (`idProduits` )
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_Ventes_Clients1`
 FOREIGN KEY (`Clients_idClients` )
 REFERENCES `ventes_datamart`.`Clients` (`idClients` )
 ON DELETE NO ACTION
 ON UPDATE NO ACTION)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; 