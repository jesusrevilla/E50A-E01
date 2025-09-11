CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(60) NOT NULL,
    autor VARCHAR(60) NOT NULL,
    año_publicacion INT NOT NULL
);


INSERT INTO libros (titulo, autor, año_publicacion) VALUES
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Deja de ser tu', 'Joe Dispenza', 2003),
('Si lo crees lo creas', 'Bryan Tracy', 1989);


CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 fecha_registro DATE NOT NULL
 );
 

INSERT INTO miembros (nombre, fecha_registro) VALUES
('Dana Juarez', '2020-03-12'),
('Cris Reyes', '2022-07-10');


CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
(1, 1, '2025-09-10'), 
(2, 2, '2025-07-05'),
(1, 2, '2025-03-10'); 


CREATE INDEX idx_titulo ON libros (titulo);


SELECT l.titulo, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
