--Universidad Politécnica de San Luis Potosí
--          26 de Febrero, 2025
--            Base de Datos
--    Christian Alejandro Cárdenas Rucoba

--          Examen Parcial 1
SET DateStyle = 'ISO, DMY';

--Crear la tabla libros:
CREATE TABLE libros(
  id INT PRIMARY KEY,
  titulo VARCHAR,
  autor VARCHAR,
  anio_publicacion INT
);

--Insertar tres registros en la tabla libros:
INSERT INTO libros VALUES
(1,'Libro A','Christian Rucoba',2020),
(2,'Libro B','Estefanía Monserrat',2018),
(3,'Cien Años de Soledad','Gabriel García Márquez',1998);

--Sección 2: Índices
--Crear un índice en el campo titulo de la tabla libros:
CREATE INDEX idx_titulo ON libros(titulo);

--Sección 3: Consultas y Relaciones
--Crear la tabla miembros:
CREATE TABLE miembros(
  id INT PRIMARY KEY,
  nombre VARCHAR,
  fecha_registro DATE
);

--Insertar dos registros en la tabla miembros:
INSERT INTO miembros VALUES
(1,'Alejandro Cárdenas','03-07-1998'),
(2,'Uriel Antonio','26-02-2000');

--Crear la tabla prestamos para relacionar libros y miembros:
CREATE TABLE prestamos(
  id_libro INT,
  FOREIGN KEY(id_libro) REFERENCES libros(id),
  id_miembro INT,
  FOREIGN KEY(id_miembro) REFERENCES miembros(id),
  fecha_prestamo DATE
);

--Insertar registros en la tabla prestamos:
INSERT INTO prestamos VALUES
(1,1,'10-01-2025'),
(2,1,'10-01-2025'),
(3,2,'25-02-2025');

--Sección 4: Consultas Avanzadas
--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:
SELECT l.titulo, m.nombre
FROM libros l
JOIN prestamos p ON l.id = p.id_libro
JOIN miembros m ON p.id_miembro = m.id;

--Consulta para contar cuántos libros ha prestado cada miembro:
SELECT m.nombre, COUNT(DISTINCT p.id_libro)
FROM prestamos p
JOIN miembros m ON p.id_miembro = m.id
GROUP BY m.nombre;

--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':
SELECT m.nombre
FROM prestamos p
JOIN miembros m ON p.id_miembro = m.id
JOIN libros l ON p.id_libro = l.id
GROUP BY m.nombre, p.id_libro
HAVING p.id_libro = 3;
