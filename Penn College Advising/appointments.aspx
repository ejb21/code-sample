<%@ Page Title="Penn College Advising" Language="C#" MasterPageFile="Private.master" AutoEventWireup="true" CodeFile="appointments.aspx.cs" Inherits="appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/appointments.css" />

    <script>
        var appt;

        function cancelFade(sender)
        {
            document.body.classList.add("bodyNoScroll");
            $("#lightsOutAppt").fadeIn();
            $("#cancelPanel").fadeIn();

            appt = sender.parentNode;
        }

        function cancelClose()
        {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutAppt").fadeOut();
            $("#cancelPanel").fadeOut();
        }

        function contactFade(text)
        {
            document.body.classList.add("bodyNoScroll");

            var stuff = document.createTextNode(text);
            $("#ContentPlaceHolder1_to").text('');
            $("#ContentPlaceHolder1_to").append(stuff);

            $("#<%= toHidden.ClientID %>").val(text);

            $("#lightsOutAppt").fadeIn();
            $("#contactPanel").fadeIn();
        }

        function contactClose()
        {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutAppt").fadeOut();
            $("#contactPanel").fadeOut();
        }

        function sendEmail()
        {
            var mailHidden = $('#<%= mailHidden.ClientID %>');

            if(mailHidden != null)
            {
                mailHidden.click();
            }
            
            document.getElementById('<%= subject.ClientID %>').value = "";
            document.getElementById('<%= mailMessage.ClientID %>').value = "";
            contactClose();

            mailHidden.Attributes.Add("OnClick", "return false;");
        }

        function apptsFound()
        {
            $('#noAppts').css("display", "none");
        }

        function apptsDeleted()
        {
            $('#noAppts').css("display", "inherit");
        }

        function cancel()
        {
            cancelClose();

            var children = appt.childNodes;
            $(appt).fadeOut();
            
            $("#<%= cancelVal.ClientID %>").val(children[0].textContent);
            $('#<%= cancelHidden.ClientID %>').click();

            //apptsDiv = document.getElementById('ContentPlaceHolder1_divAppts').childNodes;
            //alert(apptsDiv.length);

            //setTimeout(function () { $('#noAppts').fadeIn(); }, 500);
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="spacer"></div>

    <div id="divAppts" runat="server">
        <div id="noAppts">No appointments found.</div>
    </div>
    
    <div id="lightsOutAppt">
        <div id="contactPanel">
            <p id="pTo"><span id="lblTo">To:</span><span id="to" runat="server">Advisor Advisor</span></p>
            <p id="pSubject"><span id="lblSubject">Subject:</span><asp:TextBox id="subject" CssClass="subject" runat="server" /></p>
            <p id="pMessage"><asp:TextBox id="mailMessage" CssClass="message" TextMode="MultiLine" Columns="100" Rows="25" runat="server" /></p>
            
            <div id="contactButtons">
                <div id="send" onclick="sendEmail()"><span id="sendtxt">SEND</span><img id="imgSend" src="images/Send.png" /></div>
                <div id="contactClosebtn" onclick="contactClose()"><span id="contactClosebtntxt">CLOSE</span></div>
            </div>
        </div>
            
        <div id="cancelPanel">
            <p id="cancelText">Are you sure you want to cancel this appointment?</p>
            <button type="button" onclick="cancel();" id="cancelYes">YES</button><button type="button" onclick="cancelClose();" id="cancelNo">NO</button>
        </div>
    </div>
    
    <asp:ScriptManager runat="server" ID="sm">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server"><ContentTemplate>
    <asp:HiddenField ID="toHidden" runat="server" />
    <asp:HiddenField ID="cancelVal" runat="server" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="mailHidden" style="display:none" onclick="Send_Email" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="cancelHidden" style="display:none" onclick="Cancel_Appt" />
    </ContentTemplate></asp:UpdatePanel>

</asp:Content>