-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ExamenSta
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ExamenSta` ;

-- -----------------------------------------------------
-- Schema ExamenSta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExamenSta` DEFAULT CHARACTER SET utf8 ;
USE `ExamenSta` ;

-- -----------------------------------------------------
-- Table `ExamenSta`.`Exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenSta`.`Exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(255) NOT NULL,
  `totalStudents` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `subject_UNIQUE` (`subject` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenSta`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenSta`.`Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenSta`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenSta`.`Booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Exam_id` INT NOT NULL,
  `Room_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Booking_Exam1_idx` (`Exam_id` ASC),
  INDEX `fk_Booking_Room1_idx` (`Room_id` ASC),
  UNIQUE INDEX `Room_id_UNIQUE` (`Room_id` ASC),
  CONSTRAINT `fk_Booking_Exam1`
    FOREIGN KEY (`Exam_id`)
    REFERENCES `ExamenSta`.`Exam` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Booking_Room1`
    FOREIGN KEY (`Room_id`)
    REFERENCES `ExamenSta`.`Room` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenSta`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenSta`.`Student` (
  `name` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExamenSta`.`Submission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExamenSta`.`Submission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Exam_id` INT NOT NULL,
  `Student_name` VARCHAR(45) NOT NULL,
  `response` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Submission_Student1_idx` (`Student_name` ASC),
  INDEX `fk_Submission_Exam1_idx` (`Exam_id` ASC),
  CONSTRAINT `fk_Submission_Student1`
    FOREIGN KEY (`Student_name`)
    REFERENCES `ExamenSta`.`Student` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Submission_Exam1`
    FOREIGN KEY (`Exam_id`)
    REFERENCES `ExamenSta`.`Exam` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ExamenSta`.`Exam`
-- -----------------------------------------------------
START TRANSACTION;
USE `ExamenSta`;
INSERT INTO `ExamenSta`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Servicios Telemáticos Avanzados', 40);
INSERT INTO `ExamenSta`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Programación en Entornos Distribuidos', 80);
INSERT INTO `ExamenSta`.`Exam` (`id`, `subject`, `totalStudents`) VALUES (DEFAULT, 'Fundamentos de Programación', 80);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ExamenSta`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `ExamenSta`;
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B10I', 28);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B11I', 28);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B12I', 20);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B14I', 55);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B16I', 24);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B17I', 41);
INSERT INTO `ExamenSta`.`Room` (`id`, `name`, `capacity`) VALUES (DEFAULT, 'P0B18I', 32);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ExamenSta`.`Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `ExamenSta`;
INSERT INTO `ExamenSta`.`Student` (`name`, `mail`) VALUES ('jon', 'jon@ehu.eus');
INSERT INTO `ExamenSta`.`Student` (`name`, `mail`) VALUES ('miren', 'miren@ehu.eus');
INSERT INTO `ExamenSta`.`Student` (`name`, `mail`) VALUES ('luis', 'luis@ehu.eus');
INSERT INTO `ExamenSta`.`Student` (`name`, `mail`) VALUES ('ana', 'ana@ehu.eus');

COMMIT;

