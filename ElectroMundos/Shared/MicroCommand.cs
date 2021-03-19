using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class MicroCommand : IHasIdentity<int>
    {
        private int id = -1;
        public int ID { 
            get => id;
            set => id = value; 
        }

        public int CommandID { get; set; }
        public string Catalogue { get; set; }
        public int Quantity { get; set; }
        public float PriceHT { get; set; }
        public float PriceTTC { get; set; }
    }
}
