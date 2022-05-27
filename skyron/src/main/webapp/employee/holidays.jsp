
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn"%>
     <%
      try{
    	if(((String)session.getAttribute("employeeId"))==null){
		response.sendRedirect(request.getContextPath()+"/login?error=Session TimeOut Please Re-Login");
    	}
    Connection con=DbConn.getCon();
	String sql="select * from holidays";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);%>
<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <title>Holidays - Skyron</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
	
    </head>
    <body>
    <jsp:include page="/header"></jsp:include>
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
          		<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Holidays 2022</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="">Dashboard</a></li>
									<li class="breadcrumb-item active">Holidays</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_holiday"><i class="fa fa-plus"></i> Add Holiday</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<style>
					table {
counter-reset: Serial; 
}

table tr {
  counter-increment: rowNumber;
}

table tr td:first-child::before {
  content: counter(rowNumber);
  min-width: 1em;
  margin-right: 0.5em;
}</style>
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-striped custom-table mb-0">
									<thead>
										<tr>
											<th>#</th>
											<th>Title </th>
											<th>Holiday Date</th>
											<th>Day</th>
											<th class="text-right">Action</th>
										</tr>
									</thead>
									<tbody>
										<%while(rs.next()){ %>
										<tr class="holiday-upcoming">
											<td></td>
											<td><%=rs.getString("event") %></td>
											<td><%=rs.getString("eventDate") %></td>
											<td><%=rs.getString("eventDay") %></td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="<%=request.getContextPath() %>/holidayDao?eventDate=<%=rs.getString("eventDate") %>" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<% }}catch(Exception e){
											}%>
										
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Add Holiday Modal -->
				<div class="modal custom-modal fade" id="add_holiday" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Holiday</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="<%=request.getContextPath() %>/holidayDao">
									<div class="form-group">
										<label>Holiday Name <span class="text-danger">*</span></label>
										<input class="form-control" type="text" name="eventName" required>
									</div>
									<div class="form-group">
										<label>Holiday Date <span class="text-danger">*</span></label>
										<div class="cal-icon"><input class="form-control datetimepicker" required name="eventDate"id="datepicker" type="text"></div>
									</div>
									<div class="form-group">
										<label>Holiday Day <span class="text-danger">*</span></label>
										<select class="form-control" name="eventDay">
								       <option value="Monday">Monday</option>
								       <option value="Tuesday">Tuesday</option>
								       <option value="Wednesday">Wednesday</option>
								       <option value="Thursday">Thursday</option>
								       <option value="Friday">Friday</option>
								       <option value="Saturday">Saturday</option>
								       <option value="Sunday">Sunday</option>
							</select></div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Add Holiday Modal -->
				
				<!-- Edit Holiday Modal -->
				<div class="modal custom-modal fade" id="edit_holiday" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Holiday</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="form-group">
										<label>Holiday Name <span class="text-danger">*</span></label>
										<input class="form-control" value="New Year" type="text">
									</div>
									<div class="form-group">
										<label>Holiday Date <span class="text-danger">*</span></label>
										<div class="cal-icon"><input class="form-control datetimepicker" value="01-01-2019" type="text"></div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /Edit Holiday Modal -->

				<!-- Delete Holiday Modal -->
				<div class="modal custom-modal fade" id="delete_holiday" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Holiday</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="javascript:void(0);" class="btn btn-primary continue-btn">Delete</a>
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
				<!-- /Delete Holiday Modal -->
				
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
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		

    </body>
</html>
