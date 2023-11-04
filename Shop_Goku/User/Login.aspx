<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Shop_Goku.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 15;

            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2> Đăng nhập tài khoản </h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="form_container">
                        <div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Username:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username của bạn..." />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtUsername"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                </div>
                            </div>
                        </div>
                        <div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Password:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Mật khẩu của bạn..." TextMode="Password" />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtPassword"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                </div>
                            </div>
                        </div>
                    </div>
                <%------------- button login ------------------------------------------------------------------------------%>
                    <div class="btn-wrapper">
                        <div class="btn_box">
                            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập ngay" OnClick="btnLogin_Click"/>
                        </div>
                        <div class="kkkkk">
                            <asp:Label ID="lblOr"
                                runat="server"
                                Text="hoặc" />
                            <asp:Label ID="lblAlReadyUser"
                                runat="server"
                                Text="Bạn chưa có tài khoản? <a href='Registration.aspx' class='text-primary'>Đăng ký ngay</a>" />
                        </div>
                    </div>
                </div>

                <div class="col-md-4 wrapper-image-logo">
                    <div class="image-logo">
                        <img src="../Images/logo-goku.png" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
