using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class workstatus : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT work_assign.work_id, work_assign.work_assign_id, work.work_name, work_assign.worker_id, work_assign.from_date, work_assign.to_date FROM work_assign INNER JOIN work ON work_assign.work_id = work.work_id where work_assign.worker_id ='" + Session["id"] + "' and work_assign.status='pending'";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        if (e.CommandName == "approve")
        {
            cmd.CommandText = "update work_assign set status = 'approve' where work_assign_id="+e.Item.Cells[0].Text;
            obj.execute(cmd);


            cmd.CommandText = "SELECT work_assign.work_id, work_assign.work_assign_id, work.work_name, work_assign.worker_id, work_assign.from_date, work_assign.to_date FROM work_assign INNER JOIN work ON work_assign.work_id = work.work_id where work_assign.worker_id ='" + Session["id"] + "' and work_assign.status='pending'";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();

        }
        else if (e.CommandName == "reject")
        {
            cmd.CommandText = "update work_assign set status = 'reject' where work_assign_id=" + e.Item.Cells[0].Text;
            obj.execute(cmd);

            cmd.CommandText = "SELECT work_assign.work_id, work_assign.work_assign_id, work.work_name, work_assign.worker_id, work_assign.from_date, work_assign.to_date FROM work_assign INNER JOIN work ON work_assign.work_id = work.work_id where work_assign.worker_id ='" + Session["id"] + "' and work_assign.status='pending'";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();
        }
    }
}