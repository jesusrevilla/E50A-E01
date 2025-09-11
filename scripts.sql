CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(60) NOT NULL,
  autor VARCHAR(60) NOT NULL,
  anio_publicacion INT NOT NULL
);

INSERT INTO libros(titulo, autor, anio_publicacion) VALUES
('Cien Años de Soledad','Gabriel Marquez',1976);
INSERT INTO libros(titulo, autor, anio_publicacion) VALUES
('1989', 'Juan Gomez',1979);
INSERT INTO libros(titulo, autor, anio_publicacion) VALUES 
('Habitos atomicos', 'Jonh Doe',2012);

--SELECT * FROM libros;

CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('David Lopez','12/03/2004');
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Angel Martinez','04/12/1908');

--SELECT * FROM miembros;

CREATE TABLE prestamos(
  id_libro INT NOT NULL,
  id_miembro INT NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id),
  fecha_prestamo DATE NOT NULL
);

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES(
1,2,'10/09/2025');

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES(
3,1,'10/09/2025');

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES(
2,1,'04/09/2025');

CREATE INDEX idx_libros on libros (titulo);

SELECT l.titulo, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre FROM prestamos p
JOIN miembros m ON p.id_miembro = m.id
JOIN libros l ON p.id_libro = l.id
WHERE l.titulo = 'Cien Años de Soledad';
