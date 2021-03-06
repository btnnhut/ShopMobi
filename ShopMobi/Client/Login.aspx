﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contectPage" runat="server">
        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <div class="heading-sub">
                    <h3 class="pull-left">LOGIN</h3>
                    <ul class="other-link-sub pull-right">
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a class="active" href="#">Login</a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="panel panel-login">
                    <div class="panel-heading">
                        <a href="#" class="active" id="login-form-link">Login</a>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <%--<form id="login-form" action="#" method="post" role="form" style="display: block;">--%>
                                <div>
                                    <div class="form-group">
                                        <label runat="server" name="lbUserName" id="lbUserName" class="alert-danger"></label>
                                        <input runat="server" type="text" name="username" id="username" tabindex="1" 
                                            class="form-control" placeholder="Username">
                                    </div>
                                    <div class="form-group">
                                        <label runat="server" name="lbPass" id="lbPass" class="alert-danger"></label>
                                        <input runat="server" type="password" name="password" id="password" tabindex="2" 
                                            class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                        <label for="remember">Remember Me</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <%--<asp:Button ID="btnLogin" name="btnLogin" TabIndex="4" class="form-control btn btn-login" Text="Log In" OnClick="onClickLogIn" runat="server" />--%>
                                                <input runat="server" type="submit" name="login-submit" tabindex="4" 
                                                    class="form-control btn btn-login" value="Log In" onserverclick="clickLogin">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="text-center">
                                                    <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--</form>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
