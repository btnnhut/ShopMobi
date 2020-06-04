using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopMobi.ShopMobi.Client.Utils
{
    public class ClassCart
    {
        public int IDProduct { get; set; }
        public int IDType { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public double Sell { get; set; }
        public int Quantity { get; set; }
        //public double sumCart()
        //{
        //    return Convert.ToDouble(Quantity) * Sell;
        //}
    }
}