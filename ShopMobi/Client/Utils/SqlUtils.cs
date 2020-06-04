using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ShopMobi.ShopMobi.Client
{
    public class SqlUtils
    {
        private static string ConnectionString = @"Server=DESKTOP-KRDT4MF\SQLEXPRESS;Database=ShopMobi;User Id=sa;Password=123123;";
        public SqlConnection con;
        public SqlUtils()
        {
            con = new SqlConnection(ConnectionString);
        }

        public void openConnect()
        {
            con.Open();
        }
        public void closeConnect()
        {
            con.Close();
        }

        public void ExecuteNonQuery(String strQuery, Dictionary<string, object> dic)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(strQuery, con);
            addPara(cmd, dic);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //return DataTable
        public DataTable executeDataAdapter(string query, Dictionary<string, object> dic)
        {
            using (SqlConnection myConnection = new SqlConnection(ConnectionString))
            {
                string strList = getParasForStore(dic);
                SqlCommand cmd = new SqlCommand(query + " " + strList, con);
                addPara(cmd, dic);
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                //If the connection is closed before Fill is called,
                //it is opened to retrieve data, then closed. If the connection is open before Fill is called, it remains open.
                //https://docs.microsoft.com/en-us/dotnet/api/system.data.common.dataadapter.fill?view=netframework-4.8
                da.Fill(dt); // tự động mở/đóng
                return dt;
            }
        }

        //return DataTable
        public DataTable executeReader(string query, Dictionary<string, object> dic)
        {
            con.Open();
            DataTable dt = new DataTable();
            string strList = getParasForStore(dic);
            //dt.Load(cmd.ExecuteReader(CommandBehavior.CloseConnection));
            SqlCommand cmd = new SqlCommand(query + " " + strList, con);
            addPara(cmd, dic);
            dt.Load(cmd.ExecuteReader()); // ko close vì cần nó để mà chạy runtime
            return dt;
        }

        public string getParasForStore(Dictionary<string, object> dic)
        {
            if (dic == null || dic.Count() <= 0) return "";
            string rs = "";
            foreach (KeyValuePair<string, object> pair in dic)
            {
                rs += "@" + pair.Key + " ";
            }
            return rs;
        }

        public void addPara(SqlCommand cmd, Dictionary<string, object> dic)
        {
            if (dic == null || dic.Count() <= 0) return;
            foreach (KeyValuePair<string, object> pair in dic)
                cmd.Parameters.AddWithValue("@" + pair.Key, pair.Value);
        }
      
    }
}