<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="ListProduct.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contectPage" runat="server">
    <section class="shop-list-v3-page">
        <div class="container">
            <div class="heading-sub">
                <h3 class="pull-left"><%=nameProduct %></h3>
                <ul class="other-link-sub pull-right">
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="Home.aspx">điện thoại</a></li>
                    <li><a class="active" href="#"><%=nameProduct %></a></li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="widget-banner">
                <a href="#" class="images">
                    <img src="/Areas/Client/statics/img/products/banner-v3.png" alt="images" class="img-responsive"></a>
                <div class="banner-text">
                    <h2>Just Press</h2>
                    <p>Mini camera by Instax</p>
                </div>
                <div class="banner-button">
                    <a class="btn-getit">Get It</a>
                </div>
            </div>

            <div class="widget-product-list">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-list">
                            <div class="product-list grid_full grid_sidebar grid-uniform">


                                <asp:Repeater ID="rptProduct" runat="server">
                                    <ItemTemplate>
                                        <div class="product-list-item">
                                            <div class="product-item-img">
                                                <a href="/ShopMobi/Client/DetailProduct.aspx?idPr=<%# Eval("ID") %>&idPrT=<%# Eval("IDType") %>&quantity=1">
                                                    <img src="<%# Eval("Imge") %>" alt="images" class="img-responsive"></a>
                                                <div class="label label-2 red label-top-20">Hot</div>
                                            </div>
                                            <div class="product-item-info">
                                                <h3><a href="#" title=""><%# Eval("Name") %></a></h3>
                                                <div class="product-item-star ratingstar sm">
                                                    <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                    <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                    <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                    <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                    <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                    <span class="number">(12)</span>
                                                </div>
                                                <div class="prod-price">
                                                    <%# Eval("Price")!=DBNull.Value && Eval("Sell")!=DBNull.Value && 
                                                            (Convert.ToDecimal(Eval("Price"))==Convert.ToDecimal(Eval("Sell")))?
                                                            "<span class='price black'>$"+Eval("Price","{0:#,##0}")+"</span>":@""%>
                                                    <%# Eval("PricePromotion")==DBNull.Value && Eval("Sell")==DBNull.Value && 
                                                            Eval("Price")!=DBNull.Value?"<span class='price black'>$"+Eval("Price","{0:#,##0}")+"</span>":@""%>
                                                    <%# Eval("PricePromotion")!=DBNull.Value?"<span class='price old'>$"+Eval("Price","{0:#,##0}")+"</span>"
                                                                    +"<span class='price black'>$"+Eval("Sell","{0:#,##0}")+"</span>"
                                                                    +"<span class='price'>$"+Eval("PricePromotion","{0:#,##0.00}")+"</span>":@""%>
                                                    <%# Eval("Price")!=DBNull.Value && Eval("Sell")!=DBNull.Value && (Eval("PricePromotion")==DBNull.Value && Convert.ToDecimal(Eval("Price"))
                                                                    >Convert.ToDecimal(Eval("Sell"))) ? "<span class='price old'>$"+Eval("Price","{0:#,##0}")+"</span>"+
                                                                    "<span class='price'>$"+Eval("Sell","{0:#,##0}")+"</span>":@"" %>
                                                </div>
                                                <div class="prod-item-img bd-style-2">
                                                    <div class="button-ver2">
                                                        <a href="/ShopMobi/Client/AddCart.aspx?idPr=<%# Eval("ID") %>&quantity=1&idPrT=<%# Eval("IDType") %>" class="addcart-ver2" title="Add to cart"><span class="icon"></span>ADD TO CART</a>
                                                        <a href="#" class="quickview" title="quick view"><i class="ion-eye fa-4" aria-hidden="true"></i></a>
                                                        <a href="#" class="wishlist" title="wishlist"><i class="ion-heart fa-4" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                            <div class="product-pagination">
                                <ul class="pagination">
                                    <%= intCountPage != 1 && intNumberPage!=1? "<li><a href='"+linkLeftPage+"'><i class='ion-chevron-left'></i></a></li>" :null%>


                                    <asp:Repeater ID="rptPageList" runat="server">
                                        <ItemTemplate>
                                            <li <%#Convert.ToInt32(Eval("intFlagPage")) == intNumberPage ? "class='active'":"" %>>
                                                <a href="ListProduct.aspx?detail=<%# 
                                                    Eval("idType") %>&nameType=<%# Eval("strNameType") %>&countPage=<%# 
                                                    Eval("intCountPage") %>&idFirstPro=<%# Eval("intIdFirstPro") %>&flagPage=<%# 
                                                    Eval("intFlagPage") %>&numberPage=<%# Eval("intNumberPage") %>">
                                                    <%# Eval("intNumberPage") %></a></li>
                                            <%--<li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">...</a></li>
                                            <li><a href="#">4</a></li>--%>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <%= intCountPage != 1 && intNumberPage!=intCountPage ? "<li><a href='"+linkRightPage+"'><i class='ion-chevron-right'></i></a></li>" :null%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
