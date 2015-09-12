using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Property
/// </summary>
public class Property
{
	public Property()
	{
	}
  
}

public class Location
{
    public int sid { get; set; }
    public string sname { get; set; }

    public int cid { get; set; }
    public string cname { get; set; }
}

public class Jobs
{
    public double jid { get; set; }
    public string jpostion { get; set; }
    public string jlocation { get; set; }
    public string sal { get; set; }
    public string jstatus { get; set; }
    public string jdetails { get; set; }
    public string jqual { get; set; }
}

public class Registration:Location
{
    public double uid { get; set; }
    public string fname { get; set; }
    public string lname { get; set; }
    public string gender { get; set; }
    public string email { get; set; }
    public string pass { get; set; }
    public string mob { get; set; }
    public string addr { get; set; }
    public string pic { get; set; }
    public DateTime regdate { get; set; }
    public string isactive { get; set; }
}