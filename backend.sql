
 CREATE TABLE Usuario (
  id integer NOT NULL AUTO_INCREMENT,
  idPerfil integer NOT NULL,
  nome varchar(120) NOT NULL,
  email varchar(120) NOT NULL,
  notificationId varchar(255),
  dataNascimento date,
  genero tinyint,
  generoInteresse tinyint,
  auth_key varchar(32) NOT NULL,
  password_hash varchar(255) NOT NULL,
  password_reset_token varchar(255) NOT NULL,
  created_at bigint NOT NULL,
  updated_at bigint NOT NULL,
  status tinyint NOT NULL DEFAULT 1,
  CONSTRAINT PK_Usuario PRIMARY KEY (id)
);


CREATE TABLE Perfil
(
  id integer NOT NULL,
  nome varchar(40) NOT NULL,
  CONSTRAINT PK_Perfil PRIMARY KEY (id)
);


ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_
  FOREIGN KEY (idPerfil) REFERENCES Perfil (id);


CREATE TABLE Segmento
(
  id integer NOT NULL,
  nome integer NOT NULL,
  icone varchar(255),
  CONSTRAINT PK_Segmento PRIMARY KEY (id)
);


CREATE TABLE UsuarioSegmento
(
  id integer NOT NULL AUTO_INCREMENT,
  CONSTRAINT PK_UsuarioSegmento PRIMARY KEY (id)
);



ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_ ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Perfil
  MODIFY id integer NOT NULL AUTO_INCREMENT;

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_
  FOREIGN KEY (idPerfil) REFERENCES Perfil (id);


ALTER TABLE Segmento
  MODIFY id integer NOT NULL AUTO_INCREMENT;


ALTER TABLE UsuarioSegmento
  ADD idUsuario integer;



ALTER TABLE UsuarioSegmento
  MODIFY idUsuario integer NOT NULL;


ALTER TABLE UsuarioSegmento
  ADD idSegmento integer;

ALTER TABLE UsuarioSegmento
  MODIFY idSegmento integer NOT NULL;

ALTER TABLE UsuarioSegmento ADD CONSTRAINT FK_UsuarioSegmento_
  FOREIGN KEY (idUsuario) REFERENCES Usuario (id);

/* End of Step #20 */

/* Step #21: New foreign key FK_UsuarioSegmento_Segmento of UsuarioSegmento */

ALTER TABLE UsuarioSegmento ADD CONSTRAINT FK_UsuarioSegmento_Segmento
  FOREIGN KEY (idSegmento) REFERENCES Segmento (id);

/* End of Step #21 */

/* Step #22: Modify foreign key FK_UsuarioSegmento_Usuario of UsuarioSegmento */

ALTER TABLE UsuarioSegmento
  DROP FOREIGN KEY FK_UsuarioSegmento_;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'UsuarioSegmento' AND index_name = 'FK_UsuarioSegmento_');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_UsuarioSegmento_ ON UsuarioSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE UsuarioSegmento ADD CONSTRAINT FK_UsuarioSegmento_Usuario
  FOREIGN KEY (idUsuario) REFERENCES Usuario (id);

/* End of Step #22 */

/* Step #23:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #23 */

/* Step #24:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #24 */

/* Step #25: New table Loja */

CREATE TABLE Loja
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varbinary(255) NOT NULL,
  localizacao varchar(255) NOT NULL,
  lat decimal(10,8) NOT NULL,
  lng decimal(11,8) NOT NULL,
  telefone varchar(12),
  celular varchar(12),
  email varchar(120),
  facebook varchar(255),
  instagram varchar(255),
  logo varchar(255),
  banner varchar(255),
  descricao text NOT NULL,
  beneficios text NOT NULL,
  idAdministrador integer NOT NULL,
  CONSTRAINT PK_Loja PRIMARY KEY (id)
);

/* End of Step #25 */

/* Step #26:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #26 */

/* Step #27:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #27 */

/* Step #28:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #28 */

/* Step #29:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #29 */

/* Step #30: New foreign key FK_Loja_Administrador of Loja */

ALTER TABLE Loja ADD CONSTRAINT FK_Loja_Administrador
  FOREIGN KEY (idAdministrador) REFERENCES Usuario (id);

/* End of Step #30 */

/* Step #31:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #31 */

/* Step #32:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #32 */

/* Step #33: Modify foreign key FK_Usuario_Perfil of Usuario */

ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_ ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Perfil
  FOREIGN KEY (idPerfil) REFERENCES Perfil (id);

/* End of Step #33 */

/* Step #34:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #34 */

/* Step #35: New table LojaSegmento */

CREATE TABLE LojaSegmento
(
  id integer NOT NULL AUTO_INCREMENT,
  idLoja integer NOT NULL,
  idSegmento integer NOT NULL,
  CONSTRAINT PK_LojaSegmento PRIMARY KEY (id)
);

/* End of Step #35 */

/* Step #36:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #36 */

/* Step #37: New foreign key FK_Loja_Segmento of Loja */

ALTER TABLE Loja ADD CONSTRAINT FK_Loja_Segmento
  FOREIGN KEY (id) REFERENCES LojaSegmento (id) ON DELETE CASCADE;

/* End of Step #37 */

/* Step #38: Delete foreign key FK_UsuarioSegmento_Usuario of UsuarioSegmento */

ALTER TABLE UsuarioSegmento
  DROP FOREIGN KEY FK_UsuarioSegmento_Usuario;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'UsuarioSegmento' AND index_name = 'FK_UsuarioSegmento_Usuario');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_UsuarioSegmento_Usuario ON UsuarioSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #38 */

/* Step #39: Delete foreign key FK_UsuarioSegmento_Segmento of UsuarioSegmento */

ALTER TABLE UsuarioSegmento
  DROP FOREIGN KEY FK_UsuarioSegmento_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'UsuarioSegmento' AND index_name = 'FK_UsuarioSegmento_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_UsuarioSegmento_Segmento ON UsuarioSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #39 */

/* Step #40: New foreign key FK_LojaSegmento_Segmento of LojaSegmento */

ALTER TABLE LojaSegmento ADD CONSTRAINT FK_LojaSegmento_Segmento
  FOREIGN KEY (idSegmento) REFERENCES Segmento (id);

/* End of Step #40 */

/* Step #41: New foreign key FK_Usuario_Segmento of Usuario */

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Segmento
  FOREIGN KEY (id) REFERENCES UsuarioSegmento (id) ON DELETE CASCADE;

/* End of Step #41 */

/* Step #42: Delete foreign key FK_Usuario_Segmento of Usuario */

ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_Segmento ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #42 */

/* Step #43: New foreign key FK_Usuario_Segmento of Usuario */

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Segmento
  FOREIGN KEY (id) REFERENCES UsuarioSegmento (id) ON DELETE CASCADE;

/* End of Step #43 */

/* Step #44:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #44 */

/* Step #45: New foreign key FK_UsuarioSegmento_Segmento of UsuarioSegmento */

ALTER TABLE UsuarioSegmento ADD CONSTRAINT FK_UsuarioSegmento_Segmento
  FOREIGN KEY (idSegmento) REFERENCES Segmento (id);

/* End of Step #45 */

/* Step #46: New table Campanha */

CREATE TABLE Campanha
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  titulo varchar(255) NOT NULL,
  mensagem varchar(255) NOT NULL,
  genero tinyint,
  generoInteresse tinyint,
  segmentosInteresse varchar(100),
  CONSTRAINT PK_Campanha PRIMARY KEY (id)
);

/* End of Step #46 */

/* Step #47:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #47 */

/* Step #48: Delete column segmentosInteresse of Campanha */

