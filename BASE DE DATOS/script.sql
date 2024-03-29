USE [PruebaTecnica]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[dpi] [nvarchar](13) NOT NULL,
	[nombre_completo] [nvarchar](180) NULL,
	[total_hijos] [smallint] NULL,
	[salario_base] [int] NOT NULL,
 CONSTRAINT [PK_empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[fecha_nacimiento] [date] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarEmpleado]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarEmpleado]
@id_empleado int
AS
BEGIN
	SET NOCOUNT ON;

DELETE FROM empleados WHERE id_empleado=@id_empleado;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_insertEmpleado]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertEmpleado]
	@dpi nvarchar(13),
	@nombre_completo nvarchar(180),
	@total_hijos smallint,
	@salario_base int,
	@msj nvarchar(250) output
AS
BEGIN

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM empleados WHERE dpi=@dpi)
BEGIN
	SET @msj='DPI: '+@dpi+' ya registrado. ¡Ingresa otro!';
END
ELSE
BEGIN
BEGIN TRANSACTION INSERTAR
BEGIN TRY
	INSERT INTO empleados(dpi,nombre_completo,total_hijos,salario_base)
	VALUES(@dpi,@nombre_completo,@total_hijos,@salario_base);
	COMMIT TRANSACTION INSERTAR;
	SET @msj= '¡Empleado Registrado!';
END TRY
BEGIN CATCH
	SET @msj='Error: '+ERROR_MESSAGE()+' en la linea '+ CONVERT(nvarchar(255),ERROR_LINE());
	ROLLBACK TRANSACTION INSERTAR;
END CATCH
END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ListarEmpleados]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarEmpleados]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT id_empleado, dpi,nombre_completo,total_hijos,salario_base
	from empleados
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UupdateEmp]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UupdateEmp]
	@id_empleado int,
	@salario int
AS
BEGIN

	SET NOCOUNT ON;

UPDATE empleados
SET salario_base=@salario
WHERE id_empleado=@id_empleado

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidaUser]    Script Date: 4/06/2019 18:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidaUser]
@usuario nvarchar(50),
@password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT usuario, contraseña FROM usuarios
	WHERE usuario=@usuario and contraseña=@password
END
GO
