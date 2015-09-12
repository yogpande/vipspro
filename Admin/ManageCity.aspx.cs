using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageCity : System.Web.UI.Page
{
    ManageLocation m = new ManageLocation();
    Location l = new Location();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] != null)
        {
            if (!IsPostBack)
            {
                FillDrp();
                ShowCities();
            }
        }
        else
        {
            Response.Redirect("~/Visitor/Home.aspx");
        }
    }

    private void FillDrp()
    {
        drpState.DataSource = m.GetState();
        drpState.DataTextField = "sname";
        drpState.DataValueField = "sid";
        drpState.DataBind();
        drpState.Items.Insert(0, "Select State");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        l.cname = txtcname.Text;
        l.sid = Convert.ToInt16(drpState.SelectedItem.Value);
        m.InsertCity(l);
        txtcname.Text = "";
        drpState.ClearSelection();
        lbl.Text = "City Added Succesfully....";
        ShowCities();
    }

    private void ShowCities()
    {
        GridView1.DataSource = m.GetCities();
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        ShowCities();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        l.cid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        m.DeleteCity(l);
        ShowCities();
        lbl1.Text = "City Deleted Succesfully....";
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Label lstate = (Label)GridView1.Rows[e.NewEditIndex].FindControl("Label3");
        
        GridView1.EditIndex = e.NewEditIndex;
        ShowCities();

        DropDownList drps = (DropDownList)GridView1.Rows[e.NewEditIndex].FindControl("Drp");
        drps.DataSource = m.GetState();
        drps.DataTextField = "sname";
        drps.DataValueField = "sid";
        drps.DataBind();
        drps.Items.Insert(0, "Select State");

        foreach (ListItem item in drps.Items)
        {
            if (item.Text==lstate.Text)
            {
                item.Selected = true;
            }
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        l.cid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        l.cname = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        l.sid=Convert.ToInt16(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("Drp")).SelectedItem.Value);
        m.UpdateCity(l);
        GridView1.EditIndex = -1;
        ShowCities();
        lbl1.Text = "City Updated Succesfully....";
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ShowCities();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtcname.Text = "";
        drpState.ClearSelection();
        lbl.Text = "";
    }
}