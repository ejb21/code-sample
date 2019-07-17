using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Custom Event class for serializing advisor events to add to full calendar
/// </summary>
public class CustomEvent
{
    public int id { get; set; }

    public string title { get; set; }

    public string start { get; set; }

    public string end { get; set; }

    public string dow { get; set; }

    public DateTime excludedDate { get; set; }

    public string eventColor { get; set; }

    public bool selectable { get; set; } // may remove/change

    public bool editable { get; set; }

    public bool booked { get; set; }
}