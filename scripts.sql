--Crear la tabla libros:

CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
   ano_publicacion INT
);

--Insertar tres registros en la tabla libros:

INSERT INTO libros (titulo,autor,ano_publicacion) VALUES
('Cien Años de Soledad','Gabriel García Marquéz',2000),
('Juego de tronos','George R. R. Martin',2014),
('12 Tragedias griegas','Homero',1000);


--Sección 2: Índices
--Crear un índice en el campo titulo de la tabla libros:

CREATE INDEX indice ON libros(titulo);

--Sección 3: Consultas y Relaciones
--Crear la tabla miembros:

CREATE TABLE miembros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
   fecha_registro  DATE
);


--Insertar dos registros en la tabla miembros:

INSERT INTO miembros (nombre, fecha_registro) VALUES 
('Alfred De Alba', '2020-02-12'),
('Cesar Alejandro', '2025-01-26');

--Crear la tabla prestamos para relacionar libros y miembros:

CREATE TABLE prestamos (
    id_libro INT,
    id_miembro INT,
    fecha_prestamo  DATE,
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

--Insertar registros en la tabla prestamos:
INSERT INTO prestamos (id_libro, id_miembro,fecha_prestamo) VALUES 
(2,1,'2025-01-26'),
(3,1,'2025-01-26'),
(1,2,'2025-01-05');

--Sección 4: Consultas Avanzadas
--Consulta para obtener los títulos de los libros y los nombres de los miembros que los han prestado:

SELECT m.nombre, l.titulo  FROM prestamos p
JOIN miembros m ON p.id_miembro=m.id
JOIN libros l ON p.id_libro = l.id;

--Consulta para contar cuántos libros ha prestado cada miembro:

SELECT nombre, COUNT(DISTINCT p.id_libro) AS libros_prestados
FROM miembros m
JOIN prestamos p ON p.id_miembro=m.id
GROUP BY nombre;


--Consulta para obtener los nombres de los miembros que han prestado el libro titulado 'Cien Años de Soledad':
SELECT nombre FROM miembros m  
JOIN prestamos p ON p.id_miembro=m.id
WHERE(p.id_libro=1);

