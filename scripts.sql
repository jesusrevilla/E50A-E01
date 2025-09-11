
CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor VARCHAR(150) NOT NULL,
  anio_publicacion INTEGER
);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos (
  prestamo_id SERIAL PRIMARY KEY,
  id_libro INTEGER NOT NULL,
  id_miembro INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
  ('Cien Años de Soledad', 'autor', 1999),
  ('libro 2', 'autor 2', 1999),
  ('libro 3', 'autor 3', 1999);

INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Juan Pablo Marín', '2025-06-06'),
  ('Cristian Ricardo', '2025-06-06');

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
  (1, 1, '2025-06-06'),
  (2, 2, '2025-06-06'),
  (3, 1, '2025-06-06');

CREATE INDEX ind_libros_titulo ON libros(titulo);

SELECT l.titulo, m.nombre, p.fecha_prestamo
FROM prestamos p
JOIN libros   l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro;

SELECT m.nombre, p.fecha_prestamo
FROM prestamos p
JOIN libros   l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro
WHERE l.titulo = 'Cien Años de Soledad';
