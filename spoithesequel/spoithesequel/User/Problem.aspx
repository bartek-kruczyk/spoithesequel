<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Problem.aspx.cs" Inherits="spoithesequel.User.Problem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--<ul id="ProblemsMenu"><li class="MenuItem">Rozwiąż</li><li class="MenuItem">Statystyki zadania</li><li class="MenuItem">Powrót do listy problemów</li></ul>-->

<div id="ProblemsMenu">
<asp:HyperLink ID="SolveProblemLink" runat="server">Rozwiąż</asp:HyperLink>&ensp;&ensp;
<asp:HyperLink ID="ProblemStatsLink" runat="server">Statystyki</asp:HyperLink>&ensp;&ensp;
<asp:HyperLink ID="BackToListLink" runat="server">Powróć do listy zadań</asp:HyperLink>
</div>

<br />

<h2><asp:Label ID="ProblemsTitle" runat="server"></asp:Label></h2> 

<br />

<h3>Kod problemu: <asp:Label ID="ProblemsCode" runat="server"></asp:Label></h3>

<br />
<br />

<asp:Label ID="ProblemsDescription" runat="server"></asp:Label>

<br />
<br />

<hr />
<asp:Table ID="ProblemsInfo" runat="server">
<asp:TableRow><asp:TableCell>Dodane przez:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow><asp:TableCell>Data:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow><asp:TableCell>Trudność:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow><asp:TableCell>Limit czasu wykonania:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow><asp:TableCell>Limit wielkości pliku źródłowego:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
<asp:TableRow><asp:TableCell>Języki:</asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
</asp:Table>
<hr />
</asp:Content>
