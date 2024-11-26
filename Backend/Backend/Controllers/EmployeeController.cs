using Backend.Interfaces;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeServices _employeeServices;

        public EmployeeController(IEmployeeServices employeeServices) {
            _employeeServices = employeeServices;
        }

        [Authorize]
        [HttpGet]
        public IActionResult getAll() {
            return Ok(_employeeServices.getAll());
        }

        // POST: api/employee
        [Authorize]
        [HttpPost]
        public ActionResult AddEmployee([FromBody] EmployeeModel employee)
        {
            try
            {
                if (employee == null)
                {
                    return BadRequest("Employee object is null");
                }

                _employeeServices.AddEmploye(employee);

                // Retorna un código 201 (Creado) con la ubicación del nuevo recurso
                return Ok("Empleado creado.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/employee
        [Authorize]
        [HttpPut]
        public ActionResult EditEmployee([FromBody] EmployeeModel employee)
        {
            try
            {
                if (employee == null)
                {
                    return BadRequest("Employee object is null");
                }

                _employeeServices.EditEmploye(employee);

                return Ok("Empleado actualizado"); // Retorna 204 No Content para indicar que la actualización fue exitosa
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

    }
}
