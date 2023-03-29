-- DML (DATA MANIPULATION LANGUAGE)
-- Base de datos: Supermercado

-- Insertar valores en la tabla cliente
INSERT INTO cliente (NIT_cliente, Nombre_cliente, Apellido_cliente, Direccion_cliente, Telefono_cliente)
VALUES
(12345678, 'Juan', 'Pérez', 'Calle 1, Ciudad', '2222-2222'),
(23456789, 'María', 'González', 'Calle 2, Ciudad', '3333-3333'),
(34567890, 'Pedro', 'Martínez', 'Calle 3, Ciudad', '4444-4444'),
(45678901, 'Ana', 'López', 'Calle 4, Ciudad', '5555-5555'),
(56789012, 'Carlos', 'García', 'Calle 5, Ciudad', '6666-6666'),
(67890123, 'Lucía', 'Hernández', 'Calle 6, Ciudad', '7777-7777'),
(78901234, 'Sergio', 'Sánchez', 'Calle 7, Ciudad', '8888-8888'),
(89012345, 'Laura', 'Ramírez', 'Calle 8, Ciudad', '9999-9999'),
(90123456, 'Jorge', 'Díaz', 'Calle 9, Ciudad', '1111-1111'),
(12345679, 'Miguel', 'Álvarez', 'Calle 10, Ciudad', '2222-2222');

INSERT INTO factura (Numero_factura, Fecha_factura, Total_factura, NIT_cliente)
VALUES
(1001, '2022-01-01', 150, 12345678),
(1002, '2022-01-02', 200, 23456789),
(1003, '2022-01-03', 300, 34567890),
(1004, '2022-01-04', 400, 45678901),
(1005, '2022-01-05', 500, 56789012),
(1006, '2022-01-06', 600, 67890123),
(1007, '2022-01-07', 700, 78901234),
(1008, '2022-01-08', 800, 89012345),
(1009, '2022-01-09', 900, 90123456),
(1010, '2022-01-10', 1000, 12345679),
(1011, '2022-01-11', 1100, 23456789),
(1012, '2022-01-12', 800, 34567890),
(1013, '2022-01-13', 300, 45678901),
(1014, '2022-01-14', 400, 56789012),
(1015, '2022-01-15', 500, 67890123),
(1016, '2022-01-16', 600, 78901234),
(1017, '2022-01-17', 400, 89012345),
(1018, '2022-01-18', 500, 90123456),
(1019, '2022-01-19', 400, 12345678),
(1020, '2022-01-20', 500, 23456789);

INSERT INTO proveedor (NIT_proveedor, Razon_social, Direccion_proveedor, Telefono_proveedor)
VALUES
(11112222, 'Proveedor A', 'Calle 1 #123', '1234-5678'),
(22223333, 'Proveedor B', 'Calle 2 #234', '2345-6789'),
(33334444, 'Proveedor C', 'Calle 3 #345', '3456-7890'),
(44445555, 'Proveedor D', 'Calle 4 #456', '4567-8901'),
(55556666, 'Proveedor E', 'Calle 5 #567', '5678-9012'),
(66667777, 'Proveedor F', 'Calle 6 #678', '6789-0123'),
(77778888, 'Proveedor G', 'Calle 7 #789', '7890-1234'),
(88889999, 'Proveedor H', 'Calle 8 #890', '8901-2345'),
(99990000, 'Proveedor I', 'Calle 9 #901', '9012-3456'),
(11113333, 'Proveedor J', 'Calle 10 #1234', '1234-5678');

INSERT INTO categoria (Codigo_categoria, Nombre_categoria)
VALUES
(1, 'Frutas y verduras'),
(2, 'Carnes y pescados'),
(3, 'Lácteos'),
(4, 'Panadería'),
(5, 'Bebidas'),
(6, 'Snacks'),
(7, 'Limpieza'),
(8, 'Aceites'),
(9, 'Mascotas'),
(10, 'Granos'),
(11, 'Cocina');

