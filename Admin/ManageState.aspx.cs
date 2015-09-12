using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdLocation : System.Web.UI.Page
{
    ManageLocation m = new ManageLocation();
    Location l = new Location();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] != null)
        {
            if (!IsPostBack)
            {
                ShowStates();
            }
        }
       
        else
            Response.Redirect("~/Visitor/Home.aspx");
    }
   
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        l.sname = txtsname.Text;
        m.InsertState(l);
        txtsname.Text = "";
        lbl.Text = "State Added Succesfully....";
        ShowStates();
    }

    private void ShowStates()
    {
        GridView1.DataSource = m.GetState();
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        ShowStates();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        l.sid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        m.DeleteState(l);
        ShowStates();
        lbl1.Text = "State Deleted Succesfully....";
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        ShowStates();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
         l.sid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
         l.sname = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
         m.UpdateState(l);
         GridView1.EditIndex = -1;
         ShowStates();
         lbl1.Text = "State Updated Succesfully....";
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ShowStates();
    }
}