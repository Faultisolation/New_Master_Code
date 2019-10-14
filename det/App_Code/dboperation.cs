using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Dboperation
/// </summary>
public class dboperation
{
	public dboperation()
	
    {       //
		// TODO: Add constructor logic here
		//
	}
    SqlConnection con = new SqlConnection(@"Data Source=.\SQL2012;AttachDbFilename=C:\inetpub\wwwroot\det\App_Data\FAULT PREDICTION.mdf;Integrated Security=True;User Instance=True");
    public void execute (SqlCommand cmd)
    {
        cmd.Connection=con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            e.ToString();
        }
        finally
        {
            con.Close();
        }
    }
public DataTable getData (SqlCommand cmd)
{
    cmd.Connection=con;
    SqlDataAdapter da = new SqlDataAdapter();
    da.SelectCommand=cmd;
    DataSet ds = new DataSet();
    da.Fill(ds);
    return ds.Tables[0];
}
    public int max_id (SqlCommand cmd)
    {
        cmd.Connection=con;
        int i;
        try
        {
            con.Open();
                i=Convert.ToInt32(cmd.ExecuteScalar())+1;
        }
        catch
        {
            i=1;
        }
        con.Close();
        return i;
    }
}
