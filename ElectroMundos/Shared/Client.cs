using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class User : IHasIdentity<int>
    {
        private int id = -1;
        public int ID { 
            get => id;
            set => id = value; 
        }

        public string FullName { get; set; }
        public string Adress { get; set; }
        public string Region { get; set;}
        public string Email { get; set; }
        public DateTime Date { get; set; }
        public string Observation { get; set; }
    }
}
