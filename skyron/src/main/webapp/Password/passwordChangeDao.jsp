<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
			    pageEncoding="ISO-8859-1"
			     import="java.sql.*"
			     import="java.io.*,com.JdbcConnection.DbConn"%>


			<%
			String oldPassword = request.getParameter("oldPassword");
			String employee_id = (String)session.getAttribute("employeeId");
			String password = request.getParameter("newPassword");
            if(oldPassword==null){
			String edit = "UPDATE employeeDetails set password = ? where employeeId=?";
			try {
			Connection con=DbConn.getCon();
			PreparedStatement st = con.prepareStatement(edit);
			int employeeId = Integer.parseInt(employee_id);
			 st.setString(1,password);
			 st.setInt(2, employeeId);
			int s = st.executeUpdate();
			 session.removeAttribute("otp");
			 session.removeAttribute("employee_id");
			 session.invalidate();
			 response.sendRedirect(request.getContextPath()+"/login?error=Sucessfully Changed  Password");
			} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/login?error=password not changed,try again later !");
			}
            }else{
            	
            	String edit = "UPDATE employeeDetails set password=? where employeeId=? and password=?";
    			try {
    			Connection con=DbConn.getCon();
    			PreparedStatement st = con.prepareStatement(edit);
    			 st.setString(2, employee_id);
    			 st.setString(1,password);
    			 st.setString(3, oldPassword);
    			 st.executeUpdate();
    			 response.sendRedirect(request.getContextPath()+"/changePassword?error=Sucessfully Changed your Password ");
    			} catch (Exception e) {
    			e.printStackTrace();
    			response.sendRedirect(request.getContextPath()+"/changePassword?error=Incorrect old password !");
    			}
            	
            }

%>
