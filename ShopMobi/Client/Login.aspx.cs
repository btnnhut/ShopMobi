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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Account"] = "nhut";
            if (!Page.IsPostBack)
            {
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                if (userLogin != null)
                {
                    Response.Redirect("~/ShopMobi/Client/Home.aspx");
                }
            }
        }
        public void clickLogin(object sender, EventArgs e)
        {
            lbUserName.InnerText = "";
            lbPass.InnerText = "";

            SqlShop sqlShop = new SqlShop();
            string nameAccount = username.Value.ToString();
            string passAccount = password.Value.ToString();
            Dictionary<string, string> dicLogin = new Dictionary<string, string>();
            dicLogin.Add("name", nameAccount);
            dicLogin.Add("pass", passAccount);
            string strSql = "" +
                " SELECT " +
                            "x.ID " +
                " FROM " +
                            "dbo.Account x" +
                " WHERE " +
                            "NameID='" + nameAccount + "';";
            string strID = sqlShop.ExecuteScalar(strSql);
            if (strID != "0")
            {
                string strSqlPass = "" +
                " SELECT " +
                            "count(*) as total " +
                " FROM " +
                            "dbo.Account " +
                " WHERE " +
                            "NameID='" + nameAccount + "' and Password='" + passAccount + "';";
                string resultPass = sqlShop.ExecuteScalar(strSqlPass);
                if (resultPass != "0")
                {
                    UserLogin userLogin = new UserLogin();
                    userLogin.userID =Convert.ToInt64(strID);
                    userLogin.userName = nameAccount;
                    Session.Add(CommonConstants.USER_SESSION, userLogin);
                    //Session["Account"] = nameAccount;
                    Response.Redirect("~/ShopMobi/Client/Home.aspx");
                }
                else
                {
                    lbPass.InnerText = "Mat khau khong dung";
                    password.Value = "";
                } 
            }
            else
            {
                lbUserName.InnerText = "User chua dang ky";
                username.Value = "";
                password.Value = "";
            }
        }
    }
}