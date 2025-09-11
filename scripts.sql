-- Sección 1: Creación y Manipulación de Tablas
--Cree una tabla llamada libros con los siguientes campos:
-- id (entero, clave primaria, incremento automático),
-- título,
-- autor,
-- año_publicación (entero).
  CREATE TABLE libro(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion INT
);

-- Inserte tres registros en la tabla libros uno de los libros con título:
-- Cien Años de Soledad.
INSERT INTO libro (titulo, autor, anio_publicacion) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 1967),
('Alas de sangre', 'Rebecca Yarros', 2023),
('Juego de tronos', 'George R. R. Martin', 1996);

-- Cree una tabla llamada miembros con los siguientes campos:
-- id (entero, clave primaria, incremento automático),
-- nombre,
-- fecha_registro (fecha).
CREATE TABLE miembros(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Inserte dos registros en la tabla miembros.
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Lopez Alcocer Monica Isabel', '10/08/2025'),
('Arriaga Zarate Dulce Miriam', '5/04/2025');

-- Cree una tabla llamada prestamos para relacionar libros y miembros,
-- con los campos:
-- id_libro (entero, clave foránea),
-- id_miembro (entero, clave foránea),
-- fecha_prestamo (fecha). (1 punto)
-- Agregue NOT NULL a los campos que considere pertinete,
-- por lo menos a un campo de cada tabla.
CREATE TABLE prestamo(
    id SERIAL PRIMARY KEY,
    id_libro INT NOT NULL,
    id_miembros INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_miembros) REFERENCES miembros(id),
    FOREIGN KEY (id_libro) REFERENCES libro(id)
);


-- Inserte tres registros en la tabla prestamos para asignar libros a los miembros.
INSERT INTO prestamo (id_miembros, id_libro, fecha_prestamo) VALUES
(1, 1, '2025-08-20'),
(2, 2, '2025-08-15'),
(2, 3, '2025-08-10');

-- Sección 2: Índices
-- Cree un índice en el campo título de la tabla libros.
CREATE INDEX idx_titulo ON libro(titulo);
--Sección 4: Consultas Avanzadas
--Nota: cada consulta debe arrojar por lo menos un renglón
-- Realice una consulta para obtener los títulos de los libros
--y los nombres de los miembros a los que los han prestado.
SELECT l.titulo, m.nombre, p.fecha_prestamo
FROM prestamo p
JOIN libro l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembros = m.id;
--Realice una consulta para obtener los nombres de los miembros
--a los que le han prestado el libro titulado 'Cien Años de Soledad'.
SELECT m.nombre
FROM prestamo p
JOIN libro l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembros = m.id
WHERE l.titulo = 'Cien años de soledad';
