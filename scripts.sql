CREATE TABLE libros (
  libro_id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  anio_publicacion INT NOT NULL
);

CREATE TABLE miembros(
  miembro_id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos(
  prestamo_id SERIAL PRIMARY KEY,
  libro_id INT NOT NULL,
  miembro_id INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
  FOREIGN KEY (miembro_id) REFERENCES miembros(miembro_id)
);

INSERT INTO libros (titulo, autor, anio_publicacion)
VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Harry Potter y la piedra filosofal', 'J. K. Rowling', 1997),
('The Summer I Turned Pretty', 'Jenny Han', 2022);


INSERT INTO miembros (nombre, fecha_registro)
VALUES 
('Daniel Emanuel Sánchez López', '2025-10-09'),
('Patricia Michelle Martínez Huerta', '2025-10-09');

INSERT INTO prestamos (libro_id, miembro_id, fecha_prestamo)
VALUES 
(1, 1, '2025-09-10'),
(2, 2, '2025-09-10'),
(3, 1, '2025-09-11'); 

CREATE INDEX libros_titulo ON libros(titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.libro_id = l.libro_id
JOIN miembros m ON p.miembro_id = m.miembro_id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.libro_id = l.libro_id
JOIN miembros m ON p.miembro_id = m.miembro_id
WHERE l.titulo = 'Cien Años de Soledad';

