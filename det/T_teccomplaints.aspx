<%@ Page Title="" Language="C#" MasterPageFile="~/tec.master" AutoEventWireup="true" CodeFile="T_teccomplaints.aspx.cs" Inherits="teccomplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 211px;
        }
        .style3
        {
            height: 41px;
        }
        .style4
        {
            height: 32px;
        }
        .style5
        {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td class="style5">
                        Employee Name</td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Date</td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox3" runat="server" ontextchanged="TextBox3_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Complaint</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="submit" onclick="Button1_Click" 
                            class="genric-btn primary circle mt-30" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2">
                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
                            Font-Size="Medium" >
                         
                            <Columns>
                                <asp:BoundColumn DataField="cmp_id" HeaderText="Complaint_Id" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="employee_id" HeaderText="Employee_id" 
                                    Visible="False">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="type" HeaderText="type" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="complaints" HeaderText="Complaints">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="reply" HeaderText="reply"></asp:BoundColumn>
                                <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>
                    </td>
                    <td class="style2">
                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                            Text="New Complaint" Height="42px" Width="167px" class="genric-btn primary circle mt-30" />
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
    </asp:MultiView>
</asp:Content>

