using ShopMobi.ShopMobi.Client.Utils;
using ShopMobi.ShopMobi.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public partial class Cart : System.Web.UI.Page
    {
        public string sumTotal { get; set; }
        public string sumQuan { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                if (userLogin != null)
                {
                    string nameID = userLogin.userName;
                    GetCart(nameID);
                    if (Home.classCartDe.Count > 0)
                    {
                        rptCart.DataSource = Home.classCartDe;
                        rptCart.DataBind();
                        List<string> listStr = GetTotalTempCart();

                        if (listStr != null)
                        {
                            sumTotal = listStr[0];
                            sumQuan = listStr[1];
                        }
                    }
                    else
                    {
                        Cart cart = new Cart();
                        List<string> listStr = cart.GetTotalcart(nameID);
                        if (listStr != null)
                        {
                            sumTotal = listStr[0];
                            sumQuan = listStr[1];
                        }
                    }
                }
                else
                {
                    rptCart.DataSource = Home.classCartDe;
                    rptCart.DataBind();
                    List<string> listStr = GetTotalTempCart();
                    if (listStr != null)
                    {
                        sumTotal = listStr[0];
                        sumQuan = listStr[1];
                    }
                }
            }
        }
        private void GetCart(string nameID)
        {
            string strSql = "" +
                " SELECT " +
                            "dbo.Cart.IDProduct, dbo.Cart.IDType, dbo.Cart.Name, dbo.Cart.[Image], " +
                            "dbo.Cart.Sell, dbo.Cart.Quantity " +
                " FROM " +
                            "dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount = dbo.Account.ID " +
                " WHERE " +
                            "dbo.Account.NameID = '" + nameID + "'; ";
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(strSql, null);
            foreach (DataRow dr in dt.Rows)
            {
                AddCart addCart = new AddCart();
                addCart.tempCart(dr["IDProduct"].ToString(), dr["IDType"].ToString(), dr["Quantity"].ToString());
            }
        }
        public List<string> GetTotalTempCart()
        {
            if (Home.classCartDe.Count != 0)
            {
                int quantity = 0;
                long sellTotal = 0;
                List<string> listStr = new List<string>();
                foreach (ClassCart cart in Home.classCartDe)
                {
                    sellTotal = sellTotal + Convert.ToInt32(cart.Quantity) * Convert.ToInt32(cart.Sell);
                    quantity += cart.Quantity;
                }
                if (quantity != 0 && sellTotal != 0)
                {
                    sumTotal = "$" + String.Format("{0:#,##0}", sellTotal);
                    sumQuan = String.Format("{0:#,##0}", quantity);
                    listStr.Add(sumTotal);
                    listStr.Add(sumQuan);
                }
                return listStr;
            }
            else
                return null;
        }

        public List<string> GetTotalcart(string strIDName)
        {
            List<string> listStr = new List<string>();
            string strSql = "" +
                " Select " +
                "sum(dbo.Cart.Sell*dbo.Cart.Quantity) as sumTotal, sum(dbo.Cart.Quantity) as sumQuantity " +
                " From " +
                "dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount = dbo.Account.ID " +
                " Where " +
                " dbo.Account.NameID = '" + strIDName + "'; ";
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(strSql, null);
            if (dt.Rows[0]["sumTotal"] != DBNull.Value)
            {
                double decTotal = Convert.ToDouble(dt.Rows[0]["sumTotal"]);
                double decQuan = Convert.ToDouble(dt.Rows[0]["sumQuantity"]);
                //String.Format("{0:#,##0}", 123.4567);
                listStr.Add("$" + String.Format("{0:#,##0}", decTotal));
                listStr.Add(String.Format("{0:#,##0}", decQuan));
                //sumQuan = dt.Rows[0]["sumQuantity"].ToString();
                return listStr;
            }
            return null;
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
            Home.classCartDe.Clear();
            foreach (RepeaterItem item in this.rptCart.Items)
            {
                ClassCart classCart = new ClassCart();
                int quantity = Convert.ToInt32(((HtmlInputText)item.FindControl("txtQuantity") as HtmlInputText).Value);
                classCart.Quantity = quantity;
                classCart.Name = ((HtmlAnchor)item.FindControl("nameProduct") as HtmlAnchor).InnerText;
                classCart.Image = ((HtmlImage)item.FindControl("imgDetailPro") as HtmlImage).Src;
                classCart.Sell = Convert.ToDouble(((HtmlGenericControl)item.FindControl("priceProduct") as HtmlGenericControl).InnerHtml);
                string uralDetail = ((HtmlAnchor)item.FindControl("hrefDetailPro") as HtmlAnchor).HRef;
                classCart.IDProduct = Convert.ToInt32(HttpUtility.ParseQueryString(uralDetail.Substring(new[]
                { 0, uralDetail.IndexOf('?') }.Max())).Get("idPr"));
                classCart.IDType = Convert.ToInt32(HttpUtility.ParseQueryString(uralDetail.Substring(new[]
                { 0, uralDetail.IndexOf('?') }.Max())).Get("idPrT"));

                if (quantity > 0)
                {
                    if (userLogin == null)
                    {
                        Home.classCartDe.Add(classCart);
                    }
                    else
                    {
                        AddCart addCart = new AddCart();
                        int quantityCheck = Convert.ToInt32(addCart.checkCart(userLogin.userName,
                            classCart.IDType.ToString(), classCart.IDProduct.ToString()));
                        if (quantityCheck != quantity)
                        {
                            int quan = quantity - quantityCheck;
                            addCart.InserCart(classCart.IDProduct.ToString(), classCart.IDType.ToString(),
                                quan.ToString(), userLogin.userName);
                        }
                    }
                }
                else
                {
                    if (userLogin != null)
                    {
                        AddCart addCart = new AddCart();
                        addCart.deleCart(userLogin.userName, classCart.IDType.ToString(), classCart.IDProduct.ToString());
                    }
                }
            }
            if (userLogin != null)
                Response.Redirect("Home.aspx");
            else
                Response.Redirect("Login.aspx");
        }

        protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ClassCart user = e.Item.DataItem as ClassCart;
                (e.Item.FindControl("imgDetailPro") as HtmlImage).Src = user.Image;
                (e.Item.FindControl("nameProduct") as HtmlAnchor).InnerHtml = user.Name;
                (e.Item.FindControl("priceProduct") as HtmlGenericControl).InnerHtml = String.Format("{0:#,##0}", user.Sell);
                (e.Item.FindControl("totalPric") as HtmlGenericControl).InnerHtml = String.Format("{0:#,##0}", user.Sell * user.Quantity);
                HtmlInputText htmlTextBox = (HtmlInputText)e.Item.FindControl("txtQuantity");
                htmlTextBox.Value = String.Concat(user.Quantity);

                HtmlAnchor htmlDetailPro = (HtmlAnchor)e.Item.FindControl("hrefDetailPro");
                string idProduct = user.IDProduct.ToString();
                string idType = user.IDType.ToString();
                string quantity = user.Quantity.ToString();
                htmlDetailPro.HRef = String.Concat("/ShopMobi/Client/DetailProduct.aspx?idPr=" + idProduct +
                    "&idPrT=" + idType + "&quantity=" + quantity + "");
            }
        }

        protected override void OnInit(EventArgs e)
        {
            this.rptCart.ItemDataBound += new RepeaterItemEventHandler(rptCart_ItemDataBound);
            this.btnPay.Click += new EventHandler(btnPay_Click);
            base.OnInit(e);
        }
    }
}