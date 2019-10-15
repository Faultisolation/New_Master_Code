using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {
    dboperation db = new dboperation();
    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }


    [WebMethod]
    public string login(string uname, string pswd)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from login where username='" + uname + "' and password='" + pswd + "'";
        DataTable dt = db.getData(cmd);
        if (dt.Rows.Count > 0)
        {
            s = dt.Rows[0][0].ToString() + "#" + dt.Rows[0][3].ToString();
        }
        else
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public string complaints(string uid, string comp,string type)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(cmp_id) from complaints";
        int id = db.max_id(cmd);
        cmd.CommandText = "insert into complaints values('" + id + "','" + uid + "','" + type + "','"+comp+"','pending','"+System.DateTime.Now.ToShortDateString()+"')";
        try
        {
            db.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;

    }
    [WebMethod]
    public string reply(string uid)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from complaints where employee_id='" + uid + "'";
        DataTable dt = db.getData(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[5].ToString() + "#" + dr[3].ToString() + "#" + dr[4].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }


    [WebMethod]
    public string viewAlert(string uid)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select f.fault_id,f.mechine_id,m.mechine_name,f.worker_id,e.employee_name,f.date,f.time,f.problem,f.status from fault_prediction f,mechine_management m,employee_management e where e.employee_id=f.worker_id and m.mechine_id=f.mechine_id and f.technician_id='" + uid + "' and f.status<>'Reject'";
        DataTable dt = db.getData(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "#" + dr[3].ToString() + "#" + dr[4].ToString() + "#" + dr[5].ToString() + "#" + dr[6].ToString() + "#" + dr[7].ToString() + "#" + dr[8].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }


    [WebMethod]
    public string update_status(string fault_id,string sts)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update fault_prediction set status='"+sts+"' where fault_id='"+fault_id+"'";
        try
        {
            db.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public string inform_time(string fault_id, string uid,string wid,string tme)
    {
        string s = "";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(request_id) from repair_time";
        int j = db.max_id(cmd);
        cmd.CommandText = "insert into repair_time values('"+j+"','"+fault_id+"','"+uid+"','"+wid+"','"+tme+"')";
        try
        {
            db.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }


    
}
