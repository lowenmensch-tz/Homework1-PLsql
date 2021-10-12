/*
    Crear una tabla llamada LOGS, que contenga los campos:
        - CODIGO NUMBER
        - DESCRIPCION VARCHAR2(800)
        - FECHA TIMESTAMP
        - USUARIO VARCHAR2(50)
        - OPERACION VARCHAR2(50). 
    
    Además, crear una secuencia para esta tabla y que se gestione la misma a través de un trigger 
    para tener valores autoincrementables en el campo código de esta tabla. 
    
    Luego crear un trigger para la tabla categorías, se debe ejecutar después de un UPDATE en esta tabla, 
    este trigger debe guardar un registro en la tabla LOGS con la información de la operación que se realizó.
*/


-- Tabla 
CREATE TABLE LOGS( 
    CODIGO NUMBER PRIMARY KEY, 
    DESCRIPCION VARCHAR2(800),
    FECHA TIMESTAMP,
    USUARIO VARCHAR2(50),
    OPERACION VARCHAR2(50)
);


-- Secuencia para el campo CODIGO
CREATE SEQUENCE SQ_TABLA_LOGS
    START WITH 1 
    INCREMENT BY 1
;


-- Trigger Tabla LOGS
CREATE OR REPLACE TRIGGER TG_TABLA_LOGS
    BEFORE INSERT ON LOGS
        FOR EACH ROW 
            DECLARE

            BEGIN 
                :NEW.CODIGO := SQ_TABLA_LOGS.NEXTVAL;
            END;


-- Trigger Tabla Categoria
CREATE OR REPLACE TRIGGER TG_TABLA_CATEGORIAS
    AFTER UPDATE ON CATEGORIAS
        FOR EACH ROW 
            DECLARE

            BEGIN 
                INSERT INTO LOGS (DESCRIPCION, FECHA, USUARIO, OPERACION) VALUES
                (
                    'Se modifica el valor de: ' || :OLD.NOMBRECAT || ' a: ' || :NEW.NOMBRECAT, 
                    SYSTIMESTAMP, 
                    USER, 
                    'UPDATE'
                );
            END;


SELECT * FROM CATEGORIAS;

-- Actualización de documentos para la tabla CATEGORIAS
UPDATE CATEGORIAS
SET 
    NOMBRECAT = 'Carnes'
WHERE 
    CATEGORIAID = 100
;


SELECT * FROM CATEGORIAS;
SELECT * FROM LOGS;