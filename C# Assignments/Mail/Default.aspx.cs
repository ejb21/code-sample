using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
	
	public void sendEmail(object sender, EventArgs e){	
			
		// Create email message
		string emailMessage = "" ;
		emailMessage += "<html>";
		emailMessage += "	<head>";
		emailMessage += "		<style>";
		emailMessage += "			h1{margin: 0;}";
		emailMessage += "			p{margin: 0; height: 15px;}";
		emailMessage += "		</style>";
		emailMessage += "	</head>";
		emailMessage += "	<body>";
		emailMessage += "		<h1>This is an awsome email ...</h1>";
		emailMessage += "		<p>More stuff ... and what not</p>";
		emailMessage += "	<body>";
		emailMessage += "</html>";
		
		// Create the email appointment/attachment
		String[] contents = { 
			"BEGIN:VCALENDAR",
				"PRODID:-//Flo Inc.//FloSoft//EN",
				"BEGIN:VEVENT",
					"DTSTART:" + DateTime.Now.AddMinutes(-180).ToUniversalTime().ToString("yyyyMMdd\\THHmmss\\Z"), 
					"DTEND:" + DateTime.Now.AddMinutes(-165).ToUniversalTime().ToString("yyyyMMdd\\THHmmss\\Z"), 
					"LOCATION: CC 166B", 
					"DESCRIPTION;ENCODING=QUOTED-PRINTABLE: This is where some comments about the appointment would go",
					"SUMMARY: This is where the summary would go", 
					"PRIORITY:3", 
				"END:VEVENT", 
			"END:VCALENDAR" 
		};
		System.IO.File.WriteAllLines(Server.MapPath("appointments/Appointment.ics"), contents);
		
		
		MailMessage message = new MailMessage();
		SmtpClient smtpClient = new SmtpClient();
		string msg = string.Empty;
		
		try
		{
			MailAddress fromAddress = new MailAddress("spyke.krepshaw@gmail.com");
			message.From = fromAddress;
			message.To.Add("spyke.pct@gmail.com");
			message.Subject = "This is an email subject";
			message.IsBodyHtml = true;
			message.Body = "This is the email body";
			smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
			smtpClient.Port = 587;
			smtpClient.EnableSsl = true;
			smtpClient.UseDefaultCredentials = true;
			smtpClient.Credentials = new System.Net.NetworkCredential("", "");
			
			smtpClient.Send(message);
			litAlert.Text  = "Successful<BR>";
		}
		catch (Exception ex)
		{
			litAlert.Text  = ex.Message;
		}
		

		/*
		try
        {	
		
			// Connect to mial server and send email	
			System.Web.Mail.MailMessage email = new System.Web.Mail.MailMessage();
            
			email.From = "skrepshaw@pct.edu";
			email.To = "skrepshaw@pct.edu";
			email.Subject = "Appointment";
			email.BodyFormat = MailFormat.Html;
			email.Body = emailMessage;
			email.Attachments.Add(new MailAttachment(Server.MapPath("appointments/Appointment.ics")));
			
			
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; 
            smtp.Credentials = new System.Net.NetworkCredential
                 ("spyke.krepshaw@gmail.com", "20webmaster11?");
            
            smtp.EnableSsl = true;
            smtp.Send(email);
			
			litAlert.Text = "Email has been sent ...";
        }
        catch (Exception e2)
        {
			litAlert.Text += "Mail Problem.";
        }
		*/
		
		
	}
}