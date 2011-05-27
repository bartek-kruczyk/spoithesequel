<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditProblem.aspx.cs" Inherits="spoithesequel.Admin.EditProblem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2>Edytuj problem</h2>
    
    <h4>Tytuł</h4>
    <asp:TextBox ID="ProblemsTitle" Width="300px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ProblemsTitleRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="ProblemsTitle"></asp:RequiredFieldValidator>
    
    <br />
    <br />

    <h4>Kod problemu</h4>
    <asp:TextBox ID="ProblemsCode" runat="server"></asp:TextBox>

    <br />
    <br />

    <h4>Poziom trudności</h4>
    <asp:DropDownList ID="DifficultyLevel" runat="server">
        <asp:ListItem>Łatwy</asp:ListItem>
        <asp:ListItem>Średni</asp:ListItem>
        <asp:ListItem>Trudny</asp:ListItem>
    </asp:DropDownList>

    <br />
    <br />
    
    <h4>Dozwolone języki</h4>
    <asp:CheckBoxList ID="Languages" runat="server">
        <asp:ListItem>ANSI C</asp:ListItem>
        <asp:ListItem>C++</asp:ListItem>
        <asp:ListItem>C#</asp:ListItem>
    </asp:CheckBoxList>
    
    <br />

    <h4>Grupy</h4>
    
    <asp:CheckBoxList ID="Groups" runat="server">

    </asp:CheckBoxList>

    <h4>Limit czasowy na wykonanie (w sekundach)</h4>
    <asp:TextBox ID="TimeLimit" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="TimeLimitValidator" runat="server" ErrorMessage="Incorrect input sequence" ValidationExpression="[0-9]*" ControlToValidate="TimeLimit"></asp:RegularExpressionValidator>

    <h4>Limit rozmiaru (w bajtach)</h4>
    <asp:TextBox ID="SizeLimit" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="SizeLimitValidator" runat="server" ErrorMessage="Incorrect input sequence" ValidationExpression="[0-9]*" ControlToValidate="SizeLimit"></asp:RegularExpressionValidator>
    
    <h4>Opis problemu</h4>
    <cc1:Editor ID="Editor" runat="server" />
    <br />
    <br />
    <h4>Obecne pary wej/wyj</h4>
    

    <asp:Table ID="InOut" runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>

    <br />
    <br />

    <h4>Dodaj nowe pary wej/wyj do istniejacych</h4>
    <div style="width:500px;">
        <table>
            <tr>
                <td>Nr</td>
                <td><h4>Wejście</h4></td>
                <td><h4>Wyjście</h4></td>
            </tr>
            <tr>
                <td>1</td>
                <td><asp:TextBox ID="Input1" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="Output1" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>2</td>
                <td><asp:TextBox ID="Input2" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="Output2" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>3</td>
                <td><asp:TextBox ID="Input3" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="Output3" Width="200px" Height="40px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>   
        </table>
Jeśli chcesz dodać wiecęj par WEJ/WYJ zaimportuj plik z danymi w formacie *.csv (nr_pary;wejście;wyjście)<br />
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
    </div>

    <br />
    <br />
    
        <div style="width:500px;">
        <div style="float:left; margin-right:50px">
            <h4>Data otwarcia</h4>
            <asp:TextBox ID="OpeningDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="OpeningDate" runat="server">
            </asp:CalendarExtender>
            <br />
            <MKB:TimeSelector ID="OpeningTime" runat="server" SelectedTimeFormat="TwentyFour">
            </MKB:TimeSelector>
            <br />
        </div>
        
        <div style="float:left">
                <h4>Data zamknięcia</h4>
                <asp:TextBox ID="ClosingDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="ClosingDate" runat="server">
                </asp:CalendarExtender>
                <MKB:TimeSelector ID="ClosingTime" runat="server" SelectedTimeFormat="TwentyFour">
                </MKB:TimeSelector>
                <br />
        </div>
    </div>

    <br />
    <br />
    <br />

    <div style="clear:both">
        <asp:Button ID="EditProblemX" runat="server" Text="Edytuj problem" onclick="EditProblem_Click" />
    </div>
    
    <asp:Label ID="EditSuccessful" runat="server" Visible="false"></asp:Label>

</asp:Content>
