<%
request.getSession().invalidate();
response.sendRedirect(request.getContextPath()+"/login?error=Sucessfully Logout");
%>