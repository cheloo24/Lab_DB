/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     27-11-2014 5:01:39                           */
/*==============================================================*/


DROP TABLE IF EXISTS APODO;

DROP TABLE IF EXISTS ESTADISTICA;

DROP TABLE IF EXISTS FUTBOLISTA;

DROP TABLE IF EXISTS HASHTAG;

DROP TABLE IF EXISTS MENSAJE;

DROP TABLE IF EXISTS MENSAJE_A_PROCESAR;

DROP TABLE IF EXISTS MENSAJE_FUTBOLISTA;

DROP TABLE IF EXISTS MENSAJE_PALABRA;

DROP TABLE IF EXISTS PALABRA;

DROP TABLE IF EXISTS USUARIO;

/*==============================================================*/
/* Table: APODO                                                 */
/*==============================================================*/
CREATE TABLE APODO
(
   ID_APODO             INT NOT NULL AUTO_INCREMENT,
   ID_JUGADOR           INT NOT NULL,
   PSEUDONIMO           VARCHAR(140),
   PRIMARY KEY (ID_APODO)
);

/*==============================================================*/
/* Table: ESTADISTICA                                           */
/*==============================================================*/
CREATE TABLE ESTADISTICA
(
   ID_ESTADISTICA       INT NOT NULL AUTO_INCREMENT,
   ID_JUGADOR           INT NOT NULL,
   CONTADOR_MENCION_    INT,
   TIPO_MENCION         INT,
   PRIMARY KEY (ID_JUGADOR, ID_ESTADISTICA)
);

/*==============================================================*/
/* Table: FUTBOLISTA                                            */
/*==============================================================*/
CREATE TABLE FUTBOLISTA
(
   ID_JUGADOR           INT NOT NULL AUTO_INCREMENT,
   NOMBRE_JUGADOR       VARCHAR(20),
   CUENTA_DE_TWITTER    VARCHAR(50),
   EDAD                 INT,
   FECHA_DE_NACIMIENTO  DATE,
   EQUIPO               VARCHAR(100),
   PRIMARY KEY (ID_JUGADOR)
);

/*==============================================================*/
/* Table: HASHTAG                                               */
/*==============================================================*/
CREATE TABLE HASHTAG
(
   ID_MSJ               INT,
   HASHTAG              INT NOT NULL,
   HASHTAG2             VARCHAR(140),
   PRIMARY KEY (HASHTAG)
);

/*==============================================================*/
/* Table: MENSAJE                                               */
/*==============================================================*/
CREATE TABLE MENSAJE
(
   ID_MSJ               INT NOT NULL AUTO_INCREMENT,
   ID_USUARIO           INT NOT NULL,
   CONTENIDO            VARCHAR(140),
   HASHTAG              VARCHAR(140),
   ETIQUETA             VARCHAR(20),
   FECHA_MSJE           DATETIME,
   PRIMARY KEY (ID_MSJ)
);

/*==============================================================*/
/* Table: MENSAJE_A_PROCESAR                                    */
/*==============================================================*/
CREATE TABLE MENSAJE_A_PROCESAR
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   CONTENIDO_MSJ        VARCHAR(140),
   HASHTAG_MSJ          VARCHAR(140),
   ETIQUETA_MSJ         VARCHAR(20),
   FECHA_MSJ            DATETIME,
   PROCESADO            VARCHAR(30),
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: MENSAJE_FUTBOLISTA                                    */
/*==============================================================*/
CREATE TABLE MENSAJE_FUTBOLISTA
(
   ID_JUGADOR           INT NOT NULL,
   ID_MSJ               INT NOT NULL,
   PRIMARY KEY (ID_JUGADOR, ID_MSJ)
);

/*==============================================================*/
/* Table: MENSAJE_PALABRA                                       */
/*==============================================================*/
CREATE TABLE MENSAJE_PALABRA
(
   ID_MSJ               INT NOT NULL,
   ID_PALABRA           INT NOT NULL,
   PRIMARY KEY (ID_MSJ, ID_PALABRA)
);

/*==============================================================*/
/* Table: PALABRA                                               */
/*==============================================================*/
CREATE TABLE PALABRA
(
   ID_PALABRA           INT NOT NULL AUTO_INCREMENT,
   PALABRA              VARCHAR(100),
   TIPO_PALABRA         INT,
   PRIMARY KEY (ID_PALABRA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
CREATE TABLE USUARIO
(
   ID_USUARIO           INT NOT NULL AUTO_INCREMENT,
   FECHA_DE_CREACION    DATE,
   NOMBRE_USUARIO       VARCHAR(20),
   PRIMARY KEY (ID_USUARIO)
);

ALTER TABLE APODO ADD CONSTRAINT FK_TIENE FOREIGN KEY (ID_JUGADOR)
      REFERENCES FUTBOLISTA (ID_JUGADOR) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ESTADISTICA ADD CONSTRAINT FK_GUARDA FOREIGN KEY (ID_JUGADOR)
      REFERENCES FUTBOLISTA (ID_JUGADOR) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HASHTAG ADD CONSTRAINT FK_PHYSICALDATAMODEL FOREIGN KEY (ID_MSJ)
      REFERENCES MENSAJE (ID_MSJ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MENSAJE ADD CONSTRAINT FK_USUARIO_MENSAJE FOREIGN KEY (ID_USUARIO)
      REFERENCES USUARIO (ID_USUARIO) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MENSAJE_FUTBOLISTA ADD CONSTRAINT FK_MENSAJE_FUTBOLISTA FOREIGN KEY (ID_JUGADOR)
      REFERENCES FUTBOLISTA (ID_JUGADOR) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MENSAJE_FUTBOLISTA ADD CONSTRAINT FK_MENSAJE_FUTBOLISTA2 FOREIGN KEY (ID_MSJ)
      REFERENCES MENSAJE (ID_MSJ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MENSAJE_PALABRA ADD CONSTRAINT FK_USA FOREIGN KEY (ID_MSJ)
      REFERENCES MENSAJE (ID_MSJ) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MENSAJE_PALABRA ADD CONSTRAINT FK_USA2 FOREIGN KEY (ID_PALABRA)
      REFERENCES PALABRA (ID_PALABRA) ON DELETE RESTRICT ON UPDATE RESTRICT;

