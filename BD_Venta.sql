
-- Crear base de datos llamada BD_Venta
CREATE DATABASE BD_Venta
USE BD_Venta

-- Crear tabla Categoria: almacena las categorías de los productos
CREATE TABLE Categoria
(
	idCategoria		INT				NOT NULL IDENTITY(1,1), -- Clave primaria autoincremental
	descripcion		VARCHAR(100)	NOT NULL,                -- Descripción de la categoría
	estado			CHAR(1)			NOT NULL                 -- Estado ('A' activo, 'I' inactivo)
					CHECK (estado IN ('A', 'I')) 
					DEFAULT 'A' 
)
ALTER TABLE Categoria ADD PRIMARY KEY (idCategoria)
GO

-- Crear tabla Producto: almacena productos y se relaciona con Categoria
CREATE TABLE Producto 
(
     idProducto		INT IDENTITY(1,1)	NOT NULL,             -- Clave primaria autoincremental
	 idCategoria	INTEGER				NOT NULL,             -- Relación con tabla Categoria
     descripcion	VARCHAR (150)		NOT NULL,             -- Nombre del producto
     precio		    DECIMAL (9,2),                             -- Precio unitario
     stock			INTEGER				NOT NULL,             -- Cantidad disponible
     estado		    CHAR (1)			NOT NULL              -- Estado del producto ('A' o 'I')
					CHECK (estado IN ('A', 'I')) 
					DEFAULT 'A'  
)
ALTER TABLE Producto ADD PRIMARY KEY (idProducto)
ALTER TABLE Producto ADD FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
GO

-- Crear tabla Cliente: almacena información de los clientes
CREATE TABLE Cliente
(
	idCliente		INT IDENTITY(1,1)	NOT NULL,             -- Clave primaria autoincremental
	nombres		    VARCHAR(50)			NOT NULL,             -- Nombre del cliente
	apellidos		VARCHAR(50)			NOT NULL,             -- Apellido del cliente
	nroDocumento	VARCHAR(15),                              -- Documento de identidad
	estado			CHAR(1)				NOT NULL              -- Estado del cliente
					CHECK (estado IN ('A', 'I')) 
					DEFAULT 'A'
)
ALTER TABLE Cliente ADD PRIMARY KEY (idCliente)
GO

-- Crear tabla Venta: almacena las ventas realizadas
CREATE TABLE Venta
(
	idVenta			INT IDENTITY(1,1)	NOT NULL,             -- Clave primaria autoincremental
	idCliente		INT					NOT NULL,             -- Relación con Cliente
	montoTotal		DECIMAL(9,2)		NOT NULL,             -- Total de la venta
	fechaVenta		SMALLDATETIME		DEFAULT GETDATE(),    -- Fecha de la venta
	estado			CHAR(1)				NOT NULL              -- Estado de la venta
					CHECK (estado IN ('A', 'I')) 
					DEFAULT 'A'
)
ALTER TABLE Venta ADD PRIMARY KEY (idVenta)
ALTER TABLE Venta ADD FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
GO

-- Crear tabla DetalleVenta: almacena los productos incluidos en cada venta
CREATE TABLE DetalleVenta
(
	idDetalleVenta	INT IDENTITY(1,1)	NOT NULL,             -- Clave primaria autoincremental
	idProducto		INT					NOT NULL,             -- Producto vendido
	idVenta		    INT					NOT NULL,             -- Venta a la que pertenece
	precioUnitario	DECIMAL(9,2)		NOT NULL,             -- Precio por unidad en la venta
	cantidad		INT					NOT NULL,             -- Cantidad vendida
	monto			DECIMAL(9,2)		NOT NULL,             -- Subtotal (precio * cantidad)
	estado			CHAR(1)				NOT NULL              -- Estado ('A', 'I')
					CHECK (estado IN ('A', 'I'))
					DEFAULT 'A'
)
ALTER TABLE DetalleVenta ADD PRIMARY KEY (idDetalleVenta)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idProducto) REFERENCES Producto(idProducto)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idVenta) REFERENCES Venta(idVenta)
GO
