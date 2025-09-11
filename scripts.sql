--1
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    año_publicacion INT NOT NULL
);

--2
INSERT INTO libros (titulo, autor, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('La Sombra del Viento', 'Carlos Ruiz Zafón', 2001);

--3
CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

--4
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Ana Martínez', '2025-09-01'),
('Luis Gómez', '2025-09-03');

--5
CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

--7
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-05'),  -- Cien Años de Soledad prestado a Ana
(2, 2, '2025-09-06'),  -- Don Quijote prestado a Luis
(3, 1, '2025-09-07');  -- La Sombra del Viento prestado a Ana

--Sección 2
CREATE INDEX idx_titulo_libros ON libros(titulo);

--Sección 4: consultas avanzadas
SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
