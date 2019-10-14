using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class view_report : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT fault_prediction.fault_id, fault_prediction.mechine_id, mechine_management.mechine_name, fault_prediction.worker_id, fault_prediction.technician_id, employee_management.employee_name, fault_prediction.date, fault_prediction.time,  fault_prediction.problem FROM fault_prediction INNER JOIN mechine_management ON fault_prediction.mechine_id = mechine_management.mechine_id INNER JOIN employee_management ON fault_prediction.technician_id = employee_management.employee_id where fault_prediction.worker_id='"+Session["id"]+"'";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        MultiView1.SetActiveView(View1);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}