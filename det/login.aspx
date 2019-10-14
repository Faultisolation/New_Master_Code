<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 99%;
            height: 109px;
        }
        .style2
        {
            width: 183px;
        }
        .style3
        {
            font-weight: bold;
        }
        .style4
        {
            width: 183px;
            height: 36px;
            font-size: large;
        }
        .style6
        {
            width: 183px;
            font-size: large;
            height: 45px;
        }
        .style7
        {
            height: 36px;
        }
        .style8
        {
            height: 45px;
        }
        .style9
        {
            width: 218px;
            font-size: large;
            height: 45px;
        }
        .style10
        {
            width: 218px;
            height: 36px;
            font-size: large;
        }
        .style11
        {
            width: 218px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style6">
                <strong class="style3">User name</strong></td>
            <td class="style8">
                <asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style4">
                <strong class="style3">Password</strong></td>
            <td class="style7">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="31px" 
                    Width="178px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" 
                    Height="46px" Width="116px" class="genric-btn primary circle mt-30" />
            </td>
        </tr>
    </table>
</asp:Content>

