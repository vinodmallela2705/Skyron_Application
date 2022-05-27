package com.mail;



import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.RequestContext;



import javax.mail.*;


public class Employee_Leave_Mail extends HttpServlet{
	static String reporting_manager_mail;
	static String reporting_manager_name;
	static String employee_id;
	static String employee_name;
	static String from_date ;
	static String to_date;
	static String days;
	static String reason;
	static String work_mail;
	

	public static void sendMail(String recepient) throws Exception {

		System.out.println("preparing to send email");
		try {


			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.trust", "mail.zauca.com");
			properties.put("mail.smtp.host", "mail.zauca.com");
			System.out.println("check1..........................");
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
			message.addRecipient(Message.RecipientType.CC, new InternetAddress(work_mail));	
			message.setSubject(employee_name+"   Leave Request");
			message.setText("Hai "+reporting_manager_name +" \n This is a kind request regarding my leave On  "+from_date +" to   " +to_date+" due to "+reason+" "+ "So please treat this email as my leave request and kindly give your approval to take leave for"+days +"days"+ " \n \n \n Employee Id:"+employee_id+" \n "+"Employee Name : "+employee_name);
			
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) {
		HttpSession session = req.getSession();
		employee_id = (String)session.getAttribute("employee_id");
		employee_name = (String)session.getAttribute("employee_name");
		from_date	= (String)session.getAttribute("from_date");
		to_date	= (String)session.getAttribute("to_date");
		days = (String)session.getAttribute("days");
		reason = (String)session.getAttribute("reason");
		reporting_manager_mail = (String)session.getAttribute("reporting_manager_mail");
		reporting_manager_name = (String)session.getAttribute("reporting_manager_name");
		work_mail =(String)session.getAttribute("work_mail");
		try {
			sendMail(reporting_manager_mail);
			
			arg.sendRedirect(req.getContextPath()+"/employeeLeaves");
		} catch (Exception e) {

		}
	}

}

