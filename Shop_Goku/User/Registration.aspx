<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Shop_Goku.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 15;

            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>
<%--    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID %>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2> Đăng ký tài khoản </h2>"></asp:Label>
            </div>
            <div class="row">
                <%------------- form left -------------------------------------------------------------------------------%>
                <div class="col-md-8">
                    <div class="form_container">
                        <div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Họ và tên:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Họ tên của bạn..." />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtName"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                </div>
                            </div>
                        </div>
                        <div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">User name:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtUsename" runat="server" CssClass="form-control" placeholder="Username của bạn..." />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtUsename"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                </div>
                            </div>
                        </div>
                        <%--<div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Email :</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email của bạn..." />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtEmail"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                        ErrorMessage="Không đúng định dạng email. Vui lòng kiểm tra lại!"
                                        ControlToValidate="txtEmail"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
                                </div>
                            </div>
                        </div>--%>
                        <div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Mật khẩu:</label>
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
                        <%--<div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Số điện thoại:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Số điện thoại của bạn..." TextMode="Number" />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtMobile"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                    <asp:RegularExpressionValidator ID="revMobile" runat="server"
                                        ErrorMessage="Số điện thoại phải đủ 10 ký tự. Vui lòng kiểm tra lại!"
                                        ControlToValidate="txtMobile"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ValidationExpression="^[0-9]{10}$" />
                                </div>
                            </div>
                        </div>--%>
                        <%--<div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Địa chỉ:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Địa chỉ của bạn..." />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtAddress"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                </div>
                            </div>
                        </div>--%>
                        <%--<div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Mã ZIP/PostCode:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Mã ZIP/PostCode của bạn..." TextMode="Number" />
                                </div>
                                <div class="text-error">
                                    <asp:RequiredFieldValidator ID="rfvPostCode" runat="server"
                                        ErrorMessage="Không được để trông dữ liệu!"
                                        ControlToValidate="txtPostCode"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true" />
                                    <asp:RegularExpressionValidator ID="revPostCode" runat="server"
                                        ErrorMessage="Mã ZIP/PostCode không đúng. Vui lòng kiểm tra lại!"
                                        ControlToValidate="txtPostCode"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        SetFocusOnError="true"
                                        ValidationExpression="^[0-9]{6}$" />
                                </div>
                            </div>
                        </div>--%>
                        <%--<div class="wrapper">
                            <div class="wrapper-label">
                                <label class="text-label">Ảnh đại diện:</label>
                            </div>
                            <div class="wrapper-input">
                                <div class="text-input">
                                    <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                </div>
                            </div>
                        </div>--%>
                    </div>

                 <%------------- button register ------------------------------------------------------------------------------%>
                <div class="btn-wrapper">
                    <div class="btn_box">
                        <asp:Button ID="btnRegister" runat="server"
                            Text="Đăng ký ngay"
                            OnClick="btnRegister_Click" />
                    </div>
                    <div class="kkkkk">
                        <asp:Label ID="lblOr"
                            runat="server"
                            Text="hoặc" />
                        <asp:Label ID="lblAlReadyUser"
                            runat="server"
                            Text="Bạn đã có tài khoản? <a href='Login.aspx' class='text-primary'>Đăng nhập ngay</a>" />
                    </div>
                </div>
                </div>

                <%------------- form right -----------------------------------------------------------------------------------%>
                <div class="col-md-4 wrapper-image-logo">
                    <div class="image-logo">
                        <img src="../Images/logo-goku.png" />
                    </div>
<%--                    <div class="image-user">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>--%>
                </div>


            </div>
        </div>
    </section>
</asp:Content>
