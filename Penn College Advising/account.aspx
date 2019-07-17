<%@ Page Title="" Language="C#" MasterPageFile="~/Private.master" AutoEventWireup="true" 
    CodeFile="account.aspx.cs" Inherits="account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link rel="stylesheet" type="text/css" href="css/account.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="accountDiv" runat="server">
        <p id="accountManagement">Account Management</p>

        <p id="name">
            <Label id="lblName"><span id="spFirstName">First Name:</span><span id="spLastName">Last Name:</span></Label><br />
            <asp:TextBox type="text" ID="txtFirstName" CssClass="txtFirstName" runat="server" />
            <asp:TextBox type="text" ID="txtLastName" CssClass="txtLastName" runat="server" />
        </p>
        <p id="email">
            <Label id="lblEmail">Email:</Label><br />
            <asp:TextBox TextMode="Email" ID="txtEmail" CssClass="txtEmail" runat="server" />
        </p>

        <asp:Panel ID="pnlAdvisor" runat="server">
            <p id="phone" runat="server">
                <Label id="lblPhone"><span id="spPhone">Phone:</span><span id="spExt">Ext.:</span></Label><br />
                <asp:TextBox TextMode="Phone" ID="txtPhone" CssClass="txtPhone" runat="server" />
                <asp:TextBox type="text" ID="txtExt" CssClass="txtExt" runat="server" />
            </p>
            <p id="office" runat="server">
                <Label id="lblOffice"><span id="spOffice">Office:</span><span id="spBuilding">Building:</span></Label><br />
                <asp:TextBox type="text" ID="txtOffice" CssClass="txtOffice" runat="server" />
                <asp:TextBox type="text" ID="txtBuilding" CssClass="txtBuilding" runat="server" />
            </p>
        </asp:Panel>

        <p><asp:Button ID="update" CssClass="update" Text="UPDATE ACCOUNT" runat="server" OnClick="Update_Account" /></p>
        <!-- <p><asp:Literal ID="litError" runat="server"/></p> -->
    </div>

    <div id="password">
        <p id="changePassword">Change Password</p>

        <p id="pwCurrent">
            <label id="lblCurrent">Current Password:</label><br />
            <asp:TextBox TextMode="Password" ID="txtCurrent" CssClass="txtCurrent" runat="server" />
        </p>
        <p id="pwNew">
            <label id="lblNew">New Password:</label><br />
            <asp:TextBox TextMode="Password" ID="txtNew" CssClass="txtNew" runat="server" />
        </p>
        <p id="pwConfirm">
            <label id="lblConfirm">Confirm New:</label><br />
            <asp:TextBox TextMode="Password" ID="txtConfirm" CssClass="txtConfirm" runat="server" />
        </p>

        <p><asp:Button ID="change" CssClass="change" Text="CHANGE PASSWORD" runat="server" OnClick="Change_Password" /></p>
    </div>

</asp:Content>