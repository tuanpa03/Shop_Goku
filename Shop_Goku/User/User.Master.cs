using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shop_Goku.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");
                // load the control
                Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");

                // add control panel
                pnlSliderUc.Controls.Add(sliderUserControl);
            }

            if (Session["userId"] != null)
            {
                lbLoginOrLogout.Text = "Đăng xuất";
            }
            else
            {
                lbLoginOrLogout.Text = "Đăng nhập";
            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null) // Kiểm tra nếu user chưa login thì chuyển đến trang login
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon(); // Giữ lại User khi load lại trang
                Response.Redirect("Login.aspx");
            }
        }
    }
}