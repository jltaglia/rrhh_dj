CREATE TABLE categorias (
id_categoria SERIAL NOT NULL PRIMARY KEY,
descripcion VARCHAR(20) NOT NULL
);

CREATE TABLE est_civil (
id_est_civil SERIAL NOT NULL PRIMARY KEY,
descripcion VARCHAR(15) NOT NULL
);

CREATE TABLE eventos (
id_evento SERIAL NOT NULL PRIMARY KEY,
cd_evento SMALLINT NOT NULL,
descripcion VARCHAR(20) NOT NULL
);

CREATE TABLE tipo_doc (
id_documento SERIAL NOT NULL PRIMARY KEY,
descripcion VARCHAR(10) NOT NULL
);

CREATE TABLE provincias (
id_provincia SMALLINT NOT NULL PRIMARY KEY,
nombre VARCHAR(31) NOT NULL
);

CREATE TABLE localidades (
id_localidad INT NOT NULL,
nombre VARCHAR(60) NOT NULL,
cp_localidad SMALLINT NOT NULL,
id_provincia SMALLINT NOT NULL
);

CREATE TABLE parentescos (
id_parentesco SERIAL NOT NULL PRIMARY KEY,
descripcion VARCHAR(10) NOT NULL
);

CREATE TABLE personal (
id_empleado SERIAL NOT NULL PRIMARY KEY,
foto VARCHAR(50) NOT NULL,
legajo SMALLINT NOT NULL,
apellidos VARCHAR(30) NOT NULL,
nombres VARCHAR(40) NOT NULL,
id_documento SMALLINT NOT NULL,
documento INT NOT NULL,
cuil INT NOT NULL,
fecha_nacimiento DATE NOT NULL,
fecha_ingreso DATE NOT NULL,
fecha_egreso DATE ,
id_categoria SMALLINT NOT NULL,
id_est_civil SMALLINT NOT NULL,
domicilio VARCHAR(50) NOT NULL,
id_localidad INT NOT NULL,
id_provincia SMALLINT NOT NULL,
tel VARCHAR(15) NOT NULL,
email VARCHAR(320),
saldo_licencia SMALLINT NOT NULL,
licencia_curso SMALLINT NOT NULL,
fecha_regreso DATE 
);

CREATE TABLE legajos (
id_legajo SMALLINT NOT NULL,
id_empleado SMALLINT NOT NULL,
fecha_desde DATE NOT NULL,
fecha_hasta DATE NOT NULL,
id_evento SMALLINT NOT NULL,
cd_evento SMALLINT NOT NULL,
cantidad SMALLINT NOT NULL,
borrable SMALLINT NOT NULL,
afecta_vac SMALLINT NOT NULL
);