ALTER TABLE Campanha
  DROP segmentosInteresse;

/* End of Step #48 */

/* Step #49:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #49 */

/* Step #50: New table CampanhaSegmentos */

CREATE TABLE CampanhaSegmentos
(
  id integer NOT NULL AUTO_INCREMENT,
  idCampanha integer NOT NULL,
  idSegmento integer NOT NULL,
  CONSTRAINT PK_CampanhaSegmentos PRIMARY KEY (id)
);

/* End of Step #50 */

/* Step #51:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #51 */

/* Step #52: New foreign key FK_Campanha_Segmento of Campanha */

ALTER TABLE Campanha ADD CONSTRAINT FK_Campanha_Segmento
  FOREIGN KEY (id) REFERENCES CampanhaSegmentos (id) ON DELETE CASCADE;

/* End of Step #52 */

/* Step #53: New foreign key FK_CampanhaSegmentos_Segmento of CampanhaSegmentos */

ALTER TABLE CampanhaSegmentos ADD CONSTRAINT FK_CampanhaSegmentos_Segmento
  FOREIGN KEY (idSegmento) REFERENCES Segmento (id);

/* End of Step #53 */

/* Step #54: New table Notificacao */

CREATE TABLE Notificacao
(
  id integer NOT NULL AUTO_INCREMENT,
  idCampanha integer NOT NULL,
  idUsuario integer NOT NULL,
  notificationId varchar(255) NOT NULL,
  titulo varchar(255) NOT NULL,
  mensagem text NOT NULL,
  CONSTRAINT PK_Notificacao PRIMARY KEY (id)
);

/* End of Step #54 */

/* Step #55:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #55 */

/* Step #56:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #56 */

/* Step #57: Modify column mensagem of Campanha */

ALTER TABLE Campanha
  ADD mensagem_TMP text;

/* TODO FOR DBDIFFO USER: MAYBE YOU SHOULD MODIFY THE FOLLOWING COPY SCRIPT TO CONVERT DATA. */

SET SQL_SAFE_UPDATES = 0;

UPDATE Campanha SET mensagem_TMP = mensagem;

/* TODO FOR DBDIFFO USER: UNCOMMENT THE FOLLOWING STATEMENT IF YOU WANT TO ENABLE SQL SAFE UPDATES. */

/* SET SQL_SAFE_UPDATES = 1; */

ALTER TABLE Campanha
  DROP mensagem;

ALTER TABLE Campanha
  CHANGE mensagem_TMP mensagem text;

/* TODO FOR DBDIFFO USER: mensagem WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Campanha
  MODIFY mensagem text NOT NULL;

/* End of Step #57 */

/* Step #58: New foreign key FK_Campanha_Notificacao of Campanha */

ALTER TABLE Campanha ADD CONSTRAINT FK_Campanha_Notificacao
  FOREIGN KEY (id) REFERENCES Notificacao (id);

/* End of Step #58 */

/* Step #59: Delete foreign key FK_Campanha_Notificacao of Campanha */

ALTER TABLE Campanha
  DROP FOREIGN KEY FK_Campanha_Notificacao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Campanha' AND index_name = 'FK_Campanha_Notificacao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Campanha_Notificacao ON Campanha');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #59 */

/* Step #60: New foreign key FK_Campanha_Notificacao of Campanha */

ALTER TABLE Campanha ADD CONSTRAINT FK_Campanha_Notificacao
  FOREIGN KEY (id) REFERENCES Notificacao (id);

/* End of Step #60 */

/* Step #61: Delete foreign key FK_Usuario_Segmento of Usuario */

ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_Segmento ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #61 */

/* Step #62: New foreign key FK_UsuarioSegmento_Usuario of UsuarioSegmento */

ALTER TABLE UsuarioSegmento ADD CONSTRAINT FK_UsuarioSegmento_Usuario
  FOREIGN KEY (idUsuario) REFERENCES Usuario (id);

/* End of Step #62 */

/* Step #63:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #63 */

/* Step #64: Modify column nome of Loja */

ALTER TABLE Loja
  ADD nome_TMP varchar(255);

/* TODO FOR DBDIFFO USER: MAYBE YOU SHOULD MODIFY THE FOLLOWING COPY SCRIPT TO CONVERT DATA. */

SET SQL_SAFE_UPDATES = 0;

UPDATE Loja SET nome_TMP = nome;

/* TODO FOR DBDIFFO USER: UNCOMMENT THE FOLLOWING STATEMENT IF YOU WANT TO ENABLE SQL SAFE UPDATES. */

/* SET SQL_SAFE_UPDATES = 1; */

ALTER TABLE Loja
  DROP nome;

ALTER TABLE Loja
  CHANGE nome_TMP nome varchar(255);

/* TODO FOR DBDIFFO USER: nome WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Loja
  MODIFY nome varchar(255) NOT NULL;

/* End of Step #64 */

/* Step #65: Delete foreign key FK_Loja_Segmento of Loja */

ALTER TABLE Loja
  DROP FOREIGN KEY FK_Loja_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Loja' AND index_name = 'FK_Loja_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Loja_Segmento ON Loja');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #65 */

/* Step #66: New foreign key FK_LojaSegmento_Loja of LojaSegmento */

ALTER TABLE LojaSegmento ADD CONSTRAINT FK_LojaSegmento_Loja
  FOREIGN KEY (idLoja) REFERENCES Loja (id);

/* End of Step #66 */

/* Step #67: Delete foreign key FK_Campanha_Segmento of Campanha */

ALTER TABLE Campanha
  DROP FOREIGN KEY FK_Campanha_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Campanha' AND index_name = 'FK_Campanha_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Campanha_Segmento ON Campanha');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #67 */

/* Step #68: New foreign key FK_CampanhaSegmentos_ of CampanhaSegmentos */

ALTER TABLE CampanhaSegmentos ADD CONSTRAINT FK_CampanhaSegmentos_
  FOREIGN KEY (idCampanha) REFERENCES Campanha (id);

/* End of Step #68 */

/* Step #69: Modify foreign key FK_CampanhaSegmentos_Campanha of CampanhaSegmentos */

ALTER TABLE CampanhaSegmentos
  DROP FOREIGN KEY FK_CampanhaSegmentos_;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CampanhaSegmentos' AND index_name = 'FK_CampanhaSegmentos_');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CampanhaSegmentos_ ON CampanhaSegmentos');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE CampanhaSegmentos ADD CONSTRAINT FK_CampanhaSegmentos_Campanha
  FOREIGN KEY (idCampanha) REFERENCES Campanha (id);

/* End of Step #69 */

/* Step #70: Delete foreign key FK_Campanha_Notificacao of Campanha */

ALTER TABLE Campanha
  DROP FOREIGN KEY FK_Campanha_Notificacao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Campanha' AND index_name = 'FK_Campanha_Notificacao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Campanha_Notificacao ON Campanha');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #70 */

/* Step #71: New foreign key FK_Notificacao_Campanha of Notificacao */

ALTER TABLE Notificacao ADD CONSTRAINT FK_Notificacao_Campanha
  FOREIGN KEY (idCampanha) REFERENCES Campanha (id);

/* End of Step #71 */

/* Step #72: Delete foreign key FK_CampanhaSegmentos_Segmento of CampanhaSegmentos */

ALTER TABLE CampanhaSegmentos
  DROP FOREIGN KEY FK_CampanhaSegmentos_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CampanhaSegmentos' AND index_name = 'FK_CampanhaSegmentos_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CampanhaSegmentos_Segmento ON CampanhaSegmentos');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #72 */

/* Step #73: Delete foreign key FK_LojaSegmento_Segmento of LojaSegmento */

