using Backend.Interfaces;
using Backend.Models;
using Dapper;
using System.Data;
using System.Data.Common;

namespace Backend.Servicios
{
    public class EmployeeServices : IEmployeeServices
    {
        private readonly IDbConnection _connection;

        public EmployeeServices(IDbConnection connection)
        {
            _connection = connection;
        }

        public void AddEmploye(EmployeeModel employee)
        {
            var query = @"
            INSERT INTO empleados (Nombres, Apellidos, Telefono, Correo, FechaContratacion, IdArea, FechaCreacion)
                    VALUES (@Nombres, @Apellidos, @Telefono, @Correo, @FechaContratacion, @IdArea, @FechaCreacion) 
                    returning *;";

            var empleado = _connection.QuerySingle<EmployeeModel>(query, new
            {
                employee.Nombres,
                employee.Apellidos,
                employee.Telefono,
                employee.Correo,
                employee.FechaContratacion,
                employee.IdArea,
                employee.FechaCreacion
            });
        }

        public void EditEmploye(EmployeeModel employee)
        {
            string query = @"
                    UPDATE empleados
                    SET Nombres = @Nombres, Apellidos = @Apellidos, Telefono = @Telefono, Correo = @Correo, 
                        FechaContratacion = @FechaContratacion, IdArea = @IdArea, FechaModificacion = @FechaModificacion
                    WHERE Id = @Id"
            ;

            // Usamos ExecuteAsync para ejecutar la actualización
            _connection.Execute(query, new
            {
                employee.Nombres,
                employee.Apellidos,
                employee.Telefono,
                employee.Correo,
                employee.FechaContratacion,
                employee.IdArea,
                employee.FechaModificacion,
                employee.Id
            });
        }

        public IEnumerable<EmployeeModel> getAll()
        {
            return _connection.Query<EmployeeModel>("SELECT * FROM empleados");
        }
    }
}
