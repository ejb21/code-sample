<%@ Page Title="Penn College Advising" Language="C#" MasterPageFile="Private.master" 
         AutoEventWireup="true" CodeFile="advisor.aspx.cs" Inherits="_advisor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/advisor.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p id="advAppt"><asp:button text="Manage Appointments" CssClass="advButton" runat="server" OnClick="ManageAppointment_Click"/></p>
    <p id="advStudents"><asp:button text="Manage Students" CssClass="advButton" runat="server" OnClick="ManageStudent_Click" /></p>
    <p id="advAvail"><asp:button text="Set Availability" CssClass="advButton" runat="server" OnClick="ManageAvailability_Click"/></p>

</asp:Content>

