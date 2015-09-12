using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Managejobs : System.Web.UI.Page
{
    ManageJobs mj = new ManageJobs();
    Jobs j = new Jobs();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"] != null)
        {
            if (!IsPostBack)
            {
                ShowJobs();
            }
            btnAdd.Visible = true;
        }
        else
            Response.Redirect("~/Visitor/Home.aspx");
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        j.jpostion = txtpos.Text;
        j.jlocation = txtloc.Text;
        j.jdetails = txtdet.Text;
        j.jqual = txtqual.Text;
        j.sal = txtsal.Text;
        j.jstatus = drpStatus.SelectedItem.Text;
        mj.InsertJob(j);
        lbl.Text = "Job Added Succesfully....";
        ShowJobs();
        txtsal.Text = "";
        txtqual.Text = "";
        txtpos.Text = "";
        txtloc.Text = ""; txtdet.Text = "";
    }

    private void ShowJobs()
    {
        GridView1.DataSource = mj.SelectJobs();
        GridView1.DataBind();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        txtsal.Text = "";
        txtqual.Text = "";
        txtpos.Text = "";
        txtloc.Text = ""; txtdet.Text = "";
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ShowJobs();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        lbl.Text = "";
        int id = Convert.ToInt16(ViewState["ind"]);
        try
        {
            GridView1.Rows[id].BackColor = System.Drawing.Color.White;
        }
        catch (System.ArgumentOutOfRangeException)
        {

            GridView1.Rows[0].BackColor = System.Drawing.Color.White;
        }
        
           Session["id"] = Convert.ToInt16(GridView1.DataKeys[e.NewSelectedIndex].Value);
            txtpos.Text = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label2")).Text;
            txtloc.Text = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label3")).Text;
            txtdet.Text = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label4")).Text;
            txtqual.Text = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label5")).Text;
            txtsal.Text = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label6")).Text;
            string sta = ((Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label7")).Text;

            foreach (ListItem item in drpStatus.Items)
            {
                if (item.Text == sta)
                {
                    drpStatus.SelectedItem.Text = sta;
                }
            }

            btnAdd.Visible = false;
            Button1.Visible = true;
          ViewState["ind"]=e.NewSelectedIndex;
            GridView1.Rows[e.NewSelectedIndex].BackColor = System.Drawing.Color.YellowGreen;
           
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         j.jpostion = txtpos.Text;
        j.jlocation = txtloc.Text;
        j.jdetails = txtdet.Text;
        j.jqual = txtqual.Text;
        j.sal = txtsal.Text;
        j.jstatus = drpStatus.SelectedItem.Text;
        j.jid = Convert.ToDouble(Session["id"]);
        mj.UpdateJob(j);
        lbl.Text = "Job Updated Succesfully....";
        ShowJobs();
        txtsal.Text = "";
        txtqual.Text = "";
        txtpos.Text = "";
        txtloc.Text = ""; txtdet.Text = "";
        btnAdd.Visible = true;
        Button1.Visible = false;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        double jid = Convert.ToDouble(GridView1.DataKeys[e.RowIndex].Value);
        mj.deletejob(jid);
        ShowJobs();
    }
}