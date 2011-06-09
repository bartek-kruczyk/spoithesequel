<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AddStudentToGroup.aspx.cs" Inherits="spoithesequel.Admin.AddStudentToGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    Studenci bez grupy:
    <br />
   
     <asp:Repeater ID="StudentWithoutGroupRepeater" runat="server" >
        <ItemTemplate>
        <asp:Button ID="AddButton" runat="server" Text="+" CommandArgument='<%# Eval("Id") %>'  OnCommand="AddUserToGroup" />     
        <asp:Literal ID="User" runat="server" Text='<%#Eval("UserId") %>'></asp:Literal> &nbsp;
        <asp:Literal ID="UserMail" runat="server" Text='<%#Eval("Email") %>'></asp:Literal> 
        <br />
        </ItemTemplate>
        </asp:Repeater>
            
    <br />

            <br />
   
    Studenci w grupie studenci:
    <br />
        <asp:Repeater ID="StudentInGroupRepeater" runat="server" >
        <ItemTemplate>
        <asp:Button ID="DropUser" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="DropButton_Command" Text="-" />
        <asp:Literal ID="UserId" runat="server" Text='<%#Eval("UserId") %>'></asp:Literal> &nbsp; 
        <asp:Literal ID="UserMail" runat="server" Text='<%#Eval("Email") %>'></asp:Literal>
         <br />
        </ItemTemplate>
        </asp:Repeater> 
</asp:Content>
