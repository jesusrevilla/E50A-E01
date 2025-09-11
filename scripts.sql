CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR NOT NULL,
    autor VARCHAR NOT NULL,
    año_publicacion INTEGER NOT NULL
);

INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('Cien Años de Soledad', 'Gabriel García Márquez', 1967);
INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('El Señor de Los Domingos', 'Miguel Angel Gaitan', 2013);
INSERT INTO libros(titulo, autor, año_publicacion) VALUES ('Mi Vecino Totoro', 'Ghibi', 1993);

CREATE TABLE miembros (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR NOT NULL,
  fecha_registro DATE NOT NULL
);

INSERT INTO miembros (nombre, fecha_registro) VALUES ('Rafael', '2024-05-03'), ('Juan', '2024-10-19');
    

CREATE TABLE prestamos (
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);


INSERT INTO prestamos (id_libro, id_miembro, fecha_prestamo) VALUES (1, 1, '2025-04-04'),  (2, 2, '2025-03-25'), (3, 1, '2025-12-29');


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
