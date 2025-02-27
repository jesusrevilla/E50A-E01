\echo '\nSección 1: Creación y Manipulación de Tablas'
CREATE TABLE libros (
  Id INT PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INT NOT NULL
);

INSERT INTO libros (Id, titulo, autor, año_publicacion) VALUES
(1, 'El psicoanalista','John Katzenbach', 2002),
(2, 'Aura','Carlos fuente', 1962),
(3, 'cien años de soledad','Gabriel García Márquez', 1967);

--
\echo '\nSección 2: Índices'
CREATE INDEX nombre_indiceX ON libros (titulo);

\echo '\nSección 3: Consultas y Relaciones'
CREATE TABLE miembros (
  Id_m INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fecha_registro DATE DEFAULT CURRENT_DATE
);

INSERT INTO miembros (Id_m, nombre, fecha_registro) VALUES
(1, 'César Alejandro', '2025-01-15'),
(2, 'Emmanuel Flores', '2025-01-20');

CREATE TABLE prestamos (
  Id_libro INT REFERENCES libros(Id) NOT NULL,
  Id_miembro INT REFERENCES miembros(Id_m) NOT NULL
);
INSERT INTO prestamos (Id_libro, Id_miembro) VALUES
(1, 1),
(2, 2);

\echo '\nSección 4: Consultas Avanzadas'

SELECT e.titulo AS nombre_libro, m.nombre AS nombre_miembro
FROM libros e
JOIN prestamos em ON em.Id_libro = em.Id_libro
JOIN miembros m ON em.Id_miembro = em.Id_miembro; 


SELECT c.nombre AS nombrep, COUNT(ec.Id_miembro) AS catidad_pretamos
FROM miembros c
LEFT JOIN prestamos ec ON ec.Id_libro = ec.Id_libro
GROUP BY c.nombre



