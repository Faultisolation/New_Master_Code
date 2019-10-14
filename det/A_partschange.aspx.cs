using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class partschange : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT parts_request.reqt_id, parts_request.technician_id, employee_management.employee_name, parts_request.mechine_id, mechine_management.mechine_name, parts_request.parts, parts_request.description, parts_request.date,  parts_request.status FROM parts_request INNER JOIN employee_management ON parts_request.technician_id = employee_management.employee_id INNER JOIN mechine_management ON parts_request.mechine_id = mechine_management.mechine_id where parts_request.status='pending'";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        if (e.CommandName == "accept")
        {
            cmd.CommandText = "update parts_request set status = 'accept' where reqt_id=" + e.Item.Cells[0].Text;
            obj.execute(cmd);

            Response.Write("<script>alert('Accept')</script>");

            cmd.CommandText = "SELECT parts_request.reqt_id, parts_request.technician_id, employee_management.employee_name, parts_request.mechine_id, mechine_management.mechine_name, parts_request.parts, parts_request.description, parts_request.date,  parts_request.status FROM parts_request INNER JOIN employee_management ON parts_request.technician_id = employee_management.employee_id INNER JOIN mechine_management ON parts_request.mechine_id = mechine_management.mechine_id where parts_request.status='pending'";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();
        }
        else if (e.CommandName == "reject")
        {
            cmd.CommandText = "update parts_request set status = 'reject' where reqt_id=" + e.Item.Cells[0].Text;
            obj.execute(cmd);

            Response.Write("<script>alert('Reject')</script>");

            cmd.CommandText = "SELECT parts_request.reqt_id, parts_request.technician_id, employee_management.employee_name, parts_request.mechine_id, mechine_management.mechine_name, parts_request.parts, parts_request.description, parts_request.date,  parts_request.status FROM parts_request INNER JOIN employee_management ON parts_request.technician_id = employee_management.employee_id INNER JOIN mechine_management ON parts_request.mechine_id = mechine_management.mechine_id where parts_request.status='pending'";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();
        }
    }
}