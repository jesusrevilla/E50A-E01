CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INT NOT NULL
);


INSERT INTO libros (titulo, autor, año_publicacion) VALUES 
  ('Cien Años de Soledad', 'Gabriel García Márquez', 1950),
  ('El Llano en Llamas', 'Juan Rulfo', 1970),
  ('Los Miserables', 'Victor Hugo', 1910);
  
  
CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES
  ('Juan Pérez', '2025-09-10'),
  ('María Sánchez', '2025-09-11');


CREATE TABLE prestamos (
  id SERIAL PRIMARY KEY,
  id_libro INT NOT NULL,
  id_miembro INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  FOREIGN KEY (id_libro) REFERENCES libros(id),
  FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES 
  (1, 1, '2025-09-11'),
  (1, 2, '2025-08-11'),
  (2, 2, '2025-09-11');
  
CREATE INDEX idx_titulo ON libros(titulo);

SELECT 
  l.titulo,
  m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id;

SELECT m.nombre
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN miembros m ON p.id_miembro = m.id
WHERE l.titulo = 'Cien Años de Soledad';
