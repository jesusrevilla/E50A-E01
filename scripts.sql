--Lopez Gonzalez Cruz Angel 183213
--Instruccion numero 1
CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

--Instruccion numero 2
INSERT INTO libros(titulo,autor,año_publicacion)
VALUES 
('El señor','JK R','2005'),
('Cien Años de Soledad','Julian C','1995'),
('Embrujados','Rafael Sanchez','2002');

--Instruccion numero 3
CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

--Instruccion numero 4
INSERT INTO miembros(nombre,fecha_registro)
VALUES
('Juan Perez','2005-11-28'),
('Antonio Villagrán','2004-05-14');

--Instruccion numero 5
CREATE TABLE prestamos(
  id_libro INTEGER,
  FOREIGN KEY(id_libro) REFERENCES libros(id),
  id_miembro INT,
  FOREIGN KEY(id_miembro) REFERENCES miembros(id),
  fecha_prestamo DATE NOT NULL
);

--Instruccion numero 6
INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES
(2,1,'2012-08-05'),
(3,2,'2012-09-18'),
(1,1,'2012-09-18');

--Crear el index para titulo - Instrucccion 7
CREATE INDEX idx_titulo ON libros(titulo);

--Instruccion numero 8, buscar todas los titulos y nombres que han prestado
SELECT l.titulo,m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

--Instruccion numero 9, Nombres de las personas que han solicitado prestado Cien Años de soledad
SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';





