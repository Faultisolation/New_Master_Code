using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class view_work : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT fault_prediction.mechine_id, fault_prediction.fault_id, mechine_management.mechine_name, fault_prediction.technician_id, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem,  fault_prediction.status FROM     fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.technician_id = employee_management.employee_id WHERE  (fault_prediction.worker_id = 1)";
        DataGrid2.DataSource = obj.getData(cmd);
        DataGrid2.DataBind();
        MultiView1.SetActiveView(View1);
    }
    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        TextBox4.Text=e.Item.Cells[2].Text;
        TextBox3.Text=e.Item.Cells[3].Text;
        TextBox5.Text=e.Item.Cells[6].Text;
        Label1.Text=e.Item.Cells[0].Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         SqlCommand cmd = new SqlCommand();

         cmd.CommandText = "update fault_prediction set time = '"+TextBox6.Text+"',status='process' where fault_id='"+Label1.Text+"'";
            obj.execute(cmd);

            Response.Write("<script>alert('Time is Set')</script>");

            cmd.CommandText = "SELECT fault_prediction.mechine_id, fault_prediction.fault_id, mechine_management.mechine_name, fault_prediction.technician_id, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem,  fault_prediction.status FROM     fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.technician_id = employee_management.employee_id WHERE  (fault_prediction.worker_id = 1)";
            DataGrid2.DataSource = obj.getData(cmd);
            DataGrid2.DataBind();
            MultiView1.SetActiveView(View1);

    }
}