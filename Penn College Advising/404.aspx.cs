using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _404 : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["advisorID"] == null && Session["studentID"] == null)
            this.MasterPageFile = "~/Public.master";
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}