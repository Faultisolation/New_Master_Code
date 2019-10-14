<%@ Page Title="" Language="C#" MasterPageFile="~/worker.master" AutoEventWireup="true" CodeFile="W_workstatus.aspx.cs" Inherits="workstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style1">
    <tr>
        <td>
            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" Font-Size="Medium">
                <Columns>
                    <asp:BoundColumn DataField="work_assign_id" HeaderText="Work_assign_id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="work_id" HeaderText="Work_id" Visible="False"></asp:BoundColumn>
                    <asp:BoundColumn DataField="worker_id" HeaderText="Worker_id" Visible="False">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="work_name" HeaderText="Work"></asp:BoundColumn>
                    <asp:BoundColumn DataField="from_date" HeaderText="From_Date"></asp:BoundColumn>
                    <asp:BoundColumn DataField="to_date" HeaderText="To_date">
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="Approve" CommandName="approve"></asp:ButtonColumn>
                    <asp:ButtonColumn Text="Reject" CommandName="reject"></asp:ButtonColumn>
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
    
</asp:Content>

