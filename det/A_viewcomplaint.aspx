<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_viewcomplaint.aspx.cs" Inherits="viewcomplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                            onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Horizontal" Font-Size="Medium">
                            <Columns>
                                <asp:BoundColumn DataField="cmp_id" HeaderText="Complaint_Id" Visible="False">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="employee_id" HeaderText="Employee_id" 
                                    Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="employee_name" HeaderText="Name"></asp:BoundColumn>
                                <asp:BoundColumn DataField="type" HeaderText="type"></asp:BoundColumn>
                                <asp:BoundColumn DataField="complaints" HeaderText="Complaints">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="reply" HeaderText="Replay"></asp:BoundColumn>
                                <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                                <asp:ButtonColumn Text="Replay"></asp:ButtonColumn>
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
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Employee Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Complaints</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        replay</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Reply" class="genric-btn primary circle mt-30" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

