<%@ Page Title="CIT386-Final" Language="C#" MasterPageFile="~/mpoust/Final.master" AutoEventWireup="true" CodeFile="ZipCode.aspx.cs" Inherits="mpoust_ZipCode" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="lblZip" Text="Zipcode:" runat="server" />   
        <br />
    <asp:TextBox ID="txtZip" runat="server" />
    <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" />
        <br />
        <br />
    <asp:Label ID="lblInfo1" Text="" runat="server" />
        <br />
        <br />
    <asp:Label ID="lblInfo2" Text="" runat="server" />
        <br />
    <asp:Image ID="imgState" runat="server" />
</asp:Content>