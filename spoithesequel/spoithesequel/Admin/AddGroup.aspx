<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddGroup.aspx.cs" Inherits="spoithesequel.Admin.AddGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<asp:TextBox ID="GroupNameTextBox" runat="server"></asp:TextBox>
<asp:Button ID="AddGroupButton" runat="server" Text="Dodaj grupe" 
        onclick="AddGroupButton_Click" />
<br />
<br />
<br />
Dodane grupy:<br />
<asp:Repeater ID="GroupNameRepeater" runat="server" DataSourceID="SqlDataSource">
<ItemTemplate>
<asp:HyperLink ID="GroupName" runat="server" NavigateUrl='<%# String.Format("~/Admin/AddStudentToGroup.aspx?id={0}", Eval("IdGroup")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink>  <br />
</ItemTemplate>
</asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dziennikucznia_studentlive_plConnectionString %>" 
        SelectCommand="SELECT [IdGroup], [Name] FROM [Groups]"></asp:SqlDataSource>
    
</asp:Content>
