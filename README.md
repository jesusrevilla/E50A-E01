# E50A-E01

## Sección 1: Creación y Manipulación de Tablas   

1. Cree una tabla llamada `libros` con los siguientes campos:   
   `id` (entero, clave primaria, incremento automático),   
   `título`,   
   `autor`,   
   `año_publicación` (entero).   
2. Inserte **tres** registros en la tabla `libros` uno de los libros con título:   
   Cien Años de Soledad.   

3. Cree una tabla llamada `miembros` con los siguientes campos:   
   `id` (entero, clave primaria, incremento automático),   
   `nombre`,   
   `fecha_registro` (fecha).   

4. Inserte **dos** registros en la tabla `miembros`.

5. Cree una tabla llamada `prestamos` para relacionar `libros` y `miembros`,   
   con los campos:   
   id (entero, clave foránea),   
   id_miembro (entero, clave foránea),   
   fecha_prestamo (fecha). (1 punto)

6. Agregue NOT NULL a los campos que considere pertinete,   
   por lo menos a un campo de cada tabla.

8. Inserte **tres** registros en la tabla prestamos para asignar libros a los miembros.   

## Sección 2: Índices

7. Cree un índice en el campo título de la tabla `libros`.

## Sección 3: Consultas Avanzadas

Nota: cada consulta debe arrojar por lo menos un renglón

8. Realice una consulta para obtener los títulos de los libros   
   y los nombres de los miembros a los que los han prestado.

9. Realice una consulta para obtener los nombres de los miembros   
   a los que le han prestado el libro titulado 'Cien Años de Soledad'.

