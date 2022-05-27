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

public class Employee_Leave_Status extends HttpServlet{
	static String employee_id;
	static String employee_name;
	static String reporting_manager_name ;
	static String status ;
	static String  from_date;
	static String  days;
	static String to_date ;
	static String work_mail;
	
	

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
		
			message.setSubject("Dear "+employee_name + "  leave "+status);
			message.setText("Hai! "+employee_id+" - "+employee_name+" \n  your requested Leave from "+from_date+" to  "+to_date+"of  "+days+" Days is "+ status+" , \n by  "+reporting_manager_name+
					   "\n \n Thanks regard");
			System.out.println("Otp..........................");
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) {
		HttpSession session = req.getSession();
		
		reporting_manager_name = req.getParameter("rpm");
		from_date = req.getParameter("from_date");
		to_date = req.getParameter("to_date");
		days = req.getParameter("d");
		employee_id = req.getParameter("id");
		status = req.getParameter("s");
		employee_name = req.getParameter("employee_name");
		work_mail = req.getParameter("work_mail");

		

		try {
			sendMail(work_mail);
		
		
			arg.sendRedirect(req.getContextPath()+"/adminEmployeeLeaves");
		} catch (Exception e) {

		}
	}

}

