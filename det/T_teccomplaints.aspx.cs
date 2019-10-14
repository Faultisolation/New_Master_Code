using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class teccomplaints : System.Web.UI.Page
{
    dboperation obj = new dboperation();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from complaints where type='Technician' and employee_id= '" + Session["id"] + "'";
            DataGrid2.DataSource = obj.getData(cmd);
            DataGrid2.DataBind();
            MultiView1.SetActiveView(View2);

            cmd.CommandText = "select max(cmp_id)from complaints";
            id = obj.max_id(cmd);

            cmd.CommandText = "select employee_name from employee_management where employee_id='" + Session["id"] + "'";
            DataTable dt = obj.getData(cmd);
            if (dt.Rows.Count > 0)
            {
                TextBox4.Text = dt.Rows[0][0].ToString();
            }
            TextBox3.Text = DateTime.Now.ToShortDateString();

        }
    }
   
protected void  Button2_Click(object sender, EventArgs e)
{
    MultiView1.SetActiveView(View1);
}
protected void Button1_Click(object sender, EventArgs e)
{
    SqlCommand cmd = new SqlCommand();
    cmd.CommandText = "select max(cmp_id)from complaints";
    id = obj.max_id(cmd);
    cmd.CommandText = "insert into complaints values('" + id + "','" + Session["id"] + "','technician','" + TextBox2.Text + "','pending','" + TextBox3.Text + "')";
    obj.execute(cmd);
    TextBox2.Text = "";
    TextBox3.Text = "";
    cmd.CommandText = "select * from complaints where type='Technician' and employee_id= '" + Session["id"] + "'";
    DataGrid2.DataSource = obj.getData(cmd);
    DataGrid2.DataBind();
    MultiView1.SetActiveView(View2);

}

protected void TextBox3_TextChanged(object sender, EventArgs e)
{

}
}
