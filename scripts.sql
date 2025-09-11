--TABLA: LIBROS
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    año_publicacion INT NOT NULL
);

-- REGISTROS EN LIBROS
INSERT INTO libros (titulo, autor, año_publicacion)
VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Los Tiburones también tienen miedo', 'Adrian Moreno', 2018),
('El Diario de Greg', 'Greg', 2001);

-- CREAR TABLA: MIEMBROS

CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- INSERTAR 3 REGISTROS EN MIEMBROS
INSERT INTO miembros (nombre, fecha_registro)
VALUES 
('Juan Loyola', '2025-01-10'),
('Carolina Herrera', '2025-02-15'),
('Gerardo Martínez', '2025-03-20');

-- ========================
-- CREAR TABLA: PRESTAMOS
-- ========================
CREATE TABLE prestamos (
    id SERIAL PRIMARY KEY,
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

-- 3 REGISTROS EN PRESTAMOS
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo)
VALUES 
(1, 1, '2025-03-01'), -- Juan pide Cien Años de Soledad
(2, 2, '2025-03-05'), -- Carolina pide Don Quijote
(3, 3, '2025-03-10'); -- Gerardo pide La sombra del viento

--ÍNDICE EN TITULO (LIBROS)

CREATE INDEX idx_libros_titulo ON libros(titulo);

SELECT * FROM libros;
SELECT * FROM miembros;
SELECT * FROM prestamos;

-- TÍTULOS DE LOS LIBROS Y NOMBRES DE LOS MIEMBROS

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

-- OBTENER NOMBRES DE LOS MIEMBROS A QUIENES SE PRESTÓ 
-- "CIEN AÑOS DE SOLEDAD"
SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
