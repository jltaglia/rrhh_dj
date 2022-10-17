/* MODIFICAR EL PATH DE CADA UNO DE LOS ARCHIVOS
CSV PARA QUE pgAdmin PUEDA ENCONTRAR LOS MISMOS.

ASIMISMO, TENER EN CUENTA QUE pgAdmin DEBE POSEER DERECHOS
DE ACCESO A DICHA CARPETA PARA QUE PUEDA ABRIRLOS SIN
PROBLEMAS
 */



COPY personal_categorias 
FROM 'C:/Users/Public/Documents/csv/categorias.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_est_civil 
FROM 'C:/Users/Public/Documents/csv/est_civil.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_eventos
FROM 'C:/Users/Public/Documents/csv/eventos.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_parentescos
FROM 'C:/Users/Public/Documents/csv/parentescos.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_provincias
FROM 'C:/Users/Public/Documents/csv/provincias.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_localidades
FROM 'C:/Users/Public/Documents/csv/localidades_reduc.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_tipo_doc
FROM 'C:/Users/Public/Documents/csv/tipo_doc.csv' 
DELIMITER ';' 
CSV HEADER;

COPY personal_personal
FROM 'C:/Users/Public/Documents/csv/personal.csv' 
DELIMITER ';' 
CSV HEADER;

