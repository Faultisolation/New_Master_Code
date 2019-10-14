using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class login : System.Web.UI.Page
{
    dboperation obj = new dboperation();
   
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
         cmd.CommandText = "select * from login where username='"+TextBox1.Text+"' and password='"+TextBox2.Text+"'";
         DataTable dt = obj.getData(cmd);
        if(dt.Rows.Count > 0 )
        {
            string type = dt.Rows[0][3].ToString();
            Session["id"] = dt.Rows[0][0].ToString();
            if(type == "admin")
            {
                Response.Redirect("a_home.aspx");

            }
            else if ( type == "Technician")
            {
                Response.Redirect("t_home.aspx");

            }
            else if (type == "Worker")
            {
                Response.Redirect("w_home.aspx");
            }

        }
        else
        {
            Response.Write("<script>alert('incorrect')</script>");
        }


        TextBox1.Text="";
        TextBox2.Text="";
          
    }
}