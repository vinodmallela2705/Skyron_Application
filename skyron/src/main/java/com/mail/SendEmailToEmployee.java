package com.mail;



import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.RequestContext;



import javax.mail.*;

public class SendEmailToEmployee extends HttpServlet{
	static String mail;
	static String name;
	static String password;
	static String userid;
	static String workEmail;
	static String designation;

	public static void sendMail(String recepient) throws Exception {
		try {
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.trust", "mail.zauca.com");
			properties.put("mail.smtp.host", "mail.zauca.com");
			properties.put("mail.smtp.port", "587");
			MailAuthDetails MADObj = new MailAuthDetails();
			final String myAccountMail = MADObj.getEmail();
			final String password  = MADObj.getPassWord();

			Session session =Session.getInstance(properties, new Authenticator() {
				@Override
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(myAccountMail, password);
				}

			});
			Message message = prepareMessage(session,myAccountMail,recepient);
			Transport.send(message);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

	private static Message prepareMessage(Session session,String myAccountMail,String recepient) {

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myAccountMail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			
			message.setSubject("Welcome to Skyron ");
			message.setContent("<h4>Dear <b>"+name+"</b><br>I'd like to welcome you  to the Skyron software solutions,on behalf of the entire staff </h4> "+"<h5 style='color:Red'>please refer below login details </h5><h2>Designation : "+designation+"<br>Email : "+workEmail+"<br>  Employee Id - "+userid+"<br> password - "+password+"<h2><h6  style='color:red'> (Temporary password :: please change your password)</h6><br>"+
			"<h4 style='color:blue;'><b><br> Thank You <br>Skyron Software Solutions<br>Hadapsar,Pune <br>Maharastra-412308<b><h4>",
            "text/html");
			
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) throws IOException {
		HttpSession session = req.getSession();
		mail =(String)session.getAttribute("mail");
		name =(String)session.getAttribute("name");
		password =(String)session.getAttribute("password");
		userid =(String)session.getAttribute("userid");
		workEmail =(String)session.getAttribute("workEmail");
		designation =(String)session.getAttribute("designation");
		PrintWriter out=arg.getWriter(); 
		try {
			sendMail(mail);
			session.removeAttribute(name);
			session.removeAttribute(mail);
			session.removeAttribute(password);
			session.removeAttribute(userid);
			session.removeAttribute(workEmail);
			session.removeAttribute(designation);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Employee Added Sucessfully\\n\\nEmployeeID :"+userid+"\\n\\nEmployee Name : "+name+"\\n\\nEmployee Email : "+workEmail+"');");
			
			out.println("window.location.href = '"+req.getContextPath()+"/allEmployees?id="+userid+" "+name+"';");
			out.println("</script>");
			//arg.sendRedirect(req.getContextPath()+"/allEmployees?id="+userid+" "+name);
		} catch (Exception e) {

		}
	}

}

