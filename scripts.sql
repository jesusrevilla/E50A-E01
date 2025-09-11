
-- Sección 1: Creación de Tablas

-- Tabla Libros
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    anio_publicacion INT
);

-- Insertar registros en libros
INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('La Odisea', 'Homero', -700);


-- Tabla Miembros
CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Insertar registros en miembros
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Juan Pérez', '2023-01-15'),
('Ana Gómez', '2023-03-20');


-- Tabla Préstamos
CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    PRIMARY KEY (id_libro, id_miembro, fecha_prestamo),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


-- Insertar registros en prestamos (relacionar libros con miembros)
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2024-04-01'),
(2, 1, '2024-05-10'),
(3, 2, '2024-06-15');
