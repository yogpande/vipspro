using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageUsers : System.Web.UI.Page
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
        GridView1.DataSource = user.GetUsers();
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        FillUsers();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        double id = Convert.ToDouble(GridView1.DataKeys[e.NewSelectedIndex].Value);
        Response.Redirect("UserDetails.aspx?id="+id);
    }
}