CREATE SCHEMA IF NOT EXISTS `bd` DEFAULT CHARACTER SET utf8mb4 ;
USE `bd` ;

CREATE TABLE IF NOT EXISTS produto (
  cod_produto int AUTO_INCREMENT,
  nome_produto varchar(20),
  preço float,
  foto varchar(50),
  endereço varchar(30),
  id int ,
  foreign key(id) references usuarios(usuario_id),
  PRIMARY KEY (cod_produto)
);

CREATE TABLE IF NOT EXISTS `papeis` (
  `papel_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`papel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `usuarios_papeis` (
  `usuario_id` INT(11) NOT NULL,
  `papel_id` INT(11) NOT NULL,
  CONSTRAINT `papel_fk`
    FOREIGN KEY (`papel_id`)
    REFERENCES `papeis` (`papel_id`),
  CONSTRAINT `user_fk`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Script de inserção de dados
INSERT INTO `papeis` (`papel_id`, `nome`) VALUES (1, 'USUARIO');
INSERT INTO `papeis` (`papel_id`, `nome`) VALUES (2, 'MORADOR');
INSERT INTO `papeis` (`papel_id`, `nome`) VALUES (3, 'ADMIN');

INSERT INTO `usuarios` (`usuario_id`, `email`, `senha`) VALUES (1, 'mercurio@teste.com', '$2a$10$wSa39/yk/UTovsqPt817X.c0I8xlS2s76YQy4ViDxag0mlxUoYUq2');
INSERT INTO `usuarios` (`usuario_id`, `email`, `senha`) VALUES (2, 'venus@teste.com', '$2a$10$v8Wr0mf6HgmIG0ANimKJOuOIt/09qIkXIF7wCwzq8.U/LTqTs9ovq');
INSERT INTO `usuarios` (`usuario_id`, `email`, `senha`) VALUES (3, 'terra@teste.com', '$2a$10$5sci59bfdcED4XxxuN9gx.SJBPsdNknirJSkLbTCouf2mFzLmX/Gi');
INSERT INTO `usuarios` (`usuario_id`, `email`, `senha`) VALUES (4, 'marte@teste.com', '$2a$10$Wl1gojjJgFhXztvHIULT3e0hiEMrDbCWCys0p6LnfrqxcxYkgh9OW');
INSERT INTO `usuarios` (`usuario_id`, `email`, `senha`) VALUES (5, 'jupiter@teste.com', '$2a$10$5sci59bfdcED4XxxuN9gx.SJBPsdNknirJSkLbTCouf2mFzLmX/Gi');

INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (1, 1); -- usuário mercurio tem papel USUARIO
INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (2, 2); -- usuário venus tem papel MORADOR
INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (3, 2); -- usuário terra tem papel MORADOR
INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (3, 1); -- usuário terra tem papel USUARIO
INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (4, 1); -- usuário marte tem papel USUARIO
INSERT INTO `usuarios_papeis` (`usuario_id`, `papel_id`) VALUES (5, 3); -- usuário jupiter tem papel ADMIN