CREATE TABLE libros (

    id SERIAL PRIMARY KEY,

    titulo VARCHAR(255) NOT NULL,

    autor VARCHAR(255) NOT NULL,

    año_publicacion INT NOT NULL

);
 
-- Insertar 3 registros en libros

INSERT INTO libros (titulo, autor, año_publicacion) VALUES

('Cien Años de Soledad', 'Gabriel García Márquez', 1967),

('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),

('La Sombra del Viento', 'Carlos Ruiz Zafón', 2001);
 
-- Crear tabla miembros

CREATE TABLE miembros (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(150) NOT NULL,

    fecha_registro DATE NOT NULL

);
 
-- Insertar 2 registros en miembros

INSERT INTO miembros (nombre, fecha_registro) VALUES

('Ana López', '2025-01-15'),

('Juan Pérez', '2025-02-20');
 
-- Crear tabla prestamos

CREATE TABLE prestamos (

    id_libro INT NOT NULL,

    id_miembro INT NOT NULL,

    fecha_prestamo DATE NOT NULL,

    FOREIGN KEY (id_libro) REFERENCES libros(id),

    FOREIGN KEY (id_miembro) REFERENCES miembros(id)

);
 
-- Insertar 3 registros en prestamos

INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES

(1, 1, '2025-03-01'),

(2, 2, '2025-03-05'),

(3, 1, '2025-03-10');
 
-- Crear índice en título

CREATE INDEX idx_titulo_libros ON libros(titulo);

SELECT l.titulo, m.nombre

FROM prestamos p

JOIN libros l ON p.id_libro = l.id

JOIN miembros m ON p.id_miembro = m.id;
 
-- Miembros que recibieron "Cien Años de Soledad"

SELECT m.nombre

FROM prestamos p

JOIN libros l ON p.id_libro = l.id

JOIN miembros m ON p.id_miembro = m.id

WHERE l.titulo = 'Cien Años de Soledad';

 