ALTER TABLE LojaSegmento
  DROP FOREIGN KEY FK_LojaSegmento_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'LojaSegmento' AND index_name = 'FK_LojaSegmento_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_LojaSegmento_Segmento ON LojaSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #73 */

/* Step #74: Delete foreign key FK_UsuarioSegmento_Segmento of UsuarioSegmento */

ALTER TABLE UsuarioSegmento
  DROP FOREIGN KEY FK_UsuarioSegmento_Segmento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'UsuarioSegmento' AND index_name = 'FK_UsuarioSegmento_Segmento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_UsuarioSegmento_Segmento ON UsuarioSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #74 */

/* Step #75:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #75 */

/* Step #76: Delete table Segmento */

DROP TABLE Segmento;

/* End of Step #76 */

/* Step #77: Delete foreign key FK_UsuarioSegmento_Usuario of UsuarioSegmento */

ALTER TABLE UsuarioSegmento
  DROP FOREIGN KEY FK_UsuarioSegmento_Usuario;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'UsuarioSegmento' AND index_name = 'FK_UsuarioSegmento_Usuario');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_UsuarioSegmento_Usuario ON UsuarioSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #77 */

/* Step #78:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #78 */

/* Step #79: Delete table UsuarioSegmento */

DROP TABLE UsuarioSegmento;

/* End of Step #79 */

/* Step #80: Delete foreign key FK_LojaSegmento_Loja of LojaSegmento */

ALTER TABLE LojaSegmento
  DROP FOREIGN KEY FK_LojaSegmento_Loja;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'LojaSegmento' AND index_name = 'FK_LojaSegmento_Loja');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_LojaSegmento_Loja ON LojaSegmento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #80 */

/* Step #81: Delete foreign key FK_Loja_Administrador of Loja */

ALTER TABLE Loja
  DROP FOREIGN KEY FK_Loja_Administrador;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Loja' AND index_name = 'FK_Loja_Administrador');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Loja_Administrador ON Loja');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #81 */

/* Step #82:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #82 */

/* Step #83: Delete table Loja */

DROP TABLE Loja;

/* End of Step #83 */

/* Step #84: Delete foreign key FK_CampanhaSegmentos_Campanha of CampanhaSegmentos */

ALTER TABLE CampanhaSegmentos
  DROP FOREIGN KEY FK_CampanhaSegmentos_Campanha;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CampanhaSegmentos' AND index_name = 'FK_CampanhaSegmentos_Campanha');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CampanhaSegmentos_Campanha ON CampanhaSegmentos');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #84 */

/* Step #85: Delete foreign key FK_Notificacao_Campanha of Notificacao */

ALTER TABLE Notificacao
  DROP FOREIGN KEY FK_Notificacao_Campanha;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Notificacao' AND index_name = 'FK_Notificacao_Campanha');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Notificacao_Campanha ON Notificacao');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #85 */

/* Step #86:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #86 */

/* Step #87: Delete table Campanha */

DROP TABLE Campanha;

/* End of Step #87 */

/* Step #88:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #88 */

/* Step #89: Delete table CampanhaSegmentos */

DROP TABLE CampanhaSegmentos;

/* End of Step #89 */

/* Step #90:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #90 */

/* Step #91: Delete table LojaSegmento */

DROP TABLE LojaSegmento;

/* End of Step #91 */

/* Step #92:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #92 */

/* Step #93: Delete table Notificacao */

DROP TABLE Notificacao;

/* End of Step #93 */

/* Step #94: Delete column generoInteresse of Usuario */

ALTER TABLE Usuario
  DROP generoInteresse;

/* End of Step #94 */

/* Step #95: New table Instituicao */

CREATE TABLE Instituicao
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  sigla varchar(4) NOT NULL,
  logo varchar(255),
  CONSTRAINT id PRIMARY KEY (id)
);

/* End of Step #95 */

/* Step #96:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #96 */

/* Step #97:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #97 */

/* Step #98: New table Modalidade */

CREATE TABLE Modalidade
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  icone varchar(255),
  chaveamento tinyint DEFAULT 0,
  CONSTRAINT PK_Modalidade PRIMARY KEY (id)
);

/* End of Step #98 */

/* Step #99:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #99 */

/* Step #100:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #100 */

/* Step #101: New table Edicao */

CREATE TABLE Edicao
(
  id integer NOT NULL AUTO_INCREMENT,
  ano integer NOT NULL,
  CONSTRAINT PK_Edicao PRIMARY KEY (id)
);

/* End of Step #101 */

/* Step #102:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #102 */

/* Step #103:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #103 */

/* Step #104: New table EdicaoParticipante */

CREATE TABLE EdicaoParticipante
(
  id integer NOT NULL,
  idEdicao integer NOT NULL,
  idInstituicao integer NOT NULL,
  CONSTRAINT PK_EdicaoParticipante PRIMARY KEY (id)
);

/* End of Step #104 */

/* Step #105:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #105 */

/* Step #106:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #106 */

/* Step #107:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #107 */

/* Step #108:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #108 */

/* Step #109:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #109 */

/* Step #110:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #110 */

/* Step #111: New foreign key FK_EdicaoParticipante_Edicao of EdicaoParticipante */

ALTER TABLE EdicaoParticipante ADD CONSTRAINT FK_EdicaoParticipante_Edicao
  FOREIGN KEY (idEdicao) REFERENCES Edicao (id);

/* End of Step #111 */

/* Step #112:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #112 */

/* Step #113: New foreign key FK_EdicaoParticipante_Instituicao of EdicaoParticipante */

ALTER TABLE EdicaoParticipante ADD CONSTRAINT FK_EdicaoParticipante_Instituicao
  FOREIGN KEY (idInstituicao) REFERENCES Instituicao (id);

/* End of Step #113 */

/* Step #114: New table Competicao */

CREATE TABLE Competicao
(
  id integer NOT NULL AUTO_INCREMENT,
  idEdicao bigint NOT NULL,
  idModalidade bigint NOT NULL,
  CONSTRAINT PK_Competicao PRIMARY KEY (id)
);

/* End of Step #114 */

/* Step #115:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #115 */

/* Step #116: Modify column idEdicao of Competicao */

ALTER TABLE Competicao
  MODIFY idEdicao integer NOT NULL;

/* End of Step #116 */

/* Step #117: Modify column idModalidade of Competicao */

ALTER TABLE Competicao
  MODIFY idModalidade integer NOT NULL;

/* End of Step #117 */

/* Step #118: New foreign key FK_Competicao_ of Competicao */

ALTER TABLE Competicao ADD CONSTRAINT FK_Competicao_
  FOREIGN KEY (idEdicao) REFERENCES Edicao (id);

/* End of Step #118 */

/* Step #119: Modify foreign key FK_Competicao_Edicao of Competicao */

ALTER TABLE Competicao
  DROP FOREIGN KEY FK_Competicao_;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Competicao' AND index_name = 'FK_Competicao_');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Competicao_ ON Competicao');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Competicao ADD CONSTRAINT FK_Competicao_Edicao
  FOREIGN KEY (idEdicao) REFERENCES Edicao (id);

/* End of Step #119 */

/* Step #120: New foreign key FK_Competicao_Modalidade of Competicao */

ALTER TABLE Competicao ADD CONSTRAINT FK_Competicao_Modalidade
  FOREIGN KEY (idModalidade) REFERENCES Modalidade (id);

/* End of Step #120 */

/* Step #121:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #121 */

/* Step #122: New table CompeticaoParticipante */

CREATE TABLE CompeticaoParticipante
(
  id integer NOT NULL AUTO_INCREMENT,
  idCompeticao integer NOT NULL,
  idParticipante integer NOT NULL,
  colocacao integer,
  CONSTRAINT PK_CompeticaoParticipante PRIMARY KEY (id)
);

