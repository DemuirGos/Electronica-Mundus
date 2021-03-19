using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class Catalogue : IHasIdentity<string>
    {
        private string id = null;
        public string ID { 
            get => id;
            set => id = value; 
        }

        public string Label { get; set; }
        public int Category { get; set; }
        public int Family { get; set; }
        public int Price { get; set; }
        public int Tax { get; set; }
    }
}
