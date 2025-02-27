--Alejandro Araujo Orellana - 177890
--Bases de Datos - 1er Parcial

--Crear la tabla libros:
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(30),
    autor VARCHAR(30),
    año_publicacion INTEGER
);

--Insertar tres registros en la tabla libros:
INSERT INTO libros (titulo, autor, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel Garcia Marquez', 1978),
('Bell Jar', 'Sylvia Plath',1920),
('La Metamorfosis', 'Franz Kafka', 1883);

--Sección 2: Índices
--Crear un índice en el campo titulo de la tabla libros:
CREATE INDEX idl ON libros(titulo);

--Sección 3: Consultas y Relaciones
--Crear la tabla miembros:
CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  fecha_registro DATE
);

--Insertar dos registros en la tabla miembros:
INSERT INTO miembros (nombre, fecha_registro) VALUES 
('Alejandro Araujo Orellana', '2004-10-19'),
('Adolfo Bioy Cazares', '2087-06-13');

--Crear la tabla prestamos para relacionar libros y miembros:
CREATE TABLE prestamos (
  id_libro INTEGER,
  id_miembro INTEGER,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id),
  fecha_prestamo DATE
);

--Insertar registros en la tabla prestamos:
INSERT INTO prestamos VALUES
(1, 2, '2033-04-12'),
(2, 1, '2019-07-14'),
(3, 1, '2077-01-01');

--Sección 4: Consultas Avanzadas
--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:
SELECT l.titulo AS titulo_libro, m.nombre AS nombre_miembro FROM prestamos p
JOIN libros l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro;

--Consulta para contar cuántos libros ha prestado cada miembro:
SELECT m.nombre AS miembro, COUNT(p.id_miembro) AS libros_prestados
FROM prestamos p
JOIN miembros m ON m.id = p.id_miembro
GROUP BY m.nombre;

--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':
SELECT m.nombre FROM miembros m
JOIN prestamos p ON p.id_miembro = m.id
JOIN libros l ON l.id = p.id_libro
WHERE l.titulo = 'Cien Años de Soledad';
