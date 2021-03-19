using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using ElectroMundos.Shared;
using System.Threading.Tasks;

[Route("api/[controller]")]
    [ApiController]
    public class CommandController : GenericController<Command,int>
    {

        public CommandController(ApplicationDBContext context) : base(context)
        {
        }
        
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.command.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var com = await _context.command.FirstOrDefaultAsync(a=>a.ID == id);
            return Ok(com);
        }

        
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return await delete(id);
        }

        [HttpPut]
        public async Task<IActionResult> Put(Command item)
        {
            return await put(item);
        }

        [HttpPost]
        public async Task<IActionResult> Post(Command item)
        {
            return await post(item);
        }
    }