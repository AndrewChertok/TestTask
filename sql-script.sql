CREATE DATABASE test;

USE test;

CREATE TABLE IF NOT EXISTS `test`.`users` (
  `id` INT(8) NOT NULL  AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `age` INT(3) NOT NULL,
  `isAdmin` BIT(1) NOT NULL,
  `dateCreated` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`id`));


INSERT INTO users (name, age, isAdmin)
VALUES ('Andrew', 28, 1),
('Dilan', 70, 0),
('Bob', 21, 0),
('Sem', 30, 0),
('Egor', 26, 1),
('Denis', 30, 0),
('Samuel', 26, 1),
('Reley', 18, 0),
('Ninjang', 50, 0),
('Bobby', 52, 0),
('Darren', 1, 0),
('Don Carleone', 71, 1),
('Batman', 288, 0),
('John', 90, 0),
('Kira', 30, 0),
('Rolton', 55, 1),
('Miley', 22, 0),
('Smith1', 41, 0),
('Smith2', 42, 0),
('Smith3', 43, 0),
('Smith4', 44, 0),
('Smith5', 45, 0);