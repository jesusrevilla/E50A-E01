CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  año_publicacion INT NOT NULL
);

INSERT INTO libros (titulo,autor,año_publicacion) VALUES
('Cien años de Soledad', 'JK Rolling', 1998),
('La gran travesia','Alan Grant', 1995),
('Alquimia', 'Christopher Nollan', 2003);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre,fecha_registro) VALUES
  ('Estefano','2025/10/12'),
  ('Alberto', '2022/6/24');
  
CREATE TABLE prestamos (
  id_libro INT,
  id_miembro INT,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id),
  PRIMARY KEY (id_miembro, id_libro, fecha_prestamo)
);

INSERT INTO prestamos VALUES
  (1, 1, '2025/6/14'),
  (2, 1, '2025/9/10'),
  (3, 2, '2025/6/28');
  
CREATE INDEX idx_autor ON libros(autor);

SELECT l.titulo, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE LOWER(l.titulo) = LOWER('Cien años de Soledad');
