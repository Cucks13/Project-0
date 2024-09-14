
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name", a."Title" from "Track" t join "Album" a on t."AlbumId" = a."AlbumId";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select a."Name", al."Title" from "Artist"  a join "Album" al on a."ArtistId" = al."ArtistId" order by a."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select c."Name", SUM(i."Total") from "Customer" c join "Invoice" i on c."CustomerId" = i."CustomerId" group by c."Name" order by "Total" asc  limit 5

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
SELECT e."Last_Name" , c."Name" 
FROM  "Employee" e 
JOIN "Customer" c ON e."EmployeeId" = c."SupportRepId";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select i."InvoiceId" , t."Name" from "Invoice" i join "InvoiceLine" il on i."InvoiceId" = il."InvoiceLineId" join "Track" t on il."TrackId" = t."TrackId" 

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select a."Name", g."Name" from "Artist" a join "Album" a2 on a."ArtistId" = a2."ArtistId" join "Track" t on a2."AlbumId" = t."AlbumId" join "Genre" g on t."GenreId" = g."GenreId" 

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name", mt."Name" from "Track" t join "MediaType" mt on t."MediaTypeId" = mt."MediaTypeId" 

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select t."Name", g."Name" from "Track" t left join "Genre" g on t."GenreId" = g."GenreId" 

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select c."Name", i."InvoiceId" from "Customer" c left join "Invoice" i on c."ID" = i."CustomerId"

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select a2."Title", ar."Name" from "Album" a2 left join "Artist" ar on a2."ArtistId" = ar."ArtistId" 

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select g."Name", count(t."TrackId") from "Track" t join "Genre" g on t."GenreId" = g."GenreId" group by g."Name"

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select a2."Title", sum(t."Milliseconds") from	 "Album" a2 join "Track" t on a2."AlbumId" = t."AlbumId" group by a2."Title" 

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select c."Name", sum(i."Total") from "Customer" c join "Invoice" i on c."ID" = i."CustomerId" group by c."ID", c."Name" 

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select e."First_Name", c."Name" from "Employee" e left join "Customer" c on e."EmployeeId" = c."SupportRepId" order by e."First_Name" 


