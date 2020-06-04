using ShopMobi.Client;
using ShopMobi.ShopMobi.Client.Utils;
using ShopMobi.ShopMobi.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public partial class AddCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get idPr, idPrT ,quantity
            //Session["Account"]: IDName
            if (!Page.IsPostBack)
            {
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                string strIdPr = Request.QueryString.Get("idPr");
                string strIdPrT = Request.QueryString.Get("idPrT");
                string strQuantity = Request.QueryString.Get("quantity");
                string strQuantityNew = Request.QueryString.Get("quantityNew");

                if (strQuantityNew != null)
                {
                    int intQuan = Convert.ToInt32(strQuantityNew) - Convert.ToInt32(strQuantity);
                    if (Convert.ToInt32(strQuantityNew) == 0)
                    {
                        strQuantity = strQuantityNew;
                    }
                    else if (intQuan == 0)
                    {
                        strQuantity = strQuantityNew;
                    }
                    else
                        strQuantity = intQuan.ToString();
                }

                if (userLogin != null)
                {
                    string strAccount = userLogin.userName;
                    if (Home.classCartDe.Count > 0)
                    {
                        InserCart(strIdPr, strIdPrT, strQuantity, strAccount);
                        Response.Redirect("~/ShopMobi/Client/Home.aspx");
                    }
                    else
                    {
                        InserCart(strIdPr, strIdPrT, strQuantity, strAccount);
                        Response.Redirect("~/ShopMobi/Client/Home.aspx");
                    }
                    Home.classCartDe.Clear();
                }
                else
                {
                    tempCart(strIdPr, strIdPrT, strQuantity);
                    Response.Redirect("~/ShopMobi/Client/Home.aspx");
                }
            }
        }
        public void tempCart(string strIdPr, string strIdPrT, string strQuantity)
        {
            if (Home.classCartDe.Count == 0)
            {
                InsertCartTemp(strIdPr, strIdPrT, strQuantity);
            }
            else
            {
                int indexCart = -1;
                bool flag = checkCartTemp(strIdPr, strIdPrT);
                if (flag == false)
                {
                    InsertCartTemp(strIdPr, strIdPrT, strQuantity);
                }
                else
                {
                    foreach (ClassCart classCart in Home.classCartDe)
                    {
                        if (classCart.IDProduct == Convert.ToInt32(strIdPr) && classCart.IDType == Convert.ToInt32(strIdPrT)
                            && Convert.ToInt32(strQuantity) != 0)
                        {
                            classCart.Quantity = classCart.Quantity + Convert.ToInt32(strQuantity);
                        }
                        else if (classCart.IDProduct == Convert.ToInt32(strIdPr) && classCart.IDType == Convert.ToInt32(strIdPrT)
                            && Convert.ToInt32(strQuantity) == 0)
                        {
                            indexCart = Home.classCartDe.IndexOf(classCart);
                        }
                    }
                    if (indexCart != -1)
                    {
                        Home.classCartDe.RemoveAt(indexCart);
                    }
                }
            }
        }
        private void InsertCartTemp(string strIdPr, string strIdPrT, string strQuantity)
        {
            ClassCart classCart = new ClassCart();
            string strSql = "" +
                " Select " +
                "dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, dbo.Product.Sell, dbo.Product.PricePromotion " +
                " From " +
                "dbo.Product " +
                " Where " +
                "dbo.Product.ID = " + strIdPr + ";";
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(strSql, null);
            //
            sqlUtils.closeConnect();
            if (dt != null || dt.Rows.Count > 0)
            {
                string strPric = "";
                if (dt.Rows[0]["Price"] != DBNull.Value)
                {
                    strPric = dt.Rows[0]["Price"].ToString();
                }
                if (dt.Rows[0]["Sell"] != DBNull.Value)
                {
                    strPric = dt.Rows[0]["Sell"].ToString();
                }
                if (dt.Rows[0]["PricePromotion"].ToString() != "")
                {
                    strPric = dt.Rows[0]["PricePromotion"].ToString();
                }
                classCart.IDProduct = Convert.ToInt32(strIdPr);
                classCart.IDType = Convert.ToInt32(strIdPrT);
                classCart.Name = dt.Rows[0]["Name"].ToString();
                classCart.Image = dt.Rows[0]["Imge"].ToString();
                classCart.Sell = Convert.ToDouble(strPric);
                classCart.Quantity = Convert.ToInt32(strQuantity);
                Home.classCartDe.Add(classCart);
            }
        }
        private bool checkCartTemp(string strIdPr, string strIdPrT)
        {
            bool flag = false;
            List<ClassCart> classCarts = new List<ClassCart>();
            foreach (ClassCart cart in Home.classCartDe)
            {
                if (cart.IDProduct == Convert.ToInt32(strIdPr) && cart.IDType == Convert.ToInt32(strIdPrT))
                {
                    flag = true;
                }
            }
            return flag;
        }
        public void InserCart(string strIdPr, string strIdPrT, string strQuantity, string strAccount)
        {
            string strCheckCart = checkCart(strAccount, strIdPrT, strIdPr);
            if (String.IsNullOrEmpty(strCheckCart))
            {
                string strSql = "" +
                    " Select " +
                    "dbo.Account.ID, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, dbo.Product.Sell, " +
                    "dbo.Product.PricePromotion " +
                    " From " +
                    "dbo.Product, dbo.Account " +
                    " Where " +
                    "dbo.Product.ID = " + strIdPr + " and   dbo.Account.NameID='" + strAccount + "'; ";
                SqlUtils sqlUtils = new SqlUtils();
                DataTable dt = sqlUtils.executeReader(strSql, null);
                if (dt != null || dt.Rows.Count > 0)
                {
                    string strPric = "";
                    if (dt.Rows[0]["Price"] != DBNull.Value)
                    {
                        strPric = dt.Rows[0]["Price"].ToString();
                    }
                    if (dt.Rows[0]["Sell"] != DBNull.Value)
                    {
                        strPric = dt.Rows[0]["Sell"].ToString();
                    }
                    if (dt.Rows[0]["PricePromotion"].ToString() != "")
                    {
                        strPric = dt.Rows[0]["PricePromotion"].ToString();
                    }
                    string strSqlInsert = "" +
                        " Insert into " +
                        "dbo.Cart(dbo.Cart.IDAccount, dbo.Cart.IDProduct, dbo.Cart.IDType, dbo.Cart.Name, dbo.Cart.[Image], " +
                        "dbo.Cart.Sell, dbo.Cart.Quantity) " +
                        " Values " +
                        "(" + dt.Rows[0]["ID"].ToString() + ", " + strIdPr + ", " + strIdPrT + ",'" + dt.Rows[0]["Name"].ToString() + "', " +
                         "'" + dt.Rows[0]["Imge"].ToString() + "', " + strPric + ", " + strQuantity + ");";
                    sqlUtils.executeDataAdapter(strSqlInsert, null);

                    //Response.Redirect("~/ShopMobi/Client/Home.aspx");5
                }
                sqlUtils.closeConnect();
            }
            else
            {
                int intQuantity = Convert.ToInt32(strQuantity) + Convert.ToInt32(strCheckCart);
                if (Convert.ToInt32(strQuantity) == 0)
                {
                    deleCart(strAccount, strIdPrT, strIdPr);
                }
                else
                    upCart(strAccount, strIdPrT, strIdPr, intQuantity.ToString());
            }
        }
        private void upCart(string nameID, string strIdPrT, string strIdPr, string strQuantity)
        {
            string strSql = "" +
                " Update " +
                "dbo.Cart set dbo.Cart.Quantity=" + strQuantity + " " +
                " Where " +
                "dbo.Cart.IDProduct = " + strIdPr + " and dbo.Cart.IDType=" + strIdPrT + " and " +
                "dbo.Cart.IDAccount = (select dbo.Account.ID " +
                " From " +
                "dbo.Account where dbo.Account.NameID = '" + nameID + "'); ";
            //SqlUtils sqlUtils = new SqlUtils();
            SqlShop sqlShop = new SqlShop();
            sqlShop.ExecuteNonQuery(strSql, null);
            //
            sqlShop.closeConnect();
        }
        public string checkCart(string nameID, string strIDProductType, string strIDProduct)
        {
            string strSql = "" +
                " Select " +
                "dbo.Cart.Quantity " +
                " From " +
                "dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount = dbo.Account.ID " +
                " Where " +
                "dbo.Account.NameID = '" + nameID + "' and dbo.Cart.IDProduct = " + strIDProduct + " and " +
                "dbo.Cart.IDType = " + strIDProductType + ";";
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(strSql, null);
            //
            sqlUtils.closeConnect();
            //if (dt.Rows.Count>0 || dt != null)
            if (dt.Rows.Count > 0)
                return dt.Rows[0]["Quantity"].ToString();
            else
                return null;
        }
        public void deleCart(string namID, string strIdPrT, string strIdPr)
        {
            string strSQL = "" +
                " Delete " +
                "dbo.Cart " +
                " Where " +
                "dbo.Cart.IDProduct = " + strIdPr + " and " +
                "dbo.Cart.IDType = " + strIdPrT + " and " +
                "dbo.Cart.IDAccount = (" +
                " select " +
                "dbo.Account.ID " +
                " From " +
                "dbo.Account " +
                " Where " +
                "dbo.Account.NameID = '" + namID + "');";
            SqlUtils sqlUtils = new SqlUtils();
            sqlUtils.ExecuteNonQuery(strSQL, null);
            sqlUtils.closeConnect();
        }

    }

}