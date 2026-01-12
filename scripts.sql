--Seccion 1
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    título VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    año_publicación INT
);


INSERT INTO libros (título, autor, año_publicación) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('Palabras Mayores', 'Luis Spota', 1949);


CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_registro DATE
);



INSERT INTO miembros (nombre, fecha_registro) VALUES
('Claudia Sheinbaum', '2025-01-15'),
('Erik De La Rosa', '2025-02-20');


CREATE TABLE prestamos (
    id_libro INT,
    id_miembro INT,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-08-01'),
(3, 1, '2025-08-05'), 
(2, 2, '2025-08-10'); 

--Seccion 2
CREATE INDEX idx_titulo ON libros(título);

--Seccion 4

--Motrar libros y a quien se presto
SELECT
    l.título,
    m.nombre
FROM prestamos AS p
JOIN libros AS l ON p.id_libro = l.id
JOIN miembros AS m ON p.id_miembro = m.id;

--Nombre a quien le prestaron 100 años soledad
SELECT
    m.nombre
FROM prestamos AS p
JOIN libros AS l ON p.id_libro = l.id
JOIN miembros AS m ON p.id_miembro = m.id
WHERE l.título = 'Cien Años de Soledad';
