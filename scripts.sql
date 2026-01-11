
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    año_publicacion INT
);

INSERT INTO libros (titulo, autor, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('1984', 'George Orwell', 1949);

CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_registro DATE
);

-- Inserción de registros en la tabla miembros
INSERT INTO miembros (nombre, fecha_registro) VALUES
('Ana Perez', '2025-01-15'),
('Juan Rodriguez', '2025-02-20');

CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-05'),
(3, 1, '2025-03-10');


CREATE INDEX idx_titulo ON libros(titulo);

SELECT
    l.titulo,
    m.nombre
FROM
    prestamos p
JOIN
    libros l ON p.id_libro = l.id
JOIN
    miembros m ON p.id_miembro = m.id;
SELECT
    m.nombre
FROM
    prestamos p
JOIN
    libros l ON p.id_libro = l.id
JOIN
    miembros m ON p.id_miembro = m.id
WHERE
    l.titulo = 'Cien Años de Soledad';
