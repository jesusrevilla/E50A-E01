-- Tabla libros
CREATE TABLE libros(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion INT
);

-- Insertar libros
INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 1967),
('Alas de sangre', 'Rebecca Yarros', 2023),
('Juego de tronos', 'George R. R. Martin', 1996);

-- Tabla miembros
CREATE TABLE miembros(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Insertar miembros
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Lopez Alcocer Monica Isabel', '2025-08-10'),
('Arriaga Zarate Dulce Miriam', '2025-04-05');

-- Tabla prestamos
CREATE TABLE prestamos(
    id SERIAL PRIMARY KEY,
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

-- Insertar préstamos
INSERT INTO prestamos (id_miembro, id_libro, fecha_prestamo) VALUES
(1, 1, '2025-08-20'),
(2, 2, '2025-08-15'),
(2, 3, '2025-08-10');

-- Índice en libros
CREATE INDEX idx_titulo ON libros(titulo);

-- Consultas
SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien años de soledad';
