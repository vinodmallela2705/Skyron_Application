/*
 * This Java Program is for validating login User credentials
 * Author: Vinod Kumar Mallela
 */

package com.validation;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.DataModel;

public class LoginDao extends HttpServlet {
	DataModel dmObj = new DataModel();
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{  
		String employeeEmail = request.getParameter("employeeEmail");
		String password = request.getParameter("password");
		PrintWriter out=response.getWriter(); 
		HttpSession session=request.getSession();  
		try {
			String employeeId = dmObj.checkLoginUser(employeeEmail,password);
			if(employeeId != null && employeeId != "")
			{	      
				session.setAttribute("workEmail",employeeEmail);
				session.setAttribute("employeeId",employeeId);
				response.sendRedirect(request.getContextPath()+"/employeeDashboard");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Incorrect Email or password');");
				out.println("window.location.href = '"+request.getContextPath()+"/login';");
				out.println("</script>");
			}
		} catch (Exception e) {
			//e.printStackTrace();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+e.toString()+"');");
			out.println("window.location.href = '"+request.getContextPath()+"/login';");
			out.println("</script>");
		} 
	}
}
