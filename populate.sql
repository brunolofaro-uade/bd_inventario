USE comercios
INSERT INTO Producto (id, nombre, precio, existencia, codigo)
VALUES
    (1, 'Product A', 20.50, 100, 'ABC123'),
    (2, 'Product B', 15.75, 75, 'DEF456'),
    (3, 'Product C', 30.00, 50, 'GHI789');

INSERT INTO Proveedor (id, nombre, descripcion, email)
VALUES
    (1, 'Provider X', 'Description for Provider X', 'providerx@example.com'),
    (2, 'Provider Y', 'Description for Provider Y', 'providery@example.com');

-- Populate Producto_proveedor table
INSERT INTO Producto_proveedor (id, id_producto, id_proveedor)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1);

	INSERT INTO Perdidas (id, cantidad, existencia_restante, precio, descripcion, id_producto, id_movimiento_inventario)
VALUES
    (1, 5.25, 95.75, 10.50, 'Loss description 1', 1, 1),
    (2, 8.00, 67.00, 15.25, 'Loss description 2', 2, 2),
    (3, 3.50, 46.50, 22.75, 'Loss description 3', 3, 3);

-- Populate Estado_caja table
INSERT INTO Estado_caja (id, estado)
VALUES
    (1, 'Open'),
    (2, 'Closed');

-- Populate Recepciones table
INSERT INTO Recepciones (id, monto_total, descripcion, metodo_pago, is_impuesto, is_iva, impuestos, proveedor)
VALUES
    (1, 150.50, 'Reception description 1', 'Cash', 1, 1, 25.50, 1),
    (2, 200.25, 'Reception description 2', 'Credit Card', 0, 1, 30.75, 2);

	-- Populate Retiro_Caja table
INSERT INTO Retiro_Caja (id, monto, descripcion, id_flujo_caja)
VALUES
    (1, 50.00, 'Withdrawal description 1', 1),
    (2, 30.25, 'Withdrawal description 2', 2);

-- Populate estado_factura table
INSERT INTO estado_factura (id, descripcion)
VALUES
    (1, 'Pending'),
    (2, 'Paid'),
    (3, 'Canceled');

-- Populate facturas table
INSERT INTO facturas (id, fecha_inicio, fecha_cierre, venta_total, efectivo, mercado_pago, posnet, inicio_caja, diferencia_cierre, id_estado, descripcion, observacion, ganancia)
VALUES
    (1, '2023-01-01', '2023-01-15', 500.00, 200.00, 250.00, 50.00, 1000.00, 10.00, 1, 'Invoice description 1', 'Observation for Invoice 1', 100.00),
    (2, '2023-02-01', '2023-02-28', 750.00, 300.00, 350.00, 100.00, 1500.00, 15.00, 2, 'Invoice description 2', 'Observation for Invoice 2', 150.00);

-- Populate flujo_caja_factura table
INSERT INTO flujo_caja_factura (id, id_flujo_caja, id_factura)
VALUES
    (1, 1, 1),
    (2, 2, 2);

-- Populate gastos table
INSERT INTO gastos (id, monto_total, descripcion, metodo_pago, fecha_facturada, fecha_cargada, impuestos, id_movimiento_inventario)
VALUES
    (1, 75.50, 'Expense description 1', 'Credit Card', '2023-01-10', '2023-01-15', 10.25, 1),
    (2, 100.25, 'Expense description 2', 'Cash', '2023-02-05', '2023-02-10', 15.75, 2);

-- Populate caja_chica table
INSERT INTO caja_chica (id, saldo_efectivo, saldo_mp, saldo_posnet, descripcion, id_flujo_caja, id_gasto)
VALUES
    (1, 500.00, 300.00, 200.00, 'Description for caja_chica 1', 1, 1),
    (2, 750.00, 400.00, 300.00, 'Description for caja_chica 2', 2, 2);

-- Ensure data consistency and compliance with defined constraints and relationships.