INSERT INTO producto (Codigo_producto, Nombre_producto, Descripcion_producto, Precio_unitario, Cantidad_stock, Costo_unitario, Codigo_categoria, NIT_proveedor) 
VALUES
(10001, 'Arroz', 'Arroz blanco de grano largo', 12.50, 100, 10.50, 10, 11112222),
(10002, 'Frijol', 'Frijol negro', 20.00, 50, 17.00, 10, 11112222),
(10003, 'Aceite', 'Aceite de girasol', 44.50, 30, 33.50, 8, 11112222),
(10004, 'Sal', 'Sal de mesa', 10.50, 200, 6.20, 11, 22223333),
(10005, 'Azucar', 'Azucar blanca refinada', 20.00, 80, 17.00, 11, 22223333),
(10006, 'Jabón', 'Jabón en barra', 51.50, 70, 40.80, 7, 33334444),
(10007, 'Leche', 'Leche entera', 12.00, 50, 10.50, 3, 44445555),
(10008, 'Yogurt', 'Yogurt natural', 10.00, 40, 7.70, 3, 44445555),
(10009, 'Pan', 'Pan integral', 1.50, 100, 0.80, 4, 55556666),
(10010, 'Huevos', 'Huevos frescos', 36.00, 60, 30.50, 11, 55556666),
(10011, 'Refresco', 'Refresco de cola', 7.50, 50, 4.90, 5, 55556666),
(10012, 'Papitas', 'Papitas de paquete', 15.00, 80, 12.60, 6, 66667777),
(10013, 'Chicles', 'Chicles sabor menta', 0.50, 150, 0.20, 6, 66667777),
(10014, 'Carne', 'Carne de res', 20.50, 30, 16.50, 2, 77778888),
(10015, 'Pollo', 'Pollo entero', 16.00, 40, 14.50, 2, 88889999),
(10016, 'Pescado', 'Pescado fresco', 50.00, 20, 39.50, 2, 88889999),
(10017, 'Manzanas', 'Manzanas rojas', 12.50, 50, 10.50, 1, 99990000),
(10018, 'Plátanos', 'Plátanos verdes', 6.50, 70, 3.80, 1, 99990000),
(10019, 'Cebollas', 'Cebollas blancas', 5.00, 100, 3.50, 1, 99990000),
(12006, 'Leche deslactosada', 'Leche deslactosada', 15.50, 150, 11.50, 3, 99990000),
(13007, 'Galletas de avena', 'Galletas integrales de avena', 13.25, 75, 8.00, 6, 99990000),
(14008, 'Jabón líquido', 'Jabón líquido con aloe vera', 13.99, 100, 9.00, 7, 99990000),
(15009, 'Aceite de oliva', 'Aceite de oliva extra virgen', 40.99, 50, 30.00, 8, 11113333),
(16010, 'Arroz integral', 'Arroz integral 1kg', 15.49, 200, 13.00, 11, 11113333),
(17011, 'Cerveza artesanal', 'Cerveza artesanal de trigo', 17.99, 25, 13.50, 5, 11113333);

INSERT INTO detalle_factura (Numero_factura, Codigo_producto, Cantidad) 
VALUES
(1001, 17011, 100),
(1001, 16010, 50),
(1002, 15009, 100),
(1002, 14008, 100),
(1003, 17011, 200),
(1003, 15009, 100),
(1004, 14008, 200),
(1004, 13007, 200),
(1005, 16010, 300),
(1005, 12006, 200),
(1006, 14008, 400),
(1006, 12006, 200),
(1007, 10019, 350),
(1007, 10019, 350),
(1008, 10016, 300),
(1008, 10017, 500),
(1009, 14008, 200),
(1009, 10016, 400),
(1009, 17011, 300),
(1010, 10015, 300),
(1010, 10014, 400),
(1010, 15009, 300),
(1011, 10013, 200),
(1011, 10012, 300),
(1011, 10015, 300),
(1011, 13007, 300),
(1012, 10012, 200),
(1012, 10011, 300),
(1012, 10015, 300),
(1013, 10010, 100),
(1013, 10011, 50),
(1013, 10014, 150),
(1014, 10010, 100),
(1014, 10011, 50),
(1014, 10014, 150),
(1015, 10009, 200),
(1015, 10010, 150),
(1015, 10013, 150),
(1016, 10008, 200),
(1016, 10012, 200),
(1016, 12006, 200),
(1017, 10007, 100),
(1017, 10008, 100),
(1017, 10014, 200),
(1018, 10006, 200),
(1018, 10005, 100),
(1018, 10009, 200),
(1019, 10004, 100),
(1019, 10003, 200),
(1019, 10006, 100),
(1020, 10002, 200),
(1020, 10001, 200),
(1020, 10011, 100);