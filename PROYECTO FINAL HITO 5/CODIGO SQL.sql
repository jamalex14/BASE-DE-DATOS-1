
-- Creación de la base de datos
CREATE DATABASE Agencia_Muebles;
USE Agencia_Muebles;

-- Tabla de Clientes

CREATE TABLE Clientes 
(
    IdCliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion NVARCHAR(200),
    Email VARCHAR(100),
    NumMovil NVARCHAR(20)
);

-- Tabla de Empleados

CREATE TABLE Empleados 
(
    IdEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaContrato DATE
);

-- Tabla de Productos

CREATE TABLE Productos 
(
    IdProducto INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    IdProveedor INT REFERENCES Proveedores(IdProveedor)
);

-- Tabla de Pedidos

CREATE TABLE Pedidos 
(
    IdPedido INT PRIMARY KEY,
    IdCliente INT REFERENCES Clientes(IdCliente),
    FechaPedido DATE,
    EstadoPedido VARCHAR(50)
);

-- Tabla de Detalles de Pedido

CREATE TABLE DetallesPedido 
(
    IdDetalle INT PRIMARY KEY,
    IdPedido INT REFERENCES Pedidos(IdPedido),
    IdProducto INT REFERENCES Productos(IdProducto),
    Cantidad INT,
    Precio DECIMAL(10, 2)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores 
(
    IdProveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Contacto VARCHAR(100)
);

-- Tabla de Inventario
CREATE TABLE Inventario 
(
    IdProducto INT REFERENCES Productos(IdProducto),
    CantidadStock INT,
    UbicacionAlmacen VARCHAR(200),
    IdEmpleado INT REFERENCES Empleados(IdEmpleado)
);

-- Tabla de Categorías de Productos

CREATE TABLE CategoriasProductos 
(
    IdCategoria INT PRIMARY KEY,
    NombreCategoria VARCHAR(100),
    Descripcion VARCHAR(200),
    IdProducto INT REFERENCES Productos(IdProducto),
    IdProveedor INT REFERENCES Proveedores(IdProveedor)
);


-- Tabla de Cuentas de Usuarios para Clientes

CREATE TABLE CuentasClientes 
(
    IdCuentaCliente INT PRIMARY KEY,
    IdCliente INT REFERENCES Clientes(IdCliente),
    NombreUsuario VARCHAR(50),
    Contrasena VARCHAR(100)
);

DROP TABLE CuentasClientes

-- Registros para la tabla Clientes

INSERT INTO Clientes (IdCliente, Nombre, Direccion, Email, NumMovil)
VALUES
    (1, 'María García', 'AV JUAN PABLO II', 'maria@gmail.com', '+123456789'),
    (2, 'Juan Rodríguez', 'ZONA SUR', 'juan@gmail.com', '+987654321'),
    (3, 'Sofía Martínez', 'ZONA LOS ANDES', 'sofia@gmail.com', '+1122334455'),
    (4, 'Carlos González', 'CARRETERA COPACABANA', 'carlos@gmail.com', '+9988776655'),
    (5, 'Luisa Pérez', 'SAN ROQUE', 'luisa@gmail.com', '+6677889900'),
    (6, 'Pedro Sánchez', 'SAN FRANCISCO', 'pedro@gmail.com', '+5544332211'),
    (7, 'Laura Gómez', 'PLAZA JUANA AZURDUY', 'laura@gmail.com', '+7788990011'),
    (8, 'Javier López', 'CALLE II CEJA', 'javier@gmail.com', '+9900112233');

-- Registros para la tabla Empleados

INSERT INTO Empleados (IdEmpleado, Nombre, Cargo, Salario, FechaContrato)
VALUES
    (1, 'Ana Ruiz', 'Gerente de Ventas', 3500.00, '2022-03-15'),
    (2, 'Jorge Hernández', 'Vendedor', 2500.00, '2022-05-20'),
    (3, 'María Torres', 'Asistente de Almacén', 2000.00, '2022-04-10'),
    (4, 'Daniel Gómez', 'Gerente de Almacén', 3800.00, '2022-02-18'),
    (5, 'Valeria González', 'Contador', 4000.00, '2022-01-05'),
    (6, 'Roberto Pérez', 'Diseñador de Interiores', 3000.00, '2022-06-30'),
    (7, 'Sara Rodríguez', 'Analista de Ventas', 2800.00, '2022-07-12'),
    (8, 'Fernando López', 'Jefe de Logística', 3200.00, '2022-08-25');

-- Registros para la tabla Productos

INSERT INTO Productos (IdProducto, Nombre, Precio, IdProveedor)
VALUES
    (1, 'Sofá de Tela', 599.99, 1),
    (2, 'Mesa de Centro', 349.50, 2),
    (3, 'Silla de Oficina', 89.99, 3),
    (4, 'Cama Doble', 799.00, 4),
    (5, 'Estantería de Madera', 499.99, 5),
    (6, 'Mesa Auxiliar', 199.99, 6),
    (7, 'Lámpara de Pie', 129.99, 7),
    (8, 'Silla Plegable', 79.99, 8);

-- Registros para la tabla Pedidos

INSERT INTO Pedidos (IdPedido, IdCliente, FechaPedido, EstadoPedido)
VALUES
    (101, 1, '2023-06-10', 'Enviado'),
    (102, 3, '2023-07-05', 'Entregado'),
    (103, 2, '2023-08-20', 'En Proceso'),
    (104, 4, '2023-09-15', 'En Proceso'),
    (105, 5, '2023-10-01', 'Enviado'),
    (106, 6, '2023-11-10', 'En Proceso'),
    (107, 7, '2023-12-05', 'Entregado'),
    (108, 8, '2024-01-20', 'En Proceso');

-- Registros para la tabla DetallesPedido

INSERT INTO DetallesPedido (IdDetalle, IdPedido, IdProducto, Cantidad, Precio)
VALUES
    (1, 101, 1, 2, 1199.98),
    (2, 102, 4, 1, 799.00),
    (3, 103, 2, 4, 1398.00),
    (4, 104, 3, 6, 539.94),
    (5, 105, 5, 3, 1499.97),
    (6, 106, 6, 2, 399.98),
    (7, 107, 7, 1, 129.99),
    (8, 108, 8, 5, 399.95);

-- Registros para la tabla Proveedores

INSERT INTO Proveedores (IdProveedor, Nombre, Direccion, Contacto)
VALUES
    (1, 'Proveedor A', 'Calle 1', '1@gmail.com'),
    (2, 'Proveedor B', 'Calle 2', '2@gmail.com'),
    (3, 'Proveedor C', 'Calle 3', '3@gmail.com'),
    (4, 'Proveedor D', 'Calle 4', '4@gmail.com'),
    (5, 'Proveedor E', 'Calle 5', '5@gmail.com'),
    (6, 'Proveedor F', 'Calle 6', '6@gmail.com'),
    (7, 'Proveedor G', 'Calle 7', '7@gmail.com'),
    (8, 'Proveedor H', 'Calle 8', '7@gmail.com');

-- Registros para la tabla Inventario

INSERT INTO Inventario (IdProducto, CantidadStock, UbicacionAlmacen, IdEmpleado)
VALUES
    (1, 10, 'Pasillo A-1', 4),
    (2, 15, 'Pasillo B-2', 3),
    (3, 20, 'Pasillo C-3', 4),
    (4, 8, 'Pasillo D-4', 5),
    (5, 12, 'Pasillo E-5', 6),
    (6, 5, 'Pasillo F-6', 8),
    (7, 18, 'Pasillo G-7', 7),
    (8, 25, 'Pasillo H-8', 6);


-- Registros para la tabla CategoriasProductos

INSERT INTO CategoriasProductos (IdCategoria, NombreCategoria, Descripcion, IdProducto, IdProveedor)
VALUES
    (1, 'Sofás', 'Muebles cómodos para sala de estar', 1, 1),
    (2, 'Mesas', 'Diversos tipos y tamaños de mesas', 2, 2),
    (3, 'Sillas', 'Sillas ergonómicas y de diseño', 3, 1),
    (4, 'Camas', 'Variedad de tamaños y estilos', 4, 3),
    (5, 'Almacenamiento', 'Muebles para almacenar', 5, 2),
    (6, 'Muebles Auxiliares', 'Complementos para el hogar', 6, 4),
    (7, 'Iluminación', 'Lámparas y sistemas de iluminación', 7, 5),
    (8, 'Mobiliario Exterior', 'Muebles para espacios al aire libre', 8, 3);

-- Registros para la tabla CuentasClientes

INSERT INTO CuentasClientes (IdCuentaCliente, IdCliente, NombreUsuario, Contrasena)
VALUES
    (1, 1, 'cliente1', '111'),
    (2, 2, 'cliente2', '222'),
    (3, 3, 'cliente3', '333'),
    (4, 4, 'cliente4', '444'),
    (5, 5, 'cliente5', '555'),
    (6, 6, 'cliente6', '666'),
    (7, 7, 'cliente7', '777'),
    (8, 8, 'cliente8', '888');


	--Consulta 1: Listar todos los productos con su categoría asociadaConsulta 1: Listar todos los productos con su categoría asociada
	
	SELECT p.Nombre AS Nombre_Producto, cp.NombreCategoria AS Categoria
	FROM Productos AS p
	INNER JOIN CategoriasProductos AS cp ON p.IdProducto = cp.IdProducto;

	--Consulta 2: Mostrar los empleados que ganan más de 3000

	SELECT Nombre, Cargo, Salario
	FROM Empleados
	WHERE Salario > 3000.00;

	--Consulta 3: Encontrar los pedidos realizados por un cliente específico (por ejemplo, María García)

	SELECT c.Nombre AS Nombre_Cliente, p.IdPedido, p.FechaPedido, p.EstadoPedido
	FROM Pedidos AS p
	INNER JOIN Clientes AS c ON p.IdCliente = c.IdCliente
	WHERE c.Nombre = 'María García';

	--Consulta 4: Obtener la cantidad de stock y ubicación en almacén para cada producto

	SELECT p.Nombre AS Nombre_Producto, i.CantidadStock, i.UbicacionAlmacen
	FROM Productos AS p
	INNER JOIN Inventario AS i ON p.IdProducto = i.IdProducto;

	--Consulta 5: Mostrar los proveedores y sus productos suministrados

	SELECT pr.Nombre AS Nombre_Proveedor, pr.Contacto, cp.Nombre AS Nombre_Producto
	FROM Proveedores AS pr
	INNER JOIN Productos AS p ON pr.IdProveedor = p.IdProveedor
	INNER JOIN CategoriasProductos AS cp ON p.IdProducto = cp.IdProducto;
