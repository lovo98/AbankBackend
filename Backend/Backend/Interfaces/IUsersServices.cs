using Backend.Models;

namespace Backend.Interfaces
{
    public interface IUsersServices
    {
        Task<UserModel> getUserByEmailPassword(string usuario, string password);
    }
}
