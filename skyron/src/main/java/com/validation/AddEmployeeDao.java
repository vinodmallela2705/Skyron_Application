package com.validation;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JdbcConnection.DbConn;


public class AddEmployeeDao extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		String employeeId = request.getParameter("employeeId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String workEmail = request.getParameter("workemail");
		String personalEmail = request.getParameter("personalEmail");
		String mobileNumber = request.getParameter("mobileNumber");
		String gender = request.getParameter("gender");
		String joiningDate = request.getParameter("joiningDate");
		String employeeType = request.getParameter("employeeType");
		String project = request.getParameter("project");
		String dob = request.getParameter("dob");
		String designation = request.getParameter("designation");
		String password = lastName+"@"+employeeId;

		try{

			String sql = "insert into employeeDetails(employeeId,firstName,lastName,workEmail,"+
					"personalEmail,phoneNumber,gender,joiningDate,employeeType,project,dateOfBirth,designation,password)"
					+"values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection con = DbConn.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, employeeId);
			st.setString(2, firstName);
			st.setString(3, lastName);
			st.setString(4, workEmail);
			st.setString(5,personalEmail);
			st.setString(6, mobileNumber);
			st.setString(7, gender);
			st.setString(8, joiningDate);
			st.setString(9, employeeType);
			st.setString(10, project);
			st.setString(11, dob);
			st.setString(12, designation);
			st.setString(13, password);
			st.executeUpdate(); 
			HttpSession session = request.getSession();
			session.setAttribute("userid",employeeId);
			session.setAttribute("mail", personalEmail);
			session.setAttribute("workEmail", workEmail);
			session.setAttribute("password", password);
			session.setAttribute("name", firstName);
			session.setAttribute("designation", designation);
			response.sendRedirect(request.getContextPath()+"/sendmail");
		}catch(Exception e){
		e.printStackTrace();
		}
	}

}
