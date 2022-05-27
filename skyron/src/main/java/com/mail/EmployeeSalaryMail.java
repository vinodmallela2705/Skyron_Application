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

public class EmployeeSalaryMail extends HttpServlet{
	static String employeeId;
	static String employeeName;
	static String  salaryMonth;
	static String salaryYear ;
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
		
			message.setSubject("Skyron payBill");
			message.setText("Hai! "+employeeId+" - "+employeeName+" \n  your "+salaryMonth+"-"+salaryYear+" pay slip is genearted,you can visit our website and download\n "
					  + "\n \n Thank you"+"\n    Skyron Software Solutions  "+"\n    Hadapsur,Pune ");
			return message;
		} catch (Exception e) {

			e.printStackTrace();
		} 
		return null;
	} 

	public void service(HttpServletRequest req, HttpServletResponse arg) {
		HttpSession session = req.getSession();
		
		
		salaryMonth = req.getParameter("sm");
		salaryYear = req.getParameter("sy");
		employeeId = req.getParameter("id");
		employeeName = req.getParameter("en");
		work_mail = req.getParameter("we");

		

		try {
			sendMail(work_mail);
		
		
			arg.sendRedirect(req.getContextPath()+"/manageSalarySlip");
		} catch (Exception e) {

		}
	}

}

