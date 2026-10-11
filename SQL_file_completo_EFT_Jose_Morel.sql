CREATE DATABASE  biblioteca_escolar;
USE biblioteca_escolar;

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    título VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn VARCHAR(50) NOT NULL UNIQUE,
    editorial VARCHAR(100) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut VARCHAR(20) NOT NULL UNIQUE,
    curso VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL -- 'bibliotecario' o 'estudiante'
);

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_libro INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    devuelto BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);


INSERT INTO categorias (nombre) VALUES ('Ficción'), ('Ciencia'), ('Historia'), ('Literatura Infantil');

INSERT INTO libros (título, autor, isbn, editorial, stock, id_categoria) VALUES 
('Cien años de soledad', 'Gabriel García Márquez', '978-0307474728', 'Sudamericana', 5, 1),
('Breve historia del tiempo', 'Stephen Hawking', '978-0553380163', 'Bantam Books', 3, 2),
('La Araucana', 'Alonso de Ercilla', '978-9561223448', 'Zig-Zag', 4, 3);

INSERT INTO estudiantes (nombre, rut, curso, correo) VALUES 
('Carlos Pérez', '20123456-7', '4to Medio', 'carlos.perez@colegio.cl'),
('Ana Gómez', '21987654-3', '3ro Medio', 'ana.gomez@colegio.cl');

INSERT INTO usuarios (nombre, rut, correo, contraseña, rol) VALUES 
('Admin Bibliotecario', '12345678-9', 'admin@biblioteca.cl', 'admin123', 'bibliotecario'),
('Carlos Estudiante', '20123456-7', 'carlos.perez@colegio.cl', 'carlos123', 'estudiante');

INSERT INTO prestamos (id_estudiante, id_libro, fecha_prestamo, fecha_devolucion, devuelto) VALUES 
(1, 1, '2026-10-01', '2026-10-15', FALSE);