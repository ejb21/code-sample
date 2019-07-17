using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int studentID = (int)(Session["studentID"]);
        int advisorID = (int)(Session["advisorID"]);

        if(studentID != 0)
        {
            // Hide advisor options from student
            accountDiv.Attributes["CssClass"] = "accountStudent";
            update.Attributes["CssClass"] = "updateStudent";
            pnlAdvisor.Visible = false;
            // Populate student fields
            Populate_Fields(studentID, false);
        }
        else if(advisorID != 0)
        {
            string phone    = "";
            string ext      = "";
            string office   = "";
            string building = "";

            // Populate advisor (all) fields
            Populate_Fields(advisorID, true);
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
            sqlConn.Open();
            SqlCommand advInfoCmd = sqlConn.CreateCommand();
            advInfoCmd.CommandText = "SELECT phone, ext, office, buildingID FROM advisor WHERE accountID = '" + advisorID + "'";
            SqlDataReader advReader = advInfoCmd.ExecuteReader();

            if (advReader.Read())
            {
                phone = Convert.ToString(advReader["phone"]);
                ext = Convert.ToString(advReader["ext"]);
                office = Convert.ToString(advReader["office"]);
                building = Convert.ToString(advReader["buildingID"]);
            }
            sqlConn.Close();

            txtPhone.Text = phone;
            txtExt.Text = ext;
            txtOffice.Text = office;
            txtBuilding.Text = building;
        }
    }

    private void Populate_Fields(int id, bool advisor)
    {
        string table     = "";
        string firstName = "";
        string lastName  = "";
        string email     = "";

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();
        SqlCommand manageCmd = sqlConn.CreateCommand();
        
        if (advisor)
            table = "advisor";
        else
            table = "student";

        manageCmd.CommandText = "SELECT firstName, lastName, email FROM " + table + 
                                " WHERE accountID = '" + id + "'";
        SqlDataReader manageReader = manageCmd.ExecuteReader();
        if (manageReader.Read())
        {
            firstName = Convert.ToString(manageReader["firstName"]);
            lastName = Convert.ToString(manageReader["lastName"]);
            email = Convert.ToString(manageReader["email"]);
        }
        sqlConn.Close();

        txtFirstName.Text = firstName;
        txtLastName.Text = lastName;
        txtEmail.Text = email;

        // Store information as Session attributes to see if values changed on update account?
    }

    protected void Update_Account(object sender, EventArgs e)
    {
        // TODO: Validate fields for updating account, don't update blank fields - Session?
    }

    protected void Change_Password(object sender, EventArgs e)
    {
        if ((txtCurrent.Text != null) && (txtNew.Text != null) && (txtConfirm.Text != null))
        {
            int id = 0;
            int advisorID = (int)Session["advisorID"];
            int studentID = (int)Session["studentID"];

            string savedPassHash = null;
            string enteredPw = null;
            string newPw = null;
            string newPwConfirm = null;

            bool match = true;

            if (advisorID != 0)
                id = advisorID;
            else if (studentID != 0)
                id = studentID;

            // TODO: Validate password input, update to new password
            // TODO: Enforce password controls?
            // TODO: Implement forgot password?
            // TODO: Implement popup for error feedback - wrong password, no match, requirements not met
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
            sqlConn.Open();
            SqlCommand pwCmd = sqlConn.CreateCommand();
            pwCmd.CommandText = "SELECT passHash FROM account WHERE accountID = '" + id + "'";

            savedPassHash = (string)pwCmd.ExecuteScalar();
            sqlConn.Close();

            // Check entered password against stored password
            byte[] hashBytes = Convert.FromBase64String(savedPassHash);
            byte[] salt = new byte[16];
            Array.Copy(hashBytes, 0, salt, 0, 16);
            enteredPw = txtCurrent.Text;
            var pbkdf2 = new Rfc2898DeriveBytes(enteredPw, salt, 10000);
            byte[] hash = pbkdf2.GetBytes(20);
            // Compare the results
            for (int i = 0; i < 20; i++)
                if (hashBytes[i + 16] != hash[i])
                    match = false;

            // Correct password entered - compare new and confirm
            if(match != false)
            {
                newPw = txtNew.Text;
                newPwConfirm = txtConfirm.Text;
                if(newPw.Equals(newPwConfirm))
                {
                    // Generate new hash
                    new RNGCryptoServiceProvider().GetBytes(salt = new byte[16]);
                    var pbkdf3 = new Rfc2898DeriveBytes(newPw, salt, 10000);
                    byte[] hash3 = pbkdf3.GetBytes(20);
                    byte[] hashBytes3 = new byte[36];
                    Array.Copy(salt, 0, hashBytes3, 0, 16);
                    Array.Copy(hash3, 0, hashBytes3, 16, 20);
                    string newHash = Convert.ToBase64String(hashBytes3);

                    // Update passHash record
                    sqlConn.Open();
                    SqlCommand updatePwCmd = sqlConn.CreateCommand();
                    updatePwCmd.CommandText = "UPDATE account SET passHash = '" + newHash + "'" +
                                              "WHERE accountID = '" + id + "'";
                    updatePwCmd.ExecuteNonQuery();
                    sqlConn.Close();

                    // Clear Session, Logout, and return to login - popup to notify user of this?
                    Session.Clear();
                    Response.Redirect("login.aspx");

                }
                else // Supplied passwords didn't match
                {
                    // TODO:
                }
            }
            else // incorrect password
            {
                // TODO: throw error popup here?
                
            }
        }
    }
}