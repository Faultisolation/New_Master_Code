using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class workermgnt : System.Web.UI.Page
{
     dboperation obj = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from employee_management ";
            DataGrid1.DataSource = obj.getData(cmd);
            DataGrid1.DataBind();
            MultiView1.SetActiveView(View1);

            cmd.CommandText = "select max(employee_id)from employee_management";
            id = obj.max_id(cmd);
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select max(employee_id)from employee_management";
        id = obj.max_id(cmd);
        cmd.CommandText = "insert into employee_management values('" + id + "','"+TextBox1.Text+"','" + DropDownList5.SelectedItem.Text + "','" + DropDownList4.SelectedItem.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox16.Text + "','" + TextBox17.Text + "')";
        obj.execute(cmd);

        cmd.CommandText = "insert into login values('" + id + "','" + TextBox16.Text + "','" + TextBox17.Text + "','"+DropDownList4.SelectedItem.Text+"')";
        obj.execute(cmd);

        TextBox1.Text = "";
        DropDownList5.SelectedIndex = -1;
        DropDownList4.SelectedIndex = -1;
        TextBox6.Text = "";
        TextBox16.Text = "";
        TextBox17.Text = "";

        cmd.CommandText = "select * from employee_management";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        MultiView1.SetActiveView(View1);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update employee_management set employee_name='" + TextBox8.Text + "',department= '" + DropDownList6.SelectedItem.Text + "',emptype='" + DropDownList3.SelectedItem.Text + "',age= " + TextBox12.Text + ",contact='" + TextBox13.Text + "',email_id='" + TextBox14.Text + "',password='"+TextBox15.Text+"' where employee_id =" + id + "";
        obj.execute(cmd);
      //  cmd.CommandText = "update login set username='" + TextBox14.Text + "',password='" + TextBox15.Text + "',type='" + id + "'";
        cmd.CommandText = "select * from employee_management ";
        DataGrid1.DataSource = obj.getData(cmd);
        DataGrid1.DataBind();
        MultiView1.SetActiveView(View1);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete from employee_management where employee_id="+id+" ";
        obj.execute(cmd);
        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select* from employee_management ";
        DataGrid1.DataSource = obj.getData(cmd); 
        DataGrid1.DataBind();
    }
    
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        id = Convert.ToInt32(e.Item.Cells[0].Text);
        TextBox8.Text = e.Item.Cells[1].Text;
        DropDownList6.SelectedItem.Text = e.Item.Cells[2].Text;
        DropDownList3.SelectedItem.Text = e.Item.Cells[3].Text;
        TextBox12.Text = e.Item.Cells[4].Text;
        TextBox13.Text = e.Item.Cells[5].Text;
        TextBox14.Text = e.Item.Cells[6].Text;
        TextBox15.Text = e.Item.Cells[7].Text;
        MultiView1.SetActiveView(View3);

    }
}