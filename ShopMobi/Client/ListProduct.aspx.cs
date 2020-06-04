using ShopMobi.ShopMobi.Client.Code;
using ShopMobi.ShopMobi.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopMobi.ShopMobi.Client.Utils;

namespace ShopMobi.ShopMobi.Client
{
    public partial class ListProduct : System.Web.UI.Page
    {
        public string nameProduct { get; set; }
        public int intNumberPage { get; set; }
        public int intCountPage { get; set; }
        public int intFagPage { get; set; }
        public string linkLeftPage { get; set; }
        public string linkRightPage { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //get url: detail=IDType, nameType=strNameType, countPage=intCountPage, idFirstPro=intIdFirstPro,
            //flagPage=intFagPage, numberPage=intNumberPage
            if (!Page.IsPostBack)
            {

                string strDetail = Request.QueryString.Get("detail");
                int intIDType = Convert.ToInt32(Request.QueryString.Get("detail"));
                string strNameType = Request.QueryString.Get("nameType");
                intCountPage = Convert.ToInt32(Request.QueryString.Get("countPage"));
                int intIdFirstPro = Convert.ToInt32(Request.QueryString.Get("idFirstPro"));
                intFagPage = Convert.ToInt32(Request.QueryString.Get("flagPage"));
                int leftPage = intFagPage - 1;
                int rightPage = intFagPage + 1;
                intNumberPage = Convert.ToInt32(Request.QueryString.Get("numberPage"));
                nameProduct = strNameType;

                //System.Diagnostics.Debug.WriteLine("*******************");
                //System.Diagnostics.Debug.WriteLine(nameProduct);
                if (strDetail != null || strDetail.Count() > 0)
                {
                    string strSql;
                    SqlShop sqlShop = new SqlShop();
                    strSql = "" +
                        " Select " +
                        "Top 6 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, " +
                        "dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType " +
                        " From " +
                        "((dbo.Product Left Join dbo.ProductType On dbo.Product.ID = dbo.ProductType.IDProduct) Left Join " +
                        "dbo.[Type] On dbo.ProductType.IDType = dbo.[Type].ID) " +
                        " Where " +
                        "dbo.[Type].ID=" + intIDType.ToString() + " and dbo.Product.ID > " + intIdFirstPro.ToString() + " " +
                        " Order by " +
                        "dbo.Product.ID ASC;";
                    //GetData(rptProduct, strSql);
                    sqlShop.GetData(rptProduct, strSql);
                    sqlShop.closeConnect();
                    if (intCountPage != 1)
                    {
                        int intIDPro = 0;
                        List<ClassPage> listClassPage = new List<ClassPage>();
                        for (int i = 1; i <= intCountPage; i++)
                        {

                            if ((i + 1) == intNumberPage)
                            {
                                linkLeftPage = NextPage(strDetail, strNameType, intCountPage.ToString(), intIDPro.ToString(),
                                    i.ToString(), i.ToString());
                            }
                            if ((i - 1) == intNumberPage)
                            {
                                linkRightPage = NextPage(strDetail, strNameType, intCountPage.ToString(), intIDPro.ToString(),
                                    i.ToString(), i.ToString());
                            }
                            ClassPage clsPage = new ClassPage();
                            SqlUtils sqlUtils1 = new SqlUtils();
                            strSql = "" +
                                " Select " +
                                "Top 6 dbo.ProductType.IDProduct as ID " +
                                " From " +
                                "dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID " +
                                " Where " +
                                "dbo.[Type].ID= " + intIDType + " and dbo.ProductType.IDProduct > " + intIDPro + " " +
                                " Order by " +
                                "dbo.ProductType.IDProduct ASC;";
                            DataTable dt = sqlUtils1.executeReader(strSql, null);
                            clsPage.idType = intIDType;
                            clsPage.strNameType = strNameType;
                            clsPage.intCountPage = intCountPage;
                            clsPage.intIdFirstPro = intIDPro;
                            clsPage.intFlagPage = i;
                            clsPage.intNumberPage = i;
                            intIDPro = Convert.ToInt32((dt.Rows[dt.Rows.Count - 1]["ID"].ToString()));
                            sqlUtils1.closeConnect();
                            listClassPage.Add(clsPage);
                        }
                        rptPageList.DataSource = listClassPage;
                        rptPageList.DataBind();

                    }
                }
            }
        }

        private string NextPage(string strDetail, string strNameType, string CountPage, string idFirstPro,
            string flagPage, string numberPage)
        {
            string link = "/ShopMobi/Client/ListProduct.aspx?detail=" + strDetail + "&" +
                                "nameType=" + strNameType + "&countPage=" + CountPage + "&" +
                                "idFirstPro=" + idFirstPro + "&flagPage=" + flagPage + "&" +
                                "numberPage=" + numberPage + "";
            return link;
        }
    }
}