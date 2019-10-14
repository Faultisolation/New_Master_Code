using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class T_parts_request : System.Web.UI.Page
{
    dboperation db = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select max(reqt_id)from parts_request";
            id = db.max_id(cmd);

            cmd.CommandText = "SELECT parts_request.mechine_id, parts_request.reqt_id, parts_request.technician_id, parts_request.parts, parts_request.description, parts_request.date, parts_request.status, mechine_management.mechine_name FROM parts_request INNER JOIN mechine_management ON parts_request.mechine_id = mechine_management.mechine_id where parts_request.status='pending' and parts_request.technician_id='"+Session["id"]+"'";
                DataGrid1.DataSource=db.getData(cmd);
            DataGrid1.DataBind();


            cmd.CommandText = "select mechine_id,mechine_name  from mechine_management";
            DropDownList1.DataSource = db.getData(cmd);
            DropDownList1.DataValueField = "mechine_id";
            DropDownList1.DataTextField = "mechine_name";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "select");

            TextBox3.Text = System.DateTime.Now.ToShortDateString();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insert into parts_request values('" + id + "','"+Session["id"]+"','"+DropDownList1.SelectedValue+"','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','pending')";
        db.execute(cmd);
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        DropDownList1.SelectedIndex = -1;

        Response.Write("<script>alert('Request')</script>");

        
        cmd.CommandText = "select max(reqt_id)from parts_request";
        id = db.max_id(cmd);

        MultiView1.SetActiveView(View1);
        cmd.CommandText = "SELECT parts_request.mechine_id, parts_request.reqt_id, parts_request.technician_id, parts_request.parts, parts_request.description, parts_request.date, parts_request.status, mechine_management.mechine_name FROM parts_request INNER JOIN mechine_management ON parts_request.mechine_id = mechine_management.mechine_id where parts_request.status='pending' and parts_request.technician_id='"+Session["id"]+"'";
                DataGrid1.DataSource=db.getData(cmd);
            DataGrid1.DataBind();



        TextBox3.Text = System.DateTime.Now.ToShortDateString();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        MultiView1.SetActiveView(View3);
        Label1.Text=e.Item.Cells[2].Text;
        Label2.Text=e.Item.Cells[4].Text;
        Label3.Text=e.Item.Cells[5].Text;
        Label4.Text=e.Item.Cells[7].Text;
    }
}