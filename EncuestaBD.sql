-- Crear la tabla Encuestas
CREATE TABLE Encuestas (
    NumeroEncuesta INT PRIMARY KEY IDENTITY,
    NombreParticipante VARCHAR(50) NOT NULL,
    Edad INT NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    PartidoPolitico VARCHAR(10) NOT NULL
);

GO

-- Crear el procedimiento almacenado AgregarEncuesta
CREATE PROCEDURE AgregarEncuesta
    @NombreParticipante VARCHAR(50),
    @Edad INT,
    @CorreoElectronico VARCHAR(100),
    @PartidoPolitico VARCHAR(10)
AS
BEGIN
    IF @Edad BETWEEN 18 AND 50 AND @NombreParticipante IS NOT NULL AND @CorreoElectronico IS NOT NULL AND @PartidoPolitico IS NOT NULL
    BEGIN
        INSERT INTO Encuestas (NombreParticipante, Edad, CorreoElectronico, PartidoPolitico)
        VALUES (@NombreParticipante, @Edad, @CorreoElectronico, @PartidoPolitico)
    END
    ELSE
    BEGIN
        RAISERROR('Los datos ingresados no cumplen con los requisitos para agregar la encuesta.', 16, 1)
    END
END;

GO

-- Crear el procedimiento almacenado ObtenerTodasLasEncuestas
CREATE PROCEDURE ObtenerTodasLasEncuestas
AS
BEGIN
    SELECT * FROM Encuestas
END;

GO