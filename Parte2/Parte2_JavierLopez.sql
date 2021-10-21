/* NOTA: Se asume la utilización de un motor de SQL tipo SQLite v3. Esto se menciona debido a que el manejo de fecha cambia para cada tipo de Motor.*/

/* 1. QUERY ENTREGA CANTIDAD DE CLIENTES DISTINTOS POR TIENDA QUE REALIZARON UNA TRANSACCION TIPO 15*/
SELECT POS_TRX.Tienda, Count(POS_TRX_CLIENTE.Rut)
FROM POS_TRX, POS_TRX_CLIENTE
WHERE (POS_TRX.ID_TRX = POS_TRX_CLIENTE.ID_TRX) AND (POS_TRX.Tipo_Transaccion = 15)
GROUP BY POS_TRX.Tienda;

/* 2. QUERY entrega las ventas de cada tienda por año en orden de mayor a menor*/

/* Orden de mayor a menor por Ventas*/
SELECT POS_TRX.Tienda as Tienda, strftime('%Y',DATE(POS_TRX.Fecha_Transaccion)) as Year, SUM(POS_TRX_PAGO.Monto_pago) as Venta
FROM POS_TRX, POS_TRX_PAGO
WHERE (POS_TRX.ID_TRX = POS_TRX_PAGO.ID_TRX)
GROUP BY Tienda, Year
ORDER BY Venta DESC;

/* Orden de mayor a menor por año*/
SELECT POS_TRX.Tienda as Tienda, strftime('%Y',DATE(POS_TRX.Fecha_Transaccion)) as Year, SUM(POS_TRX_PAGO.Monto_pago) as Venta
FROM POS_TRX, POS_TRX_PAGO
WHERE (POS_TRX.ID_TRX = POS_TRX_PAGO.ID_TRX)
GROUP BY Tienda, Year
ORDER BY Year DESC;

/* 3. QUERY entrega las ventas de cada tienda por año en orden de mayor a menor*/

/* Orden de mayor a menor por Ventas*/
SELECT POS_TRX.Tienda as Tienda, strftime('%Y',DATE(POS_TRX.Fecha_Transaccion)) as Year, AVG(POS_TRX_PAGO.Monto_pago) as Venta
FROM POS_TRX, POS_TRX_PAGO
WHERE (POS_TRX.ID_TRX = POS_TRX_PAGO.ID_TRX)
GROUP BY Tienda, Year
ORDER BY Venta DESC;

/* Orden de mayor a menor por año*/
SELECT POS_TRX.Tienda as Tienda, strftime('%Y',DATE(POS_TRX.Fecha_Transaccion)) as Year, AVG(POS_TRX_PAGO.Monto_pago) as Venta
FROM POS_TRX, POS_TRX_PAGO
WHERE (POS_TRX.ID_TRX = POS_TRX_PAGO.ID_TRX)
GROUP BY Tienda, Year
ORDER BY Year DESC;

/* 4. QUERY ENTREGA PRINCIPAL MEDIO DE PAGO EN FUNCION DEL MONTO DE PAGO */
SELECT POS_TRX_PAGO.Medio_de_pago, SUM(POS_TRX_PAGO.Monto_pago)
FROM POS_TRX_PAGO
GROUP BY POS_TRX_PAGO.Medio_de_pago
ORDER BY SUM(POS_TRX_PAGO.Monto_pago) DESC
LIMIT 1;

/* 4. BONUS: QUERY ENTREGA PRINCIPAL MEDIO DE PAGO EN FUNCION DE LAS VECES UTILIZADAS */
SELECT POS_TRX_PAGO.Medio_de_pago, COUNT(POS_TRX_PAGO.Medio_de_pago)
FROM POS_TRX_PAGO
GROUP BY POS_TRX_PAGO.Medio_de_pago
ORDER BY COUNT(POS_TRX_PAGO.Medio_de_pago) DESC
LIMIT 1;
