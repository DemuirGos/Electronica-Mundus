using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class Command : IHasIdentity<int>
    {
        private int id = -1;
        public int ID { 
            get => id;
            set => id = value; 
        }

        public DateTime dateOfSubmit { get; set; }
        public DateTime dateOfDelvry { get; set; }
        public bool Status { get; set; }
        public int Client { get; set; }
        public float PriceHT { get; set; }
        public float PriceTTC { get; set; }
    }
}
