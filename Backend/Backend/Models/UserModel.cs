
namespace Backend.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public required string Usuario { get; set; }
        public string Password { get; set; }
        public string Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdEmpleado { get; set; }

    }
}
