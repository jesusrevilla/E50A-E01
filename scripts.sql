CREATE TABLE libros (
  id_libro SERIAL PRIMARY KEY,
  titulo varchar(50) NOT NULL,
  autor varchar(50) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

INSERT INTO libros (titulo, autor,año_publicacion)VALUES 
('Cien Años de Soledad', 'AutorUno', 2004),
('LibroDos', 'AutorDos', 2005),
('LibroTres', 'AutorTres', 2006);


CREATE TABLE miembros (
  id_miembro SERIAL PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Diego', '2003-04-15'),
('Leon', '2003-07-16');

CREATE TABLE prestamos (
  id_libro int,
  id_miembro int,
  FOREIGN KEY (id_libro) references libros(id_libro),
  FOREIGN KEY (id_miembro) references miembros(id_miembro),
  fecha_prestamo DATE
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-08'),
(2, 2, '2025-09-09'),
(3, 1, '2025-09-10');

CREATE INDEX indice ON libros (titulo);

SELECT libros.titulo, miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id_libro
JOIN miembros ON prestamos.id_miembro = miembros.id_miembro;

SELECT miembros.nombre
FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id_libro
JOIN miembros ON prestamos.id_miembro = miembros.id_miembro
WHERE libros.titulo = 'Cien Años de Soledad';
