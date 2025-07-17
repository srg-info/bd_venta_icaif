
# Proyecto ICAIF - Base de Datos de Ventas

Este repositorio contiene la estructura, carga inicial y consultas SQL de una base de datos relacional orientada a la gestión de ventas para el proyecto ICAIF.

## 📌 Descripción del proyecto

La base de datos fue diseñada para una tienda que gestiona categorías de productos, inventario, clientes y ventas. Incluye relaciones bien definidas entre las tablas, así como validaciones de estado y claves primarias y foráneas.

## 🧱 Estructura de Tablas

- **Categoria**: clasificaciones de productos.
- **Producto**: detalles del inventario por categoría.
- **Cliente**: datos personales del cliente.
- **Venta**: información general de cada transacción.
- **DetalleVenta**: productos específicos vendidos en cada venta.

## 🧪 Tecnologías

- SQL Server / T-SQL
- Instrucciones DDL (CREATE, ALTER, INSERT)
- Claves foráneas (FOREIGN KEYS)
- Consultas con filtros, joins, agrupaciones

## 📂 Ejemplo de tabla

```sql
CREATE TABLE Categoria (
	idCategoria INT NOT NULL IDENTITY(1,1),
	descripcion VARCHAR(100) NOT NULL,
	estado CHAR(1) NOT NULL CHECK (estado IN ('A', 'I')) DEFAULT 'A',
	PRIMARY KEY (idCategoria)
);
```

---

## 🧾 Contenido del Repositorio

### 📁 `BD_Venta.sql`

Contiene la **estructura de las tablas** y **datos de prueba** de la base de datos:

- Tablas relacionales con integridad referencial.
- Inserción de categorías, productos, clientes y ventas.
- Simulación de datos de negocio.

📄 [Ver archivo BD_Venta.sql](./BD_Venta.sql)

---

### 📁 `Consultas_BD_Venta.sql`

Incluye un conjunto de **consultas SQL prácticas** para:

- Consultar productos por estado, stock o descripción.
- Actualizar información del inventario.
- Realizar búsquedas con `LIKE` y patrones.
- Agrupar datos (`GROUP BY`, `HAVING`, `ORDER BY`).
- Unir múltiples tablas (`INNER JOIN`) para análisis más profundos.

📄 [Ver archivo Consultas_BD_Venta.sql](./Consultas_BD_Venta.sql) ![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---
##
@ srg-info | Proyecto académico para fines educativos con SQL .
