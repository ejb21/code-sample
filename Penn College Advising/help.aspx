<%@ Page Title="Penn College Advising" Language="C#" MasterPageFile="Private.master" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/help.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="pnlWth" runat="server">
        <p class="q" id="q1">
            The heck is this?
        </p>
        <p class="a">
            This is the official Penn College web client by which students may schedule advisory appointments.
            Advisors set their availability hours, and then students are free to schedule appointments on a
            first-come, first-served basis.
        </p>
        <p class="a2">
            It is also Mike Poust and Eric Budd's final project for their CIT386 .NET course. Please wipe
            your feet.
        </p>
    </asp:Panel>
    
    <asp:Panel ID="pnlAcct" runat="server">
        <p class="q">
            Why don't I have an account?
        </p>
        <p class="a">
            Registered advisors should have had an account made for them by the proper Penn College authorities.
            Check your email for details. Advisors are encouraged to change their passwords posthaste.
        </p>
        <p class="a2">
            Student accounts are created automatically once their advisors upload a list of advisees. An email
            should be sent once that happens. Students, likewise, are encouraged to update their passwords.
        </p>
        <p class="a2">
            Or at least, that's how it <em>would</em> work. Spyke, your username is "<span class="red">rmk3</span>"
            and your password, as of now, is "<span class="red">abc123</span>". To check things out from the
            student side, you can login with usernames "<span class="blue">mbp3</span>" or
            "<span class="blue">ejb21</span>" (among others).
        </p>
    </asp:Panel>

    <asp:Panel ID="pnlPW" runat="server">
        <p class="q">
            How do I change my password?
        </p>
        <p class="a">
            Fax us a document containing your current password and new password, and we'll process your request
            within 5–10 business days. Make sure to write your new password down twice and be sure that they
            match. If a fax is unavailable, please send up a smoke signal.
        </p>
        <p class="a2">
            Just kidding!! We totally got you. To update any of your account details, including your password,
            simply click on your name on the left-hand side of the navbar.
        </p>
    </asp:Panel>
    
    <asp:Panel ID="pnlBig" runat="server">
        <p class="q">
            Why is everything so <em>big?</em>
        </p>
        <p class="a">
            Because @#$% you, that's why.
        </p>
    </asp:Panel>
    
    <asp:Panel ID="pnlDonate" runat="server">
        <p class="q">
            Where can I donate?
        </p>
        <p class="a">
            We're glad you asked! The correct answer is, "Kimball's," though we're also accepting As.
        </p>
    </asp:Panel>

</asp:Content>