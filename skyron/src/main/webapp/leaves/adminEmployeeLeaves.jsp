<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date"
	import="java.io.*,com.JdbcConnection.DbConn,java.time.LocalDateTime,java.time.format.DateTimeFormatter"%>
<%@page import="com.Database.DataModel" %>
	<%
	if (((String) session.getAttribute("employeeId")) == null || (String) session.getAttribute("workEmail") == null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Session Time Out Please Login');");
		out.println("window.location.href = '" + request.getContextPath() + "/login';");
		out.println("</script>");
	}
	String employeeId   = (String)session.getAttribute("employeeId");
		DataModel dmObj = new DataModel();	
		ResultSet rs    = dmObj.getemployeeLeaves(employeeId);
		%><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
 
        <meta name="robots" content="noindex, nofollow">
        <title>Leaves Reports</title>
		
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
    <body>  <jsp:include page="/header"></jsp:include>
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
								<h3 class="page-title">Employee Leave Status</h3>
							</div>
							
						</div>
					</div>
					<!-- /Page Header -->
					<!-- /Search Filter -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table">
									<thead>
										<tr>
											<th>Employee</th>
											<th>Leave Type</th>
											<th>From</th>
											<th>To</th>
											<th>No of Days</th>
											<th>Reason</th>
											<th class="text-center">Status</th>
										</tr>
									</thead>
									<tbody><%while (rs.next()){ %>
										<tr>
											<td>
												<h2 class="table-avatar">
													<a href="" class="avatar"><img alt="" src="assets/skyronImages/employeeIcon.png"></a>
													<a href="#"><%=rs.getString("employeeName") %> </a>
												</h2>
												<%String url = request.getContextPath()+"/leaveStatusDao?id="+rs.getString("employeeId")+"&f="
										      +rs.getString("fromDate")+"&d="+rs.getString("days")+"&work_mail="+rs.getString("workmail")+"&en="+rs.getString("employeeName")
										      +"&to="+rs.getString("toDate"); %>
											</td>
											<td><%=rs.getString("leaveType") %></td>
											<td><%=rs.getString("fromDate") %></td>
											<td><%=rs.getString("toDate") %></td>
											<td><%=rs.getString("days") %> days</td>
											<td><%=rs.getString("leaveReason") %></td>
											<td class="text-center">
												<div class="dropdown action-label">
													<a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
														<%if((rs.getString("status")).equalsIgnoreCase("Pending")) {%>
														<i class="fa fa-dot-circle-o text-info"></i><%=rs.getString("status") %>
														<%}else {%>
														<i class="fa fa-dot-circle-o text-purple"></i> <%=rs.getString("status") %><%} %>													</a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" ><i class="fa fa-dot-circle-o text-purple"></i>New </a>
														<a class="dropdown-item" href="<%=url%>&s=pending"><i class="fa fa-dot-circle-o text-info"></i> Pending</a>
														<a class="dropdown-item" href="<%=url%>&s=Approved" ><i class="fa fa-dot-circle-o text-success"></i> Approved</a>
														<a class="dropdown-item" href="<%=url%>&s=Declined" ><i class="fa fa-dot-circle-o text-danger"></i> Declined</a>
													</div>
												</div>
											</td>
										</tr><%} %>
											
									
											
															</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				
				
				<!-- Approve Leave Modal -->
				<div class="modal custom-modal fade" id="approve_leave" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Leave Approve</h3>
									<p>Are you sure want to approve for this leave?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="javascript:void(0);" class="btn btn-primary continue-btn">Approve</a>
										</div>
										<div class="col-6">
											<a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Reject Leave Modal -->
					<!-- Approve Leave Modal -->
				<div class="modal custom-modal fade" id="reject_leave" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Leave Reject</h3>
									<p>Are you sure want to reject  this leave?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="javascript:void(0);" class="btn btn-primary continue-btn">Reject</a>
										</div>
										<div class="col-6">
											<a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
								
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
		
		<!-- Datatable JS -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/dataTables.bootstrap4.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
    </body>
</html>