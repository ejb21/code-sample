<%@ Page Title="Penn College Advising" Language="C#" MasterPageFile="Private.master" 
    AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="_student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="stylesheet" type="text/css" href="css/student.css" />
    

    <link href="/css/fullcalendar.min.css" rel="stylesheet" />
    <link href="/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />
    <script src="/js/moment.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/fullcalendar.min.js"></script>


    <script>
        function infoFade()
        {
            document.body.classList.add("bodyNoScroll");
            $("#lightsOutStudent").fadeIn();
            $("#infoPanel").fadeIn();
        }

        function infoClose()
        {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutStudent").fadeOut();
            $("#infoPanel").fadeOut();
        }

        function contactFade()
        {
            document.body.classList.add("bodyNoScroll");
            $("#lightsOutStudent").fadeIn();
            $("#contactPanel").fadeIn();
        }

        function contactClose()
        {
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutStudent").fadeOut();
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

        function addEvent(startTime, endTime)
        {
            var newEvent = { title: '', start: startTime, end: endTime };

            $('#calendar').fullCalendar('renderEvent', newEvent, true);

            /*
            var newEvent = { title: "Malachi Atkinson", start: "Tue, 10 Oct 2017 08:00:00", end: "Tue, 10 Oct 2017 08:15:00" };

            $('#calendar').fullCalendar('renderEvent', newEvent, true);
            */
        }

        function addAppt(name, startTime, endTime)
        {
            var newEvent = { title: name, start: startTime, end: endTime, id: "appt" };

            $('#calendar').fullCalendar('renderEvent', newEvent, true);

            busy();
            giveName();
        }

        function giveName()
        {
            var person;
            var boxes;
            var appts = document.querySelectorAll('[category="appt"]');

            for (var i = 0; i < appts.length; i++)
            {
                person = appts[i].getAttribute('advisee');

                boxes = appts[i].childNodes;
                boxes[0].textContent = person;
            }
        }

        function busy() {
            var divs = document.getElementsByClassName("fc-content");

            for (var i = 0; i < divs.length ; i++) {
                divs[i].textContent = "Busy";
            }
        }

        function doButtons()
        {
            var buttons = document.getElementsByClassName('fc-prev-button fc-button fc-state-default fc-corner-left');
            var thisButton = buttons[0];

            thisButton.setAttribute("onclick", "populate1();");
            thisButton.className = "greyed";

            var buttons = document.getElementsByClassName('fc-next-button fc-button fc-state-default fc-corner-right');
            var thisButton = buttons[0];

            thisButton.setAttribute("onclick", "populate2();");
        }

        function populate1()
        {
            //$('#<%= calHidden.ClientID %>').click();

            var buttonDiv = document.getElementsByClassName('fc-button-group');
            var thisButton = buttonDiv[0].getElementsByTagName('button');
            
            $('#<%= dayHidden.ClientID %>').val(0);

            thisButton[0].className = "greyed";
            thisButton[1].className = "fc-next-button fc-button fc-state-default fc-corner-right";
            
            busy();
            giveName();
        }

        function populate2()
        {
            //$('#<%= calHidden.ClientID %>').click();

            var buttonDiv = document.getElementsByClassName('fc-button-group');
            var thisButton = buttonDiv[0].getElementsByTagName('button');
            
            $('#<%= dayHidden.ClientID %>').val(1);

            thisButton[0].className = "fc-prev-button fc-button fc-state-default fc-corner-left";
            thisButton[1].className = "greyed";

            busy();
            giveName();
        }

        function storeVars()
        {
            selection = document.getElementsByClassName('fc-time-grid-event fc-v-event fc-event fc-start fc-end fc-helper');
            var dayIndex = $('#<%= dayHidden.ClientID %>').attr("value");
            var time;

            cols = document.getElementsByClassName('fc-content-col');

            for (var i = 0; i < cols.length; i++)
            {
                if (isDescendant(cols[i], selection[0]))
                {
                    var date = 9 + i;
                    if (dayIndex == 1) date += 7;
                    time = "2017-10-" + date;
                }
            }

            time += " - " + selection[0].textContent;
            $('#<%= apptsHidden.ClientID %>').val(time);
        }

        function storage()
        {
            $('#<%= apptsButton.ClientID %>').click();

            window.location.reload(false);
            busy();
            giveName();
        }

        function isDescendant(parent, child) {
            var node = child.parentNode;
            while (node != null) {
                if (node == parent) {
                    return true;
                }
                node = node.parentNode;
            }
            return false;
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--<p><asp:Literal ID="litTest" runat="server"/></p>-->
    
    <div id="divAdvisor">
        <p id="advInfo">Advisor Info:</p>
        <p id="advName" runat="server" CssClass="advName">Spyke Krepshaw</p>
        <p id="links"><span id="information" onclick="infoFade()">ADVISOR INFORMATION</span><span id="bullet">•</span><span id="contact" onclick="contactFade()">CONTACT</span></p>
        <img id="advPhoto" src="images/advisors/Default.png" alt="Advisor Photo" title="Advisor Photo" runat="server" />
    </div>

    <div id="calendar" onclick="storeVars();"></div>

    <p id="inputs">
        <!--<asp:TextBox ID="hfEvents" CssClass="hfEvents" runat="server" value=""></asp:TextBox>-->
        <Button type="button" ID="btnSubmit" class="btnSubmit" runat="server" OnClick="storage();">SCHEDULE APPOINTMENT</Button>
        <asp:Literal ID="litTimes" runat="server"></asp:Literal>
    </p>
    
    <script>    
        //var hfEvents = document.getElementById('ctl00_contentPlaceHolder_hfEvents');

        $(document).ready(function() {
            
            $('#calendar').fullCalendar({
                defaultDate: '2017-10-12',
                defaultView: 'agendaWeek',
                slotDuration: '00:15:00',
                slotLabelFormat: 'h:mm a',
                hiddenDays: [0, 6],
                selectable: true, //******
                unselectAuto: true,
                selectHelper: true,
                allDaySlot: false,
                timezone: 'local',
                displayEventTime : true,
                minTime: "08:00:00",
                maxTime: "20:00:00",
                eventColor: '#c9bea9',
                maxSelectionDuration: "00:15:00",

                selectAllow: function (selectInfo) {
                    var duration = moment.duration(selectInfo.end.diff(selectInfo.start));
                    return duration.asHours() <= 0.25;
                },

                
                select: function (start, end) {
                    var title = 'Office Hour:';
                    var eventData;
                    if (title) {
                        eventData = {
                            title: title,
                            start: start,
                            end: end
                        };
                        //hfEvents.value += "[" + start + " " + end + "]";
                        //$('#calendar').fullCalendar('renderEvent', eventData, false); // stick? = true
                    }
                    //$('#calendar').fullCalendar('unselect');
                },
                
                /*
                eventAfterRender: function (event, element, view)
                {
                    $(element).attr("id", event.name);
                    $(element).attr("class", "event_id_" + event._id);

                    giveName();
                },
                */

                eventRender: function (event, element)
                {
                    element.attr("category", event.id);
                    element.attr("advisee", event.title);
                },
                
                editable: false,
                eventLimit: true,
                
            });

            $('#<%= calHidden.ClientID %>').click();
            doButtons();
        });
    </script>
    
    <div id="lightsOutStudent">
        <div id="infoPanel">
            <p id="infoInfo">Advisor Information</p>
            <p><span id="infoNamelbl">Name:</span><span id="infoName" runat="server">Joe Schmoe</span></p>
            <p><span id="infoEmaillbl">Email:</span><span id="infoEmail" runat="server">abc123@pct.edu</span></p>
            <p><span id="infoPhonelbl">Phone:</span><span id="infoPhone" runat="server">(570)867-5309 ext. 1234</span></p>
            <p><span id="infoOfficelbl">Office:</span><span id="infoOffice" runat="server">ATHS E247</span></p>
            <div id="infoClose"><p id="infoClosebtn" onclick="infoClose()">CLOSE</p></div>
        </div>

        <div id="contactPanel">
            <p id="pTo"><span id="lblTo">To:</span><span id="to" runat="server">Advisor Advisor</span></p>
            <p id="pSubject"><span id="lblSubject">Subject:</span><asp:TextBox id="subject" CssClass="subject" runat="server" /></p>
            <p id="pMessage"><asp:TextBox id="mailMessage" CssClass="message" TextMode="MultiLine" Columns="100" Rows="25" runat="server" /></p>
            
            <div id="contactButtons">
                <div id="send" onclick="sendEmail()"><span id="sendtxt">SEND</span><img id="imgSend" src="images/Send.png" /></div>
                <div id="contactClosebtn" onclick="contactClose()"><span id="contactClosebtntxt">CLOSE</span></div>
            </div>
        </div>
    </div>
    
    <asp:ScriptManager runat="server" ID="sm">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server"><ContentTemplate>
    <asp:Button UseSubmitBehavior="false" runat="server" id="mailHidden" style="display:none" onclick="Send_Email" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="calHidden" style="display:none" onclick="Populate_Calendar" />
    <asp:HiddenField ID="apptsHidden" runat="server" />
    <asp:HiddenField ID="dayHidden" Value="0" runat="server" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="apptsButton" style="display:none" onclick="Store_Times" />
    </ContentTemplate></asp:UpdatePanel>

</asp:Content>