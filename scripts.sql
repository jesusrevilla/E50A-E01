CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo varchar(50) NOT NULL,
  autor varchar(50) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

INSERT INTO libros (titulo, autor,año_publicacion)VALUES 
('Cien Años de Soledad', 'AutorUno', 2004),
('LibroDos', 'AutorDos', 2005),
('LibroTres', 'AutorTres', 2006);

CREATE TABLE prestamos (
  id_libro int NOT NULL,
  id_miembro int NOT NULL,
  FOREIGN KEY (id_libro) references libros(id),
  FOREIGN KEY (id_miembro) references miembros(id),
  fecha_prestamo DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Diego', '2003-04-15'),
('Leon', '2003-07-16');

CREATE TABLE prestamos (
  id_libro int,
  id_miembro int,
  FOREIGN KEY (id_libro) references libros(id),
  FOREIGN KEY (id_miembro) references miembros(id),
  fecha_prestamo DATE
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-08'),
(2, 2, '2025-09-09'),
(3, 1, '2025-09-10');

CREATE INDEX indice ON libros (titulo);

SELECT l.titulo, m.nombre
FROM libros l
JOIN prestamos p ON l.id = p.id_libro
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM miembros m
JOIN prestamos p ON m.id = p.id_miembro
JOIN libros l ON p.id_libro = l.id
WHERE l.titulo = 'Cien Años de Soledad';
