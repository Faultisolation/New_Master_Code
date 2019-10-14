using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class workassign : System.Web.UI.Page
{
    dboperation db = new dboperation();
    static int a_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            SqlCommand cmd = new SqlCommand();
            

            cmd.CommandText = "select max(work_assign_id)from work_assign";
            a_id = db.max_id(cmd);


            cmd.CommandText = "select work_id,work_name from work";
            DropDownList1.DataSource = db.getData(cmd);
            DropDownList1.DataValueField = "work_id";
            DropDownList1.DataTextField = "work_name";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "select");


            cmd.CommandText = "select employee_id,employee_name  from employee_management where emptype='worker'";
            DropDownList2.DataSource = db.getData(cmd);
            DropDownList2.DataValueField = "employee_id";
            DropDownList2.DataTextField = "employee_name";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "select");
        }
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        


    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       

        SqlCommand cmd = new SqlCommand();
        
        
        cmd.CommandText = "insert into work_assign values('"+a_id+"','" + DropDownList1.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + TextBox5.Text + "','"+TextBox6.Text+"','pending')";
        db.execute(cmd);
        TextBox5.Text = "";

        

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       
    }
}