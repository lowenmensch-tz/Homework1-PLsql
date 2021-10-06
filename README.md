# EJERCICIOS SOBRE PL/SQL UNIDAD I


**NOTA:** para realizar esta tarea deben trabajar con la base de datos pedidos. Los scripts se han subido al campus virtual. El archivo con las soluciones a los ejercicios, lo deben subir al Campus Virtual de la UNAH en el enlace habilitado por el docente. Esta tarea se debe realizar en grupos, con los mismos integrantes que se conformó el grupo para el proyecto. Solamente un integrante del grupo debe entregar la solución.

1. Hacer uso de un bloque anónimo para insertar dos (2) registros en la tabla productos. En caso de que se produzca un error de llave primaria duplicada o de llave foránea
inexistente, se deben gestionar estos errores mediante el bloque de excepciones. En caso de que no haya error, se deben aprobar los cambios y si hay error entonces se deben
deshacer todos los cambios. Utilizar el código -2291 para controlar el error de llave foránea inexistente.
2. Crear una tabla llamada **LOGS**, que contenga los campos: 
- CODIGO NUMBER
- DESCRIPCION VARCHAR2(800)
- FECHA TIMESTAMP
- USUARIO VARCHAR2(50)
- OPERACION VARCHAR2(50). 
Además, crear una secuencia para esta tabla y que se gestione la misma a través de un trigger para tener valores autoincrementables en el campo código de esta tabla. Luego crear un trigger para la tabla categorías, se debe ejecutar después de un UPDATE en esta tabla, este trigger debe guardar un registro en la tabla **LOGS** con la información de la operación que se realizó.
4. Crear un trigger para la tabla **PROVEEDORES**, se debe ejecutar después de un `INSERT` o un `UPDATE` o un `DELETE` en esta tabla, este trigger debe guardar un registro
en la tabla **LOGS** con la información de la operación que se realizó. Además, se debe controlar cualquier error que pueda suceder y en caso de error se debe insertar un
registro en la tabla LOGS con la información del error. El trigger es el que debe aprobar o deshacer los cambios.
4) Suponiendo que tenemos una tabla llamada EMP, en la cual existen tres campos: 
  - nombreEmp VARCHAR2(100)
  - direccionEmp VARCHAR2(255)
  - telefonoEmp NUMBER(15)
  - identidad NUMBER(15) y que se tiene la siguiente declaración de variables
