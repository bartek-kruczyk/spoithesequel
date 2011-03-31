<%@ Page Title="Add new problem" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddNewProblem.aspx.cs" Inherits="spoithesequel.Admin.AddNewProblem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h2>Add new problem</h2>
    
    <h4>Title</h4>
    <asp:TextBox ID="ProblemsTitle" Width="300px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ProblemsTitleRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="ProblemsTitle"></asp:RequiredFieldValidator>
    
    <br />
    <br />

    <h4>Problem's Code</h4>
    <asp:TextBox ID="ProblemsCode" runat="server"></asp:TextBox>

    <br />
    <br />

    <h4>Difficulty level</h4>
    <asp:DropDownList ID="DifficultyLevel" runat="server">
        <asp:ListItem>Easy</asp:ListItem>
        <asp:ListItem>Medium</asp:ListItem>
        <asp:ListItem>Hard</asp:ListItem>
    </asp:DropDownList>

    <br />
    <br />

    <h4>Allowed languages</h4>
    <asp:CheckBoxList ID="Languages" runat="server">
        <asp:ListItem>ANSI C</asp:ListItem>
        <asp:ListItem>C++</asp:ListItem>
        <asp:ListItem>C#</asp:ListItem>
    </asp:CheckBoxList>
    
    <br />
    <br />

    <h4>Time limit (seconds)</h4>
    <asp:TextBox ID="TimeLimit" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="TimeLimitValidator" runat="server" ErrorMessage="Incorrect input sequence" ValidationExpression="[0-9]*" ControlToValidate="TimeLimit"></asp:RegularExpressionValidator>

    <br />
    <br />

    <h4>Size Limit (bytes)</h4>
    <asp:TextBox ID="SizeLimit" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="SizeLimitValidator" runat="server" ErrorMessage="Incorrect input sequence" ValidationExpression="[0-9]*" ControlToValidate="SizeLimit"></asp:RegularExpressionValidator>

    <br />
    <br />

    <h4>Description</h4>
    <asp:TextBox ID="Description" TextMode="MultiLine" Width="500px" Height="300px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="DescriptionRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="Description"></asp:RequiredFieldValidator>

    <br />
    <br />

    <h4>Input (remember to separate inputs using semicolon)</h4>
    <asp:TextBox ID="Input" Width="400px" Height="150px" TextMode="MultiLine" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="InputRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="Input"></asp:RequiredFieldValidator>

    <br />
    <br />

    <h4>Output (remember to separate outputs using semicolon)</h4>
    <asp:TextBox ID="Output" Width="400px" Height="150px" TextMode="MultiLine" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="OutputRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="Output"></asp:RequiredFieldValidator>

    <br />
    <br />

    <h4>Opening date</h4>
    <asp:Calendar ID="OpeningDate" runat="server"></asp:Calendar>
       
    <br />
    <br />

    <h4>Closing date</h4>
    <asp:Calendar ID="ClosingDate" runat="server"></asp:Calendar>

    <br />
    <br />

    <asp:Button ID="AddProblem" runat="server" Text="Add new problem" 
        onclick="AddProblem_Click" />

    <br />

    <asp:Label ID="AddingSuccessful" runat="server" Visible="false"></asp:Label>

</asp:Content>