/* End of Step #122 */

/* Step #123:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #123 */

/* Step #124: New foreign key FK_CompeticaoParticipante_Competicao of CompeticaoParticipante */

ALTER TABLE CompeticaoParticipante ADD CONSTRAINT FK_CompeticaoParticipante_Competicao
  FOREIGN KEY (idCompeticao) REFERENCES Competicao (id);

/* End of Step #124 */

/* Step #125: New foreign key FK_CompeticaoParticipante_Participante of CompeticaoParticipante */

ALTER TABLE CompeticaoParticipante ADD CONSTRAINT FK_CompeticaoParticipante_Participante
  FOREIGN KEY (idParticipante) REFERENCES EdicaoParticipante (id);

/* End of Step #125 */

/* Step #126:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #126 */

/* Step #127:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #127 */

/* Step #128:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #128 */

/* Step #129:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #129 */

/* Step #130: New table Jogo */

CREATE TABLE Jogo
(
  id integer NOT NULL AUTO_INCREMENT,
  time1 integer,
  time2 integer,
  placar1 tinyint,
  placar2 tinyint,
  idAnterior1 integer,
  idAnterior2 integer,
  CONSTRAINT PK_Jogo PRIMARY KEY (id)
);

/* End of Step #130 */

/* Step #131:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #131 */

/* Step #132:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #132 */

/* Step #133: New column idCompeticao of Jogo */

ALTER TABLE Jogo
  ADD idCompeticao integer;

/* End of Step #133 */

/* Step #134: Modify column idCompeticao of Jogo */

/* TODO FOR DBDIFFO USER: idCompeticao WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Jogo
  MODIFY idCompeticao integer NOT NULL;

/* End of Step #134 */

/* Step #135: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #135 */

/* Step #136: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #136 */

/* Step #137: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #137 */

/* Step #138: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #138 */

/* Step #139: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #139 */

/* Step #140: Modify table Jogo */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #140 */

/* Step #141: New foreign key FK_Jogo_Competicao of Jogo */

ALTER TABLE Jogo ADD CONSTRAINT FK_Jogo_Competicao
  FOREIGN KEY (idCompeticao) REFERENCES Competicao (id);

/* End of Step #141 */

/* Step #142: New foreign key FK_Jogo_Time1 of Jogo */

ALTER TABLE Jogo ADD CONSTRAINT FK_Jogo_Time1
  FOREIGN KEY (time1) REFERENCES CompeticaoParticipante (id);

/* End of Step #142 */

/* Step #143: New foreign key FK_Jogo_Time2 of Jogo */

ALTER TABLE Jogo ADD CONSTRAINT FK_Jogo_Time2
  FOREIGN KEY (time2) REFERENCES CompeticaoParticipante (id);

/* End of Step #143 */

/* Step #144: New table Banner */

CREATE TABLE Banner
(
  id integer NOT NULL AUTO_INCREMENT,
  banner varchar(255) NOT NULL,
  status tinyint NOT NULL DEFAULT 1,
  CONSTRAINT PK_Banner PRIMARY KEY (id)
);

/* End of Step #144 */

/* Step #145:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #145 */

/* Step #146:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #146 */

/* Step #147: Delete foreign key FK_EdicaoParticipante_Instituicao of EdicaoParticipante */

ALTER TABLE EdicaoParticipante
  DROP FOREIGN KEY FK_EdicaoParticipante_Instituicao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'EdicaoParticipante' AND index_name = 'FK_EdicaoParticipante_Instituicao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_EdicaoParticipante_Instituicao ON EdicaoParticipante');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #147 */

/* Step #148:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #148 */

/* Step #149: Delete table Instituicao */

DROP TABLE Instituicao;

/* End of Step #149 */

/* Step #150: Delete foreign key FK_CompeticaoParticipante_Participante of CompeticaoParticipante */

ALTER TABLE CompeticaoParticipante
  DROP FOREIGN KEY FK_CompeticaoParticipante_Participante;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CompeticaoParticipante' AND index_name = 'FK_CompeticaoParticipante_Participante');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CompeticaoParticipante_Participante ON CompeticaoParticipante');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #150 */

/* Step #151: Delete foreign key FK_EdicaoParticipante_Edicao of EdicaoParticipante */

ALTER TABLE EdicaoParticipante
  DROP FOREIGN KEY FK_EdicaoParticipante_Edicao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'EdicaoParticipante' AND index_name = 'FK_EdicaoParticipante_Edicao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_EdicaoParticipante_Edicao ON EdicaoParticipante');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #151 */

/* Step #152:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #152 */

/* Step #153: Delete table EdicaoParticipante */

DROP TABLE EdicaoParticipante;

/* End of Step #153 */

/* Step #154: Delete foreign key FK_Competicao_Edicao of Competicao */

ALTER TABLE Competicao
  DROP FOREIGN KEY FK_Competicao_Edicao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Competicao' AND index_name = 'FK_Competicao_Edicao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Competicao_Edicao ON Competicao');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #154 */

/* Step #155:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #155 */

/* Step #156: Delete table Edicao */

DROP TABLE Edicao;

/* End of Step #156 */

/* Step #157: Delete foreign key FK_CompeticaoParticipante_Competicao of CompeticaoParticipante */

ALTER TABLE CompeticaoParticipante
  DROP FOREIGN KEY FK_CompeticaoParticipante_Competicao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CompeticaoParticipante' AND index_name = 'FK_CompeticaoParticipante_Competicao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CompeticaoParticipante_Competicao ON CompeticaoParticipante');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #157 */

/* Step #158: Delete foreign key FK_Jogo_Competicao of Jogo */

ALTER TABLE Jogo
  DROP FOREIGN KEY FK_Jogo_Competicao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Jogo' AND index_name = 'FK_Jogo_Competicao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Jogo_Competicao ON Jogo');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #158 */

/* Step #159: Delete foreign key FK_Competicao_Modalidade of Competicao */

ALTER TABLE Competicao
  DROP FOREIGN KEY FK_Competicao_Modalidade;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Competicao' AND index_name = 'FK_Competicao_Modalidade');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Competicao_Modalidade ON Competicao');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #159 */

/* Step #160:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #160 */

/* Step #161: Delete table Competicao */

DROP TABLE Competicao;

/* End of Step #161 */

/* Step #162: Delete foreign key FK_Jogo_Time1 of Jogo */

ALTER TABLE Jogo
  DROP FOREIGN KEY FK_Jogo_Time1;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Jogo' AND index_name = 'FK_Jogo_Time1');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Jogo_Time1 ON Jogo');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #162 */

/* Step #163: Delete foreign key FK_Jogo_Time2 of Jogo */

ALTER TABLE Jogo
  DROP FOREIGN KEY FK_Jogo_Time2;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Jogo' AND index_name = 'FK_Jogo_Time2');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Jogo_Time2 ON Jogo');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #163 */

/* Step #164:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #164 */

/* Step #165: Delete table CompeticaoParticipante */

DROP TABLE CompeticaoParticipante;

/* End of Step #165 */

/* Step #166:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #166 */

/* Step #167: Delete table Jogo */

DROP TABLE Jogo;

/* End of Step #167 */

/* Step #168:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #168 */

/* Step #169: Delete table Banner */

DROP TABLE Banner;

/* End of Step #169 */

/* Step #170:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #170 */

/* Step #171: Delete table Modalidade */

DROP TABLE Modalidade;

/* End of Step #171 */

/* Step #172: Delete foreign key FK_Usuario_Perfil of Usuario */

ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_Perfil;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_Perfil');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_Perfil ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #172 */

