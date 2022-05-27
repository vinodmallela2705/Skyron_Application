<%
String url = request.getParameter("search");
response.sendRedirect(request.getContextPath()+"/"+url);
%>