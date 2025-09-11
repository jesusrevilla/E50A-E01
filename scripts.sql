
-- Crear tabal libros 
CREATE TABLE libros(
  id SERIAL PRIMARY KEY,
  título VARCHAR(50) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  año_publicacion INTEGER NOT NULL
);

-- insertar registros de libros
INSERT INTO libros (título, autor, año_publicacion) VALUES 
('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('1987', 'George Orwell', 1949);


--Crear tabla miembros
CREATE TABLE miembros(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_registro DATE NOT NULL
);

--Insertar dos registros enn tabla miembtos
INSERT INTO miembros(nombre, fecha_registro) VALUES 
('Rafael Sánchez Saucedo','2025-09-10'),
('Cruz Ángel López Gonzalez','2025-05-22');

--Crear tabla de prestamos 
CREATE TABLE prestamos(
  id_libro INTEGER NOT NULL,
  id_miembro INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

INSERT INTO prestamos(id_libro,id_miembro,fecha_prestamo) VALUES
(1, 1, '2025-01-01'), 
(2, 2, '2025-06-05'), 
(3, 1, '2025-08-10'); 

--Cree un índice en el campo título de la tabla libros
CREATE INDEX idx_titulo ON libros(título);

---------------------CONSULTAS-------------
-- titulos y miembros que los han pedido prestados
SELECT l.título, m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;
--Miembros a los que se les ha prestado Cien años de Soledad

SELECT m.nombre FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.título = 'Cien Años de Soledad';


