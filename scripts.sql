
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


-- Sección 2: Crear un índice en el campo 'titulo' de la tabla 'libros'
CREATE INDEX idx_titulo_libros ON libros(titulo);


-- Secció 4: Consultas Avanzadas

-- Consulta 1 Obtener los títulos de los libros y los nombres 
-- de los miembros a los que han sido prestados
SELECT l.titulo, m.nombre
FROM libros l
JOIN prestamos p ON l.id = p.id_libro
JOIN miembros m ON p.id_miembro = m.id;




-- Consulta 2 Obtener los nombres de los miembros a los que se 
-- les ha prestado el libro titulado 'Cien Años de Soledad'
SELECT m.nombre
FROM miembros m
JOIN prestamos p ON m.id = p.id_miembro
JOIN libros l ON p.id_libro = l.id
WHERE l.titulo = 'Cien Años de Soledad';

SELECT m.nombre
FROM miembros m
JOIN prestamos p ON m.id = p.id_miembro
JOIN libros l ON p.id_libro = l.id
WHERE l.titulo = 'Cien Años de Soledad';

-- Insertar registros en prestamos (relacionar libros con miembros)
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2024-04-01'),
(2, 1, '2024-05-10'),
(3, 2, '2024-06-15');
