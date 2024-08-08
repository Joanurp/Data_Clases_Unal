
------- Actividad Verifcadora Bass de Datos ---------------------------



CREATE TABLE saber11_2019 (
    ESTU_TIPODOCUMENTO CHARACTER VARYING(255),
    ESTU_NACIONALIDAD CHARACTER VARYING(255),
    ESTU_GENERO CHARACTER VARYING(255),
    ESTU_FECHANACIMIENTO DATE,
    PERIODO CHARACTER VARYING(255),
    ESTU_CONSECUTIVO CHARACTER VARYING(255),
    ESTU_ESTUDIANTE CHARACTER VARYING(255),
    ESTU_TIENEETNIA CHARACTER VARYING(255),
    ESTU_PAIS_RESIDE CHARACTER VARYING(255),
    ESTU_ETNIA CHARACTER VARYING(255),
    ESTU_DEPTO_RESIDE CHARACTER VARYING(255),
    ESTU_COD_RESIDE_DEPTO CHARACTER VARYING(255),
    ESTU_MCPIO_RESIDE CHARACTER VARYING(255),
    ESTU_COD_RESIDE_MCPIO CHARACTER VARYING(255),
    FAMI_ESTRATOVIVIENDA CHARACTER VARYING(255),
    FAMI_PERSONASHOGAR CHARACTER VARYING(255),
    FAMI_CUARTOSHOGAR CHARACTER VARYING(255),
    FAMI_EDUCACIONPADRE CHARACTER VARYING(255),
    FAMI_EDUCACIONMADRE CHARACTER VARYING(255),
    FAMI_TRABAJOLABORPADRE CHARACTER VARYING(255),
    FAMI_TRABAJOLABORMADRE CHARACTER VARYING(255),
    FAMI_TIENEINTERNET CHARACTER VARYING(255),
    FAMI_TIENESERVICIOTV CHARACTER VARYING(255),
    FAMI_TIENECOMPUTADOR CHARACTER VARYING(255),
    FAMI_TIENELAVADORA CHARACTER VARYING(255),
    FAMI_TIENEHORNOMICROOGAS CHARACTER VARYING(255),
    FAMI_TIENEAUTOMOVIL CHARACTER VARYING(255),
    FAMI_TIENEMOTOCICLETA CHARACTER VARYING(255),
    FAMI_TIENECONSOLAVIDEOJUEGOS CHARACTER VARYING(255),
    FAMI_NUMLIBROS CHARACTER VARYING(255),
    FAMI_COMELECHEDERIVADOS CHARACTER VARYING(255),
    FAMI_COMECARNEPESCADOHUEVO CHARACTER VARYING(255),
    FAMI_COMECEREALFRUTOSLEGUMBRE CHARACTER VARYING(255),
    FAMI_SITUACIONECONOMICA CHARACTER VARYING(255),
    ESTU_DEDICACIONLECTURADIARIA CHARACTER VARYING(255),
    ESTU_DEDICACIONINTERNET CHARACTER VARYING(255),
    ESTU_HORASSEMANATRABAJA CHARACTER VARYING(255),
    ESTU_TIPOREMUNERACION CHARACTER VARYING(255),
    COLE_CODIGO_ICFES CHARACTER VARYING(255),
    COLE_COD_DANE_ESTABLECIMIENTO CHARACTER VARYING(255),
    COLE_NOMBRE_ESTABLECIMIENTO CHARACTER VARYING(255),
    COLE_GENERO CHARACTER VARYING(255),
    COLE_NATURALEZA CHARACTER VARYING(255),
    COLE_CALENDARIO CHARACTER VARYING(255),
    COLE_BILINGUE CHARACTER VARYING(255),
    COLE_CARACTER CHARACTER VARYING(255),
    COLE_COD_DANE_SEDE CHARACTER VARYING(255),
    COLE_NOMBRE_SEDE CHARACTER VARYING(255),
    COLE_SEDE_PRINCIPAL CHARACTER VARYING(255),
    COLE_AREA_UBICACION CHARACTER VARYING(255),
    COLE_JORNADA CHARACTER VARYING(255),
    COLE_COD_MCPIO_UBICACION CHARACTER VARYING(255),
    COLE_MCPIO_UBICACION CHARACTER VARYING(255),
    COLE_COD_DEPTO_UBICACION CHARACTER VARYING(255),
    COLE_DEPTO_UBICACION CHARACTER VARYING(255),
    ESTU_PRIVADO_LIBERTAD CHARACTER VARYING(255),
    ESTU_COD_MCPIO_PRESENTACION CHARACTER VARYING(255),
    ESTU_MCPIO_PRESENTACION CHARACTER VARYING(255),
    ESTU_DEPTO_PRESENTACION CHARACTER VARYING(255),
    ESTU_COD_DEPTO_PRESENTACION CHARACTER VARYING(255),
    PUNT_LECTURA_CRITICA NUMERIC,
    PERCENTIL_LECTURA_CRITICA NUMERIC,
    DESEMP_LECTURA_CRITICA CHARACTER VARYING(255),
    PUNT_MATEMATICAS NUMERIC,
    PERCENTIL_MATEMATICAS NUMERIC,
    DESEMP_MATEMATICAS CHARACTER VARYING(255),
    PUNT_C_NATURALES NUMERIC,
    PERCENTIL_C_NATURALES NUMERIC,
    DESEMP_C_NATURALES CHARACTER VARYING(255),
    PUNT_SOCIALES_CIUDADANAS NUMERIC,
    PERCENTIL_SOCIALES_CIUDADANAS NUMERIC,
    DESEMP_SOCIALES_CIUDADANAS CHARACTER VARYING(255),
    PUNT_INGLES NUMERIC,
    PERCENTIL_INGLES NUMERIC,
    DESEMP_INGLES CHARACTER VARYING(255),
    PUNT_GLOBAL NUMERIC,
    PERCENTIL_GLOBAL NUMERIC,
    ESTU_INSE_INDIVIDUAL CHARACTER VARYING(255),
    ESTU_NSE_INDIVIDUAL CHARACTER VARYING(255),
    ESTU_NSE_ESTABLECIMIENTO CHARACTER VARYING(255),
    ESTU_ESTADOINVESTIGACION CHARACTER VARYING(255),
    ESTU_GENERACION_E CHARACTER VARYING(255)
);




