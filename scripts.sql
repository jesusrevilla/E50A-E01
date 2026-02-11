 CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  anio_publicacion INT NOT NULL
);


CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha_registro DATE NOT NULL
);


CREATE TABLE prestamos(
  id_libro INT REFERENCES libros(id_libro),
  id_miembro INT REFERENCES miembros(id_miembros),
  fecha_prestamo DATE NOT NULL
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
  ('Cien años de Soledad', 'Gabriel Garcia Marquez', 1967),
  ('Born Again', 'Frank Miller', 1980),
  ('Jurassic Park', 'Ian Malcom', 1973);

INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Aldo Garcia', '2025-07-18'),
  ('Pedro Pascal', '2023-09-10');

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
  (3, 1, '2025-09-10'),
  (1, 2, '2025-07-09'),
  (2, 1, '2025-08-11');

CREATE INDEX ON libros(titulo);

SELECT l.titulo, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembros;
 
SELECT m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembros
WHERE l.titulo = 'Cien años de Soledad';
