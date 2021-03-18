using System;
using System.Collections.Generic;
using System.Text;

namespace ElectroMundos.Shared
{
    public interface IHasIdentity<T>
    {
        T ID { get; set; }
    }
}
