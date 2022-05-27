
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="java.io.*,com.JdbcConnection.DbConn"%>
	<%
	if(((String)session.getAttribute("employeeId"))==null){
		response.sendRedirect(request.getContextPath()+"/login?error=session Expired Please Re-Login");
    	}
	try{
		Connection con=DbConn.getCon();
		Statement statement=con.createStatement();

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
<link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.png">

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
							<h3 class="page-title">Employee</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="">Dashboard</a></li>
								<li class="breadcrumb-item active">Employee</li>
							</ul>
						</div>
						<div class="col-auto float-right ml-auto">
							<a href="#" class="btn add-btn" data-toggle="modal"
								data-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a>
							<div class="view-icons">
								<a href="<%=request.getContextPath()%>/allEmployees" class="grid-view btn btn-link active"><i
									class="fa fa-th"></i></a> <a href="<%=request.getContextPath()%>/allEmployeesList" class="list-view btn btn-link"><i
									class="fa fa-bars"></i></a>
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<!-- Search Filter -->
				<div class="row filter-row">
					<div class="col-sm-6 col-md-3">
						<div class="form-group form-focus">
							<input type="text" class="form-control floating" id="tkey"> <label
								class="focus-label">Employee ID</label>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="form-group form-focus">
							<input type="text" class="form-control floating"> <label
								class="focus-label">Employee Name</label>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="form-group form-focus select-focus">
							<select class="select floating">
								<option>Select Designation</option>
								
								<option>Software Developer</option>
								
							</select> <label class="focus-label">Designation</label>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<a href="#" class="btn btn-success btn-block"> Search </a>
					</div>
				</div>
				<!-- Search Filter -->
					<div class="row staff-grid-row"><%
						   	String sql="select * from employeeDetails";
						   	ResultSet rs= statement.executeQuery(sql);
						   	while(rs.next()){%>
			
					<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3" >
						<div class="profile-widget"><div class="profile-img">
								<a href="<%=request.getContextPath()+"/employeeProfile?id="+rs.getString("employeeId") %>"  class="avatar">
								<img src="assets/skyronImages/employeeIcon.png" alt="image"></a>
							</div>
							<h4 class="user-name m-t-10 mb-0 text-ellipsis">
								<a href=""><%=rs.getString("firstName")+"   "+rs.getString("lastName") %></a>
							</h4>
							<div class="small text-muted"><%=rs.getString("designation") %></div>
						</div></a>
					</div><%} %>
				</div>
				<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script> <script>
            $(document).ready(function() {
                $("#tkey").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#search").filter(function() {
                        $(this).toggle($(this).text()
                        .toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
				
			<%}catch(Exception e){
				e.printStackTrace();
			}%>
	
		<!-- /Page Content -->

		<!-- Add Employee Modal -->
		<div id="add_employee" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add Employee</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="addEmployeeDao" method="post">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">First Name <span
											class="text-danger">*</span></label> 
											<input class="form-control" style="text-transform: capitalize;" type="text" name="firstName" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Last Name</label> <input
											class="form-control" type="text"style="text-transform: capitalize;"	 name="lastName" autocapitalize="words" autofocus required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Work Email <span
											class="text-danger">*</span></label> <input class="form-control"
											type="email" name="workemail" value="@skyronsoftware.com"required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">personal Email<span
											class="text-danger">*</span></label> <input class="form-control"
											type="email" name="personalEmail" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Mobile Number</label> <input
											class="form-control" type="number"min="10" name="mobileNumber" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Employee ID <span
											class="text-danger">*</label> <input
											class="form-control" type="text" name="employeeId" required>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Gender</label> <select
											class="select" name="gender">
											<option value="Male">Male</option>
											<option value="Female">Female</option>
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Joining Date <span
											class="text-danger">*</span></label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text" name="joiningDate">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Employee Type</label> <select
											class="select" name="employeeType">
											<option value="Employee">Employee</option>
											<option value="Admin">Admin</option>
										</select>
									</div>
								</div>
							<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Project</label> <input
											class="form-control" type="text" name="project" >
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Date Of Birth <span class="text-danger">*</span></label> 
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text" name="dob">
										</div>
									</div>
								</div>
									
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Designation <span
											class="text-danger">*</span></label> 
											<input class="form-control" type="text" name="designation" required>
									</div>
								</div>
								</div>
							<div class="table-responsive m-t-15"></div>
							<div class="submit-section">
								<button class="btn btn-primary submit-btn">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /Add Employee Modal -->
			
	</div>
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