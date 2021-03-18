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
    public class CatalogueController : GenericController<Catalogue,string>
    {

        public CatalogueController(ApplicationDBContext context) : base(context)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.catalogue.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            var com = await _context.catalogue.FirstOrDefaultAsync(a=> a.ID == id);
            return Ok(com);
        }

        
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            return await delete(id);
        }

        [HttpPut]
        public async Task<IActionResult> Put(Catalogue item)
        {
            return await put(item);
        }

        [HttpPost]
        public async Task<IActionResult> Post(Catalogue item)
        {
            return await post(item);
        }
    }