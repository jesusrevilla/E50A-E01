CREATE TABLE libros(
  id_libro SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  anio_publicacion INT NOT NULL
);


CREATE TABLE miembros(
  id_miembros SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha_registro DATE NOT NULL
);


CREATE TABLE prestamos(
  id_libro INT REFERENCES libros(id_libro),
  id_miembro INT REFERENCES miembros(id_miembros),
  fecha_prestamo DATE NOT NULL
);

INSERT INTO libros VALUES (1, 'Cien años de Soledad', 'Gabriel Garcia Marquez', 1967);
INSERT INTO libros VALUES (2, 'Born Again', 'Frank Miller', 1980);
INSERT INTO libros VALUES (3, 'Jurassic Park', 'Ian Malcom', 1973);

INSERT INTO miembros VALUES (1, 'Aldo Garcia', '2025-07-18');
INSERT INTO miembros VALUES (2, 'Pedro Pascal', '2023-09-10');
INSERT INTO miembros VALUES (3, 'Cristiano Ronaldo', '2023-02-22');

INSERT INTO prestamos VALUES (3, 1, '2025-09-10');
INSERT INTO prestamos VALUES (1, 2, '2025-07-9');
INSERT INTO prestamos VALUES (2, 3, '2025-08-11');

CREATE INDEX ON libros(titulo);

SELECT l.titulo, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembros;
 
SELECT m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembros
WHERE l.titulo = 'Cien años de Soledad';
