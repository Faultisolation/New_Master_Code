<%@ Page Title="" Language="C#" MasterPageFile="~/tec.master" AutoEventWireup="true" CodeFile="T_parts_request.aspx.cs" Inherits="T_parts_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            width: 482px;
        }
        .style5
        {
            height: 173px;
        }
        .style6
        {
            height: 54px;
        }
        .style7
        {
            height: 30px;
        }
        .style8
        {
            height: 33px;
        }
        .style9
        {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <table class="style1">
            <tr>
                <td class="style5">
                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                        onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Horizontal" Font-Size="Medium">
                        <Columns>
                            <asp:BoundColumn DataField="reqt_id" HeaderText="Request_id" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="technician_id" HeaderText="Technician_id" 
                                Visible="False">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="mechine_name" HeaderText="Mechine Name">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="mechine_id" HeaderText="Mechine_id" Visible="False">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="parts" HeaderText="Parts to Change">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="description" HeaderText="Description">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="date" HeaderText="Date of Request">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="status" HeaderText="Status" Visible="False">
                            </asp:BoundColumn>
                            <asp:ButtonColumn Text="Status"></asp:ButtonColumn>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:DataGrid>
                </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Request New Parts" Height="40px" Width="187px" class="genric-btn primary circle mt-30" />
                </td>
                <td class="style6">
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
    <asp:View ID="View2" runat="server">
        <table class="style1">
            <tr>
                <td>
                    Mechine</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="DropDownList1" ErrorMessage="Select one" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Parts To Change</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    Description</td>
                <td class="style8">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    Date</td>
                <td class="style9">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="invalid date" ForeColor="Red" 
                        ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                    <asp:Label ID="Label5" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Request" class="genric-btn primary circle mt-30" Font-Size="Medium"/>
                </td>
            </tr>
        </table>
    </asp:View>
        <asp:View ID="View3" runat="server">
        <table class="style1">
            <tr>
                <td class="style2">
                    Mechine</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Parts To Change</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Description</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Status</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:View>
</asp:MultiView>
</asp:Content>

