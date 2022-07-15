<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn,java.text.SimpleDateFormat,java.util.Date"%>
<%@page import="com.Database.DataModel"%>
<%! String days;
 int day;
 DataModel dmObj = new DataModel();	
 %>
<%

String id = (String)session.getAttribute("employeeId");
if(id==null){
	response.sendRedirect(request.getContextPath()+"/login?error=please login");
}
String employeeName = (String)session.getAttribute("employeeName");
int employee_id = Integer.parseInt(id);
String reporting_to = "789";
String leave_name = request.getParameter("leaveType");
String from_date  = request.getParameter("fromDate");
String to_date    = request.getParameter("toDate");
String leave_reason = request.getParameter("leaveReason");
String status = "New";
String work_mail = (String)session.getAttribute("workEmail");
String reporting_manager_name;
String reporting_manager_email;
%><%
SimpleDateFormat myFormat = new SimpleDateFormat("dd/MM/yyyy");
String dateBeforeString = from_date;
String dateAfterString = to_date;

try {
      Date dateBefore = myFormat.parse(dateBeforeString);
      Date dateAfter = myFormat.parse(dateAfterString);
      long difference = dateAfter.getTime() - dateBefore.getTime();
      float daysBetween = (difference / (1000*60*60*24));
       day = (int)daysBetween+1;
       days = String.valueOf(day);
} catch (Exception e) {
      e.printStackTrace();
}
%>
<%



String edit = "insert into employeeLeaves " + "(employeeId,leaveType,fromDate,toDate,leaveReason,employeeName,status,days,approvedBy,workMail) VALUES "+ "(?,?,?,?,?,?,?,?,?,?)";
try {


Connection con=DbConn.getCon();
PreparedStatement st = con.prepareStatement(edit);
 st.setInt(1, employee_id);
 st.setString(2,leave_name);
 st.setString(3,from_date);
 st.setString(4, to_date);
 st.setString(5, leave_reason);
 st.setString(6,employeeName);
 st.setString(7,status);
 st.setInt(8,day);
 st.setString(9, reporting_to);
 st.setString(10, work_mail);
 
 st.executeUpdate();

  ResultSet rs = dmObj.getEmployeeDetailsWithId(employee_id);
  while(rs.next()){  
  reporting_manager_email = rs.getString("workEmail");
  reporting_manager_name = rs.getString("firstName")+" "+rs.getString("lastName");
 //sending mail to reporting manager
 session.setAttribute("employee_id", id);
 session.setAttribute("employee_name", employeeName);
 session.setAttribute("from_date", from_date);
 session.setAttribute("to_date",to_date);
 session.setAttribute("days",days);
 session.setAttribute("reason",leave_reason);
 session.setAttribute("reporting_manager_name",reporting_manager_name);
 session.setAttribute("reporting_manager_mail", reporting_manager_email);
 session.setAttribute("work_mail",work_mail);
 response.sendRedirect(request.getContextPath()+"/leaveRequestMail");  
  }
} catch (Exception e) {
e.printStackTrace();
response.sendRedirect(request.getContextPath()+"/employeeLeaves");
}

%>