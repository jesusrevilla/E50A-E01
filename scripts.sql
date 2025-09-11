CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(80) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('Cien Años de Soledad', 'Gabriel García Márquez', '1967');
INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('El Señor de Los Domingos', 'Miguel Angel Gaitan', '2013');
INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('Mi Vecino Totoro', 'Ghibi', '1993');

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros(nombre, fecha_registro) VALUES ('Rafael', '2025-09-10');
INSERT INTO miembros(nombre, fecha_registro) VALUES ('Gabriel', '2025-09-10');

CREATE TABLE prestamos(
  id_libro SERIAL,
  id_miembro SERIAL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos VALUES (0001, 0001, '2025-09-10');
INSERT INTO prestamos VALUES (0002, 0001, '2025-09-10');
INSERT INTO prestamos VALUES (0003, 0002, '2025-09-10');

CREATE INDEX index_titulo ON libros(titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
