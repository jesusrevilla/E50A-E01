CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  ano_publicacion INTEGER NOT NULL
);

INSERT INTO libros (titulo,autor,ano_publicacion) values
('Cien Años de Soledad','Gabriel Garcia Marquez',2000),
('Hearstopper','Desconocido',2010),
('Los Juegos del Hambre','Desconocido',2014);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre,fecha_registro) values
('Bryan Gamez','2018/01/20'),
('Coral Dominguez','2020/02/24');

CREATE TABLE prestamos (
  id_libro INTEGER REFERENCES libros(id),
  id_miembro INTEGER REFERENCES miembros(id),
  fecha_prestamo DATE NOT NULL
);

INSERT INTO prestamos values
(1,2,'2025/09/10'),
(2,1,'2025/09/08'),
(2,2,'2025/09/05');

CREATE INDEX idx_titulo on libros(titulo);

SELECT lib.titulo as libro_titulo,
miem.nombre as miembro_nombre
FROM prestamos
JOIN libros lib on prestamos.id_libro=lib.id
JOIN miembros miem on prestamos.id_miembro=miem.id;

SELECT lib.titulo as libro_titulo,
miem.nombre as miembro_nombre
FROM prestamos
JOIN libros lib on prestamos.id_libro=lib.id
JOIN miembros miem on prestamos.id_miembro=miem.id
WHERE lib.titulo='Cien Años de Soledad'

