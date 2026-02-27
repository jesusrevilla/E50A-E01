CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INT NOT NULL
);

INSERT INTO libros (titulo, autor, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1990),
('Don Quijote', 'Miguel de Cervantes', 2000),
('1984', 'George Orwell', 1985);

CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre,fecha_registro) VALUES 
('Angel Saucedo', '2025-09-10'),
('Jose Eduardo', '2025-10-23');

CREATE TABLE prestamos (
  id_libro INT REFERENCES libros(id) NOT NULL,
  id_miembro INT REFERENCES miembros(id) NOT NULL,
  fecha_prestamo DATE NOT NULL
);

INSERT INTO prestamos(id_libro, id_miembro, fecha_prestamo) VALUES 
(3, 2, '2025-09-10'),
(1, 1, '2025-12-08'),
(2, 1, '2025-08-11');

CREATE INDEX idx_titulo ON libros(titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';

