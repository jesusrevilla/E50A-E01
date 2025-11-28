-- Seccion 1: Creacion de tablas e insercion de datos a las tablas 
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    título VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    año_publicación INTEGER
);

INSERT INTO libros (título, autor, año_publicación) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('El Quijote', 'Miguel de Cervantes', 1605),
('1984', 'George Orwell', 1949);


CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_registro DATE
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('María González', '2024-01-15'),
('Carlos Rodríguez', '2024-02-20');

CREATE TABLE prestamos (
    id_libro INTEGER NOT NULL,
    id_miembro INTEGER NOT NULL,
    fecha_prestamo DATE NOT NULL,
    PRIMARY KEY (id_libro, id_miembro),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-05'),
(1, 2, '2024-03-10');

--Seccion 2: Indice de en el campo de titulo de la tabla libro
CREATE INDEX idx_libros_titulo ON libros(título);


-- Seccion 4: De busqueda avanzada.
SELECT l.título AS titulo_libro, m.nombre AS nombre_miembro
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre AS nombre_miembro
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.título = 'Cien Años de Soledad';
