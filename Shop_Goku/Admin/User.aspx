<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Shop_Goku.Admin.User" %>

<%@ Import Namespace="Shop_Goku" %>

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

    <div class="pcoded-inner-content pt-0">
        <div class="lblThongBao">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-block">
                                    <div class="card-block">
                                        <div class="row">
                                            <div class="col-12 mobile-inputs">
                                                <h1 class="sub-title text-c-blue">Danh sách sản phẩm</h1>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">

                                                        <asp:Repeater ID="rUser" runat="server" OnItemCommand="rUser_ItemCommand">
                                                            <HeaderTemplate>
                                                                <table class="table table-hover nowrap">
                                                                    <thead class="bg-primary">
                                                                        <tr>
                                                                            <th class="table-plus">ID</th>
                                                                            <th>Họ và tên</th>
                                                                            <th>Tên người dùng</th>
                                                                            <th>Email</th>
                                                                            <th>Ngày tạo</th>
                                                                            <th class="datatable-nosort">Xóa</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td class="table-plus"> <%# Eval("SrNo") %> </td>
                                                                    <td> <%# Eval("Name") %> </td>
                                                                    <td> <%# Eval("Username") %> </td>
                                                                    <td> <%# Eval("Email") %> </td>
                                                                    <td> <%# Eval("CreateDate") %> </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server"
                                                                            CommandArgument='<%# Eval("UserId") %>' CommandName="delete"
                                                                            OnClientClick="return confirm('Bạn có chắc muốn xóa người dùng?');">
                                                                         <i class="ti-trash"></i>
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </tbody>
                                                            </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
