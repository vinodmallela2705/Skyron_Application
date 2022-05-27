<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn"%>
	<%
	
	try{
		String event = request.getParameter("eventName");
		String eventDate = request.getParameter("eventDate");
		String eventDay =request.getParameter("eventDay");
		Connection con=DbConn.getCon();
		Statement statement=con.createStatement();
		if(eventDay==null){
            String sql1="delete from holidays where eventDate=?";
			PreparedStatement st = con.prepareStatement(sql1);
			 st.setString(1,eventDate);
			 st.executeUpdate();
	    }else{
		String sql="insert into holidays(event,eventDate,eventDay)"+"values(?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		 st.setString(1, event);
		 st.setString(2,eventDate);
		 st.setString(3, eventDay); 
		 st.executeUpdate();
		
	}
	}
	
	catch(Exception e){
		
	}
	response.sendRedirect(request.getContextPath()+"/holidays");%>