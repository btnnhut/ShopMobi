<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="DetailProduct.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.DetailProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contectPage" runat="server">

    <section class="shop-single-page">
        <div class="container">

            <asp:Repeater ID="rptDetailProduct" runat="server">
                <ItemTemplate>
                    <div class="heading-sub ver2">
                        <h3 class="pull-left"><%# Eval("NameType") %></h3>
                        <ul class="other-link-sub pull-right">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="ListProduct.aspx?detail=<%=strIDPrT %>&nameType=<%# Eval("NameType") %>"><%# Eval("NameType") %></a></li>
                            <li><a class="active" href="#">Thông tin chi tiết</a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="widget-shop-single">


                        <div class="row">
                            <div class="col-md-5">
                                <div class="shop-single-item-img">
                                    <div class="main-img">

                                        <div class="main-img-item">
                                            <a href="#">
                                                <img src="<%# Eval("Imge") %>" alt="images" class="img-responsive"></a>
                                        </div>

                                    </div>
                                    <ul class="multiple-img-list">

                                        <li>
                                            <div class="product-col">
                                                <div class="img">
                                                    <a href="#">
                                                        <img src="<%# Eval("Imge") %>" alt="images" class="img-responsive"></a>
                                                </div>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="shop-sing-item-detail">
                                    <h3><a href="#"><%# Eval("Name") %></a></h3>
                                    <div class="brandname">by <strong><%# Eval("Model") %></strong></div>

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
                                    <div class="description">
                                        <p><%# Eval("Description") %></p>
                                    </div>
                                    <div class="group-button">
                                        <%--<form action="#" class="cart">--%>
                                        <div class="cart">
                                            <div class="quantity">
                                                <button type="button" class="quantity-left-minus btn btn-number" data-type="minus" data-field="">
                                                    <span class="minus-icon"></span>
                                                </button>
                                                <input type="number" name="number" value="<%=strQuantity %>" id="quantity">
                                                <button type="button" class="quantity-right-plus btn btn-number" data-type="plus" data-field="">
                                                    <span class="plus-icon"></span>
                                                </button>
                                            </div>
                                        </div>
                                        <%--</form>--%>
                                        <div class="button-ver2">
                                            <%--<a href="/ShopMobi/Client/AddCart.aspx?idPr=<%# Eval("ID") %>&quantity=1" class="link-ver1 addcart-ver2"><span class="icon"></span>ADD TO CART</a>--%>
                                            <a href="javascript:document.location.href='/ShopMobi/Client/AddCart.aspx?idPr=<%# Eval("ID") %>&idPrT=<%=strIDPrT %>&quantity=<%=strQuantity %>&quantityNew='+ document.getElementById('quantity').value" class="link-ver1 addcart-ver2"><span class="icon"></span>ADD TO CART</a>
                                            <%--<a href="javascript:document.location.href='/ShopMobi/Client/AddCart.aspx?idPr=<%# Eval("ID") %>&idPrT=<%=strIDPrT %>&quantity='+ document.getElementById('quantity').value" class="link-ver1 addcart-ver2"><span class="icon"></span>ADD TO CART</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="product-detail-bottom">
                            <ul class="nav nav-tabs">
                                <%--<li class="active"><a data-toggle="tab" href="#desc">Description</a></li>--%>
                                <li class="active"><a data-toggle="tab" href="#desc">Đặc điểm nổi bật</a></li>
                                <%--<li><a data-toggle="tab" href="#special">Specifications</a></li>--%>
                                <li><a data-toggle="tab" href="#special">Thông số kỹ thuật</a></li>
                                <li><a data-toggle="tab" href="#video">Video</a></li>
                                <%--<li><a data-toggle="tab" href="#review">Reviews</a></li>--%>
                                <li><a data-toggle="tab" href="#review">Nhận xét</a></li>
                            </ul>
                            <div class="tab-content padding-lr">
                                <div id="desc" class="tab-pane fade in active">
                                    <p><%# Eval("Description") %></p>
                                </div>
                                <div id="special" class="tab-pane fade">
                                    <p><%# Eval("Description") %></p>
                                </div>
                                <div id="video" class="tab-pane fade">
                                    <p><%# Eval("Description") %></p>
                                </div>
                                <div id="review" class="tab-pane fade">
                                    <p><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </section>

</asp:Content>
