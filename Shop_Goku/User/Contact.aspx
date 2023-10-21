<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Shop_Goku.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- book section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <h2>Đặt bàn ăn...</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <form action="">
                            <div>
                                <input type="text" class="form-control" placeholder="Họ và tên..." />
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="Số điện thoại..." />
                            </div>
                            <div>
                                <input type="email" class="form-control" placeholder="Email liên hệ..." />
                            </div>
                            <div>
                                <select class="form-control nice-select wide">
                                    <option value="" disabled selected>Bạn đặt bàn cho mấy người ?</option>
                                    <option value="">1</option>
                                    <option value="">2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                </select>
                            </div>
                            <div>
                                <input type="date" class="form-control">
                            </div>
                            <div class="btn_box">
                                <button>Đặt bàn ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="map_container ">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end book section -->
</asp:Content>
