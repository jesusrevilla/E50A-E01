--Antonio de Jesus Morales Quiroz 176412
-- create
CREATE TABLE libros (
  id INT PRIMARY KEY,
   título TEXT NOT NULL,
  autor TEXT NOT NULL,
  año_publicación  INT
);

-- insert
INSERT INTO libros VALUES (0001, 'Cien Años de Soledad', 'Gabriel García Márquez',1990);
INSERT INTO libros VALUES (0002, 'El Código da Vinci', 'Dan Brown', 2002);
INSERT INTO libros VALUES (0003, 'El señor de los anillos', 'J. R. R. Tolkien',1980);

-- fetch 
SELECT * FROM libros;


CREATE INDEX inx_título ON libros(título);
SELECT * FROM libros;

-- create
CREATE TABLE miembros (
  id INT PRIMARY KEY,
   nombre TEXT NOT NULL,
  fecha_registro DATE
);


INSERT INTO miembros VALUES(1, 'Antonio Morales', '2025-02-25');
INSERT INTO miembros VALUES(2, 'Araujo','2025-02-26' );
SELECT * FROM miembros;


CREATE TABLE prestamos (
  id_libro INT ,
    id_miembro INT,
     FOREIGN KEY (id_libro) REFERENCES libros(id) ON DELETE CASCADE,
    FOREIGN KEY (id_miembro) REFERENCES miembros(id) ON DELETE CASCADE
);


INSERT INTO prestamos VALUES(1,2);
INSERT INTO prestamos VALUES(2,1);
INSERT INTO prestamos VALUES(3,1);

SELECT * FROM  prestamos;

SELECT l.título AS Titulos,m.nombre AS Miembros
FROM  libros l
JOIN prestamos P ON p.id_libro = l.id
JOIN  miembros m ON p.id_miembro = m.id;



SELECT COUNT(p.id_libro) AS libros, m.nombre AS Miembro
FROM prestamos p
JOIN miembros m On m.id = p.id_miembro
GROUP BY m.nombre;


SELECT m.nombre AS miembros, l.título AS nombres
FROM miembros m
JOIN prestamos p ON m.id = p.id_miembro
JOIN libros l ON p.id_libro = l.id 
Where l.título = 'Cien Años de Soledad';
