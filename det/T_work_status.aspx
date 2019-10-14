<%@ Page Title="" Language="C#" MasterPageFile="~/tec.master" AutoEventWireup="true" CodeFile="T_work_status.aspx.cs" Inherits="work_status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
                onitemcommand="DataGrid2_ItemCommand" >
                <Columns>
                    <asp:BoundColumn DataField="fault_id" HeaderText="Fault_id"></asp:BoundColumn>
                    <asp:BoundColumn DataField="employee_name" HeaderText="Employee_name"></asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_name" HeaderText="mechine_name">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_id" HeaderText="Mechine_id" Visible="False">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="problem" HeaderText="Issue"></asp:BoundColumn>
                    <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                    <asp:BoundColumn DataField="time" HeaderText="Time"></asp:BoundColumn>
                    <asp:BoundColumn DataField="status" HeaderText="Status"></asp:BoundColumn>
                    <asp:ButtonColumn Text="Finish"></asp:ButtonColumn>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
        </asp:View>
    </asp:MultiView>
</asp:Content>

