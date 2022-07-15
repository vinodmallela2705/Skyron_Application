<!-- --
This JSP is for Display All Employees in Grid View
 -->
<%@page import="com.Database.DataModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="java.io.*,com.JdbcConnection.DbConn,com.Database.DataModel"%>
<%
if (((String) session.getAttribute("employeeId")) == null || (String) session.getAttribute("workEmail") == null) {
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Session Time Out Please Login');");
	out.println("window.location.href = '" + request.getContextPath() + "/login';");
	out.println("</script>");
}
try {
	DataModel dmObj = new DataModel();	
	ResultSet rs = dmObj.getAllEmployees();
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
								data-target="#add_employee"><i class="fa fa-plus"></i> Add
								Employee</a>
							<div class="view-icons">
								<a href="<%=request.getContextPath()%>/allEmployees"
									class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
								<a href="<%=request.getContextPath()%>/allEmployeesList"
									class="list-view btn btn-link"><i class="fa fa-bars"></i></a>
							</div>
						</div>
					</div>
				</div>
				<!-- /Page Header -->

				<script type="text/javascript">
				var employeeIdList = [];
				var employeeEmailList = [];
									 
					function employeeIDValidate(){
						var employeeID = document.addEmployeeForm.employeeId.value;
						var employeeEmail = document.addEmployeeForm.workemail.value;
						var matchID = employeeIdList.includes(employeeID);
						var matchEmail = employeeEmailList.includes(employeeEmail);
						if(matchID){
							alert("EmployeeID  already in use Try with Other");
							document.addEmployeeForm.employeeId.value =""; 
						}
						if(matchEmail){
							alert("Email  already in use Try with Other");
							document.addEmployeeForm.workemail.value ="@skyronsoftware.com"; 
						}
						  $(document).ready(function() {
				                $("#tkey").on("keyup", function() {
				                    var value = $(this).val().toLowerCase();
				                    $("#search tr").filter(function() {
				                        $(this).toggle($(this).text()
				                        .toLowerCase().indexOf(value) > -1)
				                    });
				                });
				            });
					}
				</script>
				<div class="row staff-grid-row">
					<%
					while (rs.next()) {
					%>
					<script type="text/javascript">
					employeeIdList.push('<%=rs.getString("employeeId")%>');
					employeeEmailList.push('<%=rs.getString("workEmail")%>');
					</script>

					<div class="col-md-4 col-sm-6 col-12 col-lg-4 col-xl-3">
						<div class="profile-widget">
							<div class="profile-img">
								<a
									href="<%=request.getContextPath() + "/employeeProfile?id=" + rs.getString("employeeId")%>"
									class="avatar"> <img
									src="assets/skyronImages/employeeIcon.png" alt="image"></a>
							</div>
							<h4 class="user-name m-t-10 mb-0 text-ellipsis">
								<a href=""><%=rs.getString("firstName") + "   " + rs.getString("lastName")%></a>
							</h4>
							<div class="small text-muted"><%=rs.getString("designation")%></div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<%
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

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
								<form action="addEmployeeDao" method="post"
									name="addEmployeeForm">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">First Name <span
													class="text-danger">*</span></label> <input class="form-control"
													style="text-transform: capitalize;" type="text"
													name="firstName" required>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Last Name</label> <input
													class="form-control" type="text"
													style="text-transform: capitalize;" name="lastName"
													autocapitalize="words" autofocus required>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Work Email <span
													class="text-danger">*</span></label> <input class="form-control"
													type="email" name="workemail" value="@skyronsoftware.com"
													required oninput="employeeIDValidate()">
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
													class="form-control" type="number" min="10"
													name="mobileNumber" required>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Employee ID <span
													class="text-danger">*</label> <input class="form-control"
													type="text" name="employeeId" required
													oninput="employeeIDValidate()">
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
													<input class="form-control datetimepicker" type="text"
														name="joiningDate">
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
													class="form-control" type="text" name="project">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Date Of Birth <span class="text-danger">*</span></label>
												<div class="cal-icon">
													<input class="form-control datetimepicker" type="text"
														name="dob">
												</div>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Designation <span
													class="text-danger">*</span></label> <input class="form-control"
													type="text" name="designation" required>
											</div>
										</div>
									</div>
									<div class="table-responsive m-t-15"></div>

									<div class="table-responsive m-t-15">
										<table class="table table-striped custom-table">
											<thead>
												<tr>
													<th>Module Permission</th>
													<th class="text-center" name="PaySlipsAcess">PaySlips</th>
													<th class="text-center" name="LeavesAcess">Leaves</th>
													<th class="text-center" name="holidaysAcess">Holidays</th>
													<th class="text-center" name="TeamViewAcess">Team View</th>
													<th class="text-center" name="projectViewAcess">Project</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Access</td>
													<td class="text-center"><input checked=""
														type="checkbox"></td>
													<td class="text-center"><input type="checkbox">
													</td>
													<td class="text-center"><input type="checkbox">
													</td>
													<td class="text-center"><input type="checkbox">
													</td>
													<td class="text-center"><input type="checkbox">
													</td>

												</tr>
											</tbody>
										</table>
									</div>
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
		<script
			src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
</body>
</html>