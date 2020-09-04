-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sakila_snowflake
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sakila_snowflake` ;

-- -----------------------------------------------------
-- Schema sakila_snowflake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sakila_snowflake` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Source TypeID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Source TypeID` (
  `SourceTypeID` INT NOT NULL AUTO_INCREMENT,
  `SourceType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SourceTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ChainID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ChainID` (
  `ChainID` INT NOT NULL,
  `FoodSourceName` VARCHAR(45) NULL,
  `SourceTypeID` INT NOT NULL,
  PRIMARY KEY (`ChainID`),
  INDEX `fk_ChainID_Source TypeID1_idx` (`SourceTypeID` ASC) VISIBLE,
  CONSTRAINT `fk_ChainID_Source TypeID1`
    FOREIGN KEY (`SourceTypeID`)
    REFERENCES `mydb`.`Source TypeID` (`SourceTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CommunityData`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CommunityData` (
  `CommunityID` INT NOT NULL,
  `CommunityName` VARCHAR(45) NOT NULL,
  `EasyAccessFruitVegNumber` INT NULL,
  `AdultFruitVegServingsNumber` INT NULL,
  `AdultSodaConsumptionNumber` INT NULL,
  `AdultObesityNumber` INT NULL,
  `PerCapitaIncome` INT NULL,
  `Hardship Index` INT NULL,
  PRIMARY KEY (`CommunityID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alderman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alderman` (
  `Ward` INT NOT NULL,
  `AldermanName` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` INT NULL,
  `WardPhone` INT NULL,
  `WardFax` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Website` VARCHAR(45) NULL,
  `LocationCoor` INT NULL,
  PRIMARY KEY (`Ward`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FoodSecurity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FoodSecurity` (
  `CensusTract` INT NOT NULL,
  `POP2010` INT NULL,
  `OHU2010` INT NULL,
  `LILATracts_halfAnd10` BINARY(1) NULL,
  `HUNVFlag` BINARY(1) NULL,
  `LowIncomeTracts` BINARY(1) NULL,
  `PovertyRate` INT NULL,
  `MedianFamilyIncome` INT NULL,
  `LATracts_half` BINARY(1) NULL,
  `lapophalf` INT NULL,
  `lapophalfshare` DECIMAL(9) NULL,
  `lalowihalfshare` DECIMAL(9) NULL,
  `lasnaphalf` INT NULL,
  `lasnaphalfshare` DECIMAL(9) NULL,
  `TractWhite` INT NULL,
  `TractBlack` INT NULL,
  `TractAsian` INT NULL,
  `TractNHOPI` INT NULL,
  `TractAIAN` INT NULL,
  `TractOMultir` INT NULL,
  `TractHispanic` INT NULL,
  PRIMARY KEY (`CensusTract`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GeoJoinTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GeoJoinTable` (
  `GeoID` INT NOT NULL,
  `CommunityID` INT(2) NOT NULL,
  `Ward` INT(2) NOT NULL,
  `CensusTract` INT(11) NOT NULL,
  `ZipCode` INT(5) NULL,
  PRIMARY KEY (`GeoID`),
  INDEX `fk_FoodSources_has_TractDemographics_CommunityData1_idx` (`CommunityID` ASC) VISIBLE,
  INDEX `fk_FoodSources_has_TractDemographics_Alderman1_idx` (`Ward` ASC) VISIBLE,
  INDEX `fk_FoodSources_has_TractDemographics_FoodSecurity1_idx` (`CensusTract` ASC) VISIBLE,
  CONSTRAINT `fk_FoodSources_has_TractDemographics_CommunityData1`
    FOREIGN KEY (`CommunityID`)
    REFERENCES `mydb`.`CommunityData` (`CommunityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodSources_has_TractDemographics_Alderman1`
    FOREIGN KEY (`Ward`)
    REFERENCES `mydb`.`Alderman` (`Ward`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodSources_has_TractDemographics_FoodSecurity1`
    FOREIGN KEY (`CensusTract`)
    REFERENCES `mydb`.`FoodSecurity` (`CensusTract`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FoodSources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FoodSources` (
  `FoodSourceID` INT NOT NULL,
  `ChainID` INT NOT NULL,
  `GeoID` INT NOT NULL,
  `SquareFootage` INT NULL,
  `Latitude` INT NULL,
  `Longitude` INT NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`FoodSourceID`),
  INDEX `fk_FoodSources_ChainID1_idx` (`ChainID` ASC) VISIBLE,
  INDEX `fk_FoodSources_FoodSources_has_TractDemographics1_idx` (`GeoID` ASC) VISIBLE,
  CONSTRAINT `fk_FoodSources_ChainID1`
    FOREIGN KEY (`ChainID`)
    REFERENCES `mydb`.`ChainID` (`ChainID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodSources_FoodSources_has_TractDemographics1`
    FOREIGN KEY (`GeoID`)
    REFERENCES `mydb`.`GeoJoinTable` (`GeoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sakila_snowflake` ;

-- -----------------------------------------------------
-- Table `sakila_snowflake`.`#Tableau_42_sid_0000000C_1_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`#Tableau_42_sid_0000000C_1_Group` (
  `Rental_Count (group)` VARCHAR(21) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Rental_Count` BIGINT(21) NOT NULL DEFAULT '0',
  INDEX `_tidx_#Tableau_42_sid_0000000C_1_Group_1a` (`Rental_Count (group)`(2) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`#Tableau_9_sid_00000013_4_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`#Tableau_9_sid_00000013_4_Group` (
  `Rental_Count (group)` VARCHAR(21) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Rental_Count` BIGINT(21) NOT NULL DEFAULT '0',
  INDEX `_tidx_#Tableau_9_sid_00000013_4_Group_1a` (`Rental_Count (group)`(2) ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_actor` (
  `actor_key` INT(10) NOT NULL AUTO_INCREMENT,
  `actor_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `actor_id` INT(10) NOT NULL,
  `actor_last_name` VARCHAR(45) NOT NULL,
  `actor_first_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_key`),
  INDEX `dim_actor_last_update` (`actor_last_update` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 456
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_location_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_location_country` (
  `location_country_key` INT(10) NOT NULL AUTO_INCREMENT,
  `location_country_id` SMALLINT(10) NOT NULL,
  `location_country_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location_country_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`location_country_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 219
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_location_city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_location_city` (
  `location_city_key` INT(10) NOT NULL AUTO_INCREMENT,
  `location_country_key` INT(10) NOT NULL,
  `location_city_name` VARCHAR(50) NOT NULL,
  `location_city_id` SMALLINT(10) NOT NULL,
  `location_city_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_city_key`),
  INDEX `dim_location_country_dim_location_city_fk` (`location_country_key` ASC) VISIBLE,
  CONSTRAINT `dim_location_country_dim_location_city_fk`
    FOREIGN KEY (`location_country_key`)
    REFERENCES `sakila_snowflake`.`dim_location_country` (`location_country_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 1201
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_location_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_location_address` (
  `location_address_key` INT(10) NOT NULL AUTO_INCREMENT,
  `location_city_key` INT(10) NOT NULL,
  `location_address_id` INT(10) NOT NULL,
  `location_address_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location_address` VARCHAR(64) NOT NULL,
  `location_address_postal_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`location_address_key`),
  INDEX `dim_location_city_dim_location_address_fk` (`location_city_key` ASC) VISIBLE,
  CONSTRAINT `dim_location_city_dim_location_address_fk`
    FOREIGN KEY (`location_city_key`)
    REFERENCES `sakila_snowflake`.`dim_location_city` (`location_city_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 1207
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_customer` (
  `customer_key` INT(8) NOT NULL AUTO_INCREMENT,
  `location_address_key` INT(10) NOT NULL,
  `customer_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` INT(8) NULL DEFAULT NULL,
  `customer_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `customer_email` VARCHAR(50) NULL DEFAULT NULL,
  `customer_active` CHAR(3) NULL DEFAULT NULL,
  `customer_created` DATE NULL DEFAULT NULL,
  `customer_version_number` SMALLINT(5) NULL DEFAULT NULL,
  `customer_valid_from` DATE NULL DEFAULT NULL,
  `customer_valid_through` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`customer_key`),
  INDEX `customer_id` USING BTREE (`customer_id`) VISIBLE,
  INDEX `dim_customer_last_update` (`customer_last_update` ASC) VISIBLE,
  INDEX `dim_location_address_dim_customer_fk` (`location_address_key` ASC) VISIBLE,
  CONSTRAINT `dim_location_address_dim_customer_fk`
    FOREIGN KEY (`location_address_key`)
    REFERENCES `sakila_snowflake`.`dim_location_address` (`location_address_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 600
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_date` (
  `date_Id` BIGINT(20) NOT NULL,
  `date` DATE NOT NULL,
  `timestamp` BIGINT(20) NULL DEFAULT NULL,
  `weekend` CHAR(10) NOT NULL DEFAULT 'Weekday',
  `day_of_week` CHAR(10) NULL DEFAULT NULL,
  `month` CHAR(10) NULL DEFAULT NULL,
  `month_day` INT(11) NULL DEFAULT NULL,
  `year` INT(11) NULL DEFAULT NULL,
  `week_starting_monday` CHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`date_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_film` (
  `film_key` INT(8) NOT NULL AUTO_INCREMENT,
  `film_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `film_id` INT(10) NOT NULL,
  `film_title` VARCHAR(64) NOT NULL,
  `film_description` TEXT NULL DEFAULT NULL,
  `film_release_year` SMALLINT(5) NULL DEFAULT NULL,
  `film_language` VARCHAR(20) NOT NULL,
  `film_rental_duration` TINYINT(3) NULL DEFAULT NULL,
  `film_rental_rate` DECIMAL(4,2) NULL DEFAULT NULL,
  `film_duration` INT(8) NULL DEFAULT NULL,
  `film_replacement_cost` DECIMAL(5,2) NULL DEFAULT NULL,
  `film_rating_code` CHAR(5) NULL DEFAULT NULL,
  `film_rating_text` VARCHAR(255) NULL DEFAULT NULL,
  `film_has_trailers` CHAR(4) NULL DEFAULT NULL,
  `film_has_commentaries` CHAR(4) NULL DEFAULT NULL,
  `film_has_deleted_scenes` CHAR(4) NULL DEFAULT NULL,
  `film_has_behind_the_scenes` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_action` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_animation` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_children` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_classics` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_comedy` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_documentary` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_drama` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_family` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_foreign` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_games` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_horror` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_music` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_new` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_scifi` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_sports` CHAR(4) NULL DEFAULT NULL,
  `film_in_category_travel` CHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`film_key`),
  INDEX `dim_film_last_update` (`film_last_update` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_film_actor_bridge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_film_actor_bridge` (
  `film_key` INT(8) NOT NULL,
  `actor_key` INT(10) NOT NULL,
  `actor_weighing_factor` DECIMAL(3,2) NULL DEFAULT NULL,
  PRIMARY KEY (`film_key`, `actor_key`),
  INDEX `dim_actor_dim_film_actor_bridge_fk` (`actor_key` ASC) VISIBLE,
  CONSTRAINT `dim_actor_dim_film_actor_bridge_fk`
    FOREIGN KEY (`actor_key`)
    REFERENCES `sakila_snowflake`.`dim_actor` (`actor_key`),
  CONSTRAINT `dim_film_dim_film_actor_bridge_fk`
    FOREIGN KEY (`film_key`)
    REFERENCES `sakila_snowflake`.`dim_film` (`film_key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_staff` (
  `staff_key` INT(8) NOT NULL AUTO_INCREMENT,
  `staff_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff_id` INT(8) NULL DEFAULT NULL,
  `staff_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `staff_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `staff_store_id` INT(8) NULL DEFAULT NULL,
  `staff_version_number` SMALLINT(5) NULL DEFAULT NULL,
  `staff_valid_from` DATE NULL DEFAULT NULL,
  `staff_valid_through` DATE NULL DEFAULT NULL,
  `staff_active` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_key`),
  INDEX `dim_staff_last_update` (`staff_last_update` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`dim_store` (
  `store_key` INT(8) NOT NULL AUTO_INCREMENT,
  `location_address_key` INT(10) NOT NULL,
  `store_last_update` TIME NOT NULL,
  `store_id` INT(8) NULL DEFAULT NULL,
  `store_manager_staff_id` INT(8) NULL DEFAULT NULL,
  `store_manager_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `store_manager_last_name` VARCHAR(45) NULL DEFAULT NULL,
  `store_version_number` SMALLINT(5) NULL DEFAULT NULL,
  `store_valid_from` DATE NULL DEFAULT NULL,
  `store_valid_through` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`store_key`),
  INDEX `store_id` USING BTREE (`store_id`) VISIBLE,
  INDEX `dim_store_last_update` (`store_last_update` ASC) VISIBLE,
  INDEX `dim_location_address_dim_store_fk` (`location_address_key` ASC) VISIBLE,
  CONSTRAINT `dim_location_address_dim_store_fk`
    FOREIGN KEY (`location_address_key`)
    REFERENCES `sakila_snowflake`.`dim_location_address` (`location_address_key`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`fact_rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`fact_rental` (
  `rental_id` INT(10) NOT NULL,
  `rental_last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_key` INT(8) NOT NULL,
  `staff_key` INT(8) NOT NULL,
  `film_key` INT(8) NOT NULL,
  `store_key` INT(8) NOT NULL,
  `rental_date_key` BIGINT(20) NOT NULL,
  `return_date_key` BIGINT(20) NULL DEFAULT NULL,
  `count_returns` INT(10) NULL DEFAULT NULL,
  `count_rentals` INT(8) NULL DEFAULT NULL,
  `rental_duration` INT(10) NULL DEFAULT NULL,
  `dollar_amount` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `dim_date_dim_fact_rental_fk` (`rental_date_key` ASC) VISIBLE,
  INDEX `dim_date_dim_fact_rental_fk_2` (`return_date_key` ASC) VISIBLE,
  INDEX `dim_store_fact_rental_fk` (`store_key` ASC) VISIBLE,
  INDEX `dim_staff_fact_rental_fk` (`staff_key` ASC) VISIBLE,
  INDEX `dim_film_fact_rental_fk` (`film_key` ASC) VISIBLE,
  INDEX `dim_customer_fact_rental_fk` (`customer_key` ASC) VISIBLE,
  CONSTRAINT `dim_customer_dim_fact_rental_fk`
    FOREIGN KEY (`customer_key`)
    REFERENCES `sakila_snowflake`.`dim_customer` (`customer_key`),
  CONSTRAINT `dim_date_dim_fact_rental_fk`
    FOREIGN KEY (`rental_date_key`)
    REFERENCES `sakila_snowflake`.`dim_date` (`date_Id`),
  CONSTRAINT `dim_date_dim_fact_rental_fk_2`
    FOREIGN KEY (`return_date_key`)
    REFERENCES `sakila_snowflake`.`dim_date` (`date_Id`),
  CONSTRAINT `dim_film_dim_fact_rental_fk`
    FOREIGN KEY (`film_key`)
    REFERENCES `sakila_snowflake`.`dim_film` (`film_key`),
  CONSTRAINT `dim_staff_dim_fact_rental_fk`
    FOREIGN KEY (`staff_key`)
    REFERENCES `sakila_snowflake`.`dim_staff` (`staff_key`),
  CONSTRAINT `dim_store_dim_fact_rental_fk`
    FOREIGN KEY (`store_key`)
    REFERENCES `sakila_snowflake`.`dim_store` (`store_key`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`numbers` (
  `number` BIGINT(20) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`numbers_small`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_snowflake`.`numbers_small` (
  `number` INT(11) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
