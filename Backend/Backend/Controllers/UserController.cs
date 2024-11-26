using Backend.Interfaces;
using Backend.Models;
using Backend.Servicios;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUsersServices _userServices;
        private readonly JwtService _jwtService;

        public UserController(IUsersServices userServices, JwtService jwtService)
        {
            _userServices = userServices;
            _jwtService = jwtService;
        }

        [HttpPost("login")]
        public async Task<ActionResult> GetUserByEmailPassword(string usuario, string password)
        {
            try
            {
                var user = await _userServices.getUserByEmailPassword(usuario, password);
                if (user == null)
                {
                    return Unauthorized("Usuario o contraseña incorrectos.");
                }
                var token = _jwtService.GenerateToken(user.Id);
                return Ok(new { Message = "Login exitoso", Token = token });

            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
