<%@ Page Title="" Language="C#" MasterPageFile="schedule.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="headPlaceHolder" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="contentPlaceHolder" ContentPlaceHolderID="contentPlaceHolder" Runat="Server">

	<h1>This is the amin admin page.</h1>
    <p>You should only see this if youa re logged in</p>
    
    <asp:Button ID="btnEmail" runat="server" OnClick="sendEmail" Text="Send Email"></asp:Button>
    <asp:Literal ID="litAlert" runat="server"></asp:Literal>
 
</asp:Content>