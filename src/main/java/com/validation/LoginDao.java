package com.validation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JdbcConnection.DbConn;

public class LoginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public boolean check(String employeeId,String password) throws SQLException {
		try {
			Connection con=DbConn.getCon();
			String sql="select * from employeeDetails where employeeId=? and password=? and employeeStatus = 'Active'";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeId);
			st.setString(2,password);

			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {

			System.out.println(e.getMessage());
		}
		return false;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response){  
	String employeeId = request.getParameter("employeeId");
		String password = request.getParameter("password");
		  HttpSession session=request.getSession();  
		try {
			if(check(employeeId, password))

			{	      
				session.setAttribute("employeeId",employeeId);
				response.sendRedirect(request.getContextPath()+"/employeeDashboard");
			}else{
				response.sendRedirect(request.getContextPath()+"/login?error=Incorrect username and password");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	}

}