/* Step #173:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #173 */

/* Step #174: Delete table Perfil */

DROP TABLE Perfil;

/* End of Step #174 */

/* Step #175: Delete column genero of Usuario */

ALTER TABLE Usuario
  DROP genero;

/* End of Step #175 */

/* Step #176: New table PlanoConta */

CREATE TABLE PlanoConta
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(120) NOT NULL,
  idPai bigint NOT NULL DEFAULT 0,
  CONSTRAINT PK_PlanoConta PRIMARY KEY (id)
);

/* End of Step #176 */

/* Step #177:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #177 */

/* Step #178:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #178 */

/* Step #179: New table Lancamento */

CREATE TABLE Lancamento
(
  id integer NOT NULL AUTO_INCREMENT,
  tipo tinyint NOT NULL,
  idCliente integer,
  idFornecedor integer,
  idBeneficiario integer,
  numDocumento varchar(40),
  dtVencimento date,
  dtEmissao date,
  dtRealizacao date,
  valorPrevisto double,
  valorRealizado double,
  idBanco integer NOT NULL,
  idTipoDocumento bigint NOT NULL,
  idFormaPagamento bigint NOT NULL,
  idTipoConta bigint NOT NULL,
  idPlanoConta bigint NOT NULL,
  CONSTRAINT PK_Lancamento PRIMARY KEY (id)
);

/* End of Step #179 */

/* Step #180:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #180 */

/* Step #181: New table Banco */

CREATE TABLE Banco
(
  id integer NOT NULL AUTO_INCREMENT,
  CONSTRAINT PK_Banco PRIMARY KEY (id)
);

/* End of Step #181 */

/* Step #182:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #182 */

/* Step #183: Modify column nome of Banco */

ALTER TABLE Banco
  MODIFY id integer NOT NULL;

ALTER TABLE Banco
  DROP PRIMARY KEY;

ALTER TABLE Banco
  ADD nome varchar(50);

/* TODO FOR DBDIFFO USER: MAYBE YOU SHOULD MODIFY THE FOLLOWING COPY SCRIPT TO CONVERT DATA. */

SET SQL_SAFE_UPDATES = 0;

UPDATE Banco SET nome = id;

/* TODO FOR DBDIFFO USER: UNCOMMENT THE FOLLOWING STATEMENT IF YOU WANT TO ENABLE SQL SAFE UPDATES. */

/* SET SQL_SAFE_UPDATES = 1; */

ALTER TABLE Banco
  DROP id;

/* TODO FOR DBDIFFO USER: nome WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Banco
  MODIFY nome varchar(50) NOT NULL;

ALTER TABLE Banco ADD CONSTRAINT PK_Banco
  PRIMARY KEY (nome);

/* End of Step #183 */

/* Step #184:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #184 */

/* Step #185:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #185 */

/* Step #186: Delete table Banco */

DROP TABLE Banco;

/* End of Step #186 */

/* Step #187: New table Banco */

CREATE TABLE Banco
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  agencia varchar(20),
  conta varchar(20),
  CONSTRAINT PK_Banco PRIMARY KEY (id)
);

/* End of Step #187 */

/* Step #188:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #188 */

/* Step #189:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #189 */

/* Step #190:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #190 */

/* Step #191:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #191 */

/* Step #192: New table Associacao */

CREATE TABLE Associacao
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  descricao text,
  idCidade integer,
  endereco varchar(255),
  complemento varchar(30),
  bairro varchar(120),
  telefone varchar(20),
  email varchar(120),
  CONSTRAINT PK_Associacao PRIMARY KEY (id)
);

/* End of Step #192 */

/* Step #193:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #193 */

/* Step #194: New column idAssociacao of Usuario */

ALTER TABLE Usuario
  ADD idAssociacao integer;

/* End of Step #194 */

/* Step #195: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #195 */

/* Step #196: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #196 */

/* Step #197: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #197 */

/* Step #198: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #198 */

/* Step #199: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #199 */

/* Step #200: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #200 */

/* Step #201: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #201 */

/* Step #202: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #202 */

/* Step #203: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #203 */

/* Step #204: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #204 */

/* Step #205: Modify column idPai of PlanoConta */

ALTER TABLE PlanoConta
  ALTER idPai DROP DEFAULT;

ALTER TABLE PlanoConta
  MODIFY idPai integer NOT NULL;

/* End of Step #205 */

/* Step #206: New foreign key FK_PlanoConta_Pai of PlanoConta */

ALTER TABLE PlanoConta ADD CONSTRAINT FK_PlanoConta_Pai
  FOREIGN KEY (idPai) REFERENCES PlanoConta (id);

/* End of Step #206 */

/* Step #207: New foreign key FK_PlanoConta_id of PlanoConta */

ALTER TABLE PlanoConta ADD CONSTRAINT FK_PlanoConta_id
  FOREIGN KEY (id) REFERENCES Lancamento (id) ON DELETE CASCADE;

/* End of Step #207 */

/* Step #208: Modify foreign key FK_PlanoConta_Conta of PlanoConta */

ALTER TABLE PlanoConta
  DROP FOREIGN KEY FK_PlanoConta_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'PlanoConta' AND index_name = 'FK_PlanoConta_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_PlanoConta_id ON PlanoConta');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE PlanoConta ADD CONSTRAINT FK_PlanoConta_Conta
  FOREIGN KEY (id) REFERENCES Lancamento (id) ON DELETE CASCADE;

/* End of Step #208 */

/* Step #209: New foreign key FK_Banco_Lancamento of Banco */

ALTER TABLE Banco ADD CONSTRAINT FK_Banco_Lancamento
  FOREIGN KEY (id) REFERENCES Lancamento (id);

/* End of Step #209 */

/* Step #210: Modify foreign key FK_PlanoConta_Lancamento of PlanoConta */

ALTER TABLE PlanoConta
  DROP FOREIGN KEY FK_PlanoConta_Conta;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'PlanoConta' AND index_name = 'FK_PlanoConta_Conta');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_PlanoConta_Conta ON PlanoConta');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE PlanoConta ADD CONSTRAINT FK_PlanoConta_Lancamento
  FOREIGN KEY (id) REFERENCES Lancamento (id) ON DELETE CASCADE;

/* End of Step #210 */

/* Step #211:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #211 */

/* Step #212: Modify column descricao of Lancamento */

ALTER TABLE Lancamento
  ADD descricao varchar(120);

/* TODO FOR DBDIFFO USER: MAYBE YOU SHOULD MODIFY THE FOLLOWING COPY SCRIPT TO CONVERT DATA. */

SET SQL_SAFE_UPDATES = 0;

UPDATE Lancamento SET descricao = idBeneficiario;

/* TODO FOR DBDIFFO USER: UNCOMMENT THE FOLLOWING STATEMENT IF YOU WANT TO ENABLE SQL SAFE UPDATES. */

/* SET SQL_SAFE_UPDATES = 1; */

ALTER TABLE Lancamento
  DROP idBeneficiario;

/* End of Step #212 */

/* Step #213:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #213 */

/* Step #214: New foreign key FK_Associacao_id of Associacao */

ALTER TABLE Associacao ADD CONSTRAINT FK_Associacao_id
  FOREIGN KEY (id) REFERENCES Usuario (id) ON DELETE CASCADE;

/* End of Step #214 */

/* Step #215: Modify foreign key FK_Associacao_Usuario of Associacao */

ALTER TABLE Associacao
  DROP FOREIGN KEY FK_Associacao_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Associacao' AND index_name = 'FK_Associacao_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Associacao_id ON Associacao');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Associacao ADD CONSTRAINT FK_Associacao_Usuario
  FOREIGN KEY (id) REFERENCES Usuario (id) ON DELETE CASCADE;

