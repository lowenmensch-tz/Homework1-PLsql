/*

Hacer uso de un bloque anónimo para insertar dos (2) registros en la tabla productos. 
En caso de que se produzca un error de llave primaria duplicada o de llave foránea
inexistente, se deben gestionar estos errores mediante el bloque de excepciones. 

En caso de que no haya error, se deben aprobar los cambios y si hay error entonces se deben
deshacer todos los cambios. Utilizar el código -2291 para controlar el error de llave foránea inexistente.

*/


/*
    Prueba 1: 
    Llave foránea inexistente
*/
DECLARE

BEGIN 
    INSERT INTO PRODUCTOS VALUES (14, 200, 400, 'Jabon Palmolive Aloe 160 gr', 6.39, 500);

    
    COMMIT;

    EXCEPTION
        -- Llave primaria duplicada
        WHEN DUP_VAL_ON_INDEX THEN 

            DBMS_OUTPUT.PUT_LINE('Error de llave primaria. Error: ' || SQLCODE);
            ROLLBACK;


        -- Llave foránea inexistente
        WHEN OTHERS THEN

            IF (SQLCODE = -2291) THEN 
                DBMS_OUTPUT.PUT_LINE('Error de llave fóranea, clave inexistente. Error: ' || SQLCODE);
                ROLLBACK;
            END IF;
END;


/*
    Prueba 2: 
    Llave primaria duplicada
*/
DECLARE

BEGIN 
    INSERT INTO PRODUCTOS VALUES (10, 110, 400, 'Jabon Palmolive Aloe 160 gr', 6.39, 500);

    
    COMMIT;

    EXCEPTION
        -- Llave primaria duplicada
        WHEN DUP_VAL_ON_INDEX THEN 

            DBMS_OUTPUT.PUT_LINE('Error de llave primaria. Error: ' || SQLCODE);
            ROLLBACK;


        -- Llave foránea inexistente
        WHEN OTHERS THEN

            IF (SQLCODE = -2291) THEN 
                DBMS_OUTPUT.PUT_LINE('Error de llave fóranea, clave inexistente. Error: ' || SQLCODE);
                ROLLBACK;
            END IF;
END;


/*
    Prueba 3: 
    Datos correctos
*/
DECLARE

BEGIN 

    -- 110: PALMOLIVE 400: Higiene personal
    INSERT INTO PRODUCTOS VALUES (14, 110, 400, 'Jabon Palmolive Aloe 160 gr', 6.39, 500);
    
    -- 90: BAYER 300: limpieza
    INSERT INTO PRODUCTOS VALUES (15, 90, 300, 'Pastillas repele los mosquitos por hasta 12 horas.', 50, 236);

    COMMIT;

    EXCEPTION
        -- Llave primaria duplicada
        WHEN DUP_VAL_ON_INDEX THEN 

            DBMS_OUTPUT.PUT_LINE('Error de llave primaria. Error: ' || SQLCODE);
            ROLLBACK;


        -- Llave foránea inexistente
        WHEN OTHERS THEN

            IF (SQLCODE = -2291) THEN 
                DBMS_OUTPUT.PUT_LINE('Error de llave fóranea, clave inexistente. Error: ' || SQLCODE);
                ROLLBACK;
            END IF;
END;

SELECT * FROM PRODUCTOS;