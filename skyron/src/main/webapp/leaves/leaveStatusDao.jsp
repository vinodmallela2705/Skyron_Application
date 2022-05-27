<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*" import="java.io.*"
	import="java.util.*,com.JdbcConnection.DbConn"%>

<%!int employee_id;
	String status;
	String id;
	String days;
	String from_date;
	String employee_name;
	String work_mail;
	String reporting_manager;
	%>

<%
reporting_manager = (String)session.getAttribute("employeeName");
from_date = request.getParameter("f");
days = request.getParameter("d");
int used_leaves = Integer.parseInt(days);
id = request.getParameter("id");
status = request.getParameter("s");
employee_name = request.getParameter("en");
work_mail = request.getParameter("work_mail");
String to_date = request.getParameter("to");
employee_id = Integer.parseInt(id);
Connection con = DbConn.getCon();
String update_status = "update employeeleaves set status = ? where employeeId=? and  days=? and fromDate=?";
String update ="update employeeDetails set usedLeaves = usedLeaves +? where employeeId = ?";
PreparedStatement st = con.prepareStatement(update_status);
PreparedStatement st1 = con.prepareStatement(update);
st.setString(1, status);
st.setInt(2, employee_id);
st.setString(3, days);
st.setString(4, from_date);



st.executeUpdate();

st1.setInt(1, used_leaves);
st1.setInt(2, employee_id);
if(status.equalsIgnoreCase("Approved")){
st1.executeUpdate();
}
//response.sendRedirect(request.getContextPath() + "/adminEmployeeLeaves");
response.sendRedirect(request.getContextPath() + "/leaveMailStatus?id="+id+"&s="+status+"&work_mail="+work_mail+"&from_date="+from_date+"&rpm="+reporting_manager+"&to_date="+to_date+"&d="+days+"&employee_name="+employee_name);
%>
