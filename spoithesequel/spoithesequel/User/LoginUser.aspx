<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="spoithesequel.User.LoginUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" MembershipProvider="SqlProvider" 
    onloggedin="Login1_LoggedIn" Height="176px" style="text-align: left" 
    Width="459px">
</asp:Login>
<p>
</p>
</asp:Content>
