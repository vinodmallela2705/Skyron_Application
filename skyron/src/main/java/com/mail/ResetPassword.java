package com.mail;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.text.DecimalFormat;
import java.util.Properties;
import java.util.Random;

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

public class ResetPassword extends HttpServlet{
	static String mail;
	static String otp;
	

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
			otp= new DecimalFormat("000000").format(new Random().nextInt(999999));
			message.setSubject("Password Reset");
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) {
		HttpSession session = req.getSession();
		mail =(String)session.getAttribute("e");

		try {
			sendMail(mail);
		
			session.setAttribute("otp", otp);
			arg.sendRedirect(req.getContextPath()+"/otp");
		} catch (Exception e) {

		}
	}

}

