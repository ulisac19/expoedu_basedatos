SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`tipo_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tipo_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(256) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `session` VARCHAR(45) NULL ,
  `tipo_usuario_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_users_tipo_usuario` (`tipo_usuario_id` ASC) ,
  CONSTRAINT `fk_users_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id` )
    REFERENCES `mydb`.`tipo_usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_stand`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tipo_stand` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `permisos` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`puesto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`puesto` (
  `id` INT NOT NULL ,
  `coordenadaX` INT NULL ,
  `coordenadaY` INT NULL ,
  `ancho` INT NULL ,
  `largo` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stand`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`stand` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_stand_id` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `puesto_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_stand_tipo_stand1` (`tipo_stand_id` ASC) ,
  INDEX `fk_stand_puesto1` (`puesto_id` ASC) ,
  CONSTRAINT `fk_stand_tipo_stand1`
    FOREIGN KEY (`tipo_stand_id` )
    REFERENCES `mydb`.`tipo_stand` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stand_puesto1`
    FOREIGN KEY (`puesto_id` )
    REFERENCES `mydb`.`puesto` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`datos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT NULL ,
  `facebook` VARCHAR(125) NULL ,
  `google` VARCHAR(125) NULL ,
  `nombres` VARCHAR(45) NULL ,
  `apellidos` VARCHAR(45) NULL ,
  `fecha_nacimiento` DATE NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_datos_users1` (`users_id` ASC) ,
  CONSTRAINT `fk_datos_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datos_stand`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`datos_stand` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `logoyaccesomapa` VARCHAR(45) NULL ,
  `stand24mts` VARCHAR(45) NULL ,
  `stand48mts` VARCHAR(45) NULL ,
  `usuariochat1` VARCHAR(45) NULL ,
  `usuariochat2` VARCHAR(45) NULL ,
  `pendon1` VARCHAR(45) NULL ,
  `pendon2` VARCHAR(45) NULL ,
  `pendon3` VARCHAR(45) NULL ,
  `pendon4` VARCHAR(45) NULL ,
  `pendon5` VARCHAR(45) NULL ,
  `video1` VARCHAR(45) NULL ,
  `video2` VARCHAR(45) NULL ,
  `video3` VARCHAR(45) NULL ,
  `informarcion` VARCHAR(45) NULL ,
  `fondomural` VARCHAR(45) NULL ,
  `galeriafotos` VARCHAR(45) NULL ,
  `redessociales` VARCHAR(45) NULL ,
  `stand_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_datos_stand_stand1` (`stand_id` ASC) ,
  CONSTRAINT `fk_datos_stand_stand1`
    FOREIGN KEY (`stand_id` )
    REFERENCES `mydb`.`stand` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`interesados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`interesados` (
  `idi` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT NULL ,
  `stand_id` INT NULL ,
  PRIMARY KEY (`idi`) ,
  INDEX `fk_interesados_users1` (`users_id` ASC) ,
  INDEX `fk_interesados_stand1` (`stand_id` ASC) ,
  CONSTRAINT `fk_interesados_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interesados_stand1`
    FOREIGN KEY (`stand_id` )
    REFERENCES `mydb`.`stand` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_institucion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tipo_institucion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`institucion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`institucion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `direccion` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `lgoo` VARCHAR(45) NULL ,
  `users_id` INT NULL ,
  `tipo_institucion_id` INT NULL ,
  `razon_social` VARCHAR(126) NULL ,
  `RIF` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_institucion_users1` (`users_id` ASC) ,
  INDEX `fk_institucion_tipo_institucion1` (`tipo_institucion_id` ASC) ,
  CONSTRAINT `fk_institucion_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_institucion_tipo_institucion1`
    FOREIGN KEY (`tipo_institucion_id` )
    REFERENCES `mydb`.`tipo_institucion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`carrera`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`carrera` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `carrera` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(125) NULL ,
  `institucion_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_carrera_institucion1` (`institucion_id` ASC) ,
  CONSTRAINT `fk_carrera_institucion1`
    FOREIGN KEY (`institucion_id` )
    REFERENCES `mydb`.`institucion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`categoria` (
  `id` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria_institucion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`categoria_institucion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `categoria_id` INT NULL ,
  `institucion_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_categoria_institucion_categoria1` (`categoria_id` ASC) ,
  INDEX `fk_categoria_institucion_institucion1` (`institucion_id` ASC) ,
  CONSTRAINT `fk_categoria_institucion_categoria1`
    FOREIGN KEY (`categoria_id` )
    REFERENCES `mydb`.`categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_institucion_institucion1`
    FOREIGN KEY (`institucion_id` )
    REFERENCES `mydb`.`institucion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`responsable`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`responsable` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(125) NULL ,
  `apellido` VARCHAR(125) NULL ,
  `correo1` VARCHAR(45) NULL ,
  `correo2` VARCHAR(45) NULL ,
  `telefono1` VARCHAR(45) NULL ,
  `telefono2` VARCHAR(45) NULL ,
  `institucion_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_responsable_institucion1` (`institucion_id` ASC) ,
  CONSTRAINT `fk_responsable_institucion1`
    FOREIGN KEY (`institucion_id` )
    REFERENCES `mydb`.`institucion` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`intereses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`intereses` (
  `id` INT NOT NULL ,
  `nombres` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`intereses_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`intereses_users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `intereses_id` INT NULL ,
  `users_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_intereses_users_intereses1` (`intereses_id` ASC) ,
  INDEX `fk_intereses_users_users1` (`users_id` ASC) ,
  CONSTRAINT `fk_intereses_users_intereses1`
    FOREIGN KEY (`intereses_id` )
    REFERENCES `mydb`.`intereses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_intereses_users_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avatar_alto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`avatar_alto` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avatar_medio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`avatar_medio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avatar_bajo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`avatar_bajo` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avatar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`avatar` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(126) NULL ,
  `users_id` INT NULL ,
  `avatar_alto_id` INT NULL ,
  `avatar_medio_id` INT NULL ,
  `avatar_bajo_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_avatar_users1` (`users_id` ASC) ,
  INDEX `fk_avatar_avatar_alto1` (`avatar_alto_id` ASC) ,
  INDEX `fk_avatar_avatar_medio1` (`avatar_medio_id` ASC) ,
  INDEX `fk_avatar_avatar_bajo1` (`avatar_bajo_id` ASC) ,
  CONSTRAINT `fk_avatar_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avatar_avatar_alto1`
    FOREIGN KEY (`avatar_alto_id` )
    REFERENCES `mydb`.`avatar_alto` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avatar_avatar_medio1`
    FOREIGN KEY (`avatar_medio_id` )
    REFERENCES `mydb`.`avatar_medio` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avatar_avatar_bajo1`
    FOREIGN KEY (`avatar_bajo_id` )
    REFERENCES `mydb`.`avatar_bajo` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
