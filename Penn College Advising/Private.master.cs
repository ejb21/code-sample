using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private : System.Web.UI.MasterPage
{
   
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["studentID"] == null || Session["advisorID"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "timeoutFade();", true);
        }
        else
        {
            /* Setting the Welcome message to include the user's name */
            int studentID = (int)(Session["studentID"]);
            int advisorID = (int)(Session["advisorID"]);

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
            sqlConn.Open();
            SqlCommand fnameCmd = sqlConn.CreateCommand();

            // TODO: Implement case for when no first name is found - "Welcome, User!"

            string firstName = null;
            if (studentID != 0)
            {
                fnameCmd.CommandText = "SELECT firstName FROM student WHERE accountID = '" + studentID + "'";
                firstName = (string)fnameCmd.ExecuteScalar();
            }
            else if (advisorID != 0)
            {
                fnameCmd.CommandText = "SELECT firstName FROM advisor WHERE accountID = '" + advisorID + "'";
                firstName = (string)fnameCmd.ExecuteScalar();
            }
            else
                Response.Redirect("404.aspx");

            firstName = firstName.ToUpper();
            manageLink.InnerText = firstName;
        }
    }


    protected void Logout(object sender, EventArgs e)
    {
        Session.Clear();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "logoutFade();", true);
    }
}
