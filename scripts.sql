-- creacion tablas
CREATE TABLE libros (
    id SERIAL PRIMARY KEY ,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    anio_publicacion INT NOT NULL
);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    PRIMARY KEY (id_libro, id_miembro),
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

-- Insertar registros
INSERT INTO libros (titulo, autor, anio_publicacion) VALUES
  ('Cien Años de Soledad', 'Gabriel García Márquez', 1967),
  ('Guerra Mundial Z', 'Max Jhonson', 2006),
  ('Viaje al centro de la tierra', 'Julio Verne', 1864);
  
  INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Juan Perez', '2025-02-25'),
  ('Martín Sanchez', '2024-01-01');
  
  INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES
  (1, 1, '2025-02-02'),  
  (2, 2, '2024-04-04'),  
  (3, 1, '2023-03-03');  


-- Crear index
CREATE INDEX idx_libros_titulo ON libros(titulo);

SELECT * FROM libros
WHERE anio_publicacion > 1950;

-- Ejercicio 4_1: Títulos de libros y nombres de miembros que los tienen prestados
SELECT l.titulo AS titulo_libro,
m.nombre AS nombre_miembro,
p.fecha_prestamo FROM prestamos p 
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

-- Ejercicio 4_2
SELECT m.nombre AS nombre_miembro,
p.fecha_prestamo FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
