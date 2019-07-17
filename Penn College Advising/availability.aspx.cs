using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class availability : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["studentID"] != 0 || Session["advisorID"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void Clear_Times(object sender, EventArgs e)
    {
        int advID = (int)Session["advisorID"];

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();

        SqlCommand clearCmd = sqlConn.CreateCommand();
        clearCmd.CommandText = "SELECT advisorKey FROM advisor WHERE accountID = '" + advID + "'";
        int advisorKey = (int)clearCmd.ExecuteScalar();

        clearCmd.CommandText = "DELETE FROM availability WHERE advisorID = @key";
        clearCmd.Parameters.Add("@key", SqlDbType.Int).Value = advisorKey;

        clearCmd.ExecuteNonQuery();
        sqlConn.Close();
    }

    protected void Store_Times(object sender, EventArgs e)
    {
        int advID = (int)Session["advisorID"];

        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["CIT386-DB"].ConnectionString);
        sqlConn.Open();

        SqlCommand advKeyCmd = sqlConn.CreateCommand();
        advKeyCmd.CommandText = "SELECT advisorKey FROM advisor WHERE accountID = '" + advID + "'";
        int advisorKey = (int)advKeyCmd.ExecuteScalar();

        string[] fullTime = availHidden.Value.Split(new string[] { " - " }, StringSplitOptions.None);
        string[] time1 = fullTime[1].Split(':');
        string[] time2 = fullTime[2].Split(':');

        string day = fullTime[0];
        int hour = Convert.ToInt32(time1[0]);
        int min = Convert.ToInt32(time1[1]);
        int endHour = Convert.ToInt32(time2[0]);
        int endMin = Convert.ToInt32(time2[1]);
        string term = "FA17";

        SqlCommand availCmd = sqlConn.CreateCommand();
        availCmd.CommandText = "SELECT MAX(availabilityID) FROM availability";
        int availID = (int)availCmd.ExecuteScalar();
        availID++;

        if (endHour == 8 && hour > 8) endHour += 12;
        if (hour < 8) hour += 12;

        SqlCommand cmd = sqlConn.CreateCommand();

        //cmd.CommandText = "DELETE FROM availability WHERE advisorID = " + advisorKey;
        //cmd.ExecuteNonQuery();

        cmd.CommandText = "INSERT INTO availability (availabilityID, dayOfWeek, startTime, advisorID, termID)" +
                                   "VALUES (@param1, @param2, @param3, @param4, @param5)";
        
        while (hour != endHour || min != endMin)
        {
            cmd.Parameters.Add("@param1", SqlDbType.Int).Value = availID;
            cmd.Parameters.Add("@param2", SqlDbType.VarChar, 25).Value = day;
            cmd.Parameters.Add("@param3", SqlDbType.Time, 7).Value = hour + ":" + min + ":00";
            cmd.Parameters.Add("@param4", SqlDbType.Int).Value = advisorKey;
            cmd.Parameters.Add("@param5", SqlDbType.VarChar, 4).Value = term;
            cmd.ExecuteNonQuery();

            cmd.Parameters.Clear();
            availID++;

            if (min == 45)
            {
                hour++;
                min = 0;
            }
            else min += 15;
        }

        sqlConn.Close();
        System.Threading.Thread.Sleep(1000);
        return;
    }
}