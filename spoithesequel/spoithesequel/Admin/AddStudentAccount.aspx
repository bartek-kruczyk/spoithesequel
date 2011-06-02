<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudentAccount.aspx.cs" Inherits="spoithesequel.AddStudentAccount" MasterPageFile="~/Admin/Admin.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
Podaj plik w formacie *.csv : <br />
<asp:AsyncFileUpload ID="AsyncFileUpload" runat="server" 
        ThrobberID="UpdateProgress" Width="60px" 
        onuploadedcomplete="AsyncFileUpload_UploadedComplete" />
    <asp:UpdateProgress ID="UpdateProgress" runat="server" >
    <ProgressTemplate>
    <img alt="circle" src="../App_Themes/Default/images/ajax-loader.gif" />
    </ProgressTemplate>
    </asp:UpdateProgress>
    <br />
    <asp:Label ID="UploadFileInfoLabel" runat="server" BackColor="Red" Visible="false" Text="Plik MUSI być z rozszerzeniem *.csv"></asp:Label>
</asp:Content>

