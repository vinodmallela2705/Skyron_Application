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
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="robots" content="noindex, nofollow">
        <title>Salary Slip</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.png">
		
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
		<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
		
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
								<h3 class="page-title">Employee Salary</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Salary</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_salary"><i class="fa fa-plus"></i> Add Salary</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Search Filter -->
					<div class="row filter-row">
					   <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating">
								<label class="focus-label">Employee Name</label>
							</div>
					   </div>
					   <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option value=""> -- Select -- </option>
									<option value="">Employee</option>
									<option value="1">Manager</option>
								</select>
								<label class="focus-label">Role</label>
							</div>
					   </div>
					   <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12"> 
							<div class="form-group form-focus select-focus">
								<select class="select floating"> 
									<option> -- Select -- </option>
									<option> Pending </option>
									<option> Approved </option>
									<option> Rejected </option>
								</select>
								<label class="focus-label">Leave Status</label>
							</div>
					   </div>
					   <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<input class="form-control floating datetimepicker" type="text">
								</div>
								<label class="focus-label">From</label>
							</div>
						</div>
					   <div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<input class="form-control floating datetimepicker" type="text">
								</div>
								<label class="focus-label">To</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">  
							<a href="#" class="btn btn-success btn-block"> Search </a>  
						</div>     
                    </div>
					<!-- /Search Filter -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table datatable">
									<thead>
										<tr>
											<th>Employee</th>
											<th>Employee ID</th>
											<th>Email</th>
											<th>Role</th>
											<th>Salary</th>
											<th>Payslip</th>
										</tr>
									</thead>
									<tbody><%
						   	String sql="select * from employeeDetails where employeeStatus = 'Active'";
						   	ResultSet rs= statement.executeQuery(sql);
						   	while(rs.next()){%>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="" class="avatar"><img alt="" src="assets/skyronImages/employeeIcon.png"></a>
													<a href="<%=request.getContextPath()%>/SalarySlips?id=<%=rs.getString("employeeId")%>"><%=rs.getString("firstName")+" "+rs.getString("lastName") %> <span><%=rs.getString("designation") %></span></a>
												</h2>
											</td>
											<td><%=rs.getString("employeeId") %></td>
											<td><%=rs.getString("workEmail") %></td>
											<td>
												<div class="dropdown">
													<a href="" class="btn btn-white btn-sm btn-rounded " data-toggle="dropdown" aria-expanded="false"><%=rs.getString("designation") %> </a>
													
												</div>
											</td>
											<td> <i  class="fa">&#xf156;</i>&nbsp<%=rs.getString("basicSalary") %></td>
											<td><a class="btn btn-sm btn-primary" href="<%=request.getContextPath()%>/generateSalarySlips?id=<%=rs.getString("employeeId")%>">Generate Slip</a></td>
											
										</tr>
										<%} %>
															</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Add Salary Modal -->
				<div id="add_salary" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Staff Salary</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="row"> 
										<div class="col-sm-6"> 
											<div class="form-group">
												<label>Select Staff</label>
												<select class="select"> 
													<option>John Doe</option>
													<option>Richard Miles</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6"> 
											<label>Net Salary</label>
											<input class="form-control" type="text">
										</div>
									</div>
									<div class="row"> 
										<div class="col-sm-6"> 
											<h4 class="text-primary">Earnings</h4>
											<div class="form-group">
												<label>Basic</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>DA(40%)</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>HRA(15%)</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Conveyance</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Allowance</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Medical  Allowance</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Others</label>
												<input class="form-control" type="text">
											</div>
											<div class="add-more">
												<a href="#"><i class="fa fa-plus-circle"></i> Add More</a>
											</div>
										</div>
										<div class="col-sm-6">  
											<h4 class="text-primary">Deductions</h4>
											<div class="form-group">
												<label>TDS</label>
												<input class="form-control" type="text">
											</div> 
											<div class="form-group">
												<label>ESI</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>PF</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Leave</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Prof. Tax</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Labour Welfare</label>
												<input class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Others</label>
												<input class="form-control" type="text">
											</div>
											<div class="add-more">
												<a href="#"><i class="fa fa-plus-circle"></i> Add More</a>
											</div>
										</div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Add Salary Modal -->
				
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
</html><%}catch(Exception e){
	e.printStackTrace();
			}%>