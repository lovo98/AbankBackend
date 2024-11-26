using Backend.Models;

namespace Backend.Interfaces
{
    public interface IEmployeeServices
    {
        IEnumerable<EmployeeModel> getAll();
        void AddEmploye(EmployeeModel employee);
        void EditEmploye(EmployeeModel employee);
    }
}
