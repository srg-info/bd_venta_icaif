
# Proyecto ICAIF - Base de Datos de Ventas

Este repositorio contiene la estructura y carga inicial de una base de datos relacional orientada a la gestión de ventas para el proyecto ICAIF.

## 📌 Descripción del proyecto

La base de datos fue diseñada para una tienda que gestiona categorías de productos, inventario, clientes y ventas. Incluye relaciones bien definidas entre las tablas, así como validaciones de estado y claves primarias y foráneas.

## 🧱 Estructura de Tablas

- **Categoria**: clasificaciones de productos
- **Producto**: detalles del inventario por categoría
- **Cliente**: datos personales del cliente
- **Venta**: información general de cada transacción
- **DetalleVenta**: productos específicos vendidos en cada venta

## 🧪 Tecnologías

- SQL Server / T-SQL
- Instrucciones DDL (CREATE, ALTER)
- Integridad referencial (FOREIGN KEYS)
- Inserciones de datos (INSERT INTO)

## 📂 Ejemplo de tabla

```sql
CREATE TABLE Categoria (
	idCategoria INT NOT NULL IDENTITY(1,1),
	descripcion VARCHAR(100) NOT NULL,
	estado CHAR(1) NOT NULL CHECK (estado IN ('A', 'I')) DEFAULT 'A',
	PRIMARY KEY (idCategoria)
);
```

## 📄 Contenido

- Estructura de la base de datos
- Inserciones de prueba
- Consultas SELECT

## 🔗 Archivo principal

Puedes ver el archivo SQL completo aquí:  
👉 [BD_Venta.sql](./BD_Venta.sql)

---

© ICAIF | Proyecto académico para fines educativos.