/* End of Step #215 */

/* Step #216: New column cnpj of Associacao */

ALTER TABLE Associacao
  ADD cnpj integer;

/* End of Step #216 */

/* Step #217: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #217 */

/* Step #218: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #218 */

/* Step #219: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #219 */

/* Step #220: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #220 */

/* Step #221: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #221 */

/* Step #222: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #222 */

/* Step #223: Modify table Associacao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #223 */

/* Step #224:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #224 */

/* Step #225:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #225 */

/* Step #226:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #226 */

/* Step #227:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #227 */

/* Step #228:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #228 */

/* Step #229:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #229 */

/* Step #230:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #230 */

/* Step #231:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #231 */

/* Step #232:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #232 */

/* Step #233:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #233 */

/* Step #234:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #234 */

/* Step #235:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #235 */

/* Step #236:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #236 */

/* Step #237:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #237 */

/* Step #238:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #238 */

/* Step #239: Delete column idFornecedor of Lancamento */

ALTER TABLE Lancamento
  DROP idFornecedor;

/* End of Step #239 */

/* Step #240: Modify column idCredorDevedor of Lancamento */

ALTER TABLE Lancamento
  CHANGE idCliente idCredorDevedor integer;

/* TODO FOR DBDIFFO USER: idCredorDevedor WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Lancamento
  MODIFY idCredorDevedor integer NOT NULL;

/* End of Step #240 */

/* Step #241:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #241 */

/* Step #242:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #242 */

/* Step #243:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #243 */

/* Step #244: Delete foreign key FK_PlanoConta_Lancamento of PlanoConta */

ALTER TABLE PlanoConta
  DROP FOREIGN KEY FK_PlanoConta_Lancamento;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'PlanoConta' AND index_name = 'FK_PlanoConta_Lancamento');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_PlanoConta_Lancamento ON PlanoConta');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #244 */

/* Step #245: Modify column idPlanoConta of Lancamento */

ALTER TABLE Lancamento
  MODIFY idPlanoConta integer NOT NULL;

/* End of Step #245 */

/* Step #246: New foreign key FK_Lancamento_id of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_id
  FOREIGN KEY (idPlanoConta) REFERENCES PlanoConta (id) ON DELETE CASCADE;

/* End of Step #246 */

/* Step #247: New table CredorDevedor */

CREATE TABLE CredorDevedor
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(120) NOT NULL,
  cnpj varchar(14),
  idCidade integer,
  endereco varchar(255),
  complemento varchar(30),
  bairro varchar(120),
  telefone varchar(20),
  email varchar(120),
  CONSTRAINT PK_CredorDevedor PRIMARY KEY (id)
);

/* End of Step #247 */

/* Step #248:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #248 */

/* Step #249: Modify column nome of Associacao */

ALTER TABLE Associacao
  MODIFY nome varchar(120) NOT NULL;

/* End of Step #249 */

/* Step #250: Modify column cnpj of Associacao */

ALTER TABLE Associacao
  ADD cnpj_TMP varchar(14);

/* TODO FOR DBDIFFO USER: MAYBE YOU SHOULD MODIFY THE FOLLOWING COPY SCRIPT TO CONVERT DATA. */

SET SQL_SAFE_UPDATES = 0;

UPDATE Associacao SET cnpj_TMP = cnpj;

/* TODO FOR DBDIFFO USER: UNCOMMENT THE FOLLOWING STATEMENT IF YOU WANT TO ENABLE SQL SAFE UPDATES. */

/* SET SQL_SAFE_UPDATES = 1; */

ALTER TABLE Associacao
  DROP cnpj;

ALTER TABLE Associacao
  CHANGE cnpj_TMP cnpj varchar(14);

/* End of Step #250 */

/* Step #251: New foreign key FK_Lancamento_CredorDevedor of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_CredorDevedor
  FOREIGN KEY (idCredorDevedor) REFERENCES CredorDevedor (id) ON DELETE CASCADE;

/* End of Step #251 */

/* Step #252: Modify foreign key FK_Lancamento_PlanoConta of Lancamento */

ALTER TABLE Lancamento
  DROP FOREIGN KEY FK_Lancamento_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Lancamento' AND index_name = 'FK_Lancamento_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Lancamento_id ON Lancamento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_PlanoConta
  FOREIGN KEY (idPlanoConta) REFERENCES PlanoConta (id) ON DELETE CASCADE;

/* End of Step #252 */

/* Step #253:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #253 */

/* Step #254: New foreign key FK_Usuario_Associacao of Usuario */

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Associacao
  FOREIGN KEY (idAssociacao) REFERENCES Associacao (id) ON DELETE CASCADE;

/* End of Step #254 */

/* Step #255:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #255 */

/* Step #256: New table FormaPagamento */

CREATE TABLE FormaPagamento
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  CONSTRAINT PK_FormaPagamento PRIMARY KEY (id)
);

/* End of Step #256 */

/* Step #257:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #257 */

/* Step #258:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #258 */

/* Step #259: New table TipoDocumento */

CREATE TABLE TipoDocumento
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  CONSTRAINT PK_TipoDocumento PRIMARY KEY (id)
);

/* End of Step #259 */

/* Step #260:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #260 */

/* Step #261:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #261 */

/* Step #262: Modify column idTipoDocumento of Lancamento */

ALTER TABLE Lancamento
  MODIFY idTipoDocumento integer NOT NULL;

/* End of Step #262 */

/* Step #263: Modify column idFormaPagamento of Lancamento */

ALTER TABLE Lancamento
  MODIFY idFormaPagamento integer NOT NULL;

/* End of Step #263 */

/* Step #264: Modify column idTipoConta of Lancamento */

ALTER TABLE Lancamento
  MODIFY idTipoConta integer NOT NULL;

/* End of Step #264 */

/* Step #265: New table TipoConta */

CREATE TABLE TipoConta
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  CONSTRAINT PK_TipoConta PRIMARY KEY (id)
);

/* End of Step #265 */

/* Step #266:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #266 */

/* Step #267:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #267 */

/* Step #268:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #268 */

/* Step #269:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #269 */

/* Step #270:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #270 */

/* Step #271:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #271 */

/* Step #272:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #272 */

/* Step #273:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #273 */

/* Step #274:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #274 */

/* Step #275:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #275 */

/* Step #276:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #276 */

/* Step #277:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #277 */

/* Step #278: New foreign key FK_Lancamento_id of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_id
  FOREIGN KEY (idTipoDocumento) REFERENCES TipoDocumento (id) ON DELETE CASCADE;

/* End of Step #278 */

/* Step #279: New foreign key FK_Lancamento_FormaPagamento of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_FormaPagamento
  FOREIGN KEY (idFormaPagamento) REFERENCES FormaPagamento (id) ON DELETE CASCADE;

/* End of Step #279 */

/* Step #280: Modify foreign key FK_Lancamento_TipoDocumento of Lancamento */

ALTER TABLE Lancamento
  DROP FOREIGN KEY FK_Lancamento_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Lancamento' AND index_name = 'FK_Lancamento_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Lancamento_id ON Lancamento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_TipoDocumento
  FOREIGN KEY (idTipoDocumento) REFERENCES TipoDocumento (id) ON DELETE CASCADE;

/* End of Step #280 */

/* Step #281:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #281 */

/* Step #282:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #282 */

/* Step #283:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #283 */

/* Step #284:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #284 */

/* Step #285:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #285 */

/* Step #286:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #286 */

