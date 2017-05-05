-- MySQL Script generated by MySQL Workbench
-- 05/05/17 14:02:29
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hr` DEFAULT CHARACTER SET utf8 ;
USE `hr` ;

-- -----------------------------------------------------
-- Table `hr`.`acte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`acte` (
  `id` INT(30) NOT NULL,
  `denumire` VARCHAR(30) NOT NULL,
  `continut` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`levels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`levels` (
  `id` INT(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`personal` (
  `id` INT(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `phone` INT(30) NOT NULL,
  `address` TEXT NOT NULL,
  `CNP` INT(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `civilst` TEXT NOT NULL,
  `depart` VARCHAR(30) NOT NULL,
  `sex` VARCHAR(30) NOT NULL,
  `username` VARCHAR(30) NULL DEFAULT NULL,
  `pass` VARCHAR(30) NULL DEFAULT NULL,
  `id_level` INT(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `levels_personal_1` (`id_level` ASC),
  CONSTRAINT `levels_personal_1`
    FOREIGN KEY (`id_level`)
    REFERENCES `hr`.`levels` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`candidates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`candidates` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `id_personal` INT(30) NOT NULL,
  `CV` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_personal` (`id_personal` ASC),
  CONSTRAINT `candidates_ibfk_1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `hr`.`personal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`employees` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `id_personal` INT(30) NOT NULL,
  `data_in` DATE NOT NULL,
  `data_out` DATE NOT NULL,
  `registration_nr` INT(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_personal` (`id_personal` ASC),
  CONSTRAINT `employees_ibfk_1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `hr`.`personal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`istoric_cereri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`istoric_cereri` (
  `id` INT(30) NOT NULL,
  `id_acte` INT(30) NOT NULL,
  `id_personal` INT(30) NOT NULL,
  `data_desc` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_acte` (`id_acte` ASC),
  INDEX `id_personal` (`id_personal` ASC),
  CONSTRAINT `istoric_cereri_ibfk_1`
    FOREIGN KEY (`id_acte`)
    REFERENCES `hr`.`acte` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `istoric_cereri_ibfk_2`
    FOREIGN KEY (`id_personal`)
    REFERENCES `hr`.`personal` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`logs` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `date_in` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_out` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tabel` INT(30) NOT NULL,
  `view` INT(30) NOT NULL,
  `id_user` INT(30) NOT NULL,
  `form` INT(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `personal_logs_1` (`id_user` ASC),
  CONSTRAINT `personal_logs_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `hr`.`personal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`pontaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`pontaje` (
  `id` INT(30) NOT NULL,
  `id_personal` INT(30) NOT NULL,
  `date_in` DATETIME NOT NULL,
  `date_out` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_personal` (`id_personal` ASC),
  CONSTRAINT `pontaje_ibfk_1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `hr`.`personal` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`rules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`rules` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `id_level` INT(30) NOT NULL,
  `view_form` INT(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_level` (`id_level` ASC),
  CONSTRAINT `rules_ibfk_1`
    FOREIGN KEY (`id_level`)
    REFERENCES `hr`.`levels` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hr`.`trainers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hr`.`trainers` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `id_personal` INT(30) NOT NULL,
  `schedule` DATETIME(6) NOT NULL,
  `beginning` DATE NOT NULL,
  `finish` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_personal` (`id_personal` ASC),
  CONSTRAINT `trainers_ibfk_1`
    FOREIGN KEY (`id_personal`)
    REFERENCES `hr`.`personal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
