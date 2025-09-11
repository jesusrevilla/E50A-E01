-- create
CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  título VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicación  INTEGER NOT NULL
);

INSERT INTO libros(título, autor, año_publicación) VALUES
('Cien Años de Soledad', 'Gabriel García Marquez', 1990),
('Harry Potter', 'J.W. ROWLINg', 1992),
('El señor de los anillos', 'Autor', 1938);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros(nombre, fecha_registro) VALUES
('Uriel' , '9/10/2025'),
('Bick', '9/9/2025');

CREATE TABLE prestamos  (
  id_libro  INTEGER NOT NULL,
  id_miembro  INTEGER NOT NULL,
  fecha_prestamo  DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos VALUES
(1, 1, '9/14/2025'),
(2, 2, '9/15/2025'),
(3, 1, '9/13/2025');

CREATE INDEX ix_título ON libros(título);
SELECT l.título, m.nombre FROM prestamos p JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre FROM prestamos p JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id WHERE l.título = 'Cien Años de Soledad';

