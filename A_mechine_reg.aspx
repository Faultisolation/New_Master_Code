<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_mechine_reg.aspx.cs" Inherits="mechine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 34px;
        }
        .style4
        {
            height: 47px;
        }
        .style5
        {
            height: 46px;
        }
        .style6
        {
            height: 44px;
        }
        .style7
        {
            height: 71px;
        }
        .style8
        {
            height: 50px;
        }
        .style9
        {
            height: 82px;
        }
        .style10
        {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                            onselectedindexchanged="DataGrid1_SelectedIndexChanged" 
                            onitemcommand="DataGrid1_ItemCommand" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Horizontal" Font-Size="Small">
                            <Columns>
                                <asp:BoundColumn DataField="mechine_id" HeaderText="Mechine_Id" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="mechine_name" HeaderText="Machine Name"></asp:BoundColumn>
                                <asp:BoundColumn DataField="brand" HeaderText="Brand"></asp:BoundColumn>
                                <asp:BoundColumn DataField="use_ed" HeaderText="USE"></asp:BoundColumn>
                                <asp:BoundColumn DataField="department" HeaderText="department">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="lastserviced" HeaderText="Last Serviced ">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="warranty" HeaderText="Warranty Upto">
                                </asp:BoundColumn>
                                <asp:ButtonColumn Text="View"></asp:ButtonColumn>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        <asp:Button ID="Button1" runat="server" Text="Add New" 
                            onclick="Button1_Click" class="genric-btn primary circle mt-30"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style4">
                        Mechine Name</td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        Brand</td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        USE</td>
                    <td class="style6">
                        <asp:TextBox ID="TextBox3" runat="server" Height="30px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Department</td>
                    <td class="style7">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="DropDownList1" ErrorMessage="Choose one" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Last serviced</td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox4" runat="server" Height="30px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        &nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        Warranty Upto</td>
                    <td class="style8">
                        <asp:TextBox ID="TextBox5" runat="server" Height="30px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label3" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        </td>
                    <td class="style5">
                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="ADD" 
                            CausesValidation="False" Height="35px" Width="116px" class="genric-btn primary circle mt-30"/>
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
        <asp:View ID="View3" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Mechine Name</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Brand</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="TextBox8" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        USE</td>
                    <td class="style3">
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="TextBox9" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        Department</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="DropDownList2" ErrorMessage="Choose one" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Last serviced</td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="TextBox10" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="TextBox10" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label4" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Warranty Upto</td>
                    <td>
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                            ControlToValidate="TextBox11" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="TextBox11" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label5" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Update"
                            class="genric-btn primary circle mt-30" Height="49px" Width="189px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button4" runat="server" Text="Remove" onclick="Button4_Click"
                            class="genric-btn primary circle mt-30" Height="47px" Width="212px" />
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

