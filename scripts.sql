
CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  año_publicacion INTEGER NOT NULL
);

INSERT INTO libros(titulo,autor,año_publicacion) VALUES
('Habitos atomicos', 'Ruben Garcia', 2013),
('Cien Años de Soledad', 'Carlos Esquivel', 1998),
('IT!','Stephen King', 1973);

CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros(nombre, fecha_registro) VALUES
('Nadia Salas','2025-02-23'),
('Armida Ramirez','2025-03-24');

CREATE TABLE prestamos(
  id_libro INTEGER NOT NULL,
  id_miembro INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES
(1,1,'2025-04-12'),
(2,2,'2025-05-17'),
(3,1,'2025-07-10');

CREATE INDEX idx_titulo ON libros(titulo);

SELECT l.titulo, m.nombre FROM libros l JOIN prestamos p ON l.id = p.id_libro JOIN miembros m ON m.id = p.id_miembro;
SELECT m.nombre FROM miembros m JOIN prestamos p ON m.id = p.id_miembro JOIN libros l ON l.id = p.id_libro WHERE l.titulo = 'Cien Años de Soledad';
