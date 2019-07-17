<%@ Page Title="" Language="C#" MasterPageFile="Private.master" AutoEventWireup="true" 
    CodeFile="advisees.aspx.cs" Inherits="advisees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/advisees.css" />
    
    <script>
        function uploadClick()
        {
            $("#ContentPlaceHolder1_fileAdviseeList").click();
        }

        function contactFade(text)
        {
            document.body.classList.add("bodyNoScroll");

            var stuff = document.createTextNode(text);
            $("#ContentPlaceHolder1_to").text('');
            $("#ContentPlaceHolder1_to").append(stuff);

            $("#<%= toHidden.ClientID %>").val(text);

            $("#lightsOutAdvisees").fadeIn();
            $("#contactPanel").fadeIn();
        }

        function contactClose() {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutAdvisees").fadeOut();
            $("#contactPanel").fadeOut();
        }

        function errorFade()
        {
            document.body.classList.add("bodyNoScroll");

            $("#lightsOutAdvisees").fadeIn();
            $("#errorPanel").fadeIn();
        }

        function errorClose() {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutAdvisees").fadeOut();
            $("#errorPanel").fadeOut();
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
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divUpload">
        <p id="uploadLabel">Upload Advisee List</p>
        <p id="filetype">(.csv file)</p>

        <p id="fileUpload" onclick="uploadClick()">UPLOAD</p>
        <p id="advList"><asp:FileUpload ID="fileAdviseeList" runat="server" accept=".csv" OnChange="this.form.submit()" /></p>

        <!--
        <p id="advUpload"><asp:Button ID="btnUpload" Text="Upload" runat="server"/></p>

        <p><asp:Literal ID="litNotification" runat="server"/></p>
        <p><asp:Literal ID="litOutput" runat="server"/></p>
        -->
    </div>


    <div id="tblDiv" runat="server"></div>


    <!--
    <table id="tblStudents">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Year</th>
            <th><img id="sendTable" src="images/SendTable.png" /></th>
        </tr>
        <tr>
            <td id="name1">Eric Budd</td>
            <td id="email1">ejb21@pct.edu</td>
            <td id="year1">Unknown</td>
            <td id="contact1"><div class="stuContact" onclick="contactFade(document.getElementById('name1').innerText)">CONTACT</div></td>
        </tr>
        <tr>
            <td id="name2">Michael Poust</td>
            <td id="email2">mbp3@pct.edu</td>
            <td id="year2">Junior-ish</td>
            <td id="contact2"><div class="stuContact" onclick="contactFade(document.getElementById('name2').innerText)">CONTACT</div></td>
        </tr>
    </table>
    -->


    <div id="lightsOutAdvisees">
        <div id="contactPanel">
            <p id="pTo"><span id="lblTo">To:</span><asp:Label id="to" runat="server"></asp:Label></p>
            <p id="pSubject"><span id="lblSubject">Subject:</span><asp:TextBox id="subject" CssClass="subject" runat="server" /></p>
            <p id="pMessage"><asp:TextBox id="mailMessage" CssClass="message" TextMode="MultiLine" Columns="100" Rows="25" runat="server" /></p>
            
            <div id="contactButtons">
                <asp:Panel CssClass="sendEmail" id="sendEmail" runat="server" onclick="Send_Email"><div id="send" onclick="sendEmail()"><span id="sendtxt">SEND</span><img id="imgSend" src="images/Send.png" /></div></asp:Panel>
                <div id="contactClosebtn" onclick="contactClose()"><span id="contactClosebtntxt">CLOSE</span></div>
            </div>
        </div>

        <div id="errorPanel">
            <p>File is not in the correct format.</p>
            <div id="errorClosebtn" onclick="errorClose()"><span id="errorClosebtntxt">CLOSE</span></div>
        </div>
    </div>

    <asp:ScriptManager runat="server" ID="sm">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server"><ContentTemplate>
    <asp:HiddenField ID="toHidden" runat="server" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="mailHidden" style="display:none" onclick="Send_Email" />
    </ContentTemplate></asp:UpdatePanel>

</asp:Content>

