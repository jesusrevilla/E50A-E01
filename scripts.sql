-- SECCION 1: Creación y Manipulación de Tablas
-- 1
CREATE TABLE libros (
  id_l SERIAL PRIMARY KEY,
  titulo VARCHAR(100),
  autor VARCHAR(100),
  anio_publicacion INTEGER NOT NULL
);

-- 2 
INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
  ('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
  ('El Principito', 'Antoine de Saint-Exupéry', 1943),
  ('Rayuela', 'Julio Cortázar', 1963);

-- 3 
CREATE TABLE miembros (
  id_m SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_registro DATE
);

-- 4
INSERT INTO miembros (nombre,fecha_registro) VALUES
('isaac torres', '2025-08-20'),
('salma lopez', '2025-02-18');

-- 5
CREATE TABLE prestamo (
  -- id_prestamo SERIAL PRIMARY KEY,
  id_l INTEGER NOT NULL,
  id_m INTEGER NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_m) REFERENCES miembros(id_m),
  FOREIGN KEY (id_l) REFERENCES libros(id_l)
);

-- 7
INSERT INTO prestamo (id_l, id_m, fecha_prestamo) VALUES
(1, 1, '2025-08-20'),
(2, 2, '2025-08-15'),
(1, 1, '2025-08-10');

-- Sección 2: Índices
-- 7
CREATE INDEX idx_autor ON libros(titulo);

-- Sección 4: Consultas Avanzadas
-- 8 
SELECT m.nombre, l.titulo 
FROM miembros m 
JOIN libros l 
ON m.id_m = l.id_l;

-- 9 
SELECT DISTINCT m.nombre
FROM miembros m
JOIN prestamo p ON m.id_m = p.id_m
JOIN libros l ON p.id_l = l.id_l
WHERE l.titulo = 'Cien Años de Soledad';
