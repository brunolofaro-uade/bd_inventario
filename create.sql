CREATE TABLE Producto (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10,3),
    existencia DECIMAL(10,3) NOT NULL,
    codigo VARCHAR(255) UNIQUE NOT NULL
)

CREATE TABLE Proveedor (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(100) not null,
    descripcion VARCHAR(255),
    email VARCHAR(100) Not null
);

CREATE TABLE Producto_proveedor (
    id BIGINT PRIMARY KEY,
    id_producto BIGINT NOT NULL,
    id_proveedor BIGINT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Perdidas (
    id BIGINT PRIMARY KEY,
    cantidad DECIMAL(10,2),
    existencia_restante DECIMAL(10,2),
    precio DECIMAL(10,2),
    descripcion VARCHAR(255),
    id_producto BIGINT,
    id_movimiento_inventario BIGINT
);

CREATE TABLE Estado_caja (
    id INT PRIMARY KEY,
    estado VARCHAR(15)
);

CREATE TABLE flujo_caja (
    id BIGINT PRIMARY KEY,
    fecha_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_fin DATETIME,
    efectivo DECIMAL(10,2),
    mercado_pago DECIMAL(10,2),
    posnet DECIMAL(10,2),
    inicio_caja DECIMAL(10,2) not null,
    diferencia_cierre DECIMAL(10,2),
    id_estado INT,
    observaciones VARCHAR(255),
    ganancia DECIMAL(10,2),
    FOREIGN KEY (id_estado) REFERENCES estado_caja(id)
);

CREATE TABLE Recepciones (
    id BIGINT PRIMARY KEY,
    monto_total DECIMAL(10,2),
    descripcion VARCHAR(150),
    metodo_pago VARCHAR(50),
    is_impuesto BIT,
    is_iva BIT,
    impuestos DECIMAL(10,2),
    proveedor BIGINT,
    FOREIGN KEY (proveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Retiro_Caja (
    id BIGINT PRIMARY KEY,
    monto DECIMAL(10,2) not null,
    descripcion VARCHAR(255),
    id_flujo_caja BIGINT,
    FOREIGN KEY (id_flujo_caja) REFERENCES flujo_caja(id)
);

CREATE TABLE estado_factura (
    id INT PRIMARY KEY,
    descripcion VARCHAR(30)
);

CREATE TABLE facturas (
    id BIGINT PRIMARY KEY,
    fecha_inicio DATETIME,
    fecha_cierre DATETIME,
    venta_total DECIMAL(10,2),
    efectivo DECIMAL(10,2),
    mercado_pago DECIMAL(10,2),
    posnet DECIMAL(10,2),
    inicio_caja DECIMAL(10,2),
    diferencia_cierre DECIMAL(10,2),
    id_estado INT,
    descripcion VARCHAR(150),
    observacion VARCHAR(150),
    ganancia DECIMAL(10,2),
    FOREIGN KEY (id_estado) REFERENCES estado_factura(id)
);

CREATE TABLE flujo_caja_factura (
    id BIGINT PRIMARY KEY,
    id_flujo_caja BIGINT,
    id_factura BIGINT,
    FOREIGN KEY (id_flujo_caja) REFERENCES flujo_caja(id),
    FOREIGN KEY (id_factura) REFERENCES facturas(id)
);

-- Crear tabla movimiento_Inventario
CREATE TABLE movimiento_Inventario (
    id BIGINT PRIMARY KEY,
    stock_inicial DECIMAL(10,2),
    stock_anadido DECIMAL(10,2),
    existencia DECIMAL(10,2),
    precio_compra DECIMAL(10,2),
    precio_venta DECIMAL(10,2),
    id_producto BIGINT,
    id_recepcion BIGINT,
    id_perdida BIGINT,
    id_factura BIGINT,
    fecha_movimiento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES Producto(id),
    FOREIGN KEY (id_recepcion) REFERENCES Recepciones(id),
    FOREIGN KEY (id_perdida) REFERENCES Perdidas(id),
    FOREIGN KEY (id_factura) REFERENCES facturas(id)
);



CREATE TABLE gastos (
    id BIGINT PRIMARY KEY,
    monto_total DECIMAL(10,2),
    descripcion VARCHAR(255),
    metodo_pago VARCHAR(50),
    fecha_facturada DATETIME,
    fecha_cargada DATETIME,
    impuestos DECIMAL(8,2),
    id_movimiento_inventario BIGINT,
    FOREIGN KEY (id_movimiento_inventario) REFERENCES movimiento_Inventario(id)
);

CREATE TABLE caja_chica (
    id BIGINT PRIMARY KEY,
    saldo_efectivo DECIMAL(10,2),
    saldo_mp DECIMAL(10,2),
    saldo_posnet DECIMAL(10,2),
    descripcion VARCHAR(150),
    id_flujo_caja BIGINT,
    id_gasto BIGINT,
    FOREIGN KEY (id_flujo_caja) REFERENCES flujo_caja(id),
    FOREIGN KEY (id_gasto) REFERENCES gastos(id)
);

CREATE TABLE ventas (
    id BIGINT PRIMARY KEY,
    id_flujo_caja BIGINT,
    id_movimiento_inventario BIGINT,
    FOREIGN KEY (id_flujo_caja) REFERENCES flujo_caja(id),
    FOREIGN KEY (id_movimiento_inventario) REFERENCES movimiento_Inventario(id)
);

ALTER TABLE movimiento_Inventario ADD id_venta BIGINT;

ALTER TABLE movimiento_Inventario 
    ADD CONSTRAINT fk_venta FOREIGN KEY (id_venta) REFERENCES ventas(id);