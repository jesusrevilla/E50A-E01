--libros
CREATE TABLE libros(
  libro_id SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor VARCHAR(150) NOT NULL,
  anio_publicacion INTEGER
);

CREATE TABLE miembros (
  miembro_id SERIAL PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos (
  prestamo_id SERIAL PRIMARY KEY,
  libro_id INTEGER NOT NULL,
  miembro_id INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
  FOREIGN KEY (miembro_id) REFERENCES miembros(miembro_id)
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
  ('Cien Años de Soledad', 'autor', 1999), ('libro 2', 'autor 2', 1999), ('libro 3', 'autor 3', 1999);
  
INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Juan Pablo Marín', '2025-06-06'), ('Cristian Ricardo', '2025-06-06');
  
INSERT INTO prestamos (libro_id, miembro_id, fecha_prestamo) VALUES
  (1, 1, '2025-06-06'), (2, 2, '2025-06-06'), (3, 1, '2025-06-06');
  
CREATE INDEX ind_libros_titulo ON libros(titulo);

SELECT l.titulo, m.nombre, p.fecha_prestamo FROM prestamos p
JOIN libros l ON l.libro_id = p.libro_id
JOIN miembros m ON m.miembro_id = p.miembro_id;

SELECT m.nombre, p.fecha_prestamo FROM prestamos p
JOIN libros l ON l.libro_id = p.libro_id
JOIN miembros m ON m.miembro_id = p.miembro_id WHERE l.titulo = 'Cien Años de Soledad';
