-- DDL (DATA DEFINITION LANGUAGE)
-- Base de datos: Supermercado

CREATE DATABASE IF NOT EXISTS supermercado;

use supermercado;

-- Creación de tablas

-- Tabla Cliente
CREATE TABLE IF NOT EXISTS cliente 
(
  NIT_cliente INT NOT NULL PRIMARY KEY,
  Nombre_cliente VARCHAR(45),
  Apellido_cliente VARCHAR(45),
  Direccion_cliente VARCHAR(45),
  Telefono_cliente VARCHAR(45)
);

-- Tabla Factura
CREATE TABLE IF NOT EXISTS factura 
(
  Numero_factura INT NOT NULL PRIMARY KEY,
  Fecha_factura DATETIME,
  Total_factura INT,
  NIT_cliente INT NOT NULL, index (NIT_cliente),
  foreign key (NIT_cliente) references cliente (NIT_cliente)
);

-- Tabla Proveedor
CREATE TABLE IF NOT EXISTS proveedor 
(
  NIT_proveedor INT NOT NULL PRIMARY KEY,
  Razon_social VARCHAR(45),
  Direccion_proveedor VARCHAR(45),
  Telefono_proveedor VARCHAR(45)
);

-- Tabla Categoria
CREATE TABLE IF NOT EXISTS categoria 
(
  Codigo_categoria INT NOT NULL PRIMARY KEY,
  Nombre_categoria VARCHAR(45)
);

-- Tabla Producto
CREATE TABLE IF NOT EXISTS producto (
  Codigo_producto INT NOT NULL PRIMARY KEY,
  Nombre_producto VARCHAR(45),
  Descripcion_producto VARCHAR(255),
  Precio_unitario DECIMAL(6,2),
  Cantidad_stock INT,
  Costo_unitario DECIMAL(6,2),
  Codigo_categoria INT NOT NULL, index (Codigo_categoria),
  foreign key (Codigo_categoria) references categoria (Codigo_categoria),
  NIT_proveedor INT NOT NULL, index (NIT_proveedor),
  foreign key (NIT_proveedor) references proveedor (NIT_proveedor)
);

-- Tabla Detalle_factura
CREATE TABLE IF NOT EXISTS detalle_factura (
  Numero_factura INT NOT NULL, index (Numero_factura),
  foreign key (Numero_factura) references factura (Numero_factura),
  Codigo_producto INT NOT NULL, index (Codigo_producto),
  foreign key (Codigo_producto) references producto (Codigo_producto),
  Cantidad INT NOT NULL
);

-- Procedimientos almacenados para insert

