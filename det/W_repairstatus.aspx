<%@ Page Title="" Language="C#" MasterPageFile="~/worker.master" AutoEventWireup="true" CodeFile="W_repairstatus.aspx.cs" Inherits="view_work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            height: 27px;
        }
        .style3
        {
            height: 30px;
        }
        .style4
        {
            height: 28px;
        }
        .style5
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <table class="style1">
            <tr>
                <td>
                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" 
                        onitemcommand="DataGrid2_ItemCommand" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Horizontal" Font-Size="Medium">
                        <Columns>
                            <asp:BoundColumn DataField="fault_id" HeaderText="Fault_id"></asp:BoundColumn>
                            <asp:BoundColumn DataField="employee_name" HeaderText="Employee_name">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="mechine_name" HeaderText="mechine_name">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="mechine_id" HeaderText="Mechine_id" Visible="False">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="technician_id" HeaderText="employee_id" 
                                Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="problem" HeaderText="Issue"></asp:BoundColumn>
                            <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                            <asp:BoundColumn DataField="time" HeaderText="Time"></asp:BoundColumn>
                            <asp:BoundColumn DataField="status" HeaderText="Status"></asp:BoundColumn>
                            <asp:ButtonColumn Text="View"></asp:ButtonColumn>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:DataGrid>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table class="style1">
            <tr>
                <td class="style2">
                    Technician </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Mechine</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Issue on Report</td>
                <td class="style4">
                    <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Time</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox6" ErrorMessage="invalid time" ForeColor="Red" 
                        ValidationExpression="^([1-9]|1[0-2]|0[1-9]){1}(:[0-5][0-9][aApP][mM]){1}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" 
                        class="genric-btn primary circle mt-30" Font-Size="Medium" />
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
</asp:Content>

