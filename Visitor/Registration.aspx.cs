using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Visitor_Registration : System.Web.UI.Page
{
    ManageLocation m = new ManageLocation();
    ManageUser u = new ManageUser();
    Registration r = new Registration();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDrp();
            ShowCities();
        }
    }

    private void ShowCities()
    {
        if (drpState.SelectedItem.Text == "Select State")
        {
            drpCity.ClearSelection();
        }
        else
        {
            drpCity.DataSource = m.GetCityByState(Convert.ToInt16(drpState.SelectedItem.Value));
            drpCity.DataTextField = "cname";
            drpCity.DataValueField = "cid";
            drpCity.DataBind();
            drpCity.Items.Insert(0, "Select City");
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
    protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowCities();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (u.CheckEmailID(txtemail.Text) == 0)
        {

            if (FileUpload1.HasFile)
            {
                string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
                {
                    r.fname = txtfname.Text;
                    r.lname = txtlname.Text;
                    r.gender = rdoGen.SelectedItem.Text;
                    r.email = txtemail.Text;
                    r.pass = txtpass.Text;
                    r.mob = txtmob.Text;
                    r.addr = txtadd.Text;
                    r.sid = Convert.ToInt16(drpState.SelectedItem.Value);
                    r.cid = Convert.ToInt16(drpCity.SelectedItem.Value);
                    r.pic = "../UImages/" + Guid.NewGuid() + FileUpload1.PostedFile.FileName;
                    FileUpload1.SaveAs(Server.MapPath(r.pic));
                    u.AddUsers(r);
                    lbl.Text = "You are successfully registered with us...";


                }
                else
                {
                    lbl.Text = "Please upload only jpg,jpeg and png photos...";
                }
            }
            else
            {
                lbl.Text = "Please upload your Photo...";
            }
        }
        else
        {
            lbl.Text = "Please enter different Email Id to register...";
        }
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        if (u.CheckEmailID(txtemail.Text) == 1)
        {
            txtemail.BackColor = System.Drawing.Color.LightSalmon;
            Literal1.Text = "entered email id is already registered...";
          
        }
        else
        {
            txtemail.BackColor = System.Drawing.Color.LimeGreen;
            Literal1.Text = "";
        }

    }
}