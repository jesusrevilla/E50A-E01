--Yovana Isabel Palencia Sánchez 174197

CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  anio_publicacion INT
);

INSERT INTO libros (titulo, autor, anio_publicacion) VALUES 
('Cien Años de Soledad','Gabriel García Marquéz',2000),
('Tardes de lluvia','Claudia Celis',2009),
('Corazón de campeon','Juan Veerecken',2006);

--Crear un índice en el campo titulo de la tabla libros:
CREATE INDEX indice ON libros(titulo);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_registro DATE
);

INSERT INTO miembros (nombre, fecha_registro) VALUES 
('Yovana Palencia','2025-09-10'),
('Cecilia Castro','2025-08-09');

CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT,
    fecha_prestamo  DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos (id_libro, id_miembro,fecha_prestamo) VALUES 
(2,1,'2025-09-10'),
(3,1,'2025-01-26'),
(1,2,'2025-08-22');

--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:
SELECT m.nombre, l.titulo  FROM prestamos p
JOIN miembros m ON p.id_miembro=m.id
JOIN libros l ON p.id_libro = l.id;

--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':
SELECT nombre FROM miembros m  
JOIN prestamos p ON p.id_miembro=m.id
WHERE(p.id_libro=1);
