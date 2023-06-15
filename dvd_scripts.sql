-- Pregunta 5 Diccionrio
SELECT

t1.TABLE_NAME AS tabla_nombre,

t1.COLUMN_NAME AS columna_nombre,

t1.COLUMN_DEFAULT AS columna_defecto,

t1.IS_NULLABLE AS columna_nulo,

t1.DATA_TYPE AS columna_tipo_dato,

COALESCE(t1.NUMERIC_PRECISION,

t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,

PG_CATALOG.COL_DESCRIPTION(t2.OID,

t1.DTD_IDENTIFIER::int) AS columna_descripcion,

t1.DOMAIN_NAME AS columna_dominio

FROM

INFORMATION_SCHEMA.COLUMNS t1

INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)

WHERE

t1.TABLE_SCHEMA = 'public'

ORDER BY

t1.TABLE_NAME;



-- Pregunta 4 Construye las siguientes consultas:
-- Insertar un Customer
INSERT INTO customer (first_name, last_name, email, address_id, active, create_date, last_update, store_id, activebool)
VALUES ('Juanito', 'Figueroa', 'no.tiene@mail.com', 1, 1, current_timestamp, current_timestamp, 1, true);


-- <Modificar un Customer:
UPDATE customer
SET first_name = 'Pedro',
    address_id = 2,
    create_date = current_timestamp,
    last_update = current_timestamp,
    store_id = 1,
    activebool = false
WHERE customer_id = 602;

-- Eliminar un Customer:
DELETE FROM customer WHERE customer_id = 602;

-- Insertar un Staff
INSERT INTO staff (first_name, last_name, address_id, email, store_id, username, password) VALUES ('Juan', 'Borico', 1, 'merly@gmail.com', 2, 'oly', '123%&/456');

-- <Modificar un Staff:
UPDATE staff SET first_name = 'Ricardo', last_name = 'Lagos', address_id = 2, email = 'ricky@example.com', store_id = 2, username = 'riclake', password = '44l%%$%&#"23rG'
WHERE staff_id = 3;

-- Eliminar un Staff:
DELETE FROM staff WHERE staff_id = 5;

-- Insertar un Actor
INSERT INTO actor (first_name, last_name) VALUES ('Brad', 'Pit');

-- <Modificar un Actor:
UPDATE actor
SET first_name = 'NuevoNombre', last_name = 'NuevoApellido' WHERE actor_id = <id_del_actor>;

-- Eliminar un Actor:
DELETE FROM actor WHERE actor_id = 201;


-- Listar todas las “rental” con los datos del “customer” dado un año y mes
SELECT rental.rental_id, rental.rental_date, rental.return_date, customer.customer_id, customer.first_name, customer.last_name
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005
  AND EXTRACT(MONTH FROM rental.rental_date) = 7;
 
-- Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”

-- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
SELECT *
FROM film
WHERE release_year = '2006'::year
  AND rental_rate > 4.0;


