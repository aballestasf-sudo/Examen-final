CREATE DATABASE CEA_v2;
USE CEA_v2;


CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE
);


CREATE TABLE Programa (
    id_programa INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    duracion INT CHECK (duracion > 0),
    facultad VARCHAR(100) NOT NULL
);


CREATE TABLE Docente (
    id_docente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    especialidad VARCHAR(100)
);


CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT NOT NULL,
    id_programa INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_programa) REFERENCES Programa(id_programa)
);


CREATE TABLE Evaluacion (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_docente INT NOT NULL,
    nota DECIMAL(4,2) CHECK (nota >= 0 AND nota <= 5),
    observaciones TEXT,
    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
    FOREIGN KEY (id_docente) REFERENCES Docente(id_docente)
);