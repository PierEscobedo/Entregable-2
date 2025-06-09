USE MASTER
GO
CREATE DATABASE DB_CRM
GO
USE DB_CRM
GO
CREATE SCHEMA store
GO
CREATE TABLE store.categories(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	category_id INT NOT NULL,
	name VARCHAR(150) NOT NULL,
	description VARCHAR(400),
	ind_level TINYINT,
	ind_status BIT,
	create_at datetime,
	update_at datetime
);
GO
-- PROCEDIMIENTO PARA CREAR UNA CATEGORIA
CREATE PROCEDURE store.up_category_create
	@category_id INT,
	@name VARCHAR(150),
	@description VARCHAR(400),
	@ind_level TINYINT
AS
BEGIN TRY
	BEGIN TRANSACTION
		SET NOCOUNT ON
		INSERT INTO store.categories(category_id, name, description, ind_level, ind_status, create_at, update_at) 
		VALUES(@category_id, @name, @description, @ind_level, 1, GETDATE(), NULL);
		SELECT 
			ind_action = 1,
			id = IDENT_CURRENT('store.categories'),
			message = 'El registro fue creado con éxito'
		SET NOCOUNT OFF
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	SELECT 
		ind_action = 0,
		message = ERROR_MESSAGE() + ' Linea ' + CONVERT(VARCHAR(3), ERROR_LINE())
END CATCH
GO
-- PROCEDIMIENTO PARA ACTUALIZAR UNA CATEGORIA
CREATE PROCEDURE store.up_category_update
    @id INT,
	@category_id INT,
	@name VARCHAR(150),
	@description VARCHAR(400),
	@ind_level TINYINT
AS
BEGIN TRY
	BEGIN TRANSACTION
		SET NOCOUNT ON
		UPDATE store.categories 
		SET 
			category_id = @category_id,
			name = @name,
			description = @description,
			ind_level = @ind_level,
			update_at = GETDATE() 
		WHERE 
			id = @id;
		SELECT 
			ind_action = 1,
            id = @id,
			message = 'El registro fue actualizado con éxito'
		SET NOCOUNT OFF
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
	SELECT 
		ind_action = 0,
		message = ERROR_MESSAGE() + ' Linea ' + CONVERT(VARCHAR(3), ERROR_LINE())
END CATCH
GO
-- PROCEDIMIENTO PARA ELIMINAR UNA CATEGORIA
CREATE PROCEDURE store.up_category_delete
	@id INT
AS
BEGIN TRY
	BEGIN TRANSACTION
		SET NOCOUNT ON
		DELETE FROM store.categories WHERE id = @id;
		SELECT 
			ind_action = 1,
            id = @id,
			message = 'El registro fue eliminado con éxito'
		SET NOCOUNT OFF
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
	SELECT 
		ind_action = 0,
		message = ERROR_MESSAGE() + ' Linea ' + CONVERT(VARCHAR(3), ERROR_LINE())
END CATCH
GO
-- PROCEDIMIENTO PARA LISTAR TODAS LAS CATEGORIAS
CREATE PROCEDURE store.up_category_list
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @SQL AS VARCHAR(MAX)
	SET @SQL = CONCAT(
		'SELECT ',
		'   id, category_id, name, description, ind_level, ind_status, create_at, update_at ',
		'FROM store.categories WHERE ind_status = 1;'
    )
	EXECUTE (@SQL)
	SET NOCOUNT OFF
END
GO
-- PROCEDIMIENTO PARA ENCONTRAR UNA CATEGORIA
CREATE PROCEDURE store.up_category_find_by_id
	@id INT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @SQL AS VARCHAR(MAX)
	SET @SQL = CONCAT(
		'SELECT ',
		'   id, category_id, name, description, ind_level, ind_status, create_at, update_at ',
		'FROM store.categories WHERE id = ', CAST(@ID AS VARCHAR), ';'
    )
	EXECUTE (@SQL)
	SET NOCOUNT OFF
END
GO
--EJEMPLO PARA TESTEAR LOS PROCEDIMIENTOS ALMACENADOS

-- CREAR REGISTROS
-- EXECUTE store.up_category_create 0, 'Metales', 'Metales', 0;
-- EXECUTE store.up_category_create 0, 'Piedras Preciosas', 'Piedras Preciosas', 0;
-- EXECUTE store.up_category_create 0, 'Piedras Semi Preciosas', 'Piedras Semi Preciosas', 0;

-- ACTUALIZAR UN REGISTRO
-- EXECUTE store.up_category_update 3, 0, 'Piedras Feisimas', 'Piedras Feisimas', 0;

-- ELIMINAR UN REGISTRO
-- EXECUTE store.up_category_delete 3;

-- CONSULTAR REGISTROS
-- EXECUTE store.up_category_list;
-- EXECUTE store.up_category_find_by_id 2;