<h1>IDL2: Elaborar un CRUD.</h1>

- De acuerdo a lo solicitado, se elaboro un CRUD para un control de Categorías para una Joyería, de las cuales se realizó lo siguiente:
	+ Se creo una base de datos denominada: DB_CRM con la tabla denominada categories.    
	+ Para crear la aplicación web en Python, se uso el framework Web de Python: Flask
        - Se creo la carpeta llamada Entregable 2
            + Para Backend:
                - Se creó el modelo: categories.py
                - Se creó el controlador y la aplicación de ejecución: app.py
            + Para Frontend:
                - Se creó la carpeta templates para renderizar el html: categories.html
                - Se creó la carpeta static/lib: donde se encuentra las librerias Bootstrap, Fontawesome y jQuery.

- Operaciones CRUD para el control de categorías:
	+ Listar Categorías
        
    + Crear Categorías
    
    + Actualizar Categorías
    
    + Eliminar Categorías
    
- Para desplegar y ejecutar la aplicación se debe realizar lo siguiente pasos:
    + Requisitos:
        - Tener Instalado el Gestor de Base de Datos: SQL Server 2022
        - Tener Python Instalado version 3.13.3
	+ Clonar el repositorio <https://github.com/PierEscobedo/Entregable-2.git>
    + Ejecutar el script bd.sql en Gestor de Base de Datos SQL Server 2022
    + Modificar el nombre del servidor o IP del archivo categories.py: 
    <br />
    <pre>self.conn = pyodbc.connect('DRIVER={SQL SERVER};SERVER=MI_SERVER;DATABASE=DB_CRM;')</pre>
	<br />
    + Luego en la terminal ejecutar el siguiente comando: python app.py
    <br />
	+ Luego ir al navegador web y digitar http://127.0.0.1:4000
    Se mostrará el resultado final de Categorías.
   
