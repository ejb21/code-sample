using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mpoust_ZipCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string zipString = "";
        string zipCode = "";
        string stateAbbr = "";
        string cityName = "";
        string stateName = "";
        int numZips = -1;

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["FINAL-DB"].ConnectionString);

        try
        {
            // Zip Query
            zipString = txtZip.Text;
            sqlConn.Open();
            SqlCommand zipCmd = sqlConn.CreateCommand();
            zipCmd.CommandText = "SELECT * FROM zips WHERE zipcode = '" + zipString + "'";
            SqlDataReader zipReader = zipCmd.ExecuteReader();

            zipReader.Read();
            zipCode = Convert.ToString(zipReader["zipCode"]);
            stateAbbr = Convert.ToString(zipReader["stateAbbr"]);
            cityName = Convert.ToString(zipReader["city"]);
            zipReader.Close();

            // State Name Query
            SqlCommand stateCmd = sqlConn.CreateCommand();
            stateCmd.CommandText = "SELECT state FROM states WHERE stateAbbr = '\"" + stateAbbr + "\"'";
            stateName = (string)stateCmd.ExecuteScalar();

            //Zip Count Query
            SqlCommand numZipCmd = sqlConn.CreateCommand();
            numZipCmd.CommandText = "SELECT COUNT(zipcode) FROM zips WHERE stateAbbr = '" + stateAbbr + "'";
            numZips = (int)numZipCmd.ExecuteScalar();

            stateName = stateName.Replace("\"", "");
;           cityName = ProperCase(cityName);
            sqlConn.Close();

            if(zipCode != "")
            {
                lblInfo1.Text = "You live in: <b>" + cityName + ", " + stateName + "</b>";
                lblInfo2.Text = "There are: <b>" + numZips + "</b> other zipcodes in <b>" + stateAbbr + "</b>";

                string imgName = "";
                stateName = stateName.ToLower();
                stateName = stateName.Replace(" ", "-");
                imgName = "state-" + stateName + ".png";
                imgState.ImageUrl = "~/mpoust/images/" + imgName;
            }
            else
            {
                lblInfo1.Text = "Zipcode does not exist";
            }

        }
        
        catch (Exception ex)
        {
            lblInfo1.Text = "Zipcode does not exist";
        }

    }

    static string ProperCase(string s)
    {
        if (string.IsNullOrEmpty(s))
        {
            return string.Empty;
        }
        bool hasSpace = s.Contains(" ");
        s = s.ToLower();
        if(!hasSpace)
            return char.ToUpper(s[0]) + s.Substring(1);
        else
        {
            string[] parts = s.Split(' ');

            string one = parts[0];
            string two = parts[1];

            one = ProperCase(one);
            two = ProperCase(two);

            string result = one + " " + two;

            return result;
        }
    }
}
 