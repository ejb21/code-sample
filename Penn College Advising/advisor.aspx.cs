using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _advisor : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["studentID"] != 0 || Session["advisorID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void ManageAppointment_Click(object sender, EventArgs e)
    {
        Response.Redirect("appointments.aspx");
    }

    protected void ManageStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("advisees.aspx");
    }

    protected void ManageAvailability_Click(object sender, EventArgs e)
    {
        Response.Redirect("availability.aspx");
    }
}