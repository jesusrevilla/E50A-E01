--EXAMEN P1
--1
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR NOT NULL,
    autor VARCHAR NOT NULL,
    año_publicacion INTEGER NOT NULL
);
--2
INSERT INTO libros (titulo, autor, año_publicacion) VALUES 
    ('Cien Años de Soledad', 'Gabriel García Márquez', 2000),
    ('Titulo de libro 2', 'autor dos', 2022),
    ('titulo de libro 3', 'autor tres', 2225);

--3
CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  fecha_registro DATE NOT NULL
);

--4
INSERT INTO miembros (nombre, fecha_registro) VALUES
    ('Miembro uno', '2024-05-03'),
    ('Miembro dos', '2024-10-19');
    
--5
CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

--6
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo)
VALUES
(1, 1, '2025-04-04'),  
(2, 2, '2025-03-25'), 
(3, 1, '2025-12-29'); 


--7
CREATE INDEX idx_titulo ON libros(titulo);

--8
SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

--9
SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
