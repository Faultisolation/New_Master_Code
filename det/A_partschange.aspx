<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_partschange.aspx.cs" Inherits="partschange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
        onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Horizontal" Font-Size="Small">
        <Columns>
            <asp:BoundColumn DataField="reqt_id" HeaderText="reqt id"></asp:BoundColumn>
            <asp:BoundColumn DataField="employee_name" HeaderText="Technician Name">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="mechine_name" HeaderText="Mechine Name">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="technician_id" HeaderText="employee_id" 
                Visible="False">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="mechine_id" HeaderText="machine_id" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="parts" HeaderText="parts to change">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="description" HeaderText="Description">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="date" HeaderText="date of request ">
            </asp:BoundColumn>
            <asp:ButtonColumn Text="Accept" CommandName="accept"></asp:ButtonColumn>
            <asp:ButtonColumn Text="Reject" CommandName="reject"></asp:ButtonColumn>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataGrid>
    <p>
    </p>
</asp:Content>

