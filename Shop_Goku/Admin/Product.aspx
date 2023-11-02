<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Shop_Goku.Admin.Product" %>

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
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID %>').prop('src', e.target.result)
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
                                            <h4 class="sub-title">Thêm sản phẩm món ăn</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Tên món ăn</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                            placeholder="Nhập tên món ăn..." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ErrorMessage="Vui lòng điền tên món ăn!"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="false"
                                                            ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdlId" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Danh mục món ăn</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control"
                                                            DataSourceID="SqlDataSource1"
                                                            DataTextField="Name"
                                                            DataValueField="CategoryId"
                                                            AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Chọn danh mục</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                            ErrorMessage="Vui lòng chọn danh mục món ăn!"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="ddlCategories"
                                                            InitialValue="0" />
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:cs %>"
                                                            SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Giá bán (vnd)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"
                                                            placeholder="Nnhập giá món ăn..." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                            ErrorMessage="Vui lòng điền giá món ăn!"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="txtPrice" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                            ErrorMessage="Price must be in decimal"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="txtPrice"
                                                            ValidationExpression="^\d{0,8}(\.\d{1,4})?$" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Số lượng</label>
                                                    <div>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"
                                                            placeholder="Nhập số lượng món ăn..." />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                            ErrorMessage="Vui lòng điền số lượng món ăn!"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="txtQuantity" />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                            ErrorMessage="Quantity must be non negative"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="txtQuantity"
                                                            ValidationExpression="([1-9]\d*|0)$" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Mô tả món ăn</label>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                            placeholder="Nhập mô tả món ăn..." TextMode="MultiLine" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                            ErrorMessage="Vui lòng điền mô tả món ăn!"
                                                            ForeColor="Red"
                                                            Display="Dynamic"
                                                            SetFocusOnError="true"
                                                            ControlToValidate="txtDescription" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
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
                                                    CausesValidation="false" OnClick="btnClear_Click" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-5 col-lg-5">
                                                <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-lg-12 mobile-inputs">
                                            <h2 class="sub-title text-c-blue">Danh sách sản phẩm</h2>
                                            <div class="card-block table-border-style">

                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rProduct" runat="server"
                                                        OnItemCommand="rProduct_ItemCommand"
                                                        OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table table-hover nowrap">
                                                                <thead class="bg-primary">
                                                                    <tr>
                                                                        <th class="table-plus">Tên món ăn</th>
                                                                        <th>Hình ảnh</th>
                                                                        <th>Danh mục</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Giá bán</th>
                                                                        <th>Trạng thái</th>
                                                                        <th>Mô tả</th>
                                                                        <th>Ngày tạo</th>
                                                                        <th class="datatable-nosort">Actions</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %></td>
                                                                <td>
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td><%# Eval("CategoryName") %></td>
                                                                <td>
                                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("Price") %></td>
                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("Description") %></td>
                                                                <td><%# Eval("CreateDate") %></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="edit" CausesValidation="false">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="delete" CausesValidation="false"
                                                                        OnClientClick="return confirm('Bạn có chắc muốn xóa món ăn này không?');">
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
