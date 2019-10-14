using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

public partial class report : System.Web.UI.Page
{
    dboperation db = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select max(fault_id)from fault_prediction";
            id = db.max_id(cmd);

            
            cmd.CommandText = "select mechine_id,mechine_name  from mechine_management";
            DropDownList1.DataSource = db.getData(cmd);
            DropDownList1.DataValueField = "mechine_id";
            DropDownList1.DataTextField = "mechine_name";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "select");

            cmd.CommandText = "select employee_id,employee_name  from employee_management where emptype='worker'";
            DropDownList4.DataSource = db.getData(cmd);
            DropDownList4.DataValueField = "employee_id";
            DropDownList4.DataTextField = "employee_name";
            DropDownList4.DataBind();
            DropDownList4.Items.Insert(0, "select");


            cmd.CommandText = "select employee_id,employee_name  from employee_management where emptype='technician'";
            DropDownList3.DataSource = db.getData(cmd);
            DropDownList3.DataValueField = "employee_id";
            DropDownList3.DataTextField = "employee_name";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "select");

            cmd.CommandText = "select * from fault_prediction";
            DataGrid1.DataSource = db.getData(cmd);
            DataGrid1.DataBind();

        }

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);

    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(fault_id)from fault_prediction";
        id = db.max_id(cmd);
        cmd.CommandText = "insert into fault_prediction values('"+id+"','" + DropDownList1.SelectedValue + "','" + DropDownList4.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + TextBox2.Text + "','No Time','" + TextBox3.Text + "','pending')";
        db.execute(cmd);
        DropDownList1.SelectedIndex = -1;
        DropDownList4.SelectedIndex = -1;
        DropDownList3.SelectedIndex = -1;
        TextBox2.Text = "";
        TextBox3.Text = "";
        


        
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Process.Start(@"D:\ProjectFinal\Predict\WindowsFormsApplication1\bin\Debug\WindowsFormsApplication1.exe");
    }
}