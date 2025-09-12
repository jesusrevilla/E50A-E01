CREATE TABLE libros(
 id SERIAL PRIMARY KEY,
 titulo VARCHAR(100) NOT NULL,
 autor VARCHAR(100) NOT NULL,
 anio_publicacion INT
);

CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_registro DATE
);

CREATE TABLE prestamos(
  id_libro INT NOT NULL,
  id_miembro INT,
  fecha_prestamo DATE,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES 
('Cien Años de Soledad', 'David Pérez', 2002),
('Ruge', 'Daniel Habif', 2023),
('El principito', 'Zara', 2016);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Juan', '2025-06-15'),
('Sergio', '2025-03-16');

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(3, 1, '2025-09-10'),
(2, 1, '2025-09-07'),
(1, 2, '2025-09-06');

CREATE INDEX idx_titulo ON libros(titulo);

SELECT m.nombre AS nombre_miembro, l.titulo AS titulo_libro
FROM prestamos p
JOIN miembros m ON p.id_miembro = m.id
JOIN libros l ON p.id_libro = l.id;

SELECT m.nombre AS nombre_miembro
FROM prestamos p
JOIN miembros m ON p.id_miembro = m.id
JOIN libros l ON p.id_libro = l.id
WHERE l.titulo = 'Cien Años de Soledad';

