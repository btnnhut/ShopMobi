using ShopMobi.ShopMobi.Client;
using ShopMobi.ShopMobi.Client.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public partial class DetailProduct : System.Web.UI.Page
    {
        public string strIDPrT { get; set; }
        public string strQuantity { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //get idPr, idPrT, quantity
            if (!Page.IsPostBack)
            {
                string strIDPr = Request.QueryString.Get("idPr");
                strIDPrT = Request.QueryString.Get("idPrT");
                strQuantity = Request.QueryString.Get("quantity");
                string strSQL = "" +
                    " Select " +
                    "dbo.Product.ID, dbo.[Type].Name as NameType, dbo.Product.Name, dbo.Product.Model, " +
                    "dbo.Product.[Description], dbo.Product.Imge, dbo.Product.Price, dbo.Product.Sell, " +
                    "dbo.Product.PricePromotion " +
                    " From " +
                    "((dbo.Product Left Join dbo.ProductType On dbo.Product.ID = dbo.ProductType.IDProduct) " +
                    "Left Join dbo.[Type] On dbo.ProductType.IDType = dbo.[Type].ID) " +
                    " Where " +
                    "dbo.Product.ID = " + strIDPr + " and dbo.ProductType.IDType = " + strIDPrT + ";";
                if (strIDPr != null || strIDPr.Count() > 1)
                {
                    SqlShop sqlShop = new SqlShop();
                    sqlShop.GetData(rptDetailProduct, strSQL);
                }
            }
        }
    }
}