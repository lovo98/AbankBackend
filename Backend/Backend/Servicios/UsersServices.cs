using Backend.Interfaces;
using Backend.Models;
using Dapper;
using System.Data;

namespace Backend.Servicios
{
    public class UsersServices : Interfaces.IUsersServices
    {

        private readonly IDbConnection _connection;

        public UsersServices(IDbConnection connection)
        {
            _connection = connection;
        }
        public async Task<UserModel> getUserByEmailPassword(string usuario, string password)
        {
            var query = "SELECT * FROM Usuarios WHERE Usuario = @Usuario AND Password = @Password";
            var user = await _connection.QueryFirstOrDefaultAsync<UserModel>(query, new { Usuario = usuario, Password = password });
            return user;
        }
    }
}
