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

	public static void sendMail(String recepient) throws Exception {
		try {
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.trust", "mail.zauca.com");
			properties.put("mail.smtp.host", "mail.zauca.com");
			properties.put("mail.smtp.port", "587");
			final String myAccountMail = "vinod.mallela@skyronsoftware.com";
			final String password  = "Srinusha@2705";

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
			message.setContent("<h4>Dear <b>"+name+"</b><br>I'd like to welcome you  to the Skyron software solutions,on behalf of the entire staff </h4> "+"<h5 style='color:red'>please refer below login details </h5> <h2> UserID - "+userid+"<br>User password - "+password+"<h2><h6> (Temporary password)</h6>please change your password<br>"+
			"<h4 style='color:blue;'><b><br> Thank You <br>Skyron Software Solutions<br>Hadapsar,Pune <br>Maharastra-412308<b><h4>",
            "text/html");
			
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) {
		HttpSession session = req.getSession();
		mail =(String)session.getAttribute("mail");
		name =(String)session.getAttribute("name");
		password =(String)session.getAttribute("password");
		userid =(String)session.getAttribute("userid");
		
		try {
			sendMail(mail);
			session.removeAttribute(name);
			session.removeAttribute(mail);
			session.removeAttribute(password);
			session.removeAttribute(userid);
			arg.sendRedirect(req.getContextPath()+"/allEmployees?id="+userid+" "+name);
		} catch (Exception e) {

		}
	}

}

