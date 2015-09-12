using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 

public partial class Visitor_Home : System.Web.UI.Page
{
    ManageUser u = new ManageUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillinfos();
        }
    }

    private void Fillinfos()
    {
        System.Data.DataSet ds = new System.Data.DataSet();
        ds.ReadXml(Server.MapPath("~/Admin/my.xml"));
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string email = TextBox1.Text;
        string pass = TextBox2.Text;
        DataSet ds = u.LoginUser(email, pass);
        if (email=="admin@admin.in" && pass=="admin123")
        {
            Session["aid"] = "admin";
            Response.Redirect("~/Admin/AdHome.aspx");
        }
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count >= 1)
            {
                Session["uid"] = ds.Tables[0].Rows[0]["uid"].ToString();
                Session["name"] = ds.Tables[0].Rows[0]["fname"].ToString() + " " + ds.Tables[0].Rows[0]["lname"].ToString();
                Session["pic"] = ds.Tables[0].Rows[0]["pic"].ToString();
                Response.Redirect("~/Users/UHome.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Please Enter Correct EmailID and Password... ";
            }
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Please Enter Correct EmailID and Password... ";
        }
    }
}