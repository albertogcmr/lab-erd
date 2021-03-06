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
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUsers` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `address` VARCHAR(400) NULL,
  `birth` DATE NULL,
  `premium` TINYINT NULL,
  `trust_rate` FLOAT NULL,
  `genre` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `idProducts` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `cuantity_available_for_sale` INT NULL,
  `promo` TINYINT NULL,
  `department` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users_buys_Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users_buys_Products` (
  `Users_idUsers` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  PRIMARY KEY (`Users_idUsers`, `Products_idProducts`),
  INDEX `fk_Users_has_Products_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_Users_has_Products_Users_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Users_has_Products_Users`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Products_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductOwners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductOwners` (
  `idProductOwners` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `address` VARCHAR(400) NULL,
  `stock` INT NULL,
  `free_shipment` TINYINT NULL,
  `phone` INT NULL,
  `country` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`idProductOwners`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductOwners_sells_Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductOwners_sells_Products` (
  `ProductOwners_idProductOwners` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  PRIMARY KEY (`ProductOwners_idProductOwners`, `Products_idProducts`),
  INDEX `fk_ProductOwners_has_Products_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_ProductOwners_has_Products_ProductOwners1_idx` (`ProductOwners_idProductOwners` ASC) VISIBLE,
  CONSTRAINT `fk_ProductOwners_has_Products_ProductOwners1`
    FOREIGN KEY (`ProductOwners_idProductOwners`)
    REFERENCES `mydb`.`ProductOwners` (`idProductOwners`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductOwners_has_Products_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users_likes_Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users_likes_Products` (
  `Users_idUsers` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  PRIMARY KEY (`Users_idUsers`, `Products_idProducts`),
  INDEX `fk_Users_has_Products_Products2_idx` (`Products_idProducts` ASC) VISIBLE,
  INDEX `fk_Users_has_Products_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Users_has_Products_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_has_Products_Products2`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews` (
  `idReviews` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `text` VARCHAR(1000) NULL,
  `date` VARCHAR(45) NULL,
  `stars` INT NULL,
  `Users_idUsers` INT NOT NULL,
  `Products_idProducts` INT NOT NULL,
  PRIMARY KEY (`idReviews`, `Users_idUsers`, `Products_idProducts`),
  INDEX `fk_Reviews_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  INDEX `fk_Reviews_Products1_idx` (`Products_idProducts` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Products1`
    FOREIGN KEY (`Products_idProducts`)
    REFERENCES `mydb`.`Products` (`idProducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

