-- MySQL Script generated by MySQL Workbench
-- Thu Jul 13 16:50:14 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema monstagram
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema monstagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `monstagram` DEFAULT CHARACTER SET utf8 ;
USE `monstagram` ;

-- -----------------------------------------------------
-- Table `monstagram`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monstagram`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL COMMENT '账户名',
  `nickname` VARCHAR(45) NULL COMMENT '昵称',
  `password` VARCHAR(45) NULL COMMENT '密码',
  `prefix` INT(2) NULL,
  `phone` BIGINT(11) NULL,
  `created_at` INT NULL COMMENT '创建时间',
  `updated_at` INT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `monstagram`.`resources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monstagram`.`resources` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(250) NULL COMMENT '资源标题',
  `img_url` VARCHAR(1000) NULL COMMENT '图片地址',
  `created_at` INT NULL COMMENT '创建时间',
  `updated_at` INT NULL COMMENT '更新时间',
  `status` INT NULL DEFAULT 1 COMMENT '资源状态',
  PRIMARY KEY (`id`),
  INDEX `fk_resources_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_resources_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `monstagram`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `monstagram`.`user_likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monstagram`.`user_likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL COMMENT '用户id',
  `resources_id` INT NOT NULL COMMENT '资源id',
  `created_at` INT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  INDEX `fk_user_likes_user1_idx` (`user_id` ASC),
  INDEX `fk_user_likes_resources1_idx` (`resources_id` ASC),
  CONSTRAINT `fk_user_likes_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `monstagram`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_likes_resources1`
    FOREIGN KEY (`resources_id`)
    REFERENCES `monstagram`.`resources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `monstagram`.`user_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monstagram`.`user_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL COMMENT '用户id',
  `resources_id` INT NOT NULL COMMENT '资源id',
  `content` VARCHAR(500) NULL COMMENT '评论内容',
  `created_at` INT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  INDEX `fk_user_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_user_comment_resources1_idx` (`resources_id` ASC),
  CONSTRAINT `fk_user_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `monstagram`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_comment_resources1`
    FOREIGN KEY (`resources_id`)
    REFERENCES `monstagram`.`resources` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `monstagram`.`access_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monstagram`.`access_token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL COMMENT '用户id',
  `token` VARCHAR(255) NOT NULL COMMENT '用户token值',
  `expire_time` INT(11) NOT NULL COMMENT 'token过期时间',
  PRIMARY KEY (`id`),
  INDEX `fk_access_token_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_access_token_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `monstagram`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
