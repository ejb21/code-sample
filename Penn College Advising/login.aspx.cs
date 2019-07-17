using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // TODO: Add SSL?

    protected void Submit_Click(object sender, EventArgs e)
    {
        // NOTE: for testing purposes all passwords are: abc123

        // User entered values on login page
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);

        litError.Text = ""; // Clear error every button press

        if (username != "" && password != "")
        {
            // First, clear the Session
            Session.Clear();
            
            // Trimming email to username
            int index = username.IndexOf("@");
            if (index > 0)
                username = username.Substring(0, index);

            // Finding if username exists
            sqlConn.Open();
            SqlCommand matchCmd = sqlConn.CreateCommand();
            matchCmd.CommandText = "SELECT COUNT(*) FROM account WHERE username = '" + username + "'";
            int matchUsername = (int)matchCmd.ExecuteScalar();
            sqlConn.Close();
            
            if (matchUsername == 1) // username exists
            {
                bool    match     = true;
                bool    isAdvisor = false;
                int     accID     = 0;

                sqlConn.Open();
                SqlCommand pwCmd       = sqlConn.CreateCommand();
                pwCmd.CommandText      = "SELECT * FROM account WHERE username = '" + username + "'";
                SqlDataReader pwReader = pwCmd.ExecuteReader();

                while (pwReader.Read())
                {
                    /* Checking if passwords match */
                    // Fetch stored value
                    string savedPassHash = Convert.ToString(pwReader["passHash"]);
                    // Extract the bytes
                    byte[] hashBytes = Convert.FromBase64String(savedPassHash);
                    isAdvisor = Convert.ToBoolean(pwReader["type"]);
                    accID = Convert.ToInt32(pwReader["accountID"]);
                    // Get the salt
                    byte[] salt = new byte[16];
                    Array.Copy(hashBytes, 0, salt, 0, 16);
                    // Compute hash on password supplied at login
                    var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                    byte[] hash = pbkdf2.GetBytes(20);
                    // Compare the results
                    for (int i = 0; i < 20; i++)
                        if (hashBytes[i + 16] != hash[i])
                            match = false;
                }
                pwReader.Close();
                sqlConn.Close();

                if (match == true)
                {
                    if (isAdvisor)
                    {
                        Session["advisorID"] = accID;
                        Session["studentID"] = 0;
                        litError.Text = "Advisor";

                        Response.Redirect("advisor.aspx"); 
                    }
                    else if (!isAdvisor)
                    {
                        Session["studentID"] = accID;
                        Session["advisorID"] = 0;
                        litError.Text = "Student";

                        Response.Redirect("student.aspx");
                    }
                   
                    litError.Text +=  " Successful Login!";
                }
                else
                {
                    litError.Text = "<p class=\"error\">Invalid Username or Password</p>";
                }
            }
            else litError.Text = "<p class=\"error\">Invalid username or password.</p>";
            
        }
        else
        {
            litError.Text = "<p class=\"error\">Please enter a Username and Password</p>";
        }
    }
}