using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Created By Yog.
/// </summary>


public class Service
{
   public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
   public SqlCommand cmd;
   public SqlDataAdapter da;
   public DataTable dt;
   public DataSet ds;

}

public class ManageLocation:Service
{
    public void InsertState(Location l)
    {       
       cmd = new SqlCommand("InsertState",con);
       cmd.CommandType = CommandType.StoredProcedure;
       cmd.Parameters.AddWithValue("@sname", l.sname);
       con.Open();
       cmd.ExecuteNonQuery();
       con.Close();
    }

    public void UpdateState(Location l)
    {
        cmd = new SqlCommand("UpdateState", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@sname", l.sname);
        cmd.Parameters.AddWithValue("@sid", l.sid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public void DeleteState(Location l)
    {
        cmd = new SqlCommand("DeleteState", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@sid", l.sid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public DataTable GetState()
    {
        cmd = new SqlCommand("GetState", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public void InsertCity(Location l)
    {
        cmd = new SqlCommand("InsertCity", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cname", l.cname);
        cmd.Parameters.AddWithValue("@sid", l.sid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateCity(Location l)
    {
        cmd = new SqlCommand("UpdateCity", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cname", l.cname);
        cmd.Parameters.AddWithValue("@sid", l.sid);
        cmd.Parameters.AddWithValue("@cid", l.cid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public void DeleteCity(Location l)
    {
        cmd = new SqlCommand("DeleteCity", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cid", l.cid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataTable GetCities()
    {
        cmd = new SqlCommand("GetCity", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetCityByState(int sid)
    {
        cmd = new SqlCommand("select * from CityTbl where sid=@sid", con);
        cmd.Parameters.AddWithValue("@sid",sid);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}

public class ManageJobs : Service
{
    public void InsertJob(Jobs j)
    {
        cmd = new SqlCommand("InsertJob", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@jp", j.jpostion);
        cmd.Parameters.AddWithValue("@jl", j.jlocation);
        cmd.Parameters.AddWithValue("@jd", j.jdetails);
        cmd.Parameters.AddWithValue("@jq", j.jqual);
        cmd.Parameters.AddWithValue("@sal", j.sal);
        cmd.Parameters.AddWithValue("@js", j.jstatus);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateJob(Jobs j)
    {
        cmd = new SqlCommand("UpdateJob", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@jp", j.jpostion);
        cmd.Parameters.AddWithValue("@jl", j.jlocation);
        cmd.Parameters.AddWithValue("@jd", j.jdetails);
        cmd.Parameters.AddWithValue("@jq", j.jqual);
        cmd.Parameters.AddWithValue("@sal", j.sal);
        cmd.Parameters.AddWithValue("@js", j.jstatus);
        cmd.Parameters.AddWithValue("@jid",j.jid);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void deletejob(double id)
    {
        cmd = new SqlCommand("delete from JobTbl where jid=@id", con);
        cmd.Parameters.AddWithValue("@id", id);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }


    public DataTable SelectJobs()
    {
        cmd = new SqlCommand("GetJobs", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}

public class ManageUser : Service
{

    public void AddUsers(Registration u)
    {
        cmd = new SqlCommand("AddUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@fname", u.fname);
        cmd.Parameters.AddWithValue("@lname", u.lname);
        cmd.Parameters.AddWithValue("@gender", u.gender);
        cmd.Parameters.AddWithValue("@email", u.email);
        cmd.Parameters.AddWithValue("@pass", u.pass);
        cmd.Parameters.AddWithValue("@mob", u.mob);
        cmd.Parameters.AddWithValue("@addr", u.addr);
        cmd.Parameters.AddWithValue("@sid", u.sid);
        cmd.Parameters.AddWithValue("@cid", u.cid);
        cmd.Parameters.AddWithValue("@pic", u.pic);
        cmd.Parameters.AddWithValue("@rd", DateTime.Now);
        cmd.Parameters.AddWithValue("@ia", "Active");
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataTable GetUsers()
    {
        cmd = new SqlCommand("GetUsers", con);
        cmd.CommandType = CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable GetUserByID(double uid)
    {
        cmd = new SqlCommand("GetUserByID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", uid);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public int CheckEmailID(string email)
    {
        int i = 0;
        cmd = new SqlCommand("CheckEmailID", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@email", email);
        con.Open();
        i = Convert.ToInt16(cmd.ExecuteScalar());
        con.Close();
        return i;
    }

    public DataSet LoginUser(string email,string pass)
    {
        cmd = new SqlCommand("LoginUser", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@email",email);
        cmd.Parameters.AddWithValue("@pass",pass);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds,"RegTbl");
        return ds;
    }
}