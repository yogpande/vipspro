using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserDetails : System.Web.UI.Page
{
    ManageUser user = new ManageUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] != null)
        {
            if (!IsPostBack)
            {
                FillUsers();
            }
        }
        else
            Response.Redirect("~/Visitor/Home.aspx");
    }

    private void FillUsers()
    {
        double uid = Convert.ToDouble(Request.QueryString["id"]);
        GridView1.DataSource = user.GetUserByID(uid);
        GridView1.DataBind();
    }
}