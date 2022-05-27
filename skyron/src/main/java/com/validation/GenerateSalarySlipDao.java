package com.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JdbcConnection.DbConn;

public class GenerateSalarySlipDao extends HttpServlet {
	String employeeId ;
    String employeeName ;
    String salaryMonth ;
    String salaryYear;
    String designtaion;
    String bankName ;
    String bankAcNo ;
    String pfNumber ;
    String uanNumber ;
    String paybleDays ;
    String location ;
    String pan ;
    String basicSalary;
    String hra ;
    String lta ;
    String personalPay ;
    String providentFund ;
    String employeePF ;
    String professionalTax;
    String totalEarnings ;
    String totalDeductions ;
    String netPay ;
    String workEmail ;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		HttpSession session=request.getSession(); 
		workEmail    = (String)session.getAttribute("we");
	     session.removeAttribute("we");
	     employeeId   = request.getParameter("employeeId");
	     employeeName = request.getParameter("employeeName");
	     salaryMonth  = request.getParameter("salaryMonth");
	     salaryYear   = request.getParameter("salaryYear");
	     designtaion  = request.getParameter("designation");
	     bankName     = request.getParameter("bankName");
	     bankAcNo     = request.getParameter("bankAcNo");
	     pfNumber     = request.getParameter("pfNumber");
	     uanNumber    = request.getParameter("uanNumber");
	     paybleDays   = request.getParameter("paybleDays");
	     location     = request.getParameter("location");
	     pan 		  = request.getParameter("pan");
	     basicSalary  = request.getParameter("basicSalary");
	     hra 		  = request.getParameter("hra");
	     lta 		  = request.getParameter("lta");
	     personalPay  = request.getParameter("personalPay");
	     providentFund = request.getParameter("providentFund");
	     employeePF    = request.getParameter("employeePF");
	     professionalTax = request.getParameter("professionTax");
	     totalEarnings   = request.getParameter("totalEarnings");
	     totalDeductions = request.getParameter("totalDeductions");
	     netPay          = request.getParameter("netPayWords");
	
	     Connection con =DbConn.getCon();
	     String sql ="insert into salarySlips ( employeeId,employeeName,salaryMonth,salaryYear,designation, bankName,bankAcNo,pfNumber,uanNumber,paybleDays,location,pan,basicSalary,hra,lta, personalPay,providentFund,employeePF,professionalTax,totalEarnings,totalDeductions,netPayWords)"+
	     " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	     PreparedStatement st=con.prepareStatement(sql);
	     st.setString(1, employeeId);
	     st.setString(2,employeeName);
	     st.setString(3,salaryMonth);
	     st.setString(4,salaryYear);
	     st.setString(5, designtaion);
	     st.setString(6, bankName);
	     st.setString(7,bankAcNo);
	     st.setString(8,pfNumber);
	     st.setString(9, uanNumber);
	     st.setString(10,paybleDays);
	     st.setString(11, location);
	     st.setString(12, pan);
	     st.setString(13, basicSalary);
	     st.setString(14, hra);
	     st.setString(15, lta);
	     st.setString(16, personalPay);
	     st.setString(17, providentFund);
	     st.setString(18,employeePF);
	     st.setString(19, professionalTax);
	     st.setString(20, totalEarnings);
	     st.setString(21, totalDeductions);
	     st.setString(22, netPay);
	     st.executeUpdate();	
	     response.sendRedirect(request.getContextPath()+"/salaryMail?we="+workEmail+"&id="+employeeId+"&sm="+salaryMonth+"&sy="+salaryYear+"&en="+employeeName);
	 	
	}catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect(request.getContextPath()+"/manageSalarySlip");
		
	}
	
	}

}
