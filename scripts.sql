
CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor VARCHAR(150) NOT NULL,
  anio_publicacion INT
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('El Principito', 'Antoine de Saint-Exupéry', 1943),
('Pedro Páramo', 'Juan Rulfo', 1955);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Ana Pérez', '2025-09-01'),
('Luis Gómez', '2025-09-03');

CREATE TABLE prestamos (
  id_libro INT NOT NULL,
  id_miembro INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  CONSTRAINT fk_prestamos_libro FOREIGN KEY (id_libro) REFERENCES libros(id),
  CONSTRAINT fk_prestamos_miembro FOREIGN KEY (id_miembro) REFERENCES miembros(id),
  CONSTRAINT pk_prestamos PRIMARY KEY (id_libro, id_miembro, fecha_prestamo)
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-05'),
(2, 2, '2025-09-06'),
(3, 1, '2025-09-07');

CREATE INDEX idx_libros_titulo ON libros (titulo);

SELECT l.titulo AS titulo_libro, m.nombre AS nombre_miembro, p.fecha_prestamo
FROM prestamos p
JOIN libros l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro;

SELECT m.nombre, p.fecha_prestamo
FROM prestamos p
JOIN libros l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro
WHERE l.titulo = 'Cien Años de Soledad';
