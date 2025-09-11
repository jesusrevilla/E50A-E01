--Yazmin Guerrero Guevara - 182483

--Sección 1: Creación y Manipulación de Tablas

-- create libros
CREATE TABLE libros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR NOT NULL,
  autor VARCHAR NOT NULL,
  año_publicación INTEGER NOT NULL
);

-- insert 3
INSERT INTO libros(titulo, autor, año_publicación)
VALUES ('Cien Años de Soledad', 'Gabriel Garcia', 1990);

INSERT INTO libros(titulo, autor, año_publicación)
VALUES ('La divina comedia', 'Dante', 1500);

INSERT INTO libros(titulo, autor, año_publicación)
VALUES ('Orgullo y Prejuicio', 'Jane Austen', 1815);

-- create miembros
CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  fecha_registro DATE NOT NULL
);

-- insert 2
INSERT INTO miembros(nombre, fecha_registro)
VALUES ('Yazmin Guerrero', '20205-09-10');

INSERT INTO miembros(nombre, fecha_registro)
VALUES ('Luna Hernández', '20205-09-09');

-- create prestamos
CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

-- insert 3
INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo)
VALUES
(1, 2, '2025-09-10'),
(2, 2, '2025-09-09'),
(3, 1, '2025-09-08');

------------------------------------------------
--Sección 2: Índices

CREATE INDEX index_libros ON libros(titulo);

------------------------------------------------
--Sección 4: Consultas Avanzadas

-- Consulta libros con miembros
SELECT titulo as Titulo_libro, nombre as Nombre_Miembro FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id
JOIN miembros ON prestamos.id_miembro = miembros.id;

-- Consulta miembros prestamo "Cien Años de Soledad"
SELECT nombre as nombre_miembro FROM prestamos
JOIN libros ON prestamos.id_libro = libros.id
JOIN miembros ON prestamos.id_miembro = miembros.id
WHERE libros.titulo = 'Cien Años de Soledad';
