using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class mechine : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    static int mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from mechine_management ";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();
            MultiView1.SetActiveView(View1);

            cmd.CommandText = "select max(mechine_id)from mechine_management";
            mid = obj.max_id(cmd);

            cmd.CommandText = "select distinct department from employee_management";
            DropDownList1.DataSource = obj.getData(cmd);
            DropDownList1.DataValueField = "department";
            DropDownList1.DataTextField = "department";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "select");

            cmd.CommandText = "select department  from employee_management";
            DropDownList2.DataSource = obj.getData(cmd);
            DropDownList2.DataValueField = "department";
            DropDownList2.DataTextField = "department";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "select");
        }
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);

    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label1.Text = e.Item.Cells[0].Text;
        TextBox7.Text = e.Item.Cells[1].Text;
        TextBox8.Text = e.Item.Cells[2].Text;
        TextBox9.Text = e.Item.Cells[3].Text;
        TextBox10.Text = e.Item.Cells[5].Text;
        TextBox11.Text = e.Item.Cells[6].Text;
        MultiView1.SetActiveView(View3);
        DropDownList2.SelectedItem.Text = e.Item.Cells[4].Text;
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(mechine_id)from mechine_management";
        mid = obj.max_id(cmd);
        cmd.CommandText = "insert into mechine_management values('" + mid + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList1.SelectedValue + "','" + TextBox4.Text + "','" + TextBox5.Text + "')";
        obj.execute(cmd);
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";

        cmd.CommandText = "select * from mechine_management";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        MultiView1.SetActiveView(View1);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update mechine_management set mechine_name='" + TextBox7.Text + "',brand='" + TextBox8.Text + "',partnumber='" + TextBox9.Text + "',department='" + DropDownList2.SelectedValue
 + "',lastserviced='" + TextBox10.Text + "',warranty='" + TextBox11.Text + "' where mechine_id='" + Label1.Text + "'";
        obj.execute(cmd);
        cmd.CommandText = "select*from mechine_management ";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
            MultiView1.SetActiveView(View1);
    }




    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete from mechine_management where mechine_id="+Label1.Text+" ";
        obj.execute(cmd);
        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select* from mechine_management ";
        DataGrid1.DataSource = obj.getData(cmd); ;
        DataGrid1.DataBind();
          

    }
}