using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class appointments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["studentID"] != 0 || Session["advisorID"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString + ";MultipleActiveResultSets=True");
        sqlConn.Open();

        int advID = (int)Session["advisorID"];
        SqlCommand findAdvKey = sqlConn.CreateCommand();
        findAdvKey.CommandText = "SELECT advisorKey FROM advisor WHERE accountID = '" + advID + "'";
        int advKey = (int)findAdvKey.ExecuteScalar();

        SqlCommand apptsCmd = sqlConn.CreateCommand();
        apptsCmd.CommandText = "SELECT studentID, appDate, startTime FROM appointmentNewNew WHERE advisorID = " + advKey;
        SqlDataReader apptsReader = apptsCmd.ExecuteReader();

        SqlCommand stuNameCmd = sqlConn.CreateCommand();

        int apptStuID, apptDate;
        string apptStuName = "";
        string apptDay, apptStartTime;
        string[] startTimeBroken, splitHelper;
        int[] startTimeInts = new int[2];

        string ampm = "a.m.";
        int apptIndex = 0;

        while (apptsReader.Read())
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "apptsFound", "apptsFound();", true);

            apptStuID = Convert.ToInt32(apptsReader["studentID"]);
            apptDay = Convert.ToString(apptsReader["appDate"]);
            apptStartTime = Convert.ToString(apptsReader["startTime"]);

            startTimeBroken = apptStartTime.Split(':');
            startTimeInts[0] = Convert.ToInt32(startTimeBroken[0]);

            if (startTimeInts[0] > 12)
            {
                startTimeInts[0] -= 12;
                ampm = "p.m.";
            }

            splitHelper = apptDay.Split(' ');
            splitHelper = splitHelper[0].Split('/');
            apptDay = splitHelper[1];

            apptDate = Convert.ToInt32(apptDay);

            if (apptDate == 9 || apptDate == 16)
                apptDay = "Monday";
            else if (apptDate == 10 || apptDate == 17)
                apptDay = "Tuesday";
            else if (apptDate == 11 || apptDate == 18)
                apptDay = "Wednesday";
            else if (apptDate == 12 || apptDate == 19)
                apptDay = "Thursday";
            else if (apptDate == 13 || apptDate == 20)
                apptDay = "Friday";

            stuNameCmd.CommandText = "SELECT firstName FROM student WHERE studentKey = " + apptStuID;
            apptStuName += Convert.ToString(stuNameCmd.ExecuteScalar());
            stuNameCmd.CommandText = "SELECT lastName FROM student WHERE studentKey = " + apptStuID;
            apptStuName += " " + Convert.ToString(stuNameCmd.ExecuteScalar());

            divAppts.InnerHtml += "<div class=\"appointment\">" +
        "<div class=\"advisee\" id=\"advisee" + apptIndex + "\">" + apptStuName + "</div>" +
        "<div class=\"date\"><strong>" + apptDay + ", October " + apptDate + "</strong> " +
        "at <strong>" + startTimeInts[0] + ":" + startTimeBroken[1] + " " + ampm + "</strong></div>" +
        "<div class=\"cancel\" onclick=\"cancelFade(this);\">×</div>" +
        "<div class=\"email\" onclick=\"contactFade(document.getElementById('advisee" + apptIndex +
        "').innerText)\"><img class=\"sendImage\" src=\"images/SendMini.png\" /></div></div>";

            apptStuName = "";
            ampm = "a.m.";
            apptIndex++;
        }
    }

    public void Send_Email(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();

        string[] stuName = new string[2];
        stuName = toHidden.Value.Split(' ');

        SqlCommand mailCmd = sqlConn.CreateCommand();
        mailCmd.CommandText = "SELECT email FROM student WHERE firstName = '" + stuName[0] + "' AND lastName = '" + stuName[1] + "'";
        string stuEmail = (string)mailCmd.ExecuteScalar();

        int advisorID = (int)Session["advisorID"];
        mailCmd.CommandText = "SELECT email FROM advisor WHERE accountID = '" + advisorID + "'";
        string advEmail = (string)mailCmd.ExecuteScalar();
        mailCmd.CommandText = "SELECT firstName FROM advisor WHERE accountID = '" + advisorID + "'";
        string advFname = (string)mailCmd.ExecuteScalar();
        mailCmd.CommandText = "SELECT lastName FROM advisor WHERE accountID = '" + advisorID + "'";
        string advLname = (string)mailCmd.ExecuteScalar();
        string advName = advFname + " " + advLname;

        sqlConn.Close();

        var sysLogin = "penncollegeadvising@gmail.com";
        var sysPass = "P. C. T. 4dv151n6";

        var sysAddress = new MailAddress(advEmail, advName);
        var receiverAddress = new MailAddress(stuEmail, stuEmail);

        string mailBody = "";
        mailBody += "<html>";
        mailBody += "	<head>";
        mailBody += "		<style>";
        mailBody += "			#footer{ font-size: 14px; width: 100%; text-align: center; margin: 30px; margin-top: 50px; margin-bottom: 0px; padding-top: 30px; padding-bottom: 30px; background-color: lightgrey; border-radius: 10px; }";
        mailBody += "		</style>";
        mailBody += "	</head>";
        mailBody += "	<body>";
        mailBody += mailMessage.Text;
        mailBody += "		<p id=\"footer\">This email was sent by <strong>";
        mailBody += advName + "</strong> via PennCollegeAdvising.com. To reply to " + advFname + " directly, ";
        mailBody += "contact <strong>" + advEmail + "</strong>.</p>";
        mailBody += "	</body>";
        mailBody += "</html>";

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",   //gmail example
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Credentials = new System.Net.NetworkCredential(sysLogin, sysPass)
        };

        var message = new MailMessage(sysAddress, receiverAddress)
        {
            From = sysAddress,
            Subject = subject.Text,
            IsBodyHtml = true,
            Body = mailBody
        };

        using (message)
        {
            smtp.Send(message);
        }
    }

    protected void Cancel_Appt(object sender, EventArgs e)
    {
        string name = cancelVal.Value;
        string[] firstLast = name.Split(' ');

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString + ";MultipleActiveResultSets=True");
        sqlConn.Open();

        SqlCommand findKey = sqlConn.CreateCommand();
        findKey.CommandText = "SELECT studentKey FROM student WHERE firstName = '" + firstLast[0] + "' AND lastName = '" + firstLast[1] + "'";
        int studentKey = (int)findKey.ExecuteScalar();

        SqlCommand apptDel = sqlConn.CreateCommand();
        apptDel.CommandText = "DELETE FROM appointmentNewNew WHERE studentID = @key";
        apptDel.Parameters.Add("@key", SqlDbType.Int).Value = studentKey;
        apptDel.ExecuteNonQuery();

        sqlConn.Close();
    }
}