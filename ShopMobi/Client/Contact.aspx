﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMobi/Client/Default.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ShopMobi.ShopMobi.Client.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contectPage" runat="server">

    <section class="contact-us">
        <div class="container">
            <div class="heading-sub">
                <h3 class="pull-left">Liên hệ</h3>
                <ul class="other-link-sub pull-right">
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a class="active" href="#">Liên hệ</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="contact-info-heading">
                <div class="row">
                    <div class="col-md-4 contact-column-inner">
                        <div class="contact-box">
                            <div class="contact-box-icon"><i class="ion-ios-location icon-contact"></i></div>
                            <div class="contact-box-information">
                                One World Trade Center Suite 8500 New York, NY 1006, United State of America
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 contact-column-inner">
                        <div class="contact-box">
                            <div class="contact-box-icon"><i class="ion-ios-telephone icon-contact"></i></div>
                            <div class="contact-box-information">
                                (800) 8001-8588 | (800) 8001-9669
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 contact-column-inner">
                        <div class="contact-box">
                            <div class="contact-box-icon"><i class="ion-email icon-contact"></i></div>
                            <div class="contact-box-information">
                                shoppee@support.com
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contact-info-content">
                <div class="row">
                    <div class="col-md-6">
                        <%--<form action="#" class="contact-form">--%>
                        <div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <strong>First Name</strong>
                                        <input type="text" name="first_name" class="form-control" value="">
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <strong>Email *</strong>
                                        <input type="text" name="last_name" class="form-control" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <strong>Phone Number</strong>
                                        <input type="text" name="first_name" class="form-control" value="">
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <strong>Subject</strong>
                                        <input type="text" name="last_name" class="form-control" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <strong>Your Messenge</strong>
                                        <textarea name="note" id="message" tabindex="2" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn-send-message">SEND MESSENGE</button>
                        </div>
                        <%--</form>--%>
                    </div>
                    <div class="col-md-6">
                        <div id="googlemap1" style="height: 370px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
