
CREATE DATABASE IF NOT EXISTS `mydb`;

-- Schema new_schema1

USE `mydb` ;


-- Table `Clientes`

CREATE TABLE IF NOT EXISTS `Clientes` (
  `Nro_cli` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `DNI` INT NULL,
  `Telefono` INT(11) NULL,
  `Email` VARCHAR(20) NULL,
  `Domicilio_cli` VARCHAR(45) NULL,
  `Primer_visita` DATE NULL,
  `Ultima_visita` DATE NULL,
  `total_de_visitas` INT NULL,
  `Celular_cli` INT(11) NULL,
  PRIMARY KEY (`Nro_cli`)
  );



-- Table `Vehiculo`

CREATE TABLE IF NOT EXISTS `Vehiculo` (
  `Nro_vehiculo` INT NOT NULL,
  `Tipo_de_vehiculo` VARCHAR(45) NULL,
  `Patente` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Anio` YEAR(1) NULL,
  `Color` VARCHAR(45) NULL,
  `Estado_vehiculo` VARCHAR(45) NULL,
  `Transmision` VARCHAR(45) NULL,
  `Clientes_Nro_cli` INT NOT NULL,
  PRIMARY KEY (`Nro_vehiculo`),
    FOREIGN KEY (`Clientes_Nro_cli`)
    REFERENCES `Clientes` (`Nro_cli`)
    );



-- Table `Sucursales`

CREATE TABLE IF NOT EXISTS `Sucursales` (
  `Nro_suc` INT NOT NULL,
  `Ubicacion` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Apertura` DATE NOT NULL,
  `Nombre_fantasia` VARCHAR(45) NOT NULL,
  `Cant_empleados` INT NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Horario` TIME NOT NULL,
  `Descripcion` VARCHAR(150) NOT NULL,
  `Celular_suc` INT NOT NULL,
  PRIMARY KEY (`Nro_suc`)
    );



-- Table `Empleado`

CREATE TABLE IF NOT EXISTS `Empleado` (
  `Num_emp` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `DNI` INT NOT NULL,
  `Domicilio` VARCHAR(45) NOT NULL,
  `Telefono` INT NOT NULL,
  `Cel_emp` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Puesto` VARCHAR(45) NOT NULL,
  `Antiguedad` DATE NOT NULL,
  `Turno` VARCHAR(45) NOT NULL,
  `Vacaciones` DATE NOT NULL,
  `Nro_suc` INT NOT NULL,
  `Cuil_em` INT NOT NULL,
  `Legajo` VARCHAR(20) NOT NULL,
  `Obra_social_emp` VARCHAR(45) NOT NULL,
  `Nro_obra_emp` INT NOT NULL,
  `Sindicato` VARCHAR(45) NOT NULL,
  `Nro_sindicato` INT NOT NULL,
  `Seguro` VARCHAR(45) NOT NULL,
  `Nro_seguro` INT NOT NULL,
  `fecha_ingreso_emp` DATE NOT NULL,
  `Categoria_emp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Num_emp`, `Nro_suc`),
    FOREIGN KEY (`Nro_suc`)
    REFERENCES `Sucursales` (`Nro_suc`)
    );



-- Table `Orden_Servicios`

CREATE TABLE IF NOT EXISTS `Orden_Servicios` (
  `Nro_serv` INT NOT NULL,
  `Tipo_serv` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `fecha_I` DATE NULL,
  `Fecha_F` DATE NULL,
  `Precio_final` DECIMAL(1) NULL,
  `Nro_emp` INT NOT NULL,
  `Nro_vehiculo` INT NOT NULL,
  `Nro_suc` INT NOT NULL,
  PRIMARY KEY (`Nro_serv`, `Nro_emp`, `Nro_vehiculo`, `Nro_suc`),
    FOREIGN KEY (`Nro_vehiculo`)
    REFERENCES `Vehiculo` (`Nro_vehiculo`),
    FOREIGN KEY (`Nro_emp`)
    REFERENCES `Empleado` (`Num_emp`),
    FOREIGN KEY (`Nro_suc`)
    REFERENCES `Sucursales` (`Nro_suc`)
    );



-- Table `Pago_empleado`

CREATE TABLE IF NOT EXISTS `Pago_empleado` (
  `Nro_pago` INT NOT NULL,
  `Sueldo` DECIMAL(1) NOT NULL,
  `Bonos` DECIMAL(1) NOT NULL,
  `Vacaciones` DECIMAL(1) NOT NULL,
  `Fecha_pago` DATETIME NOT NULL,
  `Forma_pago` DATETIME NOT NULL,
  `Nro_emp` INT NOT NULL,
  `Cuil_em` INT NOT NULL,
  `Legajo` VARCHAR(20) NOT NULL,
  `Obra_social_emp` VARCHAR(45) NOT NULL,
  `Nro_obra_emp` INT NOT NULL,
  `Sindicato` VARCHAR(45) NOT NULL,
  `Nro_sindicato` INT NOT NULL,
  `Seguro` VARCHAR(45) NOT NULL,
  `Nro_seguro` INT NOT NULL,
  PRIMARY KEY (`Nro_pago`, `Nro_emp`),
    FOREIGN KEY (`Nro_emp`)
    REFERENCES `Empleado` (`Num_emp`)
    );



-- Table `Pago_servicios`

