<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.Home" %>

<asp:Content ID="Home01" ContentPlaceHolderID="contectPage" runat="server">
    <!-- /header -->
    <div class="slide v3">
        <div class="single-item js-banner">
            <div class="slide-img">
                <img src="/Areas/Client/statics/img/slider/image-slider8.jpg" alt="images" class="img-reponsive">
                <div class="slide-content-ver2">
                    <h5>NUA Ti-CORE - THE HEART OF YOUR PHONE</h5>
                    <h3>Titanium Pro<br>
                    </h3>
                    <a href="#" class="slide-button-ver2">Buying Option</a>
                    <i class="ion-ios-arrow-forward icon-sub-banner green"></i>
                </div>
                <div class="slide-ribbon orange">
                    only now
                    <br>
                    <strong>$200</strong>
                </div>
            </div>

            <div class="slide-img">
                <img src="/Areas/Client/statics/img/slider/image-slider9.jpg" alt="images" class="img-reponsive">
                <div class="slide-content-ver2">
                    <h5>NUA Ti-CORE - THE HEART OF YOUR PHONE</h5>
                    <h3>Titanium Pro<br>
                    </h3>
                    <a href="#" class="slide-button-ver2">Buying Option</a>
                    <i class="ion-ios-arrow-forward icon-sub-banner green"></i>
                </div>
                <div class="slide-ribbon orange">
                    only now
                    <br>
                    <strong>$200</strong>
                </div>
            </div>

            <div class="slide-img">
                <img src="/Areas/Client/statics/img/slider/image-slider12.jpg" alt="images" class="img-reponsive">
                <div class="slide-content-ver2">
                    <h5>NUA Ti-CORE - THE HEART OF YOUR PHONE</h5>
                    <h3>Titanium Pro<br>
                    </h3>
                    <a href="#" class="slide-button-ver2">Buying Option</a>
                    <i class="ion-ios-arrow-forward icon-sub-banner green"></i>
                </div>
                <div class="slide-ribbon orange">
                    only now
                    <br>
                    <strong>$800</strong>
                </div>
            </div>

            <div class="slide-img">
                <img src="/Areas/Client/statics/img/slider/image-slider5.jpg" alt="images" class="img-reponsive">
                <div class="slide-content-ver2">
                    <h5>NUA Ti-CORE - THE HEART OF YOUR PHONE</h5>
                    <h3>Titanium Pro<br>
                    </h3>
                    <a href="#" class="slide-button-ver2">Buying Option</a>
                    <i class="ion-ios-arrow-forward icon-sub-banner green"></i>
                </div>
                <div class="slide-ribbon orange">
                    only now
                    <br>
                    <strong>$800</strong>
                </div>
            </div>
        </div>
    </div>


    <section class="featured-product">
        <asp:Repeater ID="event" runat="server" OnItemDataBound="event_ItemDataBound">
            <ItemTemplate>

                <div class="container">
                    <%--  --%>
                    <div class="heading-v1">
                        <h3 class="pull-left"><%# Eval("NameType") %></h3>
                        <ul class="otherr-link pull-right">
                            <li class="active"><a id="linkAll" name="linkAll" href="ListProduct.aspx?detail=<%# Eval("IDType") %>&nameType=<%# Eval("NameType") %>&countPage=<%# Convert.ToInt32(Eval("countIDPro"))%6==0?Convert.ToInt32(Eval("countIDPro"))/6: Convert.ToInt32(Eval("countIDPro"))/6+1%>&idFirstPro=0&flagPage=1&numberPage=1">xem tất cả</a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="tab-content">
                        <div id="all" class="tab-pane fade in active">
                            <div class="prod-fea-list">
                                <div class="row">

                                    <asp:Repeater ID="product" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-15 col-sm-4 col-xs-6">
                                                <div class="product-item ver2">
                                                    <div class="prod-item-img bd-style-2">
                                                        <a href="/ShopMobi/Client/DetailProduct.aspx?idPr=<%# Eval("IDPro") %>&idPrT=<%# Eval("IDType") %>&quantity=1">
                                                            <%--<img src="/Areas/Client/statics/img/products/smarphone.jpg" alt="images" class="img-responsive"></a>--%>
                                                            <img src='<%# Eval("ImgePro") %>' alt="images" class="img-responsive"></a>
                                                        <div class="button">
                                                            <a href="/ShopMobi/Client/AddCart.aspx?idPr=<%# Eval("IDPro") %>&quantity=1&idPrT=<%# Eval("IDType") %>" class="addcart">ADD TO CART</a>
                                                            <a href="/ShopMobi/Client/Cart.aspx" class="view"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="prod-info">
                                                        <h3><a href="#"><%# Eval("NamePro") %></a></h3>
                                                        <div class="ratingstar sm">
                                                            <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                            <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                            <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                            <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                            <a href="#"><i class="fa fa-star-o fa-1" aria-hidden="true"></i></a>
                                                            <span class="number">(12)</span>
                                                        </div>
                                                        <div class="prod-price">
                                                            <%# Eval("Price")!=null && Eval("Sell")!=null && 
                                                            (Convert.ToDecimal(Eval("Price"))==Convert.ToDecimal(Eval("Sell")))?
                                                            "<span class='price black'>$"+Eval("Price","{0:#,##0}")+"</span>":@""%>

                                                            <%# Eval("PricePromotion")==null && Eval("Sell")==null && 
                                                            Eval("Price")!=null?"<span class='price black'>$"+Eval("Price","{0:#,##0}")+"</span>":@""%>
                                                            <%# Eval("PricePromotion")!=null?"<span class='price old'>$"+Eval("Price","{0:#,##0}")+"</span>"
                                                                    +"<span class='price black'>$"+Eval("Sell","{0:#,##0}")+"</span>"
                                                                    +"<span class='price'>$"+Eval("PricePromotion","{0:#,##0.00}")+"</span>":@""%>
                                                            <%# Eval("Price")!=null && Eval("Sell")!=null && (Eval("PricePromotion")==null && Convert.ToDecimal(Eval("Price"))
                                                                    >Convert.ToDecimal(Eval("Sell"))) ? "<span class='price old'>$"+Eval("Price","{0:#,##0}")+"</span>"+
                                                                    "<span class='price'>$"+Eval("Sell","{0:#,##0}")+"</span>":@"" %>



                                                            <%--gia ban(gia ban)--%>
                                                            <%--<span class="price black">$212.20</span>--%>
                                                            <%--gia ban(gach bo)--%>
                                                            <%--<span class="price old">$699.6</span>--%>
                                                            <%--gia ban(kem gia gach bo)--%>
                                                            <%--<span class="price">$510.02</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </section>

</asp:Content>
