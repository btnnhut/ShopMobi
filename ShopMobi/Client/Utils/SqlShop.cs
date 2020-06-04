using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using ShopMobi.ShopMobi.Client;

namespace ShopMobi.ShopMobi.Client.Utils
{
    public class SqlShop: SqlUtils
    {
        //Result one value string
        public string ExecuteScalar(string sqlQuery)
        {
            SqlUtils sqlUtils = new SqlUtils();
            sqlUtils.openConnect();
            SqlCommand cmd =new SqlCommand(sqlQuery, sqlUtils.con);
            string res = cmd.ExecuteScalar().ToString();
            sqlUtils.closeConnect();
            return res;
        }

        public void GetData(Repeater target, string sqlQuery)
        {
            SqlUtils sqlUtils = new SqlUtils();
            DataTable dt = sqlUtils.executeReader(sqlQuery, null);
            target.DataSource = dt;
            target.DataBind();
        }
    }
}