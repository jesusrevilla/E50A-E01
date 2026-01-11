CREATE TABLE libros (
  id                 SERIAL PRIMARY KEY,
  titulo           text    NOT NULL,
  autor              text    NOT NULL,
  ano_publicacion  integer
);

INSERT INTO libros (titulo, autor, ano_publicacion) VALUES
  ('Cien Años de Soledad', 'Gabriel García Márquez', 2010),
  ('El Principito', 'Octavio Paz', 1950),
  ('Baldor', 'Juan Rulfo', 1955);


CREATE TABLE miembros (
  id              SERIAL PRIMARY KEY,
  nombre          text NOT NULL,
  fecha_registro  date NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Mauricio Salinas',  DATE '2025-06-01'),
  ('Josafat Carrillo', DATE '2025-09-01');



CREATE TABLE prestamos (
  id_libro        integer NOT NULL REFERENCES libros(id),
  id_miembro      integer NOT NULL REFERENCES miembros(id),
  fecha_prestamo  date    NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
  (1, 1, DATE '2025-09-06'),  
  (3, 1, DATE '2025-09-07'), 
  (2, 2, DATE '2025-09-08'); 

CREATE INDEX idx_libros_titulo ON libros (titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros   l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro
ORDER BY p.fecha_prestamo;


SELECT DISTINCT m.nombre
FROM prestamos p
JOIN libros   l ON l.id = p.id_libro
JOIN miembros m ON m.id = p.id_miembro
WHERE l.titulo = 'Cien Años de Soledad';



