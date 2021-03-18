using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ElectroMundos.Shared;
using System.Threading.Tasks;

[Route("api/[controller]")]
    [ApiController]
    public class CategoryController : GenericController<Category,int>
    {

        public CategoryController(ApplicationDBContext context) : base(context)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.category.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var com = await _context.category.FirstOrDefaultAsync(a=>a.ID == id);
            return Ok(com);
        }
    }