/* Step #287: New foreign key FK_Lancamento_id of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_id
  FOREIGN KEY (idTipoConta) REFERENCES TipoConta (id) ON DELETE CASCADE;

/* End of Step #287 */

/* Step #288:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #288 */

/* Step #289: Modify foreign key FK_Lancamento_TipoConta of Lancamento */

ALTER TABLE Lancamento
  DROP FOREIGN KEY FK_Lancamento_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Lancamento' AND index_name = 'FK_Lancamento_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Lancamento_id ON Lancamento');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_TipoConta
  FOREIGN KEY (idTipoConta) REFERENCES TipoConta (id) ON DELETE CASCADE;

/* End of Step #289 */

/* Step #290: New table ResultadoMensal */

CREATE TABLE ResultadoMensal
(
  id integer NOT NULL AUTO_INCREMENT,
  ano integer NOT NULL,
  mes integer NOT NULL,
  valor double NOT NULL,
  idCategoriaResultado integer NOT NULL,
  CONSTRAINT PK_ResultadoMensal PRIMARY KEY (id)
);

/* End of Step #290 */

/* Step #291:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #291 */

/* Step #292:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #292 */

/* Step #293: New table CategoriaResultado */

CREATE TABLE CategoriaResultado
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  prazoRecebimento integer NOT NULL DEFAULT 0 COMMENT 'Em meses',
  CONSTRAINT PK_CategoriaResultado PRIMARY KEY (id)
)
COMMENT 'Os resultados mensais são agrupados em a vista, a prazo, etc...';

/* End of Step #293 */

/* Step #294:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #294 */

/* Step #295:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #295 */

/* Step #296:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #296 */

/* Step #297:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #297 */

/* Step #298: New foreign key FK_ResultadoMensal_id of ResultadoMensal */

ALTER TABLE ResultadoMensal ADD CONSTRAINT FK_ResultadoMensal_id
  FOREIGN KEY (idCategoriaResultado) REFERENCES CategoriaResultado (id) ON DELETE CASCADE;

/* End of Step #298 */

/* Step #299: Modify foreign key FK_ResultadoMensal_CategoriaResultado of ResultadoMensal */

ALTER TABLE ResultadoMensal
  DROP FOREIGN KEY FK_ResultadoMensal_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'ResultadoMensal' AND index_name = 'FK_ResultadoMensal_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_ResultadoMensal_id ON ResultadoMensal');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE ResultadoMensal ADD CONSTRAINT FK_ResultadoMensal_CategoriaResultado
  FOREIGN KEY (idCategoriaResultado) REFERENCES CategoriaResultado (id) ON DELETE CASCADE;

/* End of Step #299 */

/* Step #300: New table Retencao */

CREATE TABLE Retencao
(
  id integer NOT NULL AUTO_INCREMENT,
  ano integer NOT NULL,
  mes integer NOT NULL,
  valor double NOT NULL,
  CONSTRAINT PK_Retencao PRIMARY KEY (id)
);

/* End of Step #300 */

/* Step #301:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #301 */

/* Step #302:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #302 */

/* Step #303:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #303 */

/* Step #304:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #304 */

/* Step #305: New table Cliente */

CREATE TABLE Cliente
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(120) NOT NULL,
  cnpj varchar(14),
  idCidade integer,
  endereco varchar(255),
  complemento varchar(30),
  bairro varchar(120),
  telefone varchar(20),
  email varchar(120),
  CONSTRAINT PK_Cliente PRIMARY KEY (id)
);

/* End of Step #305 */

/* Step #306:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #306 */

/* Step #307:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #307 */

/* Step #308: Delete foreign key FK_Usuario_Associacao of Usuario */

ALTER TABLE Usuario
  DROP FOREIGN KEY FK_Usuario_Associacao;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Usuario' AND index_name = 'FK_Usuario_Associacao');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Usuario_Associacao ON Usuario');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

/* End of Step #308 */

/* Step #309: Modify column idCliente of Usuario */

ALTER TABLE Usuario
  CHANGE idAssociacao idCliente integer;

/* End of Step #309 */

/* Step #310: New foreign key FK_Usuario_Cliente of Usuario */

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #310 */

/* Step #311: New column idAssociacao of Cliente */

ALTER TABLE Cliente
  ADD idAssociacao integer;

/* End of Step #311 */

/* Step #312: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #312 */

/* Step #313: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #313 */

/* Step #314: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #314 */

/* Step #315: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #315 */

/* Step #316: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #316 */

/* Step #317: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #317 */

/* Step #318: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #318 */

/* Step #319: Modify table Cliente */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #319 */

/* Step #320: New foreign key FK_Cliente_Associacao of Cliente */

ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_Associacao
  FOREIGN KEY (idAssociacao) REFERENCES Associacao (id) ON DELETE CASCADE;

/* End of Step #320 */

/* Step #321: New table Cidade */

CREATE TABLE Cidade
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(120) NOT NULL,
  idEstado integer NOT NULL,
  CONSTRAINT PK_Cidade PRIMARY KEY (id)
);

/* End of Step #321 */

/* Step #322:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #322 */

/* Step #323:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #323 */

/* Step #324: New foreign key FK_Cliente_Cidade of Cliente */

ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_Cidade
  FOREIGN KEY (idCidade) REFERENCES Cidade (id) ON DELETE CASCADE;

/* End of Step #324 */

/* Step #325:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #325 */

/* Step #326:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #326 */

/* Step #327: New foreign key FK_Associacao_Cidade of Associacao */

ALTER TABLE Associacao ADD CONSTRAINT FK_Associacao_Cidade
  FOREIGN KEY (idCidade) REFERENCES Cidade (id) ON DELETE CASCADE;

/* End of Step #327 */

/* Step #328: New foreign key FK_CredorDevedor_Cidade of CredorDevedor */

ALTER TABLE CredorDevedor ADD CONSTRAINT FK_CredorDevedor_Cidade
  FOREIGN KEY (idCidade) REFERENCES Cidade (id) ON DELETE CASCADE;

/* End of Step #328 */

/* Step #329: New table Estado */

CREATE TABLE Estado
(
  id integer NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  sigla varchar(2) NOT NULL,
  CONSTRAINT PK_Estado PRIMARY KEY (id)
);

/* End of Step #329 */

/* Step #330:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #330 */

/* Step #331: New foreign key FK_Cidade_Estado of Cidade */

ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_Estado
  FOREIGN KEY (idEstado) REFERENCES Estado (id);

/* End of Step #331 */

/* Step #332: Modify foreign key FK_Cidade_Estado of Cidade */

ALTER TABLE Cidade
  DROP FOREIGN KEY FK_Cidade_Estado;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'Cidade' AND index_name = 'FK_Cidade_Estado');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_Cidade_Estado ON Cidade');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_Estado
  FOREIGN KEY (idEstado) REFERENCES Estado (id) ON DELETE CASCADE;

/* End of Step #332 */

/* Step #333: New column username of Usuario */

ALTER TABLE Usuario
  ADD username varchar(60);

/* End of Step #333 */

/* Step #334: Modify column username of Usuario */

/* TODO FOR DBDIFFO USER: username WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Usuario
  MODIFY username varchar(60) NOT NULL;

/* End of Step #334 */

/* Step #335: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #335 */

/* Step #336: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #336 */

/* Step #337: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #337 */

/* Step #338: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #338 */

/* Step #339: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #339 */

/* Step #340: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #340 */

/* Step #341: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #341 */

/* Step #342: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #342 */

/* Step #343: Modify column authKey of Usuario */

ALTER TABLE Usuario
  CHANGE auth_key authKey varchar(32) NOT NULL;

/* End of Step #343 */

/* Step #344: Modify column passwordHash of Usuario */

