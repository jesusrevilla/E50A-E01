-- Palau Andrade Arturo - 178561
-- SECCIÓN 1: CREACIÓN Y MANIPULACIÓN DE TABLAS
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    anio_publicacion INT NOT NULL
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('Pedro Páramo', 'Juan Rulfo', 1955);

CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Ana Martínez', '2025-01-15'),
('Carlos Gómez', '2025-02-20');

CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-03-01'),
(2, 1, '2025-03-05'),
(3, 2, '2025-03-10');

-- SECCIÓN 2: ÍNDICES
CREATE INDEX idx_libros_titulo ON libros(titulo);

-- SECCIÓN 4: CONSULTAS AVANZADAS
SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
