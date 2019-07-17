<%@ Page Title="" Language="C#" MasterPageFile="~/Public.master" AutoEventWireup="true" 
    CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/login.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel DefaultButton="submit" runat="server">
        <div id="login">
            <p id="username">
                <Label id="lblUsername">Username:</Label>
                <asp:TextBox type="text" ID="txtUsername" CssClass="txtUsername" runat="server" autofocus="true" />
            </p>
            <p id="password">
                <Label id="lblPassword">Password:</Label>
                <asp:TextBox type="password" ID="txtPassword" CssClass="txtPassword" runat="server" />
            </p>
        
            <p id="pSubmit"><asp:LinkButton ID="submit" CssClass="submit" Text="LOG IN" runat="server" OnClick="Submit_Click" /></p>
        
            <!-- <p><asp:Literal ID="litError" runat="server"/></p> -->
        </div>
    </asp:Panel>

</asp:Content>

