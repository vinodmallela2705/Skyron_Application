package com.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.JdbcConnection.DbConn;

public class EmployeeDetailsFormDao extends HttpServlet {

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String joiningDate = request.getParameter("joiningDate");
		String employeeStatus = request.getParameter("employeeStatus");
		String workEmail = request.getParameter("workEmail");
		String personalEmail = request.getParameter("personalEmail");
		String repotingTo = request.getParameter("repotingTo");
		String gender = request.getParameter("gender");
		String martialStatus = request.getParameter("martialStatus");
		String religion = request.getParameter("religion");
		String dateOfBirth = request.getParameter("dateOfBirth");
		String designation = request.getParameter("designation");
		String isLead = request.getParameter("isLead");
		String reportingManager = request.getParameter("repotingManager");
		String panNumber = request.getParameter("panNumber");
		String passportNumber = request.getParameter("passportNumber");
		String motherName = request.getParameter("motherName");
		String bankAcno = request.getParameter("bankAcno");
		String bankBranch = request.getParameter("bankBranch");
		String netSalary = request.getParameter("netSalary");
		String project = request.getParameter("project");
		String department = request.getParameter("department");
		String workLocation = request.getParameter("workLocation");
		String adharNumber = request.getParameter("aadharNumber");
		String fatherName = request.getParameter("fatherName");
		String bankName = request.getParameter("bankName");
		String bankIfsc = request.getParameter("bankIfsc");
		String basicSalary = request.getParameter("basicSalary");
		String emergencyContactname = request.getParameter("emergencyContactname");
		String emergencyContactRelation = request.getParameter("emergencyContactRelation");
		String emergencyContactnumber = request.getParameter("emergencyContactnumber");

		try {

			String sql = "UPDATE employeeDetails set firstName=?,lastName=?,phoneNumber=?,joiningDate=?,employeeStatus=?,"
			+ "workEmail=?,personalEmail=?,reportingTo=?,gender=?,martialStatus=?,religion=?,dateOfBirth=?,designation=?,isLead=?,reportingManager=?,"
			+ "panNumber=?,passportNumber=?,motherName=?,bankAcno=?,bankBranch=?,netSalary=?,project=?,department=?,workLocation=?,adharNumber=?,"
			+ "fatherName=?,bankName=?,bankIfsc=?,basicSalary=?,emergencyContactname=?,emergencyContactRelation=?,emergencyContactnumber=? where employeeId = ?";
			Connection con = DbConn.getCon();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, firstName);
			st.setString(2, lastName);
			st.setString(3, phoneNumber);
			st.setString(4, joiningDate);
			st.setString(5, employeeStatus);
			st.setString(6, workEmail);
			st.setString(7, personalEmail);
			st.setString(8, repotingTo);
			st.setString(9, gender);
			st.setString(10, martialStatus);
			st.setString(11, religion);
			st.setString(12, dateOfBirth);
			st.setString(13, designation);
			st.setString(14, isLead);
			st.setString(15, reportingManager);
			st.setString(16, panNumber);
			st.setString(17, passportNumber);
			st.setString(18, motherName);
			st.setString(19, bankAcno);
			st.setString(20, bankBranch);
			st.setString(21, netSalary);
			st.setString(22, project);
			st.setString(23, department);
			st.setString(24, workLocation);
			st.setString(25, adharNumber);
			st.setString(26, fatherName);
			st.setString(27, bankName);
			st.setString(28, bankIfsc);
			st.setString(29, basicSalary);
			st.setString(30, emergencyContactname);
			st.setString(31, emergencyContactRelation);
			st.setString(32, emergencyContactnumber);
			st.setInt(33, employeeId);
			st.executeUpdate();
			response.sendRedirect(request.getContextPath() + "/employeeProfile?id=" + employeeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
