﻿using ShopMobi.ShopMobi.Client.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UserLogin userLogin = (UserLogin)Session[CommonConstants.USER_SESSION];
                if (userLogin != null)
                {
                    Session.Clear();
                    Session.RemoveAll();
                    Home.classCartDe.Clear();
                    Response.Redirect("Home.aspx");
                }
            }
            else
                Response.Redirect("Home.aspx");
        }
    }
}