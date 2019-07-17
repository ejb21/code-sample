<%@ Page Title="Penn College Advising" Language="C#" MasterPageFile="Private.master" AutoEventWireup="true" CodeFile="availability.aspx.cs" Inherits="availability" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="css/availability.css" />

    <link href="/css/fullcalendar.min.css" rel="stylesheet" />
    <link href="/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />
    <script src="/js/moment.min.js"></script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/fullcalendar.min.js"></script>

    <script>
        function panelOpen()
        {
            document.body.classList.add("bodyNoScroll");
            $("#lightsOutAvail").fadeIn();
            $("#availPanel").fadeIn();

            setTimeout(storage, 1000);
        }

        function panelSwap()
        {
            $('#loading').css("display", "none");
            $('#complete').css("display", "inherit");
        }

        function panelClose()
        {
            /*
            document.body.classList.remove("bodyNoScroll");
            $("#lightsOutAvail").fadeOut();
            $("#availPanel").fadeOut();
            */

            location.reload();
        }

        function getTimes()
        {
            var events = document.getElementsByClassName("fc-content");
            var time;

            for (var i = 0; i < events.length; i++)
            {
                time = events[i].textContent;
                alert(time);
            }
        }

        function storage()
        {
            var cols = document.getElementsByClassName("fc-content-col");
            var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
            var dayIndex = 0;
            var events;
            var times;

            $("#<%= clearButton.ClientID %>").click();

            for (var i = 0; i < cols.length; i++)
            {
                events = cols[i].getElementsByClassName("fc-content");

                for (var j = 0; j < events.length; j++)
                {
                    times = days[dayIndex] + " - " + events[j].textContent;

                    $("#<%= availHidden.ClientID %>").val(times);
                    $("#<%= availButton.ClientID %>").click();

                    sleep(2000);
                }

                dayIndex++;
            }

            $('#calendar').fullCalendar('removeEvents');
            panelSwap();
        }

        function sleep(delay)
        {
            var start = new Date().getTime();
            while (new Date().getTime() < start + delay);
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="calendar"></div>

    <p id="inputs">
        <Button type="button" ID="btnSubmit" class="btnSubmit" runat="server" OnClick="panelOpen();">SET AVAILABILITY</Button>
        <span ID="btnClear" class="btnClear" onclick="$('#calendar').fullCalendar( 'removeEvents');">CLEAR</span>
        <asp:Literal ID="litTimes" runat="server"></asp:Literal>
    </p>
    
    <script>
        $(document).ready(function() {
            
            $('#calendar').fullCalendar({
                defaultDate: '2017-10-12',
                defaultView: 'agendaWeek',
                slotDuration: '00:15:00',
                slotLabelFormat: 'h:mm a',
                hiddenDays: [0, 6],
                selectable: true,
                unselectAuto: true,
                selectHelper: true,
                allDaySlot: false,
                timezone: 'local',
                minTime: "08:00:00",
                maxTime: "20:00:00",
                eventColor: '#991431',
                maxSelectionDuration: "00:15:00",

                select: function (start, end, jsEvent, view) {
                    $("#calendar").fullCalendar('addEventSource', [{
                        start: start,
                        end: end,
                        block: true,
                    }, ]);
                    $("#calendar").fullCalendar("unselect");
                },
                selectOverlap: function(event) {
                    return ! event.block;
                },
                
                editable: false,
                eventLimit: true
            });

            $('.fc-day-header.fc-widget-header.fc-mon.fc-past').find('span').text('Monday');
            $('.fc-day-header.fc-widget-header.fc-tue.fc-past').find('span').text('Tuesday');
            $('.fc-day-header.fc-widget-header.fc-wed.fc-past').find('span').text('Wednesday');
            $('.fc-day-header.fc-widget-header.fc-thu.fc-past').find('span').text('Thursday');
            $('.fc-day-header.fc-widget-header.fc-fri.fc-past').find('span').text('Friday');
        });
    </script>
    
    <div id="lightsOutAvail">
        <div id="availPanel">
            <div id="loading">
                <p id="loadingText">Processing...</p>
                <img id="loadingIcon" class="icon-spin" src="images/loading.png" />
            </div>
            <div id="complete">
                <p id="completeText">Availability updated.</p>
                <button type="button" onclick="panelClose();" id="btnContinue">CONTINUE</button>
            </div>
        </div>
    </div>

    <asp:ScriptManager runat="server" ID="sm">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server"><ContentTemplate>
    <asp:HiddenField ID="availHidden" runat="server" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="availButton" style="display:none" onclick="Store_Times" />
    <asp:Button UseSubmitBehavior="false" runat="server" id="clearButton" style="display:none" onclick="Clear_Times" />
    </ContentTemplate></asp:UpdatePanel>

</asp:Content>

