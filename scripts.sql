CREATE TABLE libros (
  id_libro SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  anio_publicacion INT NOT NULL
);

CREATE TABLE miembros(
  id_miembro SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos(
  id_prestamo SERIAL PRIMARY KEY,
  id_libro INT NOT NULL,
  id_miembro INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id_miembro)
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

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo)
VALUES 
(1, 1, '2025-09-10'),
(2, 2, '2025-09-10'),
(3, 1, '2025-09-11'); 

CREATE INDEX libros_titulo ON libros(titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembro;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id_libro
JOIN miembros m ON p.id_miembro = m.id_miembro
WHERE l.titulo = 'Cien Años de Soledad';
