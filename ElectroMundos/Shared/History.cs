using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public class History : IHasIdentity<int>
    {
        private int id = -1;
        public int ID { 
            get => id;
            set => id = value; 
        }

        public int CommandID { get; set; }
        public int ClientID { get; set; }
        public DateTime Date { get; set; }
        public bool Status { get; set; }
    }
}
