--Antonio de Jesus Morales Quiroz 176412
--Examen primer parcial Base de datos


-- Crear la tabla libros
CREATE TABLE libros (
  id INT PRIMARY KEY ,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  ano_publicacion INT
);

-- Insertar tres registros en la tabla libros
INSERT INTO libros (id, titulo, autor, ano_publicacion) VALUES (1, 'Cien Años de Soledad', 'Gabriel Garcia Marquez', 1990);
INSERT INTO libros (id, titulo, autor, ano_publicacion) VALUES (2, 'El Codigo da Vinci', 'Dan Brown', 2002);
INSERT INTO libros (id, titulo, autor, ano_publicacion) VALUES (3, 'El señor de los anillos', 'J. R. R. Tolkien', 1980);

-- Crear un indice en el campo titulo de la tabla libros
CREATE INDEX inx_titulo ON libros(titulo);

-- Crear la tabla miembros
CREATE TABLE miembros (
  id INT PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE
);

-- Insertar dos registros en la tabla miembros
INSERT INTO miembros (id, nombre, fecha_registro) VALUES (1, 'Antonio Morales', '2025-02-25');
INSERT INTO miembros (id, nombre, fecha_registro) VALUES (2, 'Araujo', '2025-02-26');

-- Crear la tabla prestamos
CREATE TABLE prestamos (
  id_libro INT,
  id_miembro INT,
  FOREIGN KEY (id_libro) REFERENCES libros(id) ON DELETE CASCADE,
  FOREIGN KEY (id_miembro) REFERENCES miembros(id) ON DELETE CASCADE,
  fecha_prestamo DATE
);

-- Insertar registros en la tabla prestamos
INSERT INTO prestamos  VALUES (1, 2,'2025-02-25');
INSERT INTO prestamos  VALUES (2, 1,'2025-02-20');
INSERT INTO prestamos  VALUES (3, 1,'2025-02-18');

-- Consultas
-- Obtener todos los registros de libros
SELECT * FROM libros;
-- Obtener todos los registros de prestamos
SELECT * FROM prestamos;

-- Obtener todos los registros de miembros
SELECT * FROM miembros;

-- Obtener los titulos de los libros y los nombres de los miembros que los han prestado
SELECT l.titulo AS Titulos, m.nombre AS Miembros
FROM libros l
JOIN prestamos p ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

-- Contar cuantos libros ha prestado cada miembro
SELECT COUNT(p.id_libro) AS libros, m.nombre AS Miembro
FROM prestamos p
JOIN miembros m ON m.id = p.id_miembro
GROUP BY m.nombre;

-- Obtener los miembros que han prestado el libro titulado 'Cien Anos de Soledad'
SELECT m.nombre AS miembros, l.titulo AS nombres
FROM miembros m
JOIN prestamos p ON m.id = p.id_miembro
JOIN libros l ON p.id_libro = l.id 
WHERE l.titulo = 'Cien Años de Soledad';
