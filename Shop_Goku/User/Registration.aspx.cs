using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shop_Goku.Admin;
using System.IO;

namespace Shop_Goku.User
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)  /*&& Session["userId"] != null*/
                {
                    getDetailUser();
                }
                else if (Session["userId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
            lblMsg.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtention = string.Empty;
            bool isValidToExecute = false; // biến check trạng thái
            int userId = Convert.ToInt32(Request.QueryString["id"]);

            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con); // find PROCEDURE of SQL
            cmd.Parameters.AddWithValue("@Action", userId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Username", txtUsename.Text.Trim());
            //cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
            //cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            //cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            //cmd.Parameters.AddWithValue("@PostCode", txtPostCode.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            //if (fuUserImage.HasFile)
            //{
            //    if (Utils.IsValidExtension(fuUserImage.FileName))
            //    {
            //        Guid obj = Guid.NewGuid();
            //        fileExtention = Path.GetExtension(fuUserImage.FileName);
            //        imagePath = "Images/User/" + obj.ToString() + fileExtention;
            //        fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtention);
            //        cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
            //        isValidToExecute = true;
            //    }
            //    else
            //    {
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Vui lòng chọn file có dạng .jpg, .png, .jpeg";
            //        lblMsg.CssClass = "alert alert-danger";
            //        isValidToExecute = false;
            //    }
            //}
            //else
            //{
            //    isValidToExecute = true;
            //}

            isValidToExecute = true;

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = userId == 0 
                        ? " đăng ký thành công! <b><a href='Login.aspx'>Click here!</a></b> chuyển đến LOGIN" 
                        : " chi tiết đã cập nhập thành công! <b><a href='Profile.aspx'>Bạn có thể kiểm tra ở đây!</a></b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUsename.Text.Trim() + "</b>" + actionName;
                    lblMsg.CssClass = "alert alert-success";

                    if (userId != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
                    }
                    clear();
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtUsename.Text.Trim() + "</b> đã tồn tại. Vui lòng thử tên mới!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally { 
                    con.Close();
                }
            }
        }

        void getDetailUser()
        {
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);

            cmd.Parameters.AddWithValue("@Action", "SELECTPROFILE");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
            cmd.CommandType = CommandType.StoredProcedure;

            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtUsename.Text = dt.Rows[0]["Username"].ToString();
                //txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                //txtEmail.Text = dt.Rows[0]["Email"].ToString();
                //txtAddress.Text = dt.Rows[0]["Address"].ToString();
                ////txtPostCode.Text = dt.Rows[0]["PostCode"].ToString();
                //imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) 
                //    ? "../Images/No_image.png" 
                //    : "../" + dt.Rows[0]["ImageUrl"].ToString();
                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtPassword.ReadOnly = true;
                txtPassword.Text = dt.Rows[0]["Password"].ToString();
            }

            lblHeaderMsg.Text = "<h2>Chỉnh sửa thông tin cá nhân.</h2>";
            btnRegister.Text = "Cập nhập thông tin";
            lblOr.Text = "";
            lblAlReadyUser.Text = "";
        }

        private void clear()
        {
            txtName.Text = string.Empty;
            txtUsename.Text = string.Empty;
            //txtMobile.Text = string.Empty;
            //txtEmail.Text = string.Empty;
            //txtAddress.Text = string.Empty;
            //txtPostCode.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}