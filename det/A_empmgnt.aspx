<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_empmgnt.aspx.cs" Inherits="workermgnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 34px;
        }
        .style3
        {
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                            Height="183px" onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Horizontal" Font-Size="Small"  >
                          
                            <Columns>
                                <asp:BoundColumn DataField="employee_id" HeaderText="Emp_id"></asp:BoundColumn>
                                <asp:BoundColumn DataField="employee_name" HeaderText="Name"></asp:BoundColumn>
                                <asp:BoundColumn DataField="department" HeaderText="Department"></asp:BoundColumn>
                                <asp:BoundColumn DataField="emptype" HeaderText="Employe Type">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="age" HeaderText="Age"></asp:BoundColumn>
                                <asp:BoundColumn DataField="contact" HeaderText="Contact Number">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="email_id" HeaderText="Email"></asp:BoundColumn>
                                <asp:BoundColumn DataField="password" HeaderText="Password"></asp:BoundColumn>
                                <asp:ButtonColumn Text="View"></asp:ButtonColumn>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Register New " 
                            onclick="Button3_Click" class="genric-btn primary circle mt-30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2">
                        Name</td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Department</td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Refining</asp:ListItem>
                            <asp:ListItem>Heat Treament</asp:ListItem>
                            <asp:ListItem>Crushing</asp:ListItem>
                            <asp:ListItem>Cutting</asp:ListItem>
                            <asp:ListItem>Finishing</asp:ListItem>
                            <asp:ListItem>Packaging</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="DropDownList5" ErrorMessage="Choose one" ForeColor="Red" 
                            InitialValue="Select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Employee Type</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Worker</asp:ListItem>
                            <asp:ListItem>Technician</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="DropDownList4" ErrorMessage="Choose one" ForeColor="Red" 
                            InitialValue="Select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Age</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="invalid age" ForeColor="Red" 
                            ValidationExpression="[0-9]{1,3}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact Number</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="invalid number" ForeColor="Red" 
                            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        EmailID</td>
                    <td>
                        <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="TextBox16" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="TextBox16" ErrorMessage="invalid emailid" ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TextBox17" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" class="genric-btn primary circle mt-30" 
                            onclick="Button1_Click" Text="Register" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Name</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department</td>
                    <td>
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Refining</asp:ListItem>
                            <asp:ListItem>Heating</asp:ListItem>
                            <asp:ListItem>Crushing</asp:ListItem>
                            <asp:ListItem Value="Cutting">Cutiing</asp:ListItem>
                            <asp:ListItem>Finising</asp:ListItem>
                            <asp:ListItem>Packaging</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Employee Type</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Worker</asp:ListItem>
                            <asp:ListItem>Technician</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Age</td>
                    <td>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact Number</td>
                    <td>
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email ID</td>
                    <td>
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button4" runat="server" class="genric-btn primary circle mt-30" 
                            onclick="Button4_Click" Text="Update" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" Text="Delete" onclick="Button6_Click" class="genric-btn primary circle mt-30"/>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <p>
        &nbsp;</p>
</asp:Content>

