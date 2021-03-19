using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class Family : IHasIdentity<int>
    {
        private int id = -1;
        public int ID { 
            get => id;
            set => id = value; 
        }

        public string Label { get; set; }
    }
}
