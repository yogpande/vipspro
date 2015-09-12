using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;

public partial class Admin_ManageInfos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aid"]!=null)
        {
       
        if (!IsPostBack)
        {
            Fillinfos();
        }
        }
        else
            Response.Redirect("~/Visitor/Home.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        XmlTextWriter xr = new XmlTextWriter(Server.MapPath("my.xml"), null);
        xr.WriteStartDocument();
        xr.WriteStartElement("Information");
        xr.WriteStartElement("infos");
        xr.WriteElementString("info", Editor1.Content);
        xr.WriteEndElement();
        xr.WriteEndElement();
        xr.WriteEndDocument();
        xr.Close();
        Fillinfos();
        Editor1.Content = "";
    }

    private void Fillinfos()
    {
        System.Data.DataSet ds = new System.Data.DataSet();

        ds.ReadXml(Server.MapPath("~/Admin/my.xml"));
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Editor1.Content = "";
    }
}