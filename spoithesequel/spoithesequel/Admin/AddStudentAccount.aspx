<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudentAccount.aspx.cs" Inherits="spoithesequel.AddStudentAccount" MasterPageFile="~/Admin/Admin.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
Podaj plik w formacie *.csv : <br />
<asp:AsyncFileUpload ID="AsyncFileUpload" runat="server" ThrobberID="UpdateProgress" Width="60px" />
    <asp:UpdateProgress ID="UpdateProgress" runat="server">
    <ProgressTemplate>
    <img alt="circle" src="../App_Themes/Default/images/ajax-loader.gif" />
    </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