--- a. ¿Cuantos estudiantes hay por genero (ESTU_GENERO)?

SELECT estu_genero, COUNT(*) AS NUM_ESTUDIANTES
FROM saber11_2019
WHERE estu_genero <> '0'
GROUP BY estu_genero;


--- b. ¿Por departamento, cuántos del género femenino y cuántos del género masculino?


SELECT estu_depto_reside, estu_genero, COUNT(*) AS NUM_ESTUDIANTES
FROM saber11_2019
GROUP BY estu_depto_reside, estu_genero;



--- c. Distribución por género para cada uno de los municipios.


SELECT estu_mcpio_reside, estu_genero, COUNT(*) AS NUM_ESTUDIANTES
FROM saber11_2019
WHERE estu_depto_reside = 'CESAR'
GROUP BY estu_mcpio_reside, estu_genero;




--- d. Distribución para el desempeño en Inglés (DESEMP_INGLES) por municipios.


SELECT estu_mcpio_reside, desemp_ingles, COUNT(*) AS NUM_ESTUDIANTES
FROM saber11_2019
WHERE estu_depto_reside = 'CESAR'
GROUP BY estu_mcpio_reside, desemp_ingles;


--- e. promedio del puntaje global para clos municipios del departamento del Cesar.


SELECT estu_mcpio_reside, AVG(punt_global) AS PROM_PUNT_GLOBAL
FROM saber11_2019
WHERE estu_depto_reside = 'CESAR'
GROUP BY estu_mcpio_reside;



--- Promedio del puntaje global nacional:


SELECT AVG(punt_global) AS PROM_PUNT_GLOBAL_NACIONAL
FROM saber11_2019;



--- Promedio del puntaje global nacional:


SELECT AVG(punt_global) AS PROM_PUNT_GLOBAL_NACIONAL
FROM saber11_2019;



--- Promedio del puntaje global en el departamento del Cesar:


SELECT AVG(punt_global) AS PROM_PUNT_GLOBAL_CESAR
FROM saber11_2019
WHERE estu_depto_reside = 'CESAR';


--- g. Promedio de:lectura crítica, matemáticas, ciencias naturales, competencia ciudadana

