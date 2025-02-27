\echo '\nSección 1: Creación y Manipulación de Tablas'
CREATE TABLE libros (
  Id INT PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  autor VARCHAR(50) NOT NULL,
  año_publicacion INT NOT NULL
);

INSERT INTO libros (Id, titulo, autor, año_publicacion) VALUES
(1, 'cien años de soledad','Gabriel García Márquez', 1967),
(2, 'El psicoanalista','John Katzenbach', 2002),
(3, 'Aura','Carlos fuente', 1962);


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
  Id_libro INT,
  Id_miembro INT,
  FOREIGN KEY (Id_libro) REFERENCES libros(Id) ON DELETE CASCADE,
  FOREIGN KEY (Id_miembro) REFERENCES miembros(Id_m) ON DELETE CASCADE,
  
  fecha_prestamo DATE DEFAULT CURRENT_DATE
);

INSERT INTO prestamos  VALUES
(1, 1, '2025-02-26'),
(2, 2, '2025-02-20'),
(3, 2, '2025-02-15');

\echo '\nSección 4: Consultas Avanzadas'

SELECT em.titulo AS nombre_libro, m.nombre AS nombre_miembro
FROM prestamos e
JOIN libros em ON e.Id_libro = e.Id_libro
JOIN miembros m ON e.Id_miembro = e.Id_miembro; 


SELECT c.nombre AS nombrep, COUNT(ec.Id_miembro) AS catidad_pretamos
FROM miembros c
LEFT JOIN prestamos ec ON ec.Id_libro = ec.Id_libro
GROUP BY c.nombre;


SELECT m.nombre AS MIEMBRO
FROM prestamos p
JOIN libros l ON p.Id_libro = l.Id
JOIN miembros m ON p.Id_miembro = l.Id
WHERE l.titulo = 'cien años de soledad';
