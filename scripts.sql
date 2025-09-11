CREATE TABLE libros (
  id_libro SERIAL PRIMARY KEY,
  titulo varchar(50) NOT NULL,
  autor varchar(50) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

CREATE TABLE miembros (
  id_miembro SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos (
  id_libro int,
  id_miembro int,
  FOREIGN KEY (id_libro) references libros(id_libro),
  FOREIGN KEY (id_miembro) references miembros(id_miembro),
  fecha_prestamo DATE
);

CREATE INDEX indice ON libros (titulo);

INSERT INTO libros (titulo, autor,año_publicacion)VALUES ('Cien Años de Soledad', 'AutorUno', '2004');
INSERT INTO libros (titulo, autor,año_publicacion)VALUES ('LibroDos', 'AutorDos', '2005');
INSERT INTO libros (titulo, autor,año_publicacion)VALUES ('LibroTres', 'AutorTres', '2006');

INSERT INTO miembros (nombre, fecha_registro)VALUES ('Diego', '2003-04-15');
INSERT INTO miembros (nombre, fecha_registro)VALUES ('Leon', '2003-07-16');

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES (1, 1, '2025-09-08');
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES (2, 2, '2025-09-09');
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES (3, 1, '2025-09-10');

SELECT libros.titulo, miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id_libro
JOIN miembros ON prestamos.id_miembro = miembros.id_miembro;


SELECT miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id_libro
JOIN miembros ON prestamos.id_miembro = miembros.id_miembro
WHERE libros.titulo = 'Cien Años de Soledad';
