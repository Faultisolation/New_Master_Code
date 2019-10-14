using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class work_status : System.Web.UI.Page
{
    dboperation obj = new dboperation();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT fault_prediction.fault_id, mechine_management.mechine_name, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem, fault_prediction.status, fault_prediction.mechine_id,  fault_prediction.worker_id FROM  fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.worker_id = employee_management.employee_id WHERE  (fault_prediction.technician_id = '" + Session["id"] + "') AND (fault_prediction.status = 'process')";
            DataGrid2.DataSource = obj.getData(cmd);
            DataGrid2.DataBind();
            MultiView1.SetActiveView(View1);
        }
    }
    protected void DataGrid2_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "update fault_prediction set status='finish' where fault_id='" + e.Item.Cells[0].Text + "'";
        obj.execute(cmd);

        Response.Write("<script>alert('Finish success')</script>");

        cmd.CommandText = "SELECT fault_prediction.fault_id, mechine_management.mechine_name, employee_management.employee_name, fault_prediction.date, fault_prediction.time, fault_prediction.problem, fault_prediction.status, fault_prediction.mechine_id,  fault_prediction.worker_id FROM  fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.worker_id = employee_management.employee_id WHERE  (fault_prediction.technician_id = '" + Session["id"] + "') AND (fault_prediction.status = 'process')";
        DataGrid2.DataSource = obj.getData(cmd);
        DataGrid2.DataBind();
        MultiView1.SetActiveView(View1);
    }
}