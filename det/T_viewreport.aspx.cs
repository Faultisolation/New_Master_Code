using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewreportDefault2 : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT fault_prediction.mechine_id, fault_prediction.fault_id, mechine_management.mechine_name, fault_prediction.worker_id, fault_prediction.technician_id, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem, fault_prediction.status FROM fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.worker_id = employee_management.employee_id";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        MultiView1.SetActiveView(View1);

        

   }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "status")
        {
            MultiView1.SetActiveView(View3);
            Label1.Text=e.Item.Cells[5].Text;
            Label2.Text=e.Item.Cells[7].Text;
            Label3.Text=e.Item.Cells[8].Text;
            Label4.Text=e.Item.Cells[4].Text;
        }
        if (e.CommandName == "request")
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "select status from fault_prediction where status='requested' and fault_id='" + e.Item.Cells[0].Text + "'";
            DataTable dt = obj.getData(cmd);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Already Requested')</script>");
            }
            else
            {
                cmd.CommandText = "update fault_prediction set status='requested' where fault_id='" + e.Item.Cells[0].Text + "'";
                obj.execute(cmd);

                Response.Write("<script>alert('Requested')</script>");

                cmd.CommandText = "SELECT fault_prediction.mechine_id, fault_prediction.fault_id, mechine_management.mechine_name, fault_prediction.worker_id, fault_prediction.technician_id, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem, fault_prediction.status FROM fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.worker_id = employee_management.employee_id";
                DataGrid1.DataSource = obj.getData(cmd);
                DataGrid1.DataBind();
                MultiView1.SetActiveView(View1);
            }
        }
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}