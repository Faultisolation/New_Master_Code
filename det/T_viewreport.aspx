<%@ Page Title="" Language="C#" MasterPageFile="~/tec.master" AutoEventWireup="true" CodeFile="T_viewreport.aspx.cs" Inherits="viewreportDefault2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            height: 29px;
        }
        .style4
        {
            height: 29px;
            width: 302px;
        }
        .style5
        {
            height: 23px;
            width: 302px;
        }
        .style6
        {
            width: 302px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                onitemcommand="DataGrid1_ItemCommand" 
                onselectedindexchanged="DataGrid1_SelectedIndexChanged" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" Font-Size="Medium">
                <Columns>
                    <asp:BoundColumn DataField="fault_id" HeaderText="fault"></asp:BoundColumn>
                    <asp:BoundColumn DataField="technician_id" HeaderText="Technician" 
                        Visible="False">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_id" HeaderText="Mechine id" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="worker_id" HeaderText="Worker id" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_name" HeaderText="Mechine">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="employee_name" HeaderText="worker">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                    <asp:BoundColumn DataField="problem" HeaderText="issue"></asp:BoundColumn>
                    <asp:BoundColumn DataField="time" HeaderText="Time" Visible="False">
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="Request" CommandName="request"></asp:ButtonColumn>
                    <asp:ButtonColumn CommandName="status" Text="View Status"></asp:ButtonColumn>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table class="style1">
                <tr>
                    <td class="style4">
                        Worker</td>
                    <td class="style3">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Mechine</td>
                    <td class="style3">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Issue on Report</td>
                    <td class="style2">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Repair Time</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

