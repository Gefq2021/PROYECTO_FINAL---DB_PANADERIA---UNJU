-- PROYECTO FINAL - DB PANADERIA - UNJU
-- Quispe, Gerardo Fabian

-- Creación de la Base de Datos
CREATE SCHEMA panaderia;
USE panaderia;

-- Creación de las tablas
CREATE TABLE empleados (
	legajo int NOT NULL,
    nombre_apellido varchar(100) NOT NULL,
    dni int NOT NULL,
    cuil varchar(15) NOT NULL,
    domicilio varchar(50) NOT NULL,
    telefon varchar(15) NULL,
    puesto varchar(100) NOT NULL,
    PRIMARY KEY (legajo)
);

CREATE TABLE ventas (
	id_ventas int NOT NULL,
    legajo int NOT NULL,
    id_producto int NOT NULL,
    cantida int NOT NULL,
    fecha datetime NOT NULL,
    cliente varchar(20) NULL,
    importe float NOT NULL,
    PRIMARY KEY (id_ventas)
);

CREATE TABLE produccion (
	id_lote_prod int NOT NULL,
    legajo_prod int NOT NULL,
    id_insumo int NOT NULL,
    cantidad int NOT NULL,
    fecha datetime NOT NULL,
    PRIMARY KEY (id_lote_prod)
);

CREATE TABLE productos (
	id_producto int NOT NULL,
    id_lote_prod int NOT NULL,
    nombre varchar(150) NOT NULL,
    descripcion varchar(500) NULL,
    cantidad int NOT NULL,
    precio float NOT NULL,
    PRIMARY KEY (id_producto)
);

CREATE TABLE insumos (
	id_insumo int NOT NULL,
    id_proveedor int NOT NULL,
    nombre varchar(150) NOT NULL,
    cantidad int NOT NULL,
    PRIMARY KEY (id_insumo)
);

CREATE TABLE proveedores (
	id_proveedor int NOT NULL,
    nombre varchar(150) NOT NULL,
    insumo varchar(150) NOT NULL,
    cantidad int NOT NULL,
    importe float NOT NULL,
    fecha datetime NOT NULL,
	PRIMARY KEY (id_proveedor)
);

-- Creación de relaciones (FK)
ALTER TABLE ventas ADD CONSTRAINT fk_legajo FOREIGN KEY (legajo) REFERENCES empleados(legajo);
ALTER TABLE ventas ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto);
ALTER TABLE produccion ADD CONSTRAINT fk_legajo_prod FOREIGN KEY (legajo_prod) REFERENCES empleados(legajo);
ALTER TABLE produccion ADD CONSTRAINT fk_id_insumo FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo);
ALTER TABLE productos ADD CONSTRAINT fk_id_lote_prod FOREIGN KEY (id_lote_prod) REFERENCES productos(id_producto);
ALTER TABLE insumos ADD CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);

-- Para ver como quedo creada la tabla.
DESCRIBE insumos;

