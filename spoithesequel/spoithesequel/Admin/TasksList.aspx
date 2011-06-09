<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TasksList.aspx.cs" Inherits="spoithesequel.Admin.TasksList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1" 
        EnableModelValidation="True">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="LanguagesLabel" runat="server" Text='<%# Eval("Languages") %>' />
                </td>
                <td>
                    <asp:Label ID="DifficultyLevelLabel" runat="server" 
                        Text='<%# Eval("DifficultyLevel") %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="OpeningDateLabel" runat="server" 
                        Text='<%# Eval("OpeningDate") %>' />
                </td>
                <td>
                    <asp:Label ID="ClosingDateLabel" runat="server" 
                        Text='<%# Eval("ClosingDate") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LanguagesTextBox" runat="server" 
                        Text='<%# Bind("Languages") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DifficultyLevelTextBox" runat="server" 
                        Text='<%# Bind("DifficultyLevel") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OpeningDateTextBox" runat="server" 
                        Text='<%# Bind("OpeningDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ClosingDateTextBox" runat="server" 
                        Text='<%# Bind("ClosingDate") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LanguagesTextBox" runat="server" 
                        Text='<%# Bind("Languages") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DifficultyLevelTextBox" runat="server" 
                        Text='<%# Bind("DifficultyLevel") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OpeningDateTextBox" runat="server" 
                        Text='<%# Bind("OpeningDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ClosingDateTextBox" runat="server" 
                        Text='<%# Bind("ClosingDate") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="LanguagesLabel" runat="server" Text='<%# Eval("Languages") %>' />
                </td>
                <td>
                    <asp:Label ID="DifficultyLevelLabel" runat="server" 
                        Text='<%# Eval("DifficultyLevel") %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="OpeningDateLabel" runat="server" 
                        Text='<%# Eval("OpeningDate") %>' />
                </td>
                <td>
                    <asp:Label ID="ClosingDateLabel" runat="server" 
                        Text='<%# Eval("ClosingDate") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="Tr2" runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th id="Th1" runat="server">
                                    Title</th>
                                <th id="Th2" runat="server">
                                    Languages</th>
                                <th id="Th3" runat="server">
                                    DifficultyLevel</th>
                                <th id="Th4" runat="server">
                                    Description</th>
                                <th id="Th5" runat="server">
                                    OpeningDate</th>
                                <th id="Th6" runat="server">
                                    ClosingDate</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" 
                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="LanguagesLabel" runat="server" Text='<%# Eval("Languages") %>' />
                </td>
                <td>
                    <asp:Label ID="DifficultyLevelLabel" runat="server" 
                        Text='<%# Eval("DifficultyLevel") %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="OpeningDateLabel" runat="server" 
                        Text='<%# Eval("OpeningDate") %>' />
                </td>
                <td>
                    <asp:Label ID="ClosingDateLabel" runat="server" 
                        Text='<%# Eval("ClosingDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="spoithesequel.DataBase.DataClasses1DataContext" 
        Select="new (Title, Languages, DifficultyLevel, Description, OpeningDate, ClosingDate)" 
        TableName="Problems" EntityTypeName="">
    </asp:LinqDataSource>

</asp:Content>
