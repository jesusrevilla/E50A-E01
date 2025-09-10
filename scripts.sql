--Crear la tabla libros:

CREATE TABLE libros (
    id INT PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    año_publicacion INT
);
--Insertar tres registros en la tabla libros:

INSERT INTO libros (id, titulo, autor, año_publicacion) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 1967),
(2, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
(3, 'El Principito', 'Antoine de Saint-Exupéry', 1943);
--Sección 2: Índices
--Crear un índice en el campo titulo de la tabla libros:
CREATE INDEX idx_titulo ON libros(titulo);
--Sección 3: Consultas y Relaciones
--Crear la tabla miembros:

CREATE TABLE miembros (
    id INT PRIMARY KEY,
    nombre TEXT,
    fecha_registro DATE
);
--Insertar dos registros en la tabla miembros:

INSERT INTO miembros (id, nombre, fecha_registro) VALUES
(1, 'Juan Pérez', '2023-01-15'),
(2, 'María López', '2023-02-20');
--Crear la tabla prestamos para relacionar libros y miembros:

CREATE TABLE prestamos (
    id_libro INT,
    id_miembro INT,
    fecha_prestamo DATE,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);
--Insertar registros en la tabla prestamos:

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2023-03-01'),
(2, 2, '2023-03-05'),
(3, 1, '2023-03-10');
--Sección 4: Consultas Avanzadas
--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:

SELECT libros.titulo, miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id
JOIN miembros ON prestamos.id_miembro = miembros.id;
--Consulta para contar cuántos libros ha prestado cada miembro:

SELECT miembros.nombre, COUNT(prestamos.id_libro) AS cantidad_libros
FROM prestamos
JOIN miembros ON prestamos.id_miembro = miembros.id
GROUP BY miembros.nombre;
--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':

SELECT miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id
JOIN miembros ON prestamos.id_miembro = miembros.id
WHERE libros.titulo = 'Cien Años de Soledad';
