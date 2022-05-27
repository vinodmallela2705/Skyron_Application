
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="java.io.*,com.JdbcConnection.DbConn"%>
	<%!String employeeName ; %>
	<%
	if(((String)session.getAttribute("employeeId"))==null){
		response.sendRedirect(request.getContextPath()+"/login?error=session Expired Please Re-Login");
    	}
	try{
		int employee_id;
		Connection con=DbConn.getCon();
		Statement statement=con.createStatement();
		String employeeId = request.getParameter("id");
		if(employeeId==null){
		employee_id = Integer.parseInt((String)session.getAttribute("employeeId"));
		}else{
			employee_id = Integer.parseInt(employeeId);
		}

	   	String sql="select * from salarySlips where employeeId=? ";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, employee_id);
	   	ResultSet rs= st.executeQuery();

	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords"
	content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">

<meta name="robots" content="noindex, nofollow">
<title>Employees</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"href="assets/skyronImages/favicon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- Lineawesome CSS -->
<link rel="stylesheet" href="assets/css/line-awesome.min.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="assets/css/select2.min.css">

<!-- Datetimepicker CSS -->
<link rel="stylesheet"
	href="assets/css/bootstrap-datetimepicker.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="assets/css/style.css">


</head>
<body>
<jsp:include page="/header"></jsp:include>
	<!-- Main Wrapper -->
	<div class="main-wrapper">


		<!-- Page Wrapper -->
		<div class="page-wrapper">

			<!-- Page Content -->
			<div class="content container-fluid">

				<!-- Page Header -->
				<div class="page-header">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="page-title">Pay Slips</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="">Dashboard</a></li>
								<li class="breadcrumb-item active">Pay Slips</li>
							</ul>
						</div>
					
					</div>
				</div>
				<!-- /Page Header -->

				<!-- Search Filter -->
			
				<!-- Search Filter -->
					<div class="row staff-grid-row"><%						   
					         while(rs.next()){
						   	%>
			
					<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
						<div class="profile-widget"><div class="">
						     <a
						     href="<%=request.getContextPath()%>/paySlip?m=<%=rs.getString("salaryMonth")%>&y=<%=rs.getString("salaryYear") %>" target="popup" 
  onclick="window.open('<%=request.getContextPath()%>/paySlip?m=<%=rs.getString("salaryMonth")%>&y=<%=rs.getString("salaryYear") %>&id=<%=employee_id %>','popup','width=1000,height=700'); return false;">

								<img src="assets/skyronImages/files.png" height="90" width="80" style="border-radius: 0"></a>	
							</div>
							<div class="user-name m-t-10 mb-0 text-ellipsis"><%=rs.getString("salaryMonth")+" "+rs.getString("salaryYear") %></div>
						</div></a>
					</div><%} %>
				</div>
				
				
			<%}catch(Exception e){
			}%>
	
		<!-- /Page Content -->

				

	</div>
	<!-- /Page Wrapper -->

	</div>
	<!-- /Main Wrapper -->

		<!-- jQuery -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="assets/js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Tagsinput JS -->
		<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>

</body>
</html>