using ShopMobi.ShopMobi.Client.Code;
using ShopMobi.ShopMobi.Client.Utils;
using ShopMobi.ShopMobi.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public partial class Home : System.Web.UI.Page
    {
        public static List<ClassCart> classCartDe = new List<ClassCart>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                List<ClassProduct> listProduct = GetListData();
                @event.DataSource = listProduct;
                @event.DataBind();
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                if (userLogin != null)
                {
                    string strAccount = userLogin.userName;
                    if (classCartDe.Count != 0)
                    {
                        foreach (ClassCart cart in classCartDe)
                        {
                            AddCart addCart = new AddCart();
                            addCart.InserCart(cart.IDProduct.ToString(), cart.IDType.ToString(), cart.Quantity.ToString(), strAccount);
                        }
                        classCartDe.Clear();
                    }
                }
            }
        }

        //public void GetData(Repeater target, string sqlQuery)
        //{
        //    SqlUtils sqlUtils = new SqlUtils();
        //    DataTable dt = sqlUtils.executeReader(sqlQuery, null);
        //    target.DataSource = dt;
        //    target.DataBind();
        //}
        private List<ClassProduct> GetListData()
        {
            string strSql = "" +
                " Select " +
                "dbo.[Type].ID,dbo.[Type].Name,dbo.[Type].[Description],count(dbo.ProductType.IDProduct) as countIDPro " +
                " From " +
                "dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID " +
                " Where " +
                "dbo.[Type].[Description]= 'product' " +
                " Group by " +
                "dbo.[Type].ID, dbo.[Type].Name, dbo.[Type].[Description] " +
                " Order " +
                "by dbo.[Type].ID ASC;";
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(strSql, null);
            sqlUtils.closeConnect();

            List<ClassProduct> listProduct = new List<ClassProduct>();
            foreach (DataRow dr in dt.Rows)
            {
                ClassProduct clsPro = new ClassProduct();
                clsPro.IDType = Convert.ToInt32(dr["ID"]);
                clsPro.NameType = dr["Name"].ToString();
                clsPro.DescriptionType = dr["Description"].ToString();
                clsPro.countIDPro = Convert.ToInt32(dr["countIDPro"]);
                string strSql_ = "" +
                    " Select " +
                    "Top 5 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, " +
                    "dbo.Product.Sell, dbo.Product.PricePromotion " +
                    " From " +
                    "((dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType = dbo.[Type].ID) " +
                    "Left Join dbo.Product On dbo.ProductType.IDProduct = dbo.Product.ID) " +
                    " Where " +
                    "dbo.[Type].ID=" + dr["ID"] + " " +
                    " Order by " +
                    "dbo.Product.ID ASC;";
                //SqlUtils sqlUtils1 = new SqlUtils();
                DataTable dataTable = sqlUtils.executeReader(strSql_, null);
                sqlUtils.closeConnect();
                clsPro.ChildListProduct = new List<ClassProduct>();

                foreach (DataRow dr1 in dataTable.Rows)
                {
                    ClassProduct clsChildPro = new ClassProduct();
                    clsChildPro.IDPro = Convert.ToInt32(dr1["ID"]);
                    clsChildPro.IDType = Convert.ToInt32(dr1["IDType"]);
                    clsChildPro.namePro = dr1["Name"].ToString();
                    clsChildPro.ImgePro = dr1["Imge"].ToString();
                    if (dr1["Price"] != DBNull.Value)
                    {
                        clsChildPro.Price = Convert.ToInt64(dr1["Price"]);
                    }
                    if (dr1["Sell"] != DBNull.Value)
                    {
                        clsChildPro.Sell = Convert.ToInt64(dr1["Sell"]);
                    }
                    if (dr1["PricePromotion"] != DBNull.Value)
                    {
                        clsChildPro.PricePromotion = Convert.ToInt64(dr1["PricePromotion"]);
                    }
                    clsPro.ChildListProduct.Add(clsChildPro);
                }
                listProduct.Add(clsPro);
            }
            return listProduct;
        }
        protected void event_ItemDataBound(object sender, RepeaterItemEventArgs args)
        {
            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                ClassProduct user = args.Item.DataItem as ClassProduct;
                Repeater childRepeater = (Repeater)args.Item.FindControl("product");

                childRepeater.DataSource = user.ChildListProduct;
                childRepeater.DataBind();
            }
        }
    }

}