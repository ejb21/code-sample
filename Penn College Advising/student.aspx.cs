using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _student : System.Web.UI.Page
{
    List<CustomEvent> availEvents = new List<CustomEvent>();

    public string AvailAsJson
    {
        get
        {
            var serializeObject = new JavaScriptSerializer() { MaxJsonLength = int.MaxValue }.Serialize(availEvents);
            return serializeObject;
        }
    }


    protected void Page_Init(object sender, EventArgs e)
    {
        if ((int)Session["advisorID"] != 0 || Session["studentID"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (Session["studentID"] != null)
        {
            int studentID = (int)(Session["studentID"]);
            //Populate_Calendar(studentID);
            Populate_Advisor(studentID);

            // testing js func on page load
            //ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:addEvent();", true);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "$function () { addEvent(); });", true);
            
            // Get studentKey to determine advisor information
            int studentKey = -1;
            int advisorKey = -1;
            string advisorName = "";

            SqlConnection sqlConn = new SqlConnection(GetConnectionString());

            sqlConn.Open();

            SqlCommand studentKeyCmd = sqlConn.CreateCommand();
            studentKeyCmd.CommandText = "SELECT studentKey FROM student WHERE accountID = '" + studentID + "'";
            studentKey = (int)studentKeyCmd.ExecuteScalar();

            SqlCommand advKeyCmd = sqlConn.CreateCommand();
            advKeyCmd.CommandText = "SELECT advisorKey FROM student_advisor WHERE studentKey = '" + studentKey + "'";
            advisorKey = (int)advKeyCmd.ExecuteScalar();

            // TODO: Combine firstName and lastName queries
            SqlCommand advFNameCmd = sqlConn.CreateCommand();
            advFNameCmd.CommandText = "SELECT firstName FROM advisor WHERE advisorKey = '" + advisorKey + "'";
            advisorName = (string)advFNameCmd.ExecuteScalar() + " ";

            SqlCommand advLNameCmd = sqlConn.CreateCommand();
            advLNameCmd.CommandText = "SELECT lastName FROM advisor WHERE advisorKey = '" + advisorKey + "'";
            advisorName += (string)advLNameCmd.ExecuteScalar();

            sqlConn.Close();

            advName.InnerHtml = "" + advisorName;
            advName.Attributes["Class"] = "advName";

            string fn = "images/advisors/" + advisorKey + ".png";
            if (File.Exists(Server.MapPath(fn)))
                advPhoto.Attributes["src"] = fn;

            advPhoto.Attributes["Class"] = "advPhoto";

            // FOR TESTING JSON FEED
           //Response.Write(AvailAsJson);
           //Response.End();
        }
    }

    protected void Populate_Calendar(object sender, EventArgs e)
    {
        int studentID = (int)(Session["studentID"]);

        int advisorKey = -1;
        int studentKey = -1;

        SqlConnection sqlConn = new SqlConnection(GetConnectionString());
        sqlConn.Open();

        SqlCommand stuKeyCmd = sqlConn.CreateCommand();
        stuKeyCmd.CommandText = "SELECT studentKey FROM student WHERE accountID = '" + studentID + "'";
        studentKey = (int)stuKeyCmd.ExecuteScalar();

        SqlCommand advKeyCmd = sqlConn.CreateCommand();
        advKeyCmd.CommandText = "SELECT advisorKey FROM student_advisor WHERE studentKey = '" + studentKey + "'";
        advisorKey = (int)advKeyCmd.ExecuteScalar();

        SqlCommand availCmd = sqlConn.CreateCommand();
        availCmd.CommandText = "SELECT dayOfWeek, startTime FROM availability WHERE advisorID = '" + advisorKey + "'";
        SqlCommand availCmd2 = sqlConn.CreateCommand();
        availCmd2.CommandText = "SELECT dayOfWeek, startTime FROM availability WHERE advisorID = '" + advisorKey + "'";
        SqlDataReader availReader = availCmd.ExecuteReader();

        /*
        int      availID = -1;
        string   title = "";
        string   dow   = "";
        string   start = "";
        string   end   = "";
        TimeSpan span  = TimeSpan.FromMinutes(15);
        */

        string[] days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
        string[] daysAbbr = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
        string[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

        int hour = 08;
        int min = 00;
        int newHour, newMin;
        string month = "Oct";
        int monthsIndex = 10;
        int date = 9;
        int year = Convert.ToInt32(DateTime.Now.Year.ToString());
        int dow = 1;

        string readerDay;
        int readerDow;
        int increment;
        string readerTime;
        string[] timeSplit = new string[3];
        
        string startDate = "";
        string endDate;
        int scriptCtr = 0;
        string scriptName = "string" + scriptCtr;

        bool first = true;
        string justInCase = startDate;
        string lastDate = "Fri, 13 Oct 2017 20:00:00";

        startDate = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + hour + ":" + min + ":00";

        while (availReader.Read())
        {
            readerDay = Convert.ToString(availReader["dayOfWeek"]);
            readerTime = Convert.ToString(availReader["startTime"]);

            timeSplit = readerTime.Split(':');
            readerDow = Array.IndexOf(days, readerDay);

            increment = readerDow - dow;
            date += increment;

            if (month.Equals("Dec") && date > 31)
            {
                year += 1;
                date -= 31;
                monthsIndex = 0;
                month = months[monthsIndex];
            }
            else if ((month.Equals("Sep") || month.Equals("Apr") || month.Equals("Jun") || month.Equals("Nov")) && date > 30)
            {
                date -= 30;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (month.Equals("Feb") && year % 4 == 0 && date > 29)
            {
                date -= 29;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (month.Equals("Feb") && date > 28)
            {
                date -= 28;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (date > 31)
            {
                date -= 31;
                monthsIndex++;
                month = months[monthsIndex];
            }

            dow = Array.IndexOf(days, readerDay);
            newHour = Convert.ToInt32(timeSplit[0]);
            newMin = Convert.ToInt32(timeSplit[1]);

            endDate = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";
            
            if (increment == 0 && ((newHour == hour && newMin == min + 15) || (newHour == hour + 1 && newMin == min - 45) || (newHour == 8 && hour == 20 && newMin == 0 && min == 45)))
            {
                hour = newHour;
                min = newMin;
                startDate = endDate;

                if (min == 45)
                {
                    newHour++;
                    newMin -= 45;
                    justInCase = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";
                }
                else
                {
                    newMin += 15;
                    justInCase = daysAbbr[dow] +", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";
                }

                newMin = min;
                newHour = hour;
                continue;
            }

            hour = newHour;
            min = newMin;

            if (first)
                ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + startDate + "', '" + endDate + "');", true);
            else
                ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + justInCase + "', '" + endDate + "');", true);

            first = false;
            startDate = endDate;
            scriptCtr++;
            scriptName = "script" + scriptCtr;
        }

        ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + justInCase + "', '" + lastDate + "');", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "busyScript", "busy();", true);
        availReader.Close();







        
        SqlDataReader availReader2 = availCmd2.ExecuteReader();

        hour = 08;
        min = 00;
        month = "Oct";
        monthsIndex = 10;
        date = 16;
        year = Convert.ToInt32(DateTime.Now.Year.ToString());
        dow = 1;

        scriptCtr++;
        scriptName = "script" + scriptCtr;

        first = true;
        lastDate = "Fri, 20 Oct 2017 20:00:00";

        startDate = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + hour + ":" + min + ":00";
        justInCase = startDate;

        while (availReader2.Read())
        {
            readerDay = Convert.ToString(availReader2["dayOfWeek"]);
            readerTime = Convert.ToString(availReader2["startTime"]);

            timeSplit = readerTime.Split(':');
            readerDow = Array.IndexOf(days, readerDay);

            increment = readerDow - dow;
            date += increment;

            if (month.Equals("Dec") && date > 31)
            {
                year += 1;
                date -= 31;
                monthsIndex = 0;
                month = months[monthsIndex];
            }
            else if ((month.Equals("Sep") || month.Equals("Apr") || month.Equals("Jun") || month.Equals("Nov")) && date > 30)
            {
                date -= 30;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (month.Equals("Feb") && year % 4 == 0 && date > 29)
            {
                date -= 29;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (month.Equals("Feb") && date > 28)
            {
                date -= 28;
                monthsIndex++;
                month = months[monthsIndex];
            }
            else if (date > 31)
            {
                date -= 31;
                monthsIndex++;
                month = months[monthsIndex];
            }

            dow = Array.IndexOf(days, readerDay);
            newHour = Convert.ToInt32(timeSplit[0]);
            newMin = Convert.ToInt32(timeSplit[1]);

            endDate = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";

            if (increment == 0 && ((newHour == hour && newMin == min + 15) || (newHour == hour + 1 && newMin == min - 45) || (newHour == 8 && hour == 20 && newMin == 0 && min == 45)))
            {
                hour = newHour;
                min = newMin;
                startDate = endDate;

                if (min == 45)
                {
                    newHour++;
                    newMin -= 45;
                    justInCase = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";
                }
                else
                {
                    newMin += 15;
                    justInCase = daysAbbr[dow] + ", " + date + " " + month + " " + year + " " + newHour + ":" + newMin + ":00";
                }

                newMin = min;
                newHour = hour;
                continue;
            }

            hour = newHour;
            min = newMin;

            if (first)
                ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + startDate + "', '" + endDate + "');", true);
            else
                ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + justInCase + "', '" + endDate + "');", true);

            first = false;
            startDate = endDate;
            scriptCtr++;
            scriptName = "script" + scriptCtr;
        }

        ScriptManager.RegisterStartupScript(this, typeof(string), scriptName, "addEvent('" + justInCase + "', '" + lastDate + "');", true);
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "busyScript2", "busy();", true);
        availReader2.Close();





        
        SqlCommand apptsCmd = sqlConn.CreateCommand();
        apptsCmd.CommandText = "SELECT studentID, appDate, startTime FROM appointmentNewNew WHERE advisorID = " + advisorKey;
        SqlDataReader apptsReader = apptsCmd.ExecuteReader();

        string stuName = "";
        int stuID;

        string dateRaw;
        string[] dateSplit;
        int dateNum;
        string dateFormatted = "";
        string endDateFormatted = "";

        string startTime;
        string[] startTimeSplit;
        int apptHour, apptMin;

        int apptScriptIndex = 0;
        string apptScriptName = "apptScript" + apptScriptIndex;

        while (apptsReader.Read())
        {
            stuID = (int)apptsReader["studentID"];

            stuName = GetStuName(stuID);

            dateRaw = apptsReader["appDate"].ToString();
            dateSplit = dateRaw.Split(' ');
            dateSplit = dateSplit[0].Split('/');
            dateNum = Convert.ToInt32(dateSplit[1]);

            if (dateNum == 9 || dateNum == 16)
            {
                dateFormatted += "Mon, " + dateNum;
                endDateFormatted += "Mon, " + dateNum;
            }
            else if (dateNum == 10 || dateNum == 17)
            {
                dateFormatted += "Tue, " + dateNum;
                endDateFormatted += "Tue, " + dateNum;
            }
            else if (dateNum == 11 || dateNum == 18)
            {
                dateFormatted += "Wed, " + dateNum;
                endDateFormatted += "Wed, " + dateNum;
            }
            else if (dateNum == 12 || dateNum == 19)
            {
                dateFormatted += "Thu, " + dateNum;
                endDateFormatted += "Thu, " + dateNum;
            }
            else if (dateNum == 13 || dateNum == 20)
            {
                dateFormatted += "Fri, " + dateNum;
                endDateFormatted += "Fri, " + dateNum;
            }

            startTime = apptsReader["startTime"].ToString();

            startTimeSplit = startTime.Split(':');
            apptHour = Convert.ToInt32(startTimeSplit[0]);
            apptMin = Convert.ToInt32(startTimeSplit[1]);

            if (apptMin == 45)
            {
                apptHour++;
                apptMin = 0;
            }
            else apptMin += 15;

            dateFormatted += " Oct 2017 " + startTime;
            endDateFormatted += " Oct 2017 " + apptHour + ":" + apptMin + ":00";

            ScriptManager.RegisterStartupScript(this, typeof(string), apptScriptName, "addAppt('" + stuName + "', '" + dateFormatted + "', '" + endDateFormatted + "');", true);

            apptScriptIndex++;
            apptScriptName = "apptScript" + apptScriptIndex;

            dateFormatted = "";
            endDateFormatted = "";
        }

        apptsReader.Close();
        



        /*
        string asdf1 = "asdf";
        string asdf2 = "Tue, 10 Oct 2017 08:00:00";
        string asdf3 = "Tue, 10 Oct 2017 08:30:00";

        //ScriptManager.RegisterStartupScript(this, this.GetType(), "script",
        //        "addEvent(" + asdf1 + ", " + asdf2 + ", " + asdf3 + ");", true);

        ScriptManager.RegisterStartupScript(this, typeof(string), "script1", "addEvent('" + asdf1 + "', '" + asdf2 + "', '" + asdf3 + "');", true);
        */

        /*
        while (availReader.Read())
        {
            availID = Convert.ToInt32(availReader["availabilityID"]);
            title = "Available";
            dow = Convert.ToString(Array.IndexOf(days, Convert.ToString(availReader["dayOfWeek"])));
            start = Convert.ToString(availReader["startTime"]);
            TimeSpan time = TimeSpan.Parse(start);
            TimeSpan endT = time.Add(span);
            end = endT.ToString();

            litTest.Text = "" + availID;
            /*
            availEvents.Add(new CustomEvent
            {
                id = availID,
                title = title,
                start = start,
                end = end,
                dow = "[" + dow + "]",
                //selectable = true, //doesnt do anything?
                editable = false,
                eventColor = "royalblue",
                //excludedDate = dateTime.Date,
                // Booked = false            
            });
        }
        */

        sqlConn.Close();
    }

    private string GetStuName(int id)
    {
        SqlConnection sqlConn2 = new SqlConnection(GetConnectionString());
        sqlConn2.Open();

        SqlCommand stuNameCmd = sqlConn2.CreateCommand();

        string studentName = "";

        stuNameCmd.CommandText = "SELECT firstName FROM student WHERE studentKey = " + id;
        studentName += (string)stuNameCmd.ExecuteScalar();
        stuNameCmd.CommandText = "SELECT lastName FROM student WHERE studentKey = " + id;
        studentName += " " + (string)stuNameCmd.ExecuteScalar();

        sqlConn2.Close();
        return studentName;
    }

    private void Populate_Advisor(int id)
    {
        string studentKey = "";
        string advisorKey = "";
        string firstName = "";
        string lastName = "";
        string email = "";
        string phone = "";
        string ext = "";
        string office = "";
        string building = "";

        SqlConnection sqlConn = new SqlConnection(GetConnectionString());
        sqlConn.Open();
        SqlCommand manageCmd = sqlConn.CreateCommand();

        SqlCommand stuKeyCmd = sqlConn.CreateCommand();
        stuKeyCmd.CommandText = "SELECT studentKey FROM student WHERE accountID = '" + id + "'";
        studentKey = Convert.ToString(stuKeyCmd.ExecuteScalar());

        SqlCommand advKeyCmd = sqlConn.CreateCommand();
        advKeyCmd.CommandText = "SELECT advisorKey FROM student_advisor WHERE studentKey = " + studentKey;
        advisorKey = Convert.ToString(advKeyCmd.ExecuteScalar());

        manageCmd.CommandText = "SELECT firstName, lastName, email, phone, ext, office, buildingID FROM " +
                                "advisor WHERE advisorKey = " + advisorKey;
        SqlDataReader manageReader = manageCmd.ExecuteReader();

        if (manageReader.Read())
        {
            firstName = Convert.ToString(manageReader["firstName"]);
            lastName = Convert.ToString(manageReader["lastName"]);
            email = Convert.ToString(manageReader["email"]);
            phone = Convert.ToString(manageReader["phone"]);
            ext = Convert.ToString(manageReader["ext"]);
            office = Convert.ToString(manageReader["office"]);
            building = Convert.ToString(manageReader["buildingID"]);
        }

        manageReader.Close();
        sqlConn.Close();

        infoName.InnerText = firstName + " " + lastName;
        to.InnerText = firstName + " " + lastName;
        infoEmail.InnerText = email;
        infoPhone.InnerText = phone + " ext. " + ext;
        infoOffice.InnerText = building + " " + office;
    }

    public string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString;
    }

    public void Send_Email(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();

        int stuID = (int)Session["studentID"];

        SqlCommand mailCmd = sqlConn.CreateCommand();
        mailCmd.CommandText = "SELECT studentKey FROM student WHERE accountID = '" + stuID + "'";
        int stuKey = Convert.ToInt32(mailCmd.ExecuteScalar());
        mailCmd.CommandText = "SELECT advisorKey FROM student_advisor WHERE studentKey = '" + stuKey + "'";
        int advKey = Convert.ToInt32(mailCmd.ExecuteScalar());

        mailCmd.CommandText = "SELECT email FROM student WHERE accountID = '" + stuID + "'";
        string stuEmail = (string)mailCmd.ExecuteScalar();
        mailCmd.CommandText = "SELECT firstName FROM student WHERE accountID = '" + stuID + "'";
        string stuFname = (string)mailCmd.ExecuteScalar();
        mailCmd.CommandText = "SELECT lastName FROM student WHERE accountID = '" + stuID + "'";
        string stuLname = (string)mailCmd.ExecuteScalar();
        string stuName = stuFname + " " + stuLname;

        mailCmd.CommandText = "SELECT email FROM advisor WHERE advisorKey = '" + advKey + "'";
        string advEmail = (string)mailCmd.ExecuteScalar();

        sqlConn.Close();

        var sysLogin = "penncollegeadvising@gmail.com";
        var sysPass = "P. C. T. 4dv151n6";

        var sysAddress = new MailAddress(stuEmail, stuName);
        var receiverAddress = new MailAddress(advEmail, advEmail);

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
        mailBody += stuName + "</strong> via PennCollegeAdvising.com. To reply to " + stuFname + " directly, ";
        mailBody += "contact <strong>" + stuEmail + "</strong>.</p>";
        mailBody += "	</body>";
        mailBody += "</html>";

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
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
    
    protected void Store_Times(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();

        int stuID = (int)Session["studentID"];

        SqlCommand keyCmd = sqlConn.CreateCommand();
        keyCmd.CommandText = "SELECT studentKey FROM student WHERE accountID = '" + stuID + "'";
        int stuKey = Convert.ToInt32(keyCmd.ExecuteScalar());

        keyCmd.CommandText = "SELECT advisorKey FROM student_advisor WHERE studentKey = '" + stuKey + "'";
        int advKey = (int)keyCmd.ExecuteScalar();

        string[] apptDate = apptsHidden.Value.Split(new string[] { " - " }, StringSplitOptions.None);
        string[] apptDateTime = apptDate[1].Split(':');
        int apptDateHour = Convert.ToInt32(apptDateTime[0]);
        int apptDateMin = Convert.ToInt32(apptDateTime[1]);

        if (apptDateHour < 8) apptDateHour += 12;

        SqlCommand apptCmd = sqlConn.CreateCommand();

        apptCmd.CommandText = "DELETE FROM appointmentNewNew WHERE studentID = " + stuKey;
        apptCmd.ExecuteNonQuery();

        apptCmd.CommandText = "INSERT INTO appointmentNewNew (status, studentID, appDate, startTime, advisorID)" +
                                   "VALUES (@param1, @param2, @param3, @param4, @param5)";

        apptCmd.Parameters.Add("@param1", SqlDbType.VarChar, 25).Value = "pending";
        apptCmd.Parameters.Add("@param2", SqlDbType.Int).Value = stuKey;
        apptCmd.Parameters.Add("@param3", SqlDbType.Date).Value = apptDate[0];
        apptCmd.Parameters.Add("@param4", SqlDbType.Time, 7).Value = apptDateHour + ":" + apptDateMin + ":00";
        apptCmd.Parameters.Add("@param5", SqlDbType.Int).Value = advKey;
        apptCmd.ExecuteNonQuery();

        sqlConn.Close();
    }
}
 