
using ShopMobi.ShopMobi.Client;
using ShopMobi.ShopMobi.Client.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopMobi.Client
{
    public partial class Default : System.Web.UI.MasterPage
    {
        public string sumTotal { get; set; }
        public string sumQuan { get; set; }
        public string account { set; get; }
        public string createAccount { set; get; }
        public string linkCart { set; get; }

        protected void Page_Load(object sender, EventArgs e)
        {

            account = "Đăng nhập";
            createAccount = "Tạo tài khoản";
            if (!Page.IsPostBack)
            {
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                cart.HRef = "~/ShopMobi/Client/Cart.aspx";
                if (userLogin != null)
                {
                    linkLogin.HRef = "~/ShopMobi/Client/Logout.aspx";
                    linkLogin02.HRef = linkLogin.HRef;
                    linkCreateAccount.HRef = "~/ShopMobi/Client/Home.aspx";
                    linkCreateAccount02.HRef = linkCreateAccount.HRef;
                    account = "Đăng xuất";
                    createAccount = userLogin.userName;
                    if (Home.classCartDe.Count > 0)
                    {
                        Cart cart = new Cart();
                        List<string> listStr = cart.GetTotalTempCart();
                        if (listStr != null)
                        {
                            sumTotal = listStr[0];
                            sumQuan = listStr[1];
                        }
                        Home.classCartDe.Clear();
                    }
                    else
                    {
                        Cart cart = new Cart();
                        List<string> listStr = cart.GetTotalcart(createAccount);
                        if (listStr != null)
                        {
                            sumTotal = listStr[0];
                            sumQuan = listStr[1];
                        }
                    }
                }
                else
                {
                    linkLogin.HRef = "~/ShopMobi/Client/Login.aspx";
                    linkLogin02.HRef = linkLogin.HRef;
                    linkCreateAccount.HRef = "~/ShopMobi/Client/Home.aspx";
                    linkCreateAccount02.HRef = linkCreateAccount.HRef;

                    Cart cart = new Cart();
                    List<string> listStr = cart.GetTotalTempCart();
                    if (listStr != null)
                    {
                        sumTotal = listStr[0];
                        sumQuan = listStr[1];
                    }

                }
                string strSql = "" +
                    " SELECT " +
                                "y.ID, y.Name, y.[Description], count(x.IDProduct) as countIDPro " +
                    " FROM " +
                                "dbo.ProductType x Left Join dbo.[Type] y On x.IDType = y.ID " +
                    " WHERE " +
                                "y.[Description] = 'brand' " +
                    " GROUP BY " +
                                "y.ID, y.Name, y.[Description] " +
                    " ORDER BY " +
                                "y.ID ASC; ";
                SqlShop sqlShop = new SqlShop();
                sqlShop.GetData(rptBrand, strSql);
            }
        }
    }
}