SELECT 
    AVG(punt_lectura_critica) AS PROM_LECTURA_CRITICA,
    AVG(punt_matematicas) AS PROM_MATEMATICAS,
    AVG(punt_c_naturales) AS PROM_NATURALES,
    AVG(punt_sociales_ciudadanas) AS PROM_CIUDADANAS
FROM saber11_2019
WHERE estu_depto_reside = 'CESAR';


-------------- Base de Datos de Covid 19 en Colombia --------------


CREATE TABLE casos_covid (
    fecha_reporte_web TIMESTAMP,
    id_caso CHARACTER VARYING(255) PRIMARY KEY,
    fecha_notificacion DATE,
    codigo_divipola_departamento CHARACTER VARYING(255),
    nombre_departamento CHARACTER VARYING(255),
    codigo_divipola_municipio CHARACTER VARYING(255),
    nombre_municipio CHARACTER VARYING(255),
    edad INTEGER,
    unidad_medida_edad CHARACTER VARYING(255),
    sexo CHARACTER VARYING(255),
    tipo_contagio CHARACTER VARYING(255),
    ubicacion_caso CHARACTER VARYING(255),
    estado CHARACTER VARYING(255),
    codigo_iso_pais CHAR(2),
    nombre_pais CHARACTER VARYING(255),
    recuperado BOOLEAN,
    fecha_inicio_sintomas DATE,
    fecha_muerte DATE,
    fecha_diagnostico DATE,
    fecha_recuperacion DATE,
    tipo_recuperacion CHARACTER VARYING(255),
    pertenencia_etnica CHARACTER VARYING(255),
    nombre_grupo_etnico CHARACTER VARYING(255)
);


--- ¿Cuántas personas fallecidas por departamentos?


SELECT nombre_departamento, COUNT(*) AS total_fallecidos
FROM casos_covid
WHERE estado = 'Fallecido'
GROUP BY nombre_departamento
ORDER BY total_fallecidos DESC;


-- ¿Cuántas personas recuperadas por departamento?


SELECT nombre_departamento, COUNT(*) AS total_recuperados
FROM casos_covid
WHERE estado = 'Recuperado'
GROUP BY nombre_departamento
ORDER BY total_recuperados DESC;



--- Para el departamento del Cesar, ¿cuántas personas en total fallecidas?


SELECT COUNT(*) AS total_fallecidos
FROM casos_covid
WHERE estado = 'Fallecido'
  AND nombre_departamento = 'CESAR';



--- **Para el departamento del Cesar, ¿cuántas personas en total fallecidas por municipios?**


SELECT nombre_municipio, COUNT(*) AS total_fallecidos
FROM casos_covid
WHERE estado = 'Fallecido'
  AND nombre_departamento = 'CESAR'
GROUP BY nombre_municipio
ORDER BY total_fallecidos DESC;


--- ¿En qué municipio se presentó mayor frecuencia de fallecidos?


SELECT nombre_municipio, COUNT(*) AS total_fallecidos
FROM casos_covid
WHERE estado = 'Fallecido'
GROUP BY nombre_municipio
ORDER BY total_fallecidos DESC
LIMIT 1;


-- Para las ciudades: Valledupar, Santa Marta, Barranquilla, Cartagena, Sincelejo y Montería, ¿dónde se presentó el mayor promedio de fallecidos?


SELECT nombre_municipio, AVG(total_fallecidos) AS promedio_fallecidos
FROM (
    SELECT nombre_municipio, COUNT(*) AS total_fallecidos
    FROM casos_covid
    WHERE estado = 'Fallecido'
      AND nombre_municipio IN ('VALLEDUPAR', 'SANTA MARTHA', 'BARRANQUILLA', 'CARTAGENA', 'SINCELEJO', 'MONTERIA')
    GROUP BY nombre_municipio
) subquery
GROUP BY nombre_municipio
ORDER BY promedio_fallecidos DESC
LIMIT 1;



--- Total de Fallecidos y recuperados en el municipio de Pueblo Bello, Cesar.

SELECT 
    SUM(CASE WHEN estado = 'Fallecido' THEN 1 ELSE 0 END) AS total_fallecidos,
    SUM(CASE WHEN estado = 'Recuperado' THEN 1 ELSE 0 END) AS total_recuperados
FROM casos_covid
WHERE nombre_municipio = 'Pueblo Bello'
  AND nombre_departamento = 'CESAR';




