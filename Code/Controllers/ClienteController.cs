﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Ficus_App.Models;
using Ficus_App.Services;

namespace Ficus_App.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private readonly IClienteService _service;

        public ClienteController(IClienteService service)
        {
            _service = service;
        }

        // Obtener todos los clientes
        [HttpGet]
        [Route("Obtener")]
        public async Task<IActionResult> Obtener()
        {
            var data = await _service.Obtener();
            return StatusCode(StatusCodes.Status200OK, data);
        }

        // Ver un cliente
        [HttpGet]
        [Route("Ver/{nombre:int}")]
        public async Task<IActionResult> Ver(int nombre)
        {
            var client = await _service.GetByIdAsync(nombre);
            return StatusCode(StatusCodes.Status200OK, client);
        }

        // Agregar un cliente
        [HttpPost]
        [Route("Agregar")]
        public async Task<IActionResult> Agregar([FromBody] Cliente request)
        {
            await _service.AddAsync(request);
            return StatusCode(StatusCodes.Status200OK, "Ok");
        }

        // Editar un cliente
        [HttpPut]
        [Route("Editar/{nombre:int}")]
        public async Task<IActionResult> Editar([FromBody] Cliente request, int nombre)
        {
            await _service.UpdateAsync(nombre, request);
            return StatusCode(StatusCodes.Status200OK, "Ok");
        }

        // Eliminar un cliente
        [HttpDelete]
        [Route("Eliminar/{nombre:int}")]
        public async Task<IActionResult> Eliminar(int nombre)
        {
            await _service.DeleteAsync(nombre);
            return StatusCode(StatusCodes.Status200OK, "Ok");
        }

    }
}

