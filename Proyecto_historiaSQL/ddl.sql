CREATE DATABASE IF NOT EXISTS `Proyecto_historiaSQL`;

USE `Proyecto_historiaSQL`;

CREATE TABLE Alcance (
    id_Alcance INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Decada (
    id_Decada INT PRIMARY KEY AUTO_INCREMENT,
    Decada VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Eventos (
    id_Evento INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE,
    Descripcion TEXT NOT NULL,
    id_Decada INT NOT NULL,
    id_Alcance INT NOT NULL,
    FOREIGN KEY (id_Decada) REFERENCES Decada (id_Decada),
    FOREIGN KEY (id_Alcance) REFERENCES Alcance (id_Alcance)
);

CREATE TABLE Documentacion (
    id_Documentacion INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Eventos_Documentacion (
    id_Eventos_Documentacion INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_Documentacion INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_Documentacion) REFERENCES Documentacion (id_Documentacion)
);

CREATE TABLE TipoConflicto (
    id_TipoConflicto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Eventos_TipoConflicto (
    id_Eventos_TipoConflicto INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_TipoConflicto INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_TipoConflicto) REFERENCES TipoConflicto (id_TipoConflicto)
);

CREATE TABLE Personajes (
    id_Personajes INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Fecha_Fallecimiento DATE
);

CREATE TABLE Eventos_Personajes (
    id_Eventos_Personajes INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_Personajes INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_Personajes) REFERENCES Personajes (id_Personajes)
);

CREATE TABLE Locaciones (
    id_Locacion INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL
);

CREATE TABLE Eventos_Locaciones (
    id_Eventos_Locaciones INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_Locacion INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_Locacion) REFERENCES Locaciones (id_Locacion)
);

CREATE TABLE Causas (
    id_Causa INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL
);

CREATE TABLE Eventos_Causas (
    id_Eventos_Causas INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_Causa INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_Causa) REFERENCES Causas (id_Causa)
);

CREATE TABLE AspectoTransformado (
    id_AspectoTransformado INT PRIMARY KEY AUTO_INCREMENT,
    Aspecto VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Eventos_AspectoTransformado (
    id_Eventos_AspectoTransformado INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_AspectoTransformado INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_AspectoTransformado) REFERENCES AspectoTransformado (id_AspectoTransformado)
);

CREATE TABLE SubEventos (
    id_SubEventos INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(128) NOT NULL UNIQUE,
    Descripcion TEXT NOT NULL,
    Fecha DATE
);

CREATE TABLE Eventos_SubEventos (
    id_Eventos_SubEventos INT PRIMARY KEY AUTO_INCREMENT,
    id_Evento INT NOT NULL,
    id_SubEventos INT NOT NULL,
    FOREIGN KEY (id_Evento) REFERENCES Eventos (id_Evento),
    FOREIGN KEY (id_SubEventos) REFERENCES SubEventos (id_SubEventos)
);