using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        int advSessionID = 0;
        int stuSessionID = 0;

        try
        {
            advSessionID = (int)Session["advisorID"];
            stuSessionID = (int)Session["studentID"];
        }
        catch(Exception ex)
        {
            Response.Redirect("login.aspx");
        }

        if (advSessionID != 0)
            Response.Redirect("advisor.aspx");
        else if (stuSessionID != 0)
            Response.Redirect("student.aspx");
       
    }
}