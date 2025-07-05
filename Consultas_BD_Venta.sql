
-- Usar la base de datos BD_Venta
USE BD_Venta

-- Consultas básicas de la tabla Categoria
SELECT * FROM Categoria
SELECT idCategoria, descripcion FROM Categoria

-- Alias para simplificar lectura de columnas
SELECT	c.idCategoria,
		c.descripcion 
FROM	Categoria AS c

-- Usar alias personalizados para mejorar presentación de columnas
SELECT	c.idCategoria AS [codigo Categoria],
		c.descripcion AS nombreCategoria
FROM	Categoria AS c

-- Consultar descripción, precio y stock de todos los productos
SELECT	p.descripcion,
		p.precio,
		p.stock
FROM	Producto AS p

-- Consultar productos pertenecientes a la categoría 1
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.idCategoria = 1

-- Desactivar un producto (cambiar estado a 'I')
UPDATE	Producto
SET		estado = 'I'
WHERE	idProducto = 15

-- Mostrar productos activos
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.estado = 'A'

-- Mostrar productos activos con stock mayor a 10
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.stock,
		p.estado
FROM	Producto AS p
WHERE	p.estado = 'A'
		AND stock > 10

-- Buscar productos cuya descripción contenga 'co'
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '%co%'

-- Buscar productos cuya descripción comience con 's'
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE 's%'

-- Buscar productos cuya descripción termine en 's'
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '%s'

-- Buscar productos cuya segunda letra esté entre a y m
SELECT	p.idProducto,
		p.idCategoria,
		p.descripcion,
		p.estado
FROM	Producto AS p
WHERE	p.descripcion LIKE '_[a-m]%'

-- Agrupar productos por categoría y estado, mostrar solo los grupos con más de 2 productos
SELECT	idCategoria,
		estado,
		COUNT(*) AS totalProductos
FROM	Producto AS p
GROUP BY idCategoria, estado
HAVING COUNT(*) > 2
ORDER BY idCategoria

-- JOIN entre Categoría y Producto: mostrar productos activos con su categoría
SELECT	c.idCategoria,
		c.descripcion,
		p.idProducto,
		p.idCategoria,
		p.descripcion
FROM	Categoria  AS c
		INNER JOIN Producto AS p ON c.idCategoria = p.idCategoria
WHERE	p.estado = 'A'
		AND c.estado = 'A'

-- JOIN múltiple: unir categoría, producto, detalle de venta, venta y cliente
SELECT	*
FROM	Categoria				AS c
		INNER JOIN Producto		AS p	ON c.idCategoria = p.idCategoria
		INNER JOIN DetalleVenta AS dv	ON p.idProducto = dv.idProducto
		INNER JOIN Venta		AS v	ON v.idVenta = dv.idVenta
		INNER JOIN Cliente		AS cli	ON v.idCliente = cli.idCliente
