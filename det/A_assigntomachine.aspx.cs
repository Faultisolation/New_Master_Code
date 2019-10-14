using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class assigntomachine : System.Web.UI.Page
{
    dboperation db = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View2);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select mechine_id,mechine_name  from mechine_management";
            DropDownList4.DataSource = db.getData(cmd);
            DropDownList4.DataValueField = "mechine_id";
            DropDownList4.DataTextField = "mechine_name";
            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, "select");
            cmd.CommandText = "select distinct department  from employee_management";
            DropDownList5.DataSource = db.getData(cmd);
            DropDownList5.DataValueField = "department";
            DropDownList5.DataTextField = "department";
            DropDownList5.DataBind();
            DropDownList5.Items.Insert(0, "select");
        }
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
   
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select employee_id,employee_name  from employee_management where department='"+DropDownList5.SelectedItem.Text+"' and emptype='worker'";
        DropDownList2.DataSource = db.getData(cmd);
        DropDownList2.DataValueField = "employee_id";
        DropDownList2.DataTextField = "employee_name";
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "select");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(assign_id)from machine_assign";
        id = db.max_id(cmd);
        cmd.CommandText = "insert into machine_assign values('" + ID + "','" + DropDownList4.SelectedValue + "','" + DropDownList2.SelectedValue + "')";
        db.execute(cmd);
        DropDownList4.SelectedIndex = -1;
        DropDownList5.SelectedIndex = -1;
        DropDownList2.SelectedIndex = -1;


    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}