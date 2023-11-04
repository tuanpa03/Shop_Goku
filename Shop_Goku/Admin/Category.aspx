<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Shop_Goku.Admin.Category" %>
<%@ Import Namespace="Shop_Goku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 1000;

            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=imgCategory.ClientID %>').prop('src', e.target.result)
                        .width(300)
                        .height(300)
                };
                reader.readAsDataURL(input.files[0]);
            }
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
                                    <div class="row">
                                        <div class="col-sm-6 col-md-7 col-lg-7">
                                            <h4 class="sub-title">Thêm danh mục món ăn</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Tên danh mục</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                            placeholder="Nhập tên danh mục..." required />
                                                        <asp:HiddenField ID="hdlId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Trạng thái hoạt động"
                                                        CssClass="form-check-input" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Thêm mới danh mục" CssClass="btn btn-primary"
                                                        OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Làm trống" CssClass="btn btn-danger"
                                                        CausesValidation="false" OnClick="btnClear_Click"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-5 col-lg-5">
                                            <div>
                                                <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-lg-12 mobile-inputs">
                                            <h2 class="sub-title text-c-blue">Danh sách sản phẩm</h2>
                                            <div class="card-block table-border-style">
                                                
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rCategory" runat="server" 
                                                        OnItemCommand="rCategory_ItemCommand"
                                                        OnItemDataBound="rCategory_ItemDataBound">                                                        
                                                        <HeaderTemplate>
                                                            <table class="table table-hover nowrap">
                                                                <thead class="bg-primary">
                                                                    <tr>
                                                                        <th>Tên danh mục</th>
                                                                        <th>Hình ảnh</th>
                                                                        <th>Trạng thái</th>
                                                                        <th>Ngày tạo</th>
                                                                        <th class="datatable-nosort">Actions</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="name-category">
                                                                    <span><%# Eval("Name") %></span>
                                                                </td>
                                                                <td class="image-category">
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("CreateDate") %></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server"
                                                                        CommandArgument='<%# Eval("CategoryId") %>' CommandName="edit">
                                                                         <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server"
                                                                        CommandArgument='<%# Eval("CategoryId") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Bạn có chắc muốn xóa nội danh mục này không?');">
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
</asp:Content>