DROP PROCEDURE IF EXISTS prnuevo_cliente;
delimiter $$
CREATE PROCEDURE prnuevo_cliente
(
    IN nit_cliente INT,
    IN nombre_cliente VARCHAR(45),
    IN apellido_cliente VARCHAR(45),
    IN direccion_cliente VARCHAR(45),
    IN telefono_cliente VARCHAR(45)
)
BEGIN
    INSERT INTO cliente (NIT_cliente, Nombre_cliente, Apellido_cliente, Direccion_cliente, Telefono_cliente)
    VALUES (nit_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prnueva_factura;
delimiter $$
CREATE PROCEDURE prnueva_factura
(
    IN numero_factura INT,
    IN fecha_factura DATETIME,
    IN total_factura INT,
    IN nit_cliente INT
)
BEGIN
    INSERT INTO factura (Numero_factura, Fecha_factura, Total_factura, NIT_cliente)
    VALUES (numero_factura, fecha_factura, total_factura, nit_cliente);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prnuevo_proveedor;
delimiter $$
CREATE PROCEDURE prnuevo_proveedor
(
  IN nit_proveedor INT,
  IN razon_social VARCHAR(45),
  IN direccion_proveedor VARCHAR(45),
  IN telefono_proveedor VARCHAR(45)
)
BEGIN
  INSERT INTO proveedor (NIT_proveedor, Razon_social, Direccion_proveedor, Telefono_proveedor)
  VALUES (nit_proveedor, razon_social, direccion_proveedor, telefono_proveedor);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prnueva_categoria;
delimiter $$
CREATE PROCEDURE prnueva_categoria (
  IN codigo_categoria INT,
  IN nombre_categoria VARCHAR(45)
)
BEGIN
  INSERT INTO categoria (Codigo_categoria, Nombre_categoria)
  VALUES (codigo_categoria, nombre_categoria);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prnuevo_producto;
delimiter $$
CREATE PROCEDURE prnuevo_producto (
IN codigo_producto INT,
IN nombre_producto VARCHAR(45),
IN descripcion_producto VARCHAR(255),
IN precio_unitario DECIMAL(6,2),
IN cantidad_stock INT,
IN costo_unitario DECIMAL(6,2),
IN codigo_categoria INT,
IN nit_proveedor INT
)
BEGIN
INSERT INTO producto (Codigo_producto, Nombre_producto, Descripcion_producto, Precio_unitario, Cantidad_stock, Costo_unitario, Codigo_categoria, NIT_proveedor)
VALUES (codigo_producto, nombre_producto, descripcion_producto, precio_unitario, cantidad_stock, costo_unitario, codigo_categoria, nit_proveedor);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS prdetalle_factura;
delimiter $$
CREATE PROCEDURE prdetalle_factura(
  IN numero_factura INT,
  IN codigo_producto INT,
  IN cantidad INT
)
BEGIN
  INSERT INTO detalle_factura (Numero_factura, Codigo_producto, Cantidad)
  VALUES (numero_factura, codigo_producto, cantidad);
END $$
DELIMITER ;

-- Procedimientos almacenados para update

DROP PROCEDURE IF EXISTS practualizar_cliente;
delimiter $$
CREATE PROCEDURE practualizar_cliente
(
    IN nit_cliente INT,
    IN nombre_cliente VARCHAR(45),
    IN apellido_cliente VARCHAR(45),
    IN direccion_cliente VARCHAR(45),
    IN telefono_cliente VARCHAR(45)
)
BEGIN
    UPDATE cliente
    SET Nombre_cliente = nombre_cliente,
        Apellido_cliente = apellido_cliente,
        Direccion_cliente = direccion_cliente,
        Telefono_cliente = telefono_cliente
    WHERE NIT_cliente = nit_cliente;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS practualizar_factura;
delimiter $$
CREATE PROCEDURE practualizar_factura
(
    IN numero_factura INT,
    IN fecha_factura DATETIME,
    IN total_factura INT,
    IN nit_cliente INT
)
BEGIN
    UPDATE factura
    SET Fecha_factura = fecha_factura, 
		Total_factura = total_factura, 
        NIT_cliente = nit_cliente
    WHERE Numero_factura = numero_factura;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS practualizar_proveedor;
delimiter $$
CREATE PROCEDURE practualizar_proveedor
(
  IN nit_proveedor INT,
  IN razon_social VARCHAR(45),
  IN direccion_proveedor VARCHAR(45),
  IN telefono_proveedor VARCHAR(45)
)
BEGIN
  UPDATE proveedor
  SET Razon_social = razon_social,
      Direccion_proveedor = direccion_proveedor,
      Telefono_proveedor = telefono_proveedor
  WHERE NIT_proveedor = nit_proveedor;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS practualizar_categoria;
DELIMITER $$
CREATE PROCEDURE practualizar_categoria (
  IN codigo_categoria INT,
  IN nombre_categoria VARCHAR(45)
)
BEGIN
  UPDATE categoria 
  SET Nombre_categoria = nombre_categoria 
  WHERE Codigo_categoria = codigo_categoria;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS practualizar_producto;
delimiter $$
CREATE PROCEDURE practualizar_producto 
(
IN codigo_producto INT,
IN nombre_producto VARCHAR(45),
IN descripcion_producto VARCHAR(255),
IN precio_unitario DECIMAL(6,2),
IN cantidad_stock INT,
IN costo_unitario DECIMAL(6,2),
IN codigo_categoria INT,
IN nit_proveedor INT
)
BEGIN
UPDATE producto
SET Nombre_producto = nombre_producto,
    Descripcion_producto = descripcion_producto,
    Precio_unitario = precio_unitario,
    Cantidad_stock = cantidad_stock,
    Costo_unitario = costo_unitario,
    Codigo_categoria = codigo_categoria
WHERE Codigo_producto = codigo_producto AND NIT_proveedor = nit_proveedor;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS practualizar_detalle_factura;
DELIMITER $$
CREATE PROCEDURE practualizar_detalle_factura
(
  IN numero_factura INT,
  IN codigo_producto INT,
  IN cantidad INT
)
BEGIN
  UPDATE detalle_factura
  SET Cantidad = cantidad
  WHERE Numero_factura = numero_factura AND Codigo_producto = codigo_producto;
END $$
DELIMITER ;

-- Procedimientos almacenados para eliminar

DROP PROCEDURE IF EXISTS preliminar_cliente;
DELIMITER $$
CREATE PROCEDURE preliminar_cliente
(IN nit_cliente INT)
BEGIN
    DELETE FROM cliente
    WHERE NIT_cliente = nit_cliente;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS preliminar_factura;
DELIMITER $$
CREATE PROCEDURE preliminar_factura
(IN numero_factura INT)
BEGIN
  DELETE FROM factura
  WHERE Numero_factura = numero_factura;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS preliminar_proveedor;
delimiter $$
CREATE PROCEDURE preliminar_proveedor
(IN nit_proveedor INT)
BEGIN
  DELETE FROM proveedor
  WHERE NIT_proveedor = nit_proveedor;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS preliminar_categoria;
DELIMITER $$
CREATE PROCEDURE preliminar_categoria 
(IN codigo_categoria INT)
BEGIN
  DELETE FROM categoria 
  WHERE Codigo_categoria = codigo_categoria;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS preliminar_producto;
delimiter $$
CREATE PROCEDURE preliminar_producto 
(IN codigo_producto INT)
BEGIN
DELETE FROM producto
WHERE Codigo_producto = codigo_producto;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS preliminar_detalle_factura;
DELIMITER $$
CREATE PROCEDURE preliminar_detalle_factura
(
  IN numero_factura INT,
  IN codigo_producto INT
)
BEGIN
  DELETE FROM detalle_factura
  WHERE Numero_factura = numero_factura AND Codigo_producto = codigo_producto;
END $$
DELIMITER ;

-- Vistas generales de las tablas (SELECT * FROM)

-- Clientes
DROP VIEW IF EXISTS vista_clientes;
CREATE VIEW 
vista_clientes AS
SELECT * FROM cliente;

-- Facturas
DROP VIEW IF EXISTS vista_facturas;
CREATE VIEW 
vista_facturas AS
SELECT * FROM factura;

-- Proveedores
DROP VIEW IF EXISTS vista_proveedores;
CREATE VIEW 
vista_proveedores AS
SELECT * FROM proveedor;

-- Categorias
DROP VIEW IF EXISTS vista_categorias;
CREATE VIEW 
vista_categorias AS
SELECT * FROM categoria;

-- Productos
DROP VIEW IF EXISTS vista_productos;
CREATE VIEW 
vista_productos AS
SELECT * FROM producto;

-- Detalle Facturas
DROP VIEW IF EXISTS vista_detalle_facturas;
CREATE VIEW 
vista_detalle_facturas AS
SELECT * FROM detalle_factura;












