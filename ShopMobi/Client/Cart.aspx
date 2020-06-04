<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contectPage" runat="server">
    <section class="checkout-page">
        <div class="container">
            <div class="heading-sub">
                <h3 class="pull-left">Giỏ hàng</h3>
                <ul class="other-link-sub pull-right">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#shop">Shop</a></li>
                    <li><a class="active" href="#cart">Giỏ hàng</a></li>
                </ul>
            </div>
            <div class="checkout-cart-form">
                <div class="row">
                    <div class="col-md-8 col-sm-12">
                        <table class="table shop_table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Mobi</th>
                                    <th class="product-name">Tên sản phẩm</th>
                                    <th class="product-price">Giá</th>
                                    <th class="quantity">Lượng</th>
                                    <th class="product-subtotal">Tiền</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater ID="rptCart" runat="server" OnItemDataBound="rptCart_ItemDataBound">
                                    <ItemTemplate>
                                        <tr class="cart_item">
                                            <td class="product-thumbnail"><a runat="server" id="hrefDetailPro">
                                                <%--<td class="product-thumbnail"><a href="#">--%>
                                                <%--<img src="<%# Eval("Image") %>" alt="images" class="img-responsive"></a></td>--%>
                                                <img runat="server" src="#" id="imgDetailPro" alt="images" class="img-responsive"></a></td>
                                            <td class="product-name">
                                                <%--<a href="#"><%# Eval("Name") %></a>--%>
                                                <a runat="server" id="nameProduct"></a>
                                            </td>
                                            <td class="product-price">
                                                <%--<p class="price"><%# Eval("Sell","{0:#,##0}") %></p>--%>
                                                <p runat="server" id="priceProduct" class="price"></p>
                                            </td>
                                            <td class="product-quantity">
                                                <div class="quantity">
                                                    <%--<input runat="server" id="txtQuantity" type="text" name="quantity" value="<%# Eval("Quantity","{0:#,##0}") %>">--%>
                                                    <input runat="server" id="txtQuantity" type="text" name="quantity">
                                                    <%--<input runat="server" id="txtQuantity" type="text" name="quantity" value="100">--%>
                                                </div>
                                            </td>
                                            <td class="product-price product-subtotal">
                                                <%--<p class="price"><%# String.Format("{0:#,##0}",(Convert.ToDecimal(Eval("Sell"))*Convert.ToDecimal(Eval("Quantity")))) %></p>--%>
                                                <p runat="server" id="totalPric" class="price"></p>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="aside-shopping-cart-total">
                            <h2>Tổng tiền giỏ hàng</h2>
                            <ul>

                                <li><span class="text"></span><span class="cart-number big-total-number"><%= sumTotal %></span></li>
                            </ul>
                            <div class="process">
                                <%--<button runat="server" id="btnPay" type="submit" class="btn-checkout">Thanh toán</button>--%>
                                <asp:Button runat="server" ID="btnPay" Text="Thanh toán" CssClass="btn-checkout" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