ALTER TABLE Usuario
  CHANGE password_hash passwordHash varchar(255) NOT NULL;

/* End of Step #344 */

/* Step #345: Modify column passwordResetToken of Usuario */

ALTER TABLE Usuario
  CHANGE password_reset_token passwordResetToken varchar(255) NOT NULL;

/* End of Step #345 */

/* Step #346: Modify column createdAt of Usuario */

ALTER TABLE Usuario
  CHANGE created_at createdAt bigint NOT NULL;

/* End of Step #346 */

/* Step #347: Modify column updatedAt of Usuario */

ALTER TABLE Usuario
  CHANGE updated_at updatedAt bigint NOT NULL;

/* End of Step #347 */

/* Step #348: Modify column idFirebase of Usuario */

ALTER TABLE Usuario
  CHANGE notificationId idFirebase varchar(255);

/* End of Step #348 */

/* Step #349: Delete column dataNascimento of Usuario */

ALTER TABLE Usuario
  DROP dataNascimento;

/* End of Step #349 */

/* Step #350: New column imagem of Usuario */

ALTER TABLE Usuario
  ADD imagem varchar(120);

/* End of Step #350 */

/* Step #351: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #351 */

/* Step #352: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #352 */

/* Step #353: Modify table Usuario */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #353 */

/* Step #354: New column idCliente of Lancamento */

ALTER TABLE Lancamento
  ADD idCliente integer;

/* End of Step #354 */

/* Step #355: Modify column idCliente of Lancamento */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Lancamento
  MODIFY idCliente integer NOT NULL;

/* End of Step #355 */

/* Step #356: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #356 */

/* Step #357: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #357 */

/* Step #358: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #358 */

/* Step #359: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #359 */

/* Step #360: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #360 */

/* Step #361: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #361 */

/* Step #362: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #362 */

/* Step #363: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #363 */

/* Step #364: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #364 */

/* Step #365: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #365 */

/* Step #366: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #366 */

/* Step #367: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #367 */

/* Step #368: Modify table Lancamento */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #368 */

/* Step #369: New foreign key FK_Lancamento_Cliente of Lancamento */

ALTER TABLE Lancamento ADD CONSTRAINT FK_Lancamento_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #369 */

/* Step #370: New column idCliente of PlanoConta */

ALTER TABLE PlanoConta
  ADD idCliente integer;

/* End of Step #370 */

/* Step #371: Modify column idCliente of PlanoConta */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE PlanoConta
  MODIFY idCliente integer NOT NULL;

/* End of Step #371 */

/* Step #372: Modify table PlanoConta */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #372 */

/* Step #373: Modify table PlanoConta */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #373 */

/* Step #374: New foreign key FK_PlanoConta_Cliente of PlanoConta */

ALTER TABLE PlanoConta ADD CONSTRAINT FK_PlanoConta_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #374 */

/* Step #375:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #375 */

/* Step #376: New column idCliente of CredorDevedor */

ALTER TABLE CredorDevedor
  ADD idCliente integer;

/* End of Step #376 */

/* Step #377: Modify column idCliente of CredorDevedor */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE CredorDevedor
  MODIFY idCliente integer NOT NULL;

/* End of Step #377 */

/* Step #378: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #378 */

/* Step #379: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #379 */

/* Step #380: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #380 */

/* Step #381: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #381 */

/* Step #382: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #382 */

/* Step #383: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #383 */

/* Step #384: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #384 */

/* Step #385: Modify table CredorDevedor */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #385 */

/* Step #386: New foreign key FK_CredorDevedor_Cliente of CredorDevedor */

ALTER TABLE CredorDevedor ADD CONSTRAINT FK_CredorDevedor_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id);

/* End of Step #386 */

/* Step #387: Modify foreign key FK_CredorDevedor_Cliente of CredorDevedor */

ALTER TABLE CredorDevedor
  DROP FOREIGN KEY FK_CredorDevedor_Cliente;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'CredorDevedor' AND index_name = 'FK_CredorDevedor_Cliente');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_CredorDevedor_Cliente ON CredorDevedor');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE CredorDevedor ADD CONSTRAINT FK_CredorDevedor_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #387 */

/* Step #388: New column idCliente of Banco */

ALTER TABLE Banco
  ADD idCliente integer;

/* End of Step #388 */

/* Step #389: Modify column idCliente of Banco */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Banco
  MODIFY idCliente integer NOT NULL;

/* End of Step #389 */

/* Step #390: Modify table Banco */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #390 */

/* Step #391: Modify table Banco */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #391 */

/* Step #392: Modify table Banco */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #392 */

/* Step #393: New foreign key FK_Banco_Cliente of Banco */

ALTER TABLE Banco ADD CONSTRAINT FK_Banco_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #393 */

/* Step #394: New column idCliente of ResultadoMensal */

ALTER TABLE ResultadoMensal
  ADD idCliente integer;

/* End of Step #394 */

/* Step #395: Modify column idCliente of ResultadoMensal */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE ResultadoMensal
  MODIFY idCliente integer NOT NULL;

/* End of Step #395 */

/* Step #396: Modify table ResultadoMensal */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #396 */

/* Step #397: Modify table ResultadoMensal */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #397 */

/* Step #398: Modify table ResultadoMensal */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #398 */

/* Step #399: Modify table ResultadoMensal */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #399 */

/* Step #400: New foreign key FK_ResultadoMensal_id of ResultadoMensal */

ALTER TABLE ResultadoMensal ADD CONSTRAINT FK_ResultadoMensal_id
  FOREIGN KEY (idCliente) REFERENCES Cliente (id);

/* End of Step #400 */

/* Step #401: Modify foreign key FK_ResultadoMensal_Cliente of ResultadoMensal */

ALTER TABLE ResultadoMensal
  DROP FOREIGN KEY FK_ResultadoMensal_id;

SET @exist := (SELECT count(*) FROM information_schema.statistics WHERE table_schema = database() AND table_name = 'ResultadoMensal' AND index_name = 'FK_ResultadoMensal_id');
SET @sqlstmt := IF( @exist = 0, 'SELECT ''INFO: Index does not exist.''', 'DROP INDEX FK_ResultadoMensal_id ON ResultadoMensal');
PREPARE stmt FROM @sqlstmt;
EXECUTE stmt;

ALTER TABLE ResultadoMensal ADD CONSTRAINT FK_ResultadoMensal_Cliente
  FOREIGN KEY (idCliente) REFERENCES Cliente (id) ON DELETE CASCADE;

/* End of Step #401 */

/* Step #402:  */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #402 */

/* Step #403: New column idCliente of Retencao */

ALTER TABLE Retencao
  ADD idCliente integer;

/* End of Step #403 */

/* Step #404: Modify column idCliente of Retencao */

/* TODO FOR DBDIFFO USER: idCliente WAS A NULLABLE COLUMN. SEVERAL ROWS MAY CONTAIN NULL VALUES. YOU MUST SET NON-NULL VALUES FOR THIS COLUMN BEFORE CHANGING IT TO NON-NULLABLE! */

ALTER TABLE Retencao
  MODIFY idCliente integer NOT NULL;

/* End of Step #404 */

/* Step #405: Modify table Retencao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #405 */

/* Step #406: Modify table Retencao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #406 */

/* Step #407: Modify table Retencao */

/* THIS STEP DOES NOT GENERATE AN SQL SCRIPT. */

/* End of Step #407 */

/* Step #408: New foreign key FK_Retencao_id of Retencao */

ALTER TABLE Retencao ADD CONSTRAINT FK_Retencao_id
  FOREIGN KEY (idCliente) REFERENCES Cliente (id);

/* End of Step #408 */
