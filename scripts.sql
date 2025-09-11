
CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  año_publicacion INTEGER NOT NULL
);

CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos(
  id_libro INTEGER,
  id_miembro INTEGER,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO libros (titulo, autor, año_publicacion) VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Libro 2', 'Autor 1', 2024), ('Libro 3', 'Autor 2', 2025);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Juan CSNV', '2025-09-10'),
('Carlos Perez', '2025-08-15');

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-10'),  --Cien Años de Soledad
(2, 2, '2025-09-10'),  --Libro 2
(3, 1, '2025-09-10');  --Libro 3

CREATE INDEX titulo_libros ON libros(titulo);

SELECT l.titulo, n.nombre FROM prestamos p 
JOIN libros l ON p.id_libro = l.id
JOIN miembros n ON p.id_miembro = n.id;

SELECT n.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros n ON p.id_miembro = n.id
WHERE l.titulo = 'Cien Años de Soledad';