CREATE TABLE IF NOT EXISTS `Pago_servicios` (
  `Nro_pago_serv` INT NOT NULL,
  `Metodo_pago` VARCHAR(8) NULL,
  `Monto_pago` DECIMAL(1) NULL,
  `Fecha_pago` DATE NULL,
  `Finalizado` TINYINT NULL,
  `Nro_cli` INT NOT NULL,
  `Nro_serv` INT NOT NULL,
  PRIMARY KEY (`Nro_pago_serv`, `Nro_cli`, `Nro_serv`),
    FOREIGN KEY (`Nro_cli`)
    REFERENCES `Clientes` (`Nro_cli`),
    FOREIGN KEY (`Nro_serv`)
    REFERENCES `Orden_Servicios` (`Nro_serv`)
    );



-- Table `Productos`

CREATE TABLE IF NOT EXISTS `Productos` (
  `Nro_prod` INT NOT NULL,
  `Nombre_prod` VARCHAR(45) NULL,
  `Precio_prod` DECIMAL(1) NULL,
  `Descripcion_prod` VARCHAR(45) NULL,
  `Stock` DECIMAL(1) NULL,
  `Tipo_prod` VARCHAR(45) NULL,
  `Fecha_prod` DATE NULL,
  PRIMARY KEY (`Nro_prod`)
  );



-- Table `Proveedores`

CREATE TABLE IF NOT EXISTS `Proveedores` (
  `Nro_prov` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `tipo_prov` VARCHAR(45) NULL,
  `Cel_prov` INT NULL,
  PRIMARY KEY (`Nro_prov`)
  );



-- Table `Orden_Prod`

CREATE TABLE IF NOT EXISTS `Orden_Prod` (
  `Nro_orden` INT NOT NULL,
  `Precio_orden` DECIMAL(1) NULL,
  `Cant_orden` INT NULL,
  `Fecha_p` DATE NULL,
  `Loc` VARCHAR(45) NULL,
  `CUIT_orden` INT NULL,
  `Cel_orden` INT NULL,
  `Lugar_entrega` VARCHAR(45) NULL,
  `Nro_prod` INT NOT NULL,
  `Nro_prov` INT NOT NULL,
  `Nro_suc` INT NOT NULL,
  PRIMARY KEY (`Nro_orden`, `Nro_prod`, `Nro_prov`, `Nro_suc`),
    FOREIGN KEY (`Nro_prov`)
    REFERENCES `Proveedores` (`Nro_prov`),
    FOREIGN KEY (`Nro_prod`)
    REFERENCES `Productos` (`Nro_prod`),
    FOREIGN KEY (`Nro_suc`)
    REFERENCES `Sucursales` (`Nro_suc`)
    );



-- Table `Facturas`

CREATE TABLE IF NOT EXISTS `Facturas` (
  `nro_Fact` INT NOT NULL,
  `Gastos` DECIMAL NOT NULL,
  `Ingresos` DECIMAL NOT NULL,
  `fecha_fact` DATE NOT NULL,
  `nro_Suc` INT NOT NULL,
  PRIMARY KEY (`nro_Fact`, `nro_Suc`),
    FOREIGN KEY (`nro_Suc`)
    REFERENCES `Sucursales` (`Nro_suc`)
    );



-- Table `Uso_Productos_copy1`

CREATE TABLE IF NOT EXISTS `Uso_Productos` (
  `Nuro_usoProd` INT NOT NULL,
  `cantidad` INT NULL,
  `precio` DECIMAL NULL,
  `Nro_prod` INT NOT NULL,
  `Nro_servicio` INT NOT NULL,
  PRIMARY KEY (`Nuro_usoProd`, `Nro_prod`, `Nro_servicio`),
    FOREIGN KEY (`Nro_prod`)
    REFERENCES `Productos` (`Nro_prod`),
    FOREIGN KEY (`Nro_servicio`)
    REFERENCES `Orden_Servicios` (`Nro_serv`)
    );



-- Table `Maquinas`

CREATE TABLE IF NOT EXISTS `Maquinas` (
  `Num_maq` INT NOT NULL,
  `Nombre_maq` VARCHAR(45) NULL,
  `Tipo_maq` VARCHAR(45) NULL,
  `Tiempo_uso` VARCHAR(45) NULL,
  `F_ingreso` DATE NULL,
  `Marca_maq` VARCHAR(45) NULL,
  `Color_maq` VARCHAR(45) NULL,
  `Modelo_maq` VARCHAR(45) NULL,
  `Potencia_maq` VARCHAR(45) NULL,
  `Precio_maq` DECIMAL(1) NULL,
  `Peso` DECIMAL(1) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Garantia` VARCHAR(45) NULL,
  `Ultimo_mantenimiento` DATE NULL,
  `Estado` VARCHAR(45) NULL,
  `Nro_prov` INT NOT NULL,
  `Sucursales_Nro_suc` INT NOT NULL,
  PRIMARY KEY (`Num_maq`, `Nro_prov`, `Sucursales_Nro_suc`),
    FOREIGN KEY (`Nro_prov`)
    REFERENCES `Proveedores` (`Nro_prov`),
    FOREIGN KEY (`Sucursales_Nro_suc`)
    REFERENCES `Sucursales` (`Nro_suc`)
    );



-- Table `uso_maquinas`

CREATE TABLE IF NOT EXISTS `uso_maquinas` (
  `nro_Uso` INT NOT NULL,
  `Nro_maq` INT NOT NULL,
  `Nro_serv` INT NOT NULL,
  PRIMARY KEY (`nro_Uso`, `Nro_maq`, `Nro_serv`),
    FOREIGN KEY (`Nro_maq`)
    REFERENCES `Maquinas` (`Num_maq`),
    FOREIGN KEY (`Nro_serv`)
    REFERENCES `Orden_Servicios` (`Nro_serv`)
    );

