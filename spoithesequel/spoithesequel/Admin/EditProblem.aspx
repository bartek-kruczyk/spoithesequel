<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditProblem.aspx.cs" Inherits="spoithesequel.Admin.EditProblemTemp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="Form" runat="server">
    
    <h2><asp:Label ID="FormType" runat="server" Text="Edytuj problem"></asp:Label></h2>

    <h4>Tytuł</h4>
    <asp:TextBox ID="ProblemsTitle" Width="300px" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ProblemsTitleRequiredFieldValidator" runat="server" ErrorMessage="Field required" ControlToValidate="ProblemsTitle"></asp:RequiredFieldValidator>
    
    <br />

    <h4>Kod problemu</h4>
    <asp:TextBox ID="ProblemsCode" runat="server"></asp:TextBox>

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
    </asp:CheckBoxList>
    
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

    <h4>Pary wejście - wyjście</h4>
            


           
            
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
            <asp:Table ID="InOut" runat="server">
            <asp:TableHeaderRow>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox36" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox37" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox38" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Visible="false">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox39" runat="server"></asp:TextBox></asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox40" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            </asp:Table>

                         <asp:Button ID="AddNextInOut" runat="server" Text="Dodaj następne" 
                onclick="AddNextInOut_Click" CausesValidation="false" />
            </ContentTemplate>

            </asp:UpdatePanel>
            


            <br />
            <br />
            
                <p><strong>

                <asp:Label ID="ObecnePary0" runat="server" Text="Jeżeli potrzebujesz dodać wiecęj par wejścia-wyjścia zaimportuj plik z danymi w formacie *.csv (nr_pary;wejście;wyjście)."></asp:Label>
                <asp:Label ID="ObecnePary1" runat="server" Text="Obecne pary wejścia-wyjścia możesz pobrać klikając <i>tutaj</i>."></asp:Label>
                    <asp:LinkButton ID="GetCSVPairs" runat="server" OnClick="GetCSVPairs_Click"><i>tutaj</i></asp:LinkButton>
                
                </strong></p>

                <asp:AsyncFileUpload ID="AsyncFileUpload" runat="server" ThrobberID="UpdateProgress" Width="60px" onuploadedcomplete="AsyncFileUpload_UploadedComplete" />
                <asp:UpdateProgress ID="UpdateProgress" runat="server" >
                <ProgressTemplate>
                    <img alt="circle" src="../App_Themes/Default/images/ajax-loader.gif" />
                </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:Label ID="UploadFileInfoLabel" runat="server" BackColor="Red" Visible="false" Text="Plik MUSI być z rozszerzeniem *.csv"></asp:Label> 

    <br />
    <br />
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
        <asp:Button ID="EditProblemX" runat="server" Text="Edytuj problem" onclick="EditProblemX_Click" OnClientClick="doSubmit(this); return false;" />
    </div>

    

    <asp:Label ID="EditSuccessful" runat="server" Visible="false"></asp:Label>
    
    </asp:View>

        <asp:View ID="Result" runat="server">
        <h3>Pomyślnie dokonano zmian</h3>
        </asp:View>
    </asp:MultiView>
</asp:Content>
