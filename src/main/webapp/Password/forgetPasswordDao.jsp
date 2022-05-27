<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="java.io.*,com.JdbcConnection.DbConn"%>
<% 
    
    String work_mail;
    String date_of_birth ; 
    String employee_id ;
     employee_id = request.getParameter("employeeId");
     work_mail = request.getParameter("email");
     date_of_birth = request.getParameter("dob");
    
 		
    %>

<%
    	try {
    	    Connection con=DbConn.getCon();
    		String sql="select * from employeeDetails where employeeId=? and workEmail=? and dateofbirth=? ";
    		PreparedStatement st=con.prepareStatement(sql);
    		st.setString(1,employee_id);
    		st.setString(2,work_mail);
    		st.setString(3,date_of_birth);
    		ResultSet rs=st.executeQuery();
    		if(rs.next()) {
    			session.setAttribute("employeeId", employee_id);
    			session.setAttribute("e",work_mail);
    			 response.sendRedirect(request.getContextPath()+"/resetPassword?");   
    		}
    		else{
    			response.sendRedirect(request.getContextPath()+"/forgetPassword?message=Details are not matched");
    		}
    	} catch (Exception e) {
    		
    		e.printStackTrace();
    		response.sendRedirect(request.getContextPath()+"/forgetPassword?message=Details are not matched");
    		
    	}
    	
    	
    
    
    %>
