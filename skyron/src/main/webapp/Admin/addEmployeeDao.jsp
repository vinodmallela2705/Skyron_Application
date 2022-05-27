<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.*,com.JdbcConnection.*"%>
<%
     String employeeId    = request.getParameter("employeeId");
	 String firstName     = request.getParameter("firstName");
	 String lastName      = request.getParameter("lastName");
	 String workMail      = request.getParameter("workEmail");
	 String personalEmail = request.getParameter("personalEmail");
	 String mobileNumber  = request.getParameter("mobileNumber");
	 String joiningDate   = request.getParameter("joiningDate");
	 String gender        = request.getParameter("gender");
	 String employeeType  = request.getParameter("employeeType");
	 String project       = request.getParameter("project");
	 String department    = request.getParameter("department");
	 String designation   = request.getParameter("designation");
	 String Password      =  "Skyron@"+employeeId;
     try{
    	 Connection con=DbConn.getCon();
    		String sql="insert into ";
    		PreparedStatement st=con.prepareStatement(sql);
    		st.setString(1,employeeId);
    		st.executeQuery();
     }catch(Exception e){
    	 e.printStackTrace();
     }
%>

















