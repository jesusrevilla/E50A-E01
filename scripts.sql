CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL, 
  año_publicidad INTEGER NOT NULL
);
INSERT INTO libros (titulo, autor, año_publicidad) 
VALUES 
  ('Cien Años de Soledad', 'Gabriel Marquez', 2000), 
  ('La Cenicienta', 'Disney', 1980), 
  ('La Bella Durmiente', 'Disney', 1988);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) 
VALUES 
  ('Fernanda Camacho', '2024-08-19'),
  ('Aarón Diaz', '2020-07-29'); 

CREATE TABLE prestamos (
  id_libro INTEGER NOT NULL, 
  id_miembro INTEGER NOT NULL, 
  fecha_prestamo DATE NOT NULL, 
  FOREIGN KEY (id_libro) 
  REFERENCES libros(id), 
  FOREIGN KEY (id_miembro) 
  REFERENCES miembros(id)
);

INSERT INTO prestamos 
  VALUES 
  (3, 1, '2025-08-10'),
  (1, 2, '2025-09-04'),
  (2, 1, '2025-08-20');

CREATE INDEX index_titulos ON libros(titulo);

SELECT miembros.nombre, libros.titulo 
FROM miembros, prestamos, libros 
WHERE prestamos.id_miembro=miembros.id 
AND prestamos.id_libro = libros.id; 

SELECT miembros.nombre
FROM miembros  
JOIN prestamos  
ON miembros.id = prestamos.id_miembro 
WHERE prestamos.id_libro=1; 
SELECT miembros.nombre
FROM miembros  
JOIN prestamos  
ON miembros.id = prestamos.id_miembro 
WHERE prestamos.id_libro=1; 
