CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(55) NOT NULL,
  autor VARCHAR(55) NOT NULL,
  año_publicación INT NOT NULL
);

INSERT INTO libros(titulo,autor,año_publicación) VALUES 
('Cien Años de Soledad','Gabriel Garcia Marquez',1990),
('Aqui dentro siempre llueve', 'Anonimo',2017),
('Caida libre','Melanie P',2013);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(55) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros(nombre, fecha_registro) VALUES
('Coral Jazmin','10/09/2025'),
('Bryan Yareth','09/10/2025');

CREATE TABLE prestamos (
  id_libro INT,
  id_miembro INT,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES
(1,1,'09/10/2025'),
(2,2,'09/10/2025'),
(3,1,'9/10/2025');

CREATE INDEX idx_titulo ON libros(titulo);

SELECT l.titulo, m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;


SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
