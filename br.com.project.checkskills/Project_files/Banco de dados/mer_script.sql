SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `db_projeto` DEFAULT CHARACTER SET utf8 ;
USE `db_projeto` ;

-- -----------------------------------------------------
-- Table `db_projeto`.`TB_ORGANIZACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_ORGANIZACAO` (
  `ID_ORGANIZACAO` INT(11) NOT NULL AUTO_INCREMENT,
  `RAZAO_SOCIAL` VARCHAR(45) NOT NULL,
  `RAMO_ATUACAO` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NULL,
  `TELEFONE` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_ORGANIZACAO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_DEPARTAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_DEPARTAMENTO` (
  `ID_ORGANIZACAO` INT(11) NOT NULL,
  `ID_DEPARTAMENTO_PAI` INT(11) NULL,
  `ID_DEPARTAMENTO` INT(11) NOT NULL AUTO_INCREMENT,
  `ID_NIVEL` INT(11) NOT NULL,
  `NOME_DEPARTAMENTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_DEPARTAMENTO`),
  INDEX `fk_DEPARTAMENTO_TB_ORGANIZACAO1_idx` (`ID_ORGANIZACAO` ASC),
  INDEX `fk_DEPARTAMENTO_DEPARTAMENTO1_idx` (`ID_DEPARTAMENTO_PAI` ASC),
  CONSTRAINT `fk_DEPARTAMENTO_TB_ORGANIZACAO1`
    FOREIGN KEY (`ID_ORGANIZACAO`)
    REFERENCES `db_projeto`.`TB_ORGANIZACAO` (`ID_ORGANIZACAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEPARTAMENTO_DEPARTAMENTO1`
    FOREIGN KEY (`ID_DEPARTAMENTO_PAI`)
    REFERENCES `db_projeto`.`TB_DEPARTAMENTO` (`ID_DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_NIVEL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_NIVEL` (
  `ID_NIVEL` INT(11) NOT NULL AUTO_INCREMENT,
  `NIVEL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_NIVEL`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_CARGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_CARGO` (
  `ID_CARGO` INT(11) NOT NULL AUTO_INCREMENT,
  `ID_DEPARTAMENTO` INT(11) NOT NULL,
  `NOME_CARGO` VARCHAR(45) NULL,
  `CARGO_MODELO` TINYINT(1) NULL DEFAULT NULL,
  `DESCRICAO` VARCHAR(45) NULL,
  `ID_NIVEL` INT(11) NOT NULL,
  PRIMARY KEY (`ID_CARGO`),
  INDEX `fk_TB_CARGO_TB_DEPARTAMENTO1_idx` (`ID_DEPARTAMENTO` ASC),
  INDEX `fk_TB_CARGO_TB_NIVEL1_idx` (`ID_NIVEL` ASC),
  CONSTRAINT `fk_TB_CARGO_TB_DEPARTAMENTO1`
    FOREIGN KEY (`ID_DEPARTAMENTO`)
    REFERENCES `db_projeto`.`TB_DEPARTAMENTO` (`ID_DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_CARGO_TB_NIVEL1`
    FOREIGN KEY (`ID_NIVEL`)
    REFERENCES `db_projeto`.`TB_NIVEL` (`ID_NIVEL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_TIPO_COMPETENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_TIPO_COMPETENCIA` (
  `ID_TIPO_COMPETENCIA` INT(11) NOT NULL AUTO_INCREMENT,
  `TIPO_COMPETENCIA` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_TIPO_COMPETENCIA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_CARGO_MODELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_CARGO_MODELO` (
  `ID_CARGO_MODELO` INT NOT NULL,
  `ID_CARGO` INT(11) NOT NULL,
  `DATA_REGISTRO` TIMESTAMP NOT NULL,
  `PESO` INT(2) NULL,
  PRIMARY KEY (`ID_CARGO_MODELO`),
  INDEX `fk_TB_CARGO_MODELO_TB_CARGO1_idx` (`ID_CARGO` ASC),
  CONSTRAINT `fk_TB_CARGO_MODELO_TB_CARGO1`
    FOREIGN KEY (`ID_CARGO`)
    REFERENCES `db_projeto`.`TB_CARGO` (`ID_CARGO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_COMPETENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_COMPETENCIA` (
  `ID_COMPETENCIA` INT(11) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_COMPETENCIA` INT(11) NOT NULL,
  `ID_CARGO_MODELO` INT NOT NULL,
  `NOME_COMPETENCIA` VARCHAR(45) NOT NULL,
  `DESCRICAO_COMPETENCIA` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_COMPETENCIA`),
  INDEX `TIPO_COMPETENCIA1_idx` (`ID_TIPO_COMPETENCIA` ASC),
  INDEX `fk_TB_COMPETENCIA_TB_CARGO_MODELO1_idx` (`ID_CARGO_MODELO` ASC),
  CONSTRAINT `TIPO_COMPETENCIA1`
    FOREIGN KEY (`ID_TIPO_COMPETENCIA`)
    REFERENCES `db_projeto`.`TB_TIPO_COMPETENCIA` (`ID_TIPO_COMPETENCIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_COMPETENCIA_TB_CARGO_MODELO1`
    FOREIGN KEY (`ID_CARGO_MODELO`)
    REFERENCES `db_projeto`.`TB_CARGO_MODELO` (`ID_CARGO_MODELO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_USUARIO` (
  `ID_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(120) NOT NULL,
  `EMAIL` VARCHAR(255) NOT NULL,
  `PASSWORD` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_FUNCIONARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_FUNCIONARIO` (
  `ID_FUNCIONARIO` INT NOT NULL,
  `ID_DEPARTAMENTO` INT(11) NOT NULL,
  `NOME_PESSOA` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(13) NULL,
  `SEXO` CHAR NOT NULL,
  `SALARIO` DOUBLE NOT NULL,
  `TELEFONE` INT NULL,
  `DATA_NASCIMENTO` DATE NOT NULL,
  `DATA_ADMISSAO` DATE NOT NULL,
  `DATA_DEMISSAO` DATE NULL,
  `STATUS` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`),
  INDEX `fk_TB_FUNCIONARIO_TB_DEPARTAMENTO1_idx` (`ID_DEPARTAMENTO` ASC),
  CONSTRAINT `fk_PESSOA_TB_USUARIO1`
    FOREIGN KEY (`ID_FUNCIONARIO`)
    REFERENCES `db_projeto`.`TB_USUARIO` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_FUNCIONARIO_TB_DEPARTAMENTO1`
    FOREIGN KEY (`ID_DEPARTAMENTO`)
    REFERENCES `db_projeto`.`TB_DEPARTAMENTO` (`ID_DEPARTAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_CICLO_AVALIACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_CICLO_AVALIACAO` (
  `ID_CICLO_PLANEJAMENTO` INT NOT NULL AUTO_INCREMENT,
  `NOME_CICLO` VARCHAR(120) NOT NULL,
  `DESCRICAO` VARCHAR(255) NULL,
  `DATA_INICIO` DATE NOT NULL,
  `DATE_FIM` DATE NOT NULL,
  `STATUS` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID_CICLO_PLANEJAMENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_AVALIACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_AVALIACAO` (
  `ID_AVALIACAO` INT NOT NULL,
  `ID_CICLO_AVALIACAO` INT NOT NULL,
  INDEX `fk_TB_AVALIACAO_TB_CICLO_AVALIACAO1_idx` (`ID_CICLO_AVALIACAO` ASC),
  PRIMARY KEY (`ID_AVALIACAO`),
  CONSTRAINT `fk_TB_AVALIACAO_TB_CICLO_AVALIACAO1`
    FOREIGN KEY (`ID_CICLO_AVALIACAO`)
    REFERENCES `db_projeto`.`TB_CICLO_AVALIACAO` (`ID_CICLO_PLANEJAMENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_ESCALA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_ESCALA` (
  `ID_ESCALA` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(45) NOT NULL,
  `VALOR` INT NOT NULL,
  PRIMARY KEY (`ID_ESCALA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_MATRIZ_COMPETENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_MATRIZ_COMPETENCIA` (
  `ID_MATRIZ_COMPETENCIA` INT NOT NULL AUTO_INCREMENT,
  `ID_AVALIACAO` INT NOT NULL,
  `ID_COMPETENCIA` INT(11) NOT NULL,
  `ID_ESCALA` INT NOT NULL,
  INDEX `fk_TB_ESCALA_TB_COMPETENCIA1_idx` (`ID_COMPETENCIA` ASC),
  INDEX `fk_TB_MATRIZ_COMPETENCIA_TB_AVALIACAO1_idx` (`ID_AVALIACAO` ASC),
  PRIMARY KEY (`ID_MATRIZ_COMPETENCIA`),
  INDEX `fk_TB_MATRIZ_COMPETENCIA_TB_ESCALA1_idx` (`ID_ESCALA` ASC),
  CONSTRAINT `fk_TB_ESCALA_TB_COMPETENCIA1`
    FOREIGN KEY (`ID_COMPETENCIA`)
    REFERENCES `db_projeto`.`TB_COMPETENCIA` (`ID_COMPETENCIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_MATRIZ_COMPETENCIA_TB_AVALIACAO1`
    FOREIGN KEY (`ID_AVALIACAO`)
    REFERENCES `db_projeto`.`TB_AVALIACAO` (`ID_AVALIACAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_MATRIZ_COMPETENCIA_TB_ESCALA1`
    FOREIGN KEY (`ID_ESCALA`)
    REFERENCES `db_projeto`.`TB_ESCALA` (`ID_ESCALA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_FEEDBACK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_FEEDBACK` (
  `ID_FEEDBACK` INT NOT NULL AUTO_INCREMENT,
  `ID_AVALIACAO` INT NOT NULL,
  `Observacao` BLOB NULL,
  `data_cadastro` TIMESTAMP NOT NULL,
  PRIMARY KEY (`ID_FEEDBACK`),
  INDEX `fk_TB_FEEDBACK_TB_AVALIACAO1_idx` (`ID_AVALIACAO` ASC),
  CONSTRAINT `fk_TB_FEEDBACK_TB_AVALIACAO1`
    FOREIGN KEY (`ID_AVALIACAO`)
    REFERENCES `db_projeto`.`TB_AVALIACAO` (`ID_AVALIACAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_PERFIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_PERFIL` (
  `ID_PERFIL` INT NOT NULL AUTO_INCREMENT,
  `PERFIL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_PERFIL`),
  UNIQUE INDEX `ROLE_UNIQUE` (`PERFIL` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`ASS_USUARIO_PERMISSAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`ASS_USUARIO_PERMISSAO` (
  `ID_USUARIO` INT NOT NULL,
  `ID_PERFIL` INT NOT NULL,
  PRIMARY KEY (`ID_USUARIO`, `ID_PERFIL`),
  INDEX `fk_TB_USUARIO_TB_PERMISSAO_TB_PERMISSAO1_idx` (`ID_PERFIL` ASC),
  INDEX `fk_TB_USUARIO_TB_PERMISSAO_TB_USUARIO1_idx` (`ID_USUARIO` ASC),
  CONSTRAINT `fk_TB_USUARIO_TB_PERMISSAO_TB_USUARIO1`
    FOREIGN KEY (`ID_USUARIO`)
    REFERENCES `db_projeto`.`TB_USUARIO` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_USUARIO_TB_PERMISSAO_TB_PERMISSAO1`
    FOREIGN KEY (`ID_PERFIL`)
    REFERENCES `db_projeto`.`TB_PERFIL` (`ID_PERFIL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto`.`TB_FUNCIONARIO_AVALIACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto`.`TB_FUNCIONARIO_AVALIACAO` (
  `ID_FUNCIONARIO` INT NOT NULL,
  `ID_AVALIACAO` INT NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`, `ID_AVALIACAO`),
  INDEX `fk_TB_FUNCIONARIO_TB_AVALIACAO_TB_AVALIACAO1_idx` (`ID_AVALIACAO` ASC),
  INDEX `fk_TB_FUNCIONARIO_TB_AVALIACAO_TB_FUNCIONARIO1_idx` (`ID_FUNCIONARIO` ASC),
  CONSTRAINT `fk_TB_FUNCIONARIO_TB_AVALIACAO_TB_FUNCIONARIO1`
    FOREIGN KEY (`ID_FUNCIONARIO`)
    REFERENCES `db_projeto`.`TB_FUNCIONARIO` (`ID_FUNCIONARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_FUNCIONARIO_TB_AVALIACAO_TB_AVALIACAO1`
    FOREIGN KEY (`ID_AVALIACAO`)
    REFERENCES `db_projeto`.`TB_AVALIACAO` (`ID_AVALIACAO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
