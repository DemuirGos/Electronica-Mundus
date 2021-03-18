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
    public class UserController : GenericController<User,int>
    {
        
        public UserController(ApplicationDBContext context) : base(context)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var coms = await _context.users.ToListAsync();
            return Ok(coms);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var com = await _context.users.FirstOrDefaultAsync(a=>a.ID == id);
            return Ok(com);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return await delete(id);
        }

        [HttpPut]
        public async Task<IActionResult> Put(User item)
        {
            return await put(item);
        }

        [HttpPost]
        public async Task<IActionResult> Post(User item)
        {
            return await post(item);
        }
    }