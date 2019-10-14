<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_report.aspx.cs" Inherits="report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            height: 241px;
        }
        .style5
        {
            height: 75px;
        }
        .style6
        {
            height: 72px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Fault Prediction" 
                            onclick="Button3_Click" class="genric-btn primary circle mt-30" 
                            Height="62px" Width="228px"/>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button5" runat="server" class="genric-btn primary circle mt-30" 
                            Height="58px" onclick="Button5_Click" Text="Report" Width="179px" />
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
                        Mechine</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Worker</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="DropDownList3" ErrorMessage="*" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Technician
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="DropDownList4" ErrorMessage="*" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label2" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Issue</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button9" runat="server" onclick="Button9_Click" Text="Report" 
                            Width="179px" class="genric-btn primary circle mt-30" Height="43px"/>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table class="style1">
                <tr>
                    <td class="style4">
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" ForeColor="Black" GridLines="Horizontal" Font-Size="Small" 
                          >
                            <Columns>
                                <asp:BoundColumn DataField="fault_id" HeaderText="Fault_id"></asp:BoundColumn>
                                <asp:BoundColumn DataField="mechine_id" HeaderText="mechine_id"></asp:BoundColumn>
                                <asp:BoundColumn DataField="worker_id" HeaderText="worker_id"></asp:BoundColumn>
                                <asp:BoundColumn DataField="technician_id" HeaderText="technician_id"></asp:BoundColumn>
                                <asp:BoundColumn DataField="date" HeaderText="date">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="time" HeaderText="time"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="problem" DataField="problem"></asp:BoundColumn>
                                <asp:BoundColumn DataField="status" HeaderText="status"></asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>
                    </td>
                    <td class="style4">
                        </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Button ID="Button8" runat="server" onclick="Button8_Click" 
                            Text="ADD NEW REPORT" Width="322px" class="genric-btn primary circle mt-30" />
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
    </asp:MultiView>
</asp:Content>

