using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore;
using ElectroMundos.Shared;

public class ApplicationDBContext : DbContext
    {
        
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options):base(options)
        {
        }
        public DbSet<Catalogue> catalogue { get; set; }
        public DbSet<Region> region { get; set; }
        public DbSet<User> users { get; set; }
        public DbSet<Category> category { get; set; }
        public DbSet<Command> command { get; set; }
        public DbSet<MicroCommand> microCommand { get; set; }
        public DbSet<Family> family { get; set; }
        public DbSet<History> history { get; set; }
    }