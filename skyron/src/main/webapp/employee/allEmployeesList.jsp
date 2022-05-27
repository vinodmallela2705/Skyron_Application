<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"
	import="java.io.*,com.JdbcConnection.DbConn"%><!DOCTYPE html>
<html lang="en">
<head>
<%!HashSet<String>designations = new HashSet<String>(); %>
<%	if(((String)session.getAttribute("employeeId"))==null){
	response.sendRedirect(request.getContextPath()+"/login?error=session Expired Please Re-Login");
}					try{
	Connection con=DbConn.getCon();
	Statement statement=con.createStatement();
	%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords"
	content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">

<meta name="robots" content="noindex, nofollow">
<title>Employees</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/skyronImages/favicon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- Lineawesome CSS -->
<link rel="stylesheet" href="assets/css/line-awesome.min.css">

<!-- Datatable CSS -->
<link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="assets/css/select2.min.css">

<!-- Datetimepicker CSS -->
<link rel="stylesheet"
	href="assets/css/bootstrap-datetimepicker.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="assets/css/style.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body><jsp:include page="/header"></jsp:include>
	<!-- Main Wrapper -->
	<div class="main-wrapper">


		<!-- /Page Header -->
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
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Employee</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a>
								<div class="view-icons">
									<a href="<%=request.getContextPath()%>/allEmployees" class="grid-view btn btn-link"><i class="fa fa-th"></i></a>
									<a href="<%=request.getContextPath()%>/allEmployeesList" class="list-view btn btn-link active"><i class="fa fa-bars"></i></a>
								</div>
							</div>
						</div>
					</div>
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
					<input type="text" class="form-control floating" id="tkey"> <label
						class="focus-label">Employee Name</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="form-group form-focus select-focus">
					
					<input type="text" class="form-control floating" id="tkey"> <label
						class="focus-label">Designation</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<a href="#" class="btn btn-success btn-block"> Search </a>
			</div>
		</div>
		<!-- /Search Filter -->

		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table id="search" class="table table-striped custom-table datatable">
						<thead>
							<tr>
								<th>Name</th>
								<th>Employee ID</th>
								<th>Email</th>
								<th>Mobile</th>
								<th class="text-nowrap">Join Date</th>
								<th>&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp Designation</th>
								<th class="text-right no-sort">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
						   	String sql="select * from employeeDetails";
						   	ResultSet rs= statement.executeQuery(sql);
						   	while(rs.next()){%>
							<tr>
								<td>
									<h2 class="table-avatar">
										<a href="" class="avatar"><img alt=""
											src="assets/skyronImages/employeeIcon.png"></a> <a
											href="<%=request.getContextPath()+"/employeeProfile?id="+rs.getString("employeeid") %>" target="_blank" ><%=rs.getString("firstname") +"  "+ rs.getString("lastname") %> <span>Web Designer</span></a>
									</h2>
								</td>
								<td><%=rs.getString("employeeid") %></td>
								<td><%=rs.getString("workemail") %></td>
								<td><%=rs.getString("phonenumber") %></td>
								<td><%=rs.getString("joiningdate")%></td>
								<td>
									
										<a class="btn btn-white btn-sm btn-rounded "	data-toggle="dropdown" aria-expanded="false"><%=rs.getString("designation") %>
 </a>
								</td>
								<td class="text-right">
									<div class="dropdown dropdown-action">
										<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_employee"><i
												class="fa fa-pencil m-r-5"></i> Edit</a>
										
									</div>
								</td><%} %>
							</tr>
						</tbody>
					</table>
					 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <script>
            $(document).ready(function() {
                $("#tkey").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#search tr").filter(function() {
                        $(this).toggle($(this).text()
                        .toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
				</div>
			</div>
		</div>
	</div><%}catch(Exception e){
		e.printStackTrace();
			}%>
	<!-- /Page Content -->

	<!-- Add Employee Modal -->
	<div id="add_employee" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Employee</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">First Name <span
										class="text-danger">*</span></label> <input class="form-control"
										type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Last Name</label> <input
										class="form-control" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Username <span
										class="text-danger">*</span></label> <input class="form-control"
										type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Email <span
										class="text-danger">*</span></label> <input class="form-control"
										type="email">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Password</label> <input
										class="form-control" type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Confirm Password</label> <input
										class="form-control" type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Employee ID <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Joining Date <span
										class="text-danger">*</span></label>
									<div class="cal-icon">
										<input class="form-control datetimepicker" type="text">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Phone </label> <input
										class="form-control" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Company</label> <select
										class="select">
										<option value="">Global Technologies</option>
										<option value="1">Delta Infotech</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Department <span class="text-danger">*</span></label> <select
										class="select">
										<option>Select Department</option>
										<option>Web Development</option>
										<option>IT Management</option>
										<option>Marketing</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Designation <span class="text-danger">*</span></label> <select
										class="select">
										<option>Select Designation</option>
										<option>Web Designer</option>
										<option>Web Developer</option>
										<option>Android Developer</option>
									</select>
								</div>
							</div>
						</div>
						<div class="table-responsive m-t-15">
							<table class="table table-striped custom-table">
								<thead>
									<tr>
										<th>Module Permission</th>
										<th class="text-center">Read</th>
										<th class="text-center">Write</th>
										<th class="text-center">Create</th>
										<th class="text-center">Delete</th>
										<th class="text-center">Import</th>
										<th class="text-center">Export</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Holidays</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Leaves</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Clients</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Projects</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Tasks</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Chats</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Assets</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Timing Sheets</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="submit-section">
							<button class="btn btn-primary submit-btn">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Add Employee Modal -->

	<!-- Edit Employee Modal -->
	<div id="edit_employee" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Edit Employee</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">First Name <span
										class="text-danger">*</span></label> <input class="form-control"
										value="John" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Last Name</label> <input
										class="form-control" value="Doe" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Username <span
										class="text-danger">*</span></label> <input class="form-control"
										value="johndoe" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Email <span
										class="text-danger">*</span></label> <input class="form-control"
										value="johndoe@example.com" type="email">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Password</label> <input
										class="form-control" value="johndoe" type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Confirm Password</label> <input
										class="form-control" value="johndoe" type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Employee ID <span
										class="text-danger">*</span></label> <input type="text"
										value="FT-0001" readonly class="form-control floating">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Joining Date <span
										class="text-danger">*</span></label>
									<div class="cal-icon">
										<input class="form-control datetimepicker" type="text">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Phone </label> <input
										class="form-control" value="9876543210" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-form-label">Company</label> <select
										class="select">
										<option>Global Technologies</option>
										<option>Delta Infotech</option>
										<option selected>International Software Inc</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Department <span class="text-danger">*</span></label> <select
										class="select">
										<option>Select Department</option>
										<option>Web Development</option>
										<option>IT Management</option>
										<option>Marketing</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Designation <span class="text-danger">*</span></label> <select
										class="select">
										<option>Select Designation</option>
										<option>Web Designer</option>
										<option>Web Developer</option>
										<option>Android Developer</option>
									</select>
								</div>
							</div>
						</div>
						<div class="table-responsive m-t-15">
							<table class="table table-striped custom-table">
								<thead>
									<tr>
										<th>Module Permission</th>
										<th class="text-center">Read</th>
										<th class="text-center">Write</th>
										<th class="text-center">Create</th>
										<th class="text-center">Delete</th>
										<th class="text-center">Import</th>
										<th class="text-center">Export</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Holidays</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Leaves</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Clients</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Projects</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Tasks</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Chats</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Assets</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
									</tr>
									<tr>
										<td>Timing Sheets</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input checked="" type="checkbox">
										</td>
										<td class="text-center"><input type="checkbox"></td>
										<td class="text-center"><input type="checkbox"></td>
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
	<!-- /Edit Employee Modal -->


	<!-- /Delete Employee Modal -->

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

	<!-- Datatable JS -->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap4.min.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/app.js"></script>

</body>
</html>