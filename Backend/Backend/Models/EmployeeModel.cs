namespace Backend.Models
{
    public class EmployeeModel
    {
        public int Id { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; } 

        public string Telefono { get; set; }
        public string Correo {  get; set; }
        public DateTime FechaContratacion {  get; set; }
        public int IdArea { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
