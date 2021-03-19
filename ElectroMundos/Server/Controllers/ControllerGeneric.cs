using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ElectroMundos.Shared;
using System.Threading.Tasks;

    public class GenericController<T,U> : ControllerBase
        where T : IHasIdentity<U>, new()
    {
        protected readonly ApplicationDBContext _context;
        protected GenericController(ApplicationDBContext context)
        {
            this._context = context;
        }

        [HttpPost]
        public async Task<IActionResult> post(T item)
        {
            _context.Add(item);
            await _context.SaveChangesAsync();
            return Ok(item.ID); 
        }

        public async Task<IActionResult> put(T item)
        {
            _context.Entry(item).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        public async Task<IActionResult> delete(U id)
        {
            var item = new T { ID = id };
            _context.Remove(item);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }