using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewcomplaint : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT complaints.employee_id, employee_management.employee_name, complaints.cmp_id, complaints.type, complaints.complaints, complaints.reply, complaints.date FROM complaints INNER JOIN employee_management ON complaints.employee_id = employee_management.employee_id where complaints.reply='pending'";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = " update complaints set reply = '" + TextBox4.Text + "' where cmp_id= '" + Label1.Text + "'";
        obj.execute(cmd);
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        TextBox3.Text = e.Item.Cells[3].Text;
        Label1.Text = e.Item.Cells[0].Text;
        TextBox1.Text = e.Item.Cells[2].Text;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}