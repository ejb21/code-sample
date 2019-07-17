using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class advisees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["studentID"] != 0 || Session["advisorID"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        litNotification.Text = "";

        if (IsPostBack && fileAdviseeList.PostedFile != null)
        {
            if (fileAdviseeList.PostedFile != null &&
           fileAdviseeList.PostedFile.ContentLength > 0)
            {
                string fileName = Path.GetFileName(fileAdviseeList.PostedFile.FileName);
                string savePath = MapPath("~/uploads") + "\\" + fileName;

                try
                {
                    fileAdviseeList.PostedFile.SaveAs(savePath);
                    litNotification.Text = "File has been uploaded";
                }
                catch (Exception ex)
                {
                    litNotification.Text = ex.Message;
                }

                ReadFile(fileName);
            }
            else
            {
                litNotification.Text = "There was a problem with your file.";
            }
        }

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString + ";MultipleActiveResultSets=True");
        sqlConn.Open();

        int advID = (int)Session["advisorID"];
        SqlCommand findAdvKey = sqlConn.CreateCommand();
        findAdvKey.CommandText = "SELECT advisorKey FROM advisor WHERE accountID = '" + advID + "'";
        int advKey = (int)findAdvKey.ExecuteScalar();

        SqlCommand studentAdvisor = sqlConn.CreateCommand();
        studentAdvisor.CommandText = "SELECT studentKey FROM student_advisor WHERE advisorKey = '" + advKey + "'";
        SqlDataReader adviseeReader = studentAdvisor.ExecuteReader();

        SqlCommand tblCommand = sqlConn.CreateCommand();
        SqlDataReader tblReader;
        int stuKey;

        List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();
        Dictionary<string, string> column;

        while (adviseeReader.Read())
        {
            stuKey = Convert.ToInt32(adviseeReader["studentKey"]);

            tblCommand.CommandText = "SELECT firstName, lastName, email, year FROM student WHERE studentKey = '" + stuKey + "'";
            tblReader = tblCommand.ExecuteReader();

            while (tblReader.Read())
            {
                column = new Dictionary<string, string>();

                column["firstName"] = tblReader["firstName"].ToString();
                column["lastName"] = tblReader["lastName"].ToString();
                column["email"] = tblReader["email"].ToString();
                column["year"] = tblReader["year"].ToString();

                rows.Add(column);
            }

            tblReader.Close();
        }

        adviseeReader.Close();
        
        string[] studentData = new string[4];

        int ctr = 0;
        int tblCtr = 0;
        int contentHeight = 925;
        int scrollHeight = 660;

        tblDiv.InnerHtml = "<table id=\"tblStudents\"><tr><th>Name</th><th>Email</th><th>Year</th>" +
            "<th><img id=\"sendTable\" src=\"images/SendTable.png\" /></th></tr>";

        foreach (Dictionary<string, string> col in rows)
        {
            ctr = 0;

            foreach(KeyValuePair<string, string> kvp in col)
            {
                studentData[ctr] = kvp.Value;
                ctr++;
            }

            tblDiv.InnerHtml += "<tr><td id=\"name" + tblCtr + "\">" + studentData[0] + " " + studentData[1] +
                        "</td><td id=\"email" + tblCtr + "\">" + studentData[2] + "</td>" +
                        "<td id=\"year" + tblCtr + "\">" + studentData[3] + "</td>" +
                        "<td id=\"contact" + tblCtr + "\"><div class=\"stuContact\" onclick=\"contactFade(" +
                        "document.getElementById('name" + tblCtr + "').innerText)\">CONTACT</div></td></tr>";

            contentHeight += 57;
            scrollHeight += 57;
            tblCtr++;
        }
    }

    /*
    public void UploadFile(object sender, EventArgs e)
    {
        if(fileAdviseeList.PostedFile != null && 
           fileAdviseeList.PostedFile.ContentLength > 0)
        {
            string fileName = Path.GetFileName(fileAdviseeList.PostedFile.FileName);
            string savePath = MapPath("~/uploads") + "\\" + fileName;

            try
            {
                fileAdviseeList.PostedFile.SaveAs(savePath);
                litNotification.Text = "File has been uploaded";
            }
            catch(Exception ex)
            {
                litNotification.Text = ex.Message;
            }

            ReadFile(fileName);
        }
        else
        {
            litNotification.Text = "There was a problem with your file.";
        }
    }
    */

    public void ReadFile(string fn)
    {
        try
        {
            int advisorID = (int)Session["advisorID"]; // Advisor Session Information
            int advisorKey = -1;
            int maxStuKey = -1;
            int maxAccID = -1;

            StreamReader file = new StreamReader(MapPath("~/uploads/" + fn));
            string line = file.ReadLine(); // To skip header line

            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);

            sqlConn.Open();

            SqlCommand advKeyCmd = sqlConn.CreateCommand();
            advKeyCmd.CommandText = "SELECT advisorKey FROM advisor WHERE accountID = '" + advisorID + "'";
            advisorKey = (int)advKeyCmd.ExecuteScalar();

            while ((line = file.ReadLine()) != null)
            {
                string[] record = line.Split(',');
                string lastName = record[0],
                       firstName = record[1],
                       pctID = record[2],
                       major = record[3],
                       year = record[4],
                       email = record[5],
                       networkID = record[6];

                SqlCommand maxStuCmd = sqlConn.CreateCommand();
                maxStuCmd.CommandText = "SELECT MAX(studentKey) FROM student";
                maxStuKey = (int)maxStuCmd.ExecuteScalar();

                SqlCommand maxAccCmd = sqlConn.CreateCommand();
                maxAccCmd.CommandText = "SELECT MAX(accountID) FROM account";
                maxAccID = (int)maxAccCmd.ExecuteScalar();

                // TODO: Implement logic for changing student password at student first login
                // NOTE: Need to insert account table first, to have primary key for accountID
                // Prep for account insert
                int accountID = maxAccID + 1;
                int studentKey = maxStuKey + 1;
                string defaultPw = "abc123";  // Default password we will have students change after account creation
                byte[] salt;
                new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                var pbkdf2 = new Rfc2898DeriveBytes(defaultPw, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                byte[] hashBytes = new byte[36];
                Array.Copy(salt, 0, hashBytes, 0, 16);
                Array.Copy(hash, 0, hashBytes, 16, 20);
                string defaultHash = Convert.ToBase64String(hashBytes);
                string date = DateTime.Now.ToString("yyyy-MM-dd");

                // TODO: Need to check if a student with that username already exists - don't create if it does

                // ACCOUNT insert
                SqlCommand accountInCmd = sqlConn.CreateCommand();
                accountInCmd.CommandText = "INSERT INTO account(accountID, username, passHash, createdDate, type)" +
                                           "VALUES(@param1, @param2, @param3, @param4, @param5)";
                accountInCmd.Parameters.Add("@param1", SqlDbType.Int).Value = accountID;
                accountInCmd.Parameters.Add("@param2", SqlDbType.VarChar, 25).Value = networkID;
                accountInCmd.Parameters.Add("@param3", SqlDbType.VarChar, 50).Value = defaultHash;
                accountInCmd.Parameters.Add("@param4", SqlDbType.Date).Value = date;
                accountInCmd.Parameters.Add("@param5", SqlDbType.Bit).Value = 0;
                accountInCmd.ExecuteNonQuery();

                // STUDENT insert
                SqlCommand studentInCmd = sqlConn.CreateCommand();
                studentInCmd.CommandText = "INSERT INTO student(studentKey, studentID, firstName, lastName, email, year, accountID)" +
                                           "VALUES(@param1, @param2, @param3, @param4, @param5, @param6, @param7)";
                studentInCmd.Parameters.Add("@param1", SqlDbType.Int).Value = studentKey;
                studentInCmd.Parameters.Add("@param2", SqlDbType.VarChar, 11).Value = pctID;
                studentInCmd.Parameters.Add("@param3", SqlDbType.VarChar, 50).Value = firstName;
                studentInCmd.Parameters.Add("@param4", SqlDbType.VarChar, 50).Value = lastName;
                studentInCmd.Parameters.Add("@param5", SqlDbType.VarChar, 50).Value = email;
                studentInCmd.Parameters.Add("@param6", SqlDbType.VarChar, 50).Value = year;
                studentInCmd.Parameters.Add("@param7", SqlDbType.Int).Value = accountID;
                studentInCmd.ExecuteNonQuery();

                // STUDENT_MAJOR insert
                SqlCommand stuMajInCmd = sqlConn.CreateCommand();
                stuMajInCmd.CommandText = "INSERT INTO student_major(studentKey, majorID)" +
                                          "VALUES(@param1, @param2)";
                stuMajInCmd.Parameters.Add("@param1", SqlDbType.Int).Value = studentKey;
                stuMajInCmd.Parameters.Add("@param2", SqlDbType.VarChar, 3).Value = major;
                stuMajInCmd.ExecuteNonQuery();

                // STUDENT_ADVISOR insert
                SqlCommand stuAdvCmd = sqlConn.CreateCommand();
                stuAdvCmd.CommandText = "INSERT INTO student_advisor(studentKey, advisorKey)" +
                                        "VALUES(@param1, @param2)";
                stuAdvCmd.Parameters.Add("@param1", SqlDbType.Int).Value = studentKey;
                stuAdvCmd.Parameters.Add("@param2", SqlDbType.Int).Value = advisorKey;
                stuAdvCmd.ExecuteNonQuery();
            }
            sqlConn.Close();
            file.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "errorFade();", true);
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
}