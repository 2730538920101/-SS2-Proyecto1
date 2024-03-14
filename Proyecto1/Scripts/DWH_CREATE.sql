USE SEMINARIO2_DWH_201709282;

CREATE TABLE CLIENTE(
	CodigoCliente VARCHAR(255) PRIMARY KEY,
	NombreCliente VARCHAR(255),
	TipoCliente VARCHAR(255), 
	DireccionCliente VARCHAR(255),
	NumeroCliente BIGINT
);

CREATE TABLE VENDEDOR(
	CodVendedor VARCHAR(255) PRIMARY KEY,
	NombreVendedor VARCHAR(255),
	Vacacionista VARCHAR(255)
);

CREATE TABLE PRODUCTO(
	CodProducto VARCHAR(255) PRIMARY KEY,
	NombreProducto VARCHAR(255),
	MarcaProducto VARCHAR(255),
	Categoria VARCHAR(255)
);

CREATE TABLE SUCURSAL(
	CodSucursal VARCHAR(255) PRIMARY KEY,
	NombreSucursal VARCHAR(255),
	DireccionSucursal VARCHAR(255),
	Region VARCHAR(255),
	Departamento VARCHAR(255)
);

CREATE TABLE VENTA(
	CodVenta BIGINT PRIMARY KEY IDENTITY(1,1),
	CodigoCliente VARCHAR(255) FOREIGN KEY (CodigoCliente) REFERENCES CLIENTE(CodigoCliente),
	CodVendedor VARCHAR(255) FOREIGN KEY (CodVendedor) REFERENCES VENDEDOR(CodVendedor),
	CodProducto VARCHAR(255) FOREIGN KEY (CodProducto) REFERENCES PRODUCTO(CodProducto),
	CodSucursal VARCHAR(255) FOREIGN KEY (CodSucursal) REFERENCES SUCURSAL(CodSucursal),
	Fecha DATE,
	Unidades BIGINT,
	PrecioUnitario DECIMAL
);

CREATE TABLE PROVEEDOR(
	CodProveedor VARCHAR(255) PRIMARY KEY,
	NombreProveedor VARCHAR(255),
	DireccionProveedor VARCHAR(255),
	NumeroProveedor BIGINT,
	WebProveedor VARCHAR(255)
);

CREATE TABLE COMPRA(
	CodCompra BIGINT PRIMARY KEY IDENTITY(1,1),
	CodProveedor VARCHAR(255) FOREIGN KEY (CodProveedor) REFERENCES PROVEEDOR(CodProveedor),
	CodProducto VARCHAR(255) FOREIGN KEY (CodProducto) REFERENCES PRODUCTO(CodProducto),
	CodSucursal VARCHAR(255) FOREIGN KEY (CodSucursal) REFERENCES SUCURSAL(CodSucursal),
	Fecha DATE,
	Unidades BIGINT,
	CostoU DECIMAL
);