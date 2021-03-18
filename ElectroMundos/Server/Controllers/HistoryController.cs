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
    public class HistoryController: GenericController<History,int>
    {

        public HistoryController(ApplicationDBContext context) : base(context)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.history.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var com = await _context.history.FirstOrDefaultAsync(a=>a.ID == id);
            return Ok(com);
        }

        
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return await delete(id);
        }

        [HttpPut]
        public async Task<IActionResult> Put(History item)
        {
            return await put(item);
        }

        [HttpPost]
        public async Task<IActionResult> Post(History item)
        {
            return await post(item);
        }
    }