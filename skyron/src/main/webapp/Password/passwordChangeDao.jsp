<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
			    pageEncoding="ISO-8859-1"
			     import="java.sql.*"
			     import="java.io.*,com.JdbcConnection.DbConn"%>
<%@page import ="com.Database.DataModel" %>

			<%
			DataModel dmObj = new DataModel();
			String oldPassword = request.getParameter("oldPassword");
			String employee_id = (String)session.getAttribute("employeeId");
			String newPassword = request.getParameter("newPassword");
            if(oldPassword==null){
			try {
				session.removeAttribute("otp");
				session.removeAttribute("employee_id");
				session.invalidate();
				if(dmObj.changePassword(employee_id, newPassword)){
				 	out.println("<script type=\"text/javascript\">");
					out.println("alert('Sucessfully Changed your Password');");
					out.println("window.location.href = '" + request.getContextPath() + "/login';");
					out.println("</script>");
			 	} else {
				 	out.println("<script type=\"text/javascript\">");
					out.println("alert('password not changed,try again later !');");
					out.println("window.location.href = '" + request.getContextPath() + "/login';");
					out.println("</script>");
			 	}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/login?error=password not changed,try again later !");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('"+e.getMessage()+"');");
				out.println("window.location.href = '" + request.getContextPath() + "/login';");
				out.println("</script>");
			}
            }else{
    			try {
	    			 if(dmObj.changePassword(employee_id, newPassword, oldPassword)){
	    				 	out.println("<script type=\"text/javascript\">");
	    					out.println("alert('Sucessfully Changed your Password');");
	    					out.println("window.location.href = '" + request.getContextPath() + "/changePassword';");
	    					out.println("</script>");
	    			 } else {
	    				 	out.println("<script type=\"text/javascript\">");
	    					out.println("alert('Incorrect old password');");
	    					out.println("window.location.href = '" + request.getContextPath() + "/changePassword';");
	    					out.println("</script>");
	    			 }
	    				 
    			} catch (Exception e) {
	    			e.printStackTrace();
	    			out.println("<script type=\"text/javascript\">");
					out.println("alert('"+e.toString()+"');");
					out.println("window.location.href = '" + request.getContextPath() + "/changePassword';");
					out.println("</script>");
    			}
            	
            }

%>
