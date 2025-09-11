-- Angel Castillo Silva
-- 1
CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo TEXT NOT NULL,
  autor TEXT NOT NULL,
  anio_publicacion INT NOT NULL
);

-- 2
INSERT INTO libros(titulo, autor, anio_publicacion) VALUES ('Cien Años de Soledad', 'Gabriel García Márquez', 1967), ('La Divina Comedia', 'Dante', 1000), ('La Odisea', 'Homero', 100);

-- 3
CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  fecha_registro DATE NOT NULL
);

-- 4
INSERT INTO miembros(nombre, fecha_registro) VALUES ('Angel', '09-09-2025'), ('David', '08-08-2025');

-- 5
CREATE TABLE prestamos (
  id_libro INT NOT NULL,
  id_miembro INT NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id),
  fecha_prestamo DATE NOT NULL
);

-- 6
INSERT INTO prestamos VALUES (1, 1, '10-09-2025'), (2, 1, '11-09-2025'), (3, 2, '12-09-2025');

-- 7
CREATE INDEX idx_titulo ON libros(titulo);

-- 8
SELECT libros.titulo, miembros.nombre FROM libros JOIN prestamos ON libros.id = prestamos.id_libro JOIN miembros ON prestamos.id_libro = miembros.id;

-- 9
SELECT miembros.nombre FROM prestamos JOIN libros ON prestamos.id_libro = libros.id JOIN miembros ON prestamos.id_miembro = miembros.id WHERE libros.titulo = 'Cien Años de Soledad';


