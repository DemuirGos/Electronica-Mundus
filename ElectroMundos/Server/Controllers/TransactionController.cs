using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;
using ElectroMundos.Shared;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

[Route("api/[controller]")]
    [ApiController]
    public class TransactionController : GenericController<MicroCommand,int>
    {
        public TransactionController(ApplicationDBContext context) : base(context)
        {
        }
        
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.microCommand.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var com = await _context.microCommand.FirstOrDefaultAsync(a=>a.ID == id);
            return Ok(com);
        }
    }