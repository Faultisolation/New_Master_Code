<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_workassign.aspx.cs" Inherits="workassign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 83px;
        }
        .style4
        {
            height: 59px;
        }
        .style5
        {
            height: 79px;
        }
        .style6
        {
            height: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
                <tr>
                    <td class="style3">
                        Work </td>
                    <td class="style3">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="46px" Width="164px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="DropDownList1" ErrorMessage="Select One" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Select worker</td>
                    <td class="style5">
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged" Height="44px" 
                            Width="160px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="DropDownList2" ErrorMessage="Select One" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        From Date</td>
                    <td class="style6">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label2" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        To Date</td>
                    <td class="style4">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="invalid date" ForeColor="Red" 
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label3" runat="server" ForeColor="#999999" Text="(dd/mm/yyyy)"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" style="margin-left: 0px" 
                            Text="Assign" onclick="Button2_Click" class="genric-btn primary circle mt-30" />
                    </td>
                </tr>
            </table>
</asp:Content>

