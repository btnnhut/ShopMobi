using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopMobi.ShopMobi.Client.Code
{
    public class ClassProduct
    {
        public int? IDType { get; set; }
        public int? IDPro { get; set; }
        public string DescriptionType { get; set; }
        public string NameType { get; set; }
        public int? countIDPro { get; set; }

        public string namePro { get; set; }
        public string ImgePro { get; set; }

        public long? Price { get; set; }
        public long? Sell { get; set; }
        public long? PricePromotion { get; set; }

        public List<ClassProduct> ChildListProduct;
        public ClassProduct()
        {
            ChildListProduct = new List<ClassProduct>();
        }
    }
}