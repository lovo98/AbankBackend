CREATE TABLE Departamento (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    FechaCreacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    Id SERIAL PRIMARY KEY,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    FechaContratacion TIMESTAMP NOT NULL,
    IdArea INT NOT NULL,
    FechaCreacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Empleados_Departamento FOREIGN KEY (IdArea) REFERENCES Departamento (Id) ON DELETE CASCADE
);

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    Id SERIAL PRIMARY KEY,
    Usuario VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Estado BOOLEAN NOT NULL DEFAULT TRUE,
    IdEmpleado INT NOT NULL,
    FechaCreacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FechaModificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Usuarios_Empleados FOREIGN KEY (IdEmpleado) REFERENCES empleados (Id)
);

-- Insertar registros de ejemplo en la tabla Departamento
INSERT INTO Departamento (Nombre, FechaCreacion, FechaModificacion) VALUES
('Recursos Humanos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Tecnología', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Marketing', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insertar registros de ejemplo en la tabla Empleados
INSERT INTO Empleados (Nombres, Apellidos, Telefono, Correo, FechaContratacion, IdArea, FechaCreacion, FechaModificacion) VALUES
('Juan', 'Perez', '12345678', 'juan.perez@example.com', '2024-01-15', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ana', 'Lopez', '87654321', 'ana.lopez@example.com', '2024-02-01', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Carlos', 'Hernandez', '55555555', 'carlos.hernandez@example.com', '2023-12-01', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Pedro', 'Gonzalez', '98765432', 'pedro.gonzalez@example.com', '2024-01-20', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Maria', 'Martinez', '12347890', 'maria.martinez@example.com', '2024-03-05', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Luis', 'Rodriguez', '23456789', 'luis.rodriguez@example.com', '2024-02-15', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Laura', 'Sanchez', '34567890', 'laura.sanchez@example.com', '2024-01-30', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Miguel', 'Torres', '45678901', 'miguel.torres@example.com', '2024-03-12', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Sofia', 'Ramirez', '56789012', 'sofia.ramirez@example.com', '2024-04-01', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('David', 'Fernandez', '67890123', 'david.fernandez@example.com', '2024-02-10', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Elena', 'Gomez', '78901234', 'elena.gomez@example.com', '2024-01-22', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Antonio', 'Diaz', '89012345', 'antonio.diaz@example.com', '2024-03-20', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Isabel', 'Morales', '90123456', 'isabel.morales@example.com', '2024-04-10', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Raul', 'Castro', '11223344', 'raul.castro@example.com', '2024-02-25', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Beatriz', 'Jimenez', '22334455', 'beatriz.jimenez@example.com', '2024-03-30', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insertar registros de ejemplo en la tabla Usuarios
INSERT INTO Usuarios (Usuario, Password, Estado, IdEmpleado, FechaCreacion, FechaModificacion) VALUES
('jperez', 'hashedpassword1', TRUE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('alopez', 'hashedpassword2', TRUE, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('chernandez', 'hashedpassword3', TRUE, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('pgonzalez', 'hashedpassword4', TRUE, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('mmartinez', 'hashedpassword5', TRUE, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('lrodriguez', 'hashedpassword6', TRUE, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('lsanchez', 'hashedpassword7', TRUE, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('mtorres', 'hashedpassword8', TRUE, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('sramirez', 'hashedpassword9', TRUE, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('dfernandez', 'hashedpassword10', TRUE, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('egomez', 'hashedpassword11', TRUE, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('adiaz', 'hashedpassword12', TRUE, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('ijimenez', 'hashedpassword13', TRUE, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('rcastro', 'hashedpassword14', TRUE, 14, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('bjimenez', 'hashedpassword15', TRUE, 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- levantar docker
docker run -d --name postgres_server -p 5432:5432 -e POSTGRES_PASSWORD=yourPassword postgres