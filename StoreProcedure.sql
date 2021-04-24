use ObligatorioP3
go
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RegistroUsuario

	@docu int,
	@contra varchar(50),
	@rol varchar(50)

AS
	insert into usuario values (@docu, @contra, @rol);
GO

CREATE PROCEDURE LoginUsuario

	@docu int,
	@contra varchar(50),
	@rol varchar(50)


AS
	begin 
		select * from usuario order by documento
	end

GO



alter PROCEDURE RegistroVacuna

	@id int,
	@nombre varchar(50),
	@laboratorios int,
	@tipoVacuna varchar(50),
	@cantDosis int, 
	@lapsoDias int, 
	@rangoEdadInf int,
	@rangoEdadSup int,
	@efiCovid int, 
	@efiHosp int,
	@efiCTI int, 
	@temperatura int,
	@faseAprobacion int, 
	@estatus int,
	@aprobEme varchar(2),
	@efectosAdversos varchar (50),
	@precio int,
	@produccion int,
	@covax varchar(2)



AS
	insert into vacuna values (@id, @nombre, @laboratorios, @tipoVacuna,@cantDosis ,@lapsoDias ,@rangoEdadInf,@rangoEdadSup ,@efiCovid ,@efiHosp, 
	@efiCTI, @temperatura, @faseAprobacion, @estatus, @aprobEme, @efectosAdversos, @precio, @produccion, @covax);
GO




CREATE PROCEDURE BuscarLaboratorio

	@id int,
	@nombre varchar(50),
	@paisOrigen int,
	@experiencia varchar(2)


AS
	begin 
		select * from laboratorio where @id=id
	end



