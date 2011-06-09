<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="SolveProblem.aspx.cs" Inherits="spoithesequel.User.SolveProblem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Rozwiąż problem</h2>

<br />
<br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <p>Załaduj kod źródłowy Twojego rozwiązania:</p>
                <asp:AsyncFileUpload ID="AsyncFileUpload" runat="server" ThrobberID="UpdateProgress" Width="60px" onuploadedcomplete="AsyncFileUpload_UploadedComplete" />
                <asp:UpdateProgress ID="UpdateProgress" runat="server" >
                <ProgressTemplate>
                    <img alt="circle" src="../App_Themes/Default/images/ajax-loader.gif" />
                </ProgressTemplate>
                </asp:UpdateProgress>

                <br />
                <br />

                <p>Język:</p>
    <asp:DropDownList ID="Languages" runat="server">
    </asp:DropDownList>

    <br />
    <br />
    <br />

    <p>Kod problemu:</p>
    <asp:TextBox ID="ProblemsCode" runat="server"></asp:TextBox>

    <br />
    <br />
    <br />

    <asp:Button ID="Send" runat="server" Text="Wyślij" onclick="Send_Click" />
        </asp:View>
        <asp:View ID="View2" runat="server">
        <p>Twoje rozwiązanie zostało przesłane do sprawdzenia. Sprawdź status swojego rozwiązania klikająć <i>tutaj</i>.</p>
        </asp:View>
    </asp:MultiView>
</asp:Content>
