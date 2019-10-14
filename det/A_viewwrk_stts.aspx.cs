using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class A_viewwrk_stts : System.Web.UI.Page
{
    dboperation db = new dboperation();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT work_assign.worker_id, employee_management.employee_name, work_assign.work_id, work.work_name, work_assign.work_assign_id, work_assign.from_date, work_assign.to_date, work_assign.status FROM work_assign INNER JOIN employee_management ON work_assign.worker_id = employee_management.employee_id INNER JOIN work ON work_assign.work_id = work.work_id";
        DataGrid1.DataSource = db.getData(cmd);
        DataGrid1.DataBind();
    }
}