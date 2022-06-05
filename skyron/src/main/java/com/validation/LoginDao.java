/*
 * This Java Program is for validating login User credentials
 * Author: Vinod Kumar Mallela
 */

package com.validation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JdbcConnection.DbConn;

public class LoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public boolean check(String employeeEmail,String password) throws SQLException {
		try {
			Connection con=DbConn.getCon();
			String sql="select * from employeeDetails where workEmail=? and password=? and employeeStatus = 'Active'";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeEmail);
			st.setString(2,password);

			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{  
		String employeeEmail = request.getParameter("employeeEmail");
		String password = request.getParameter("password");
		PrintWriter out=response.getWriter(); 
		HttpSession session=request.getSession();  
		try {
			if(check(employeeEmail, password))
			{	      
				session.setAttribute("employeeEmail",employeeEmail);
				session.setAttribute("employeeId","20199");
				response.sendRedirect(request.getContextPath()+"/employeeDashboard");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Incorrect Email or password');");
				out.println("window.location.href = '"+request.getContextPath()+"/login';");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
