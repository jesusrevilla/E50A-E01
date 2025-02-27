\echo '\nSebastian Heredia Pardo - 175680\n\tExamen 1° Parcial\n'
--Crear la tabla libros:
CREATE TABLE LIBROS (
  id INT PRIMARY KEY,
  titulo TEXT,
  autor TEXT,
  año_publicacion INT
);

--Insertar tres registros en la tabla libros:
INSERT INTO LIBROS VALUES 
(7845, 'Elantris', 'Brandon Sanderson', 2005),
(4512, 'Rebelión en la granja', 'George Orwell', 1945),
(1211, 'Cien años de soledad', 'Gabriel García Márquez', 1982);



--Sección 2: Índices
--Crear un índice en el campo titulo de la tabla libros:
CREATE INDEX idx_titulo ON LIBROS(titulo);

--Sección 3: Consultas y Relaciones
--Crear la tabla miembros:
CREATE TABLE MIEMBROS (
  id INT PRIMARY KEY,
  nombre TEXT,
  fecha_registro DATE
);

--Insertar dos registros en la tabla miembros:
INSERT INTO MIEMBROS VALUES
(9663, 'Juan Antonio Lopez', '2022-03-20'),
(9667, 'Luis Roberto Ortiz', '2022-04-22');


--Crear la tabla prestamos para relacionar libros y miembros:
CREATE TABLE PRESTAMOS (
  id_libro INT,
  id_miembro INT, 
  fecha_prestamo DATE,
  FOREIGN KEY (id_libro) REFERENCES LIBROS(id),
  FOREIGN KEY (id_miembro) REFERENCES MIEMBROS(id)
);



--Insertar registros en la tabla prestamos:
INSERT INTO PRESTAMOS VALUES
(7845, 9667, '2022-05-08'),
(1211, 9667, '2022-05-09'),
(7845, 9667, '2022-06-10'),
(1211, 9663, '2022-07-03'),
(1211, 9667, '2022-07-16'),
(4512, 9663, '2022-08-19');



--Sección 4: Consultas Avanzadas
--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:

SELECT l.titulo AS Libros, m.nombre AS Miembros, p.fecha_prestamo AS Fecha
FROM LIBROS l
JOIN PRESTAMOS p ON l.id = p.id_libro
JOIN MIEMBROS m ON p.id_miembro = m.id;


--Consulta para contar cuántos libros ha prestado cada miembro:
SELECT m.nombre AS Miembros, COUNT(p.id_libro) AS Libros_Prestados
FROM MIEMBROS m
JOIN PRESTAMOS p ON m.id = p.id_miembro
GROUP BY m.id;


--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':
SELECT DISTINCT ON (m.nombre) m.nombre AS Miembros
FROM MIEMBROS m
JOIN PRESTAMOS p ON m.id = p.id_miembro
JOIN LIBROS l ON p.id_libro = l.id
WHERE l.titulo = 'Cien años de soledad';
