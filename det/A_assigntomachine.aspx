<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="A_assigntomachine.aspx.cs" Inherits="assigntomachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 71px;
        }
        .style4
        {
            height: 43px;
        }
        .style5
        {
            height: 48px;
        }
        .style6
        {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style2">
                        Mechine Name</td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList4" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DropDownList4" ErrorMessage="Choose one" ForeColor="Red" 
                            InitialValue="select"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        department</td>
                    <td class="style6">
                        <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" 
                            AutoPostBack="True" onselectedindexchanged="DropDownList5_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Select Worker</td>
                    <td class="style5">
                        <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                            onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
                            
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        </td>
                    <td class="style2">
                        <asp:Button ID="Button1" runat="server" Text="Assign" onclick="Button1_Click" class="genric-btn primary circle mt-30" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" Font-Size="Medium" ForeColor="Black" GridLines="Horizontal" >
                
                <Columns>
                    <asp:BoundColumn DataField="mechineid" HeaderText="Mechine ID">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="mechine_name" HeaderText="Mechine_name">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="empname" HeaderText="Employee Name">
                    </asp:BoundColumn>
                    <asp:ButtonColumn Text="Remove"></asp:ButtonColumn>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataGrid>
        </asp:View>
    </asp:MultiView>
</asp:Content>

