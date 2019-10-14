<%@ Page Title="" Language="C#" MasterPageFile="~/worker.master" AutoEventWireup="true" CodeFile="W_view_report.aspx.cs" Inherits="view_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
                Font-Size="Medium" >
                <Columns>
                    <asp:BoundColumn DataField="fault_id" HeaderText="fault"></asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_name" HeaderText="Mechine"></asp:BoundColumn>
                    <asp:BoundColumn DataField="worker_id" HeaderText="Worker"></asp:BoundColumn>
                    <asp:BoundColumn DataField="employee_name" HeaderText="Technician">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                    <asp:BoundColumn DataField="time" HeaderText="Time" Visible="False">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="problem" HeaderText="issue"></asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_id" HeaderText="mechn id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="employee_id" HeaderText="tech id"></asp:BoundColumn>
                    <asp:ButtonColumn Text="View"></asp:ButtonColumn>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style3">
                        Problem</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Repair time</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

