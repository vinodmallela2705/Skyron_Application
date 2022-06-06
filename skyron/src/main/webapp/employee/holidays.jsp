	 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*,java.io.*,com.JdbcConnection.DbConn,java.time.*"%>
    <%!   int employee_id_h  ;
    String employeeName ;
    String employeeImage  = "assets/skyronImages/employeeIcon.png" ;
    String team = "Skyron";
	StringBuilder experience = new StringBuilder() ;
    %>
    <% 
    try{
            while(((String)session.getAttribute("employeeId"))==null){
            	out.println("<script type=\"text/javascript\">");
    			out.println("alert('Session Time Out Please Login');");
    			out.println("window.location.href = '"+request.getContextPath()+"/login';");
    			out.println("</script>");
            }
    	if(request.getParameter("id")==null)
    		employee_id_h =Integer.parseInt((String)session.getAttribute("employeeId"));
    	else
    employee_id_h  = Integer.parseInt(request.getParameter("id"))  ;
    Connection con=DbConn.getCon();
	String sql_header="select * from employeeDetails where employeeId=?";
	PreparedStatement st=con.prepareStatement(sql_header);
	st.setInt(1,employee_id_h);
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		employeeName = rs.getString("firstName")+" "+rs.getString("lastName");
		//employeeImage = rs.getString("photo");
		String joiningDate = rs.getString("joiningdate");
		String[] joiningDateS = joiningDate.split("-");
		int year  = Integer.parseInt(joiningDateS[2]);
		int month = Integer.parseInt(joiningDateS[1]);
		int date  = Integer.parseInt(joiningDateS[0]);
		LocalDate dob = LocalDate.of(year, month, date);
		LocalDate curDate = LocalDate.now();    
		Period period = Period.between(dob, curDate); 
		if(period.getYears()>0)
			experience.append(period.getYears()+" years ");
		if(period.getMonths()>0)
			experience.append(period.getMonths()+" months  ");
		if(period.getDays()>0)
			experience.append(period.getDays()+" days");
	%>
	
	<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <title>Employee Profile</title>
		
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
		<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
		
		<!-- Tagsinput CSS -->
		<link rel="stylesheet" href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
    </head>
    <body>
<jsp:include page="/header"></jsp:include>
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Holidays 2019</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Holidays</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_holiday"><i class="fa fa-plus"></i> Add Holiday</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
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
										<tr class="holiday-completed">
											<td>1</td>
											<td>New Year</td>
											<td>1 Jan 2019</td>
											<td>Sunday</td>
											<td></td>
										</tr>
										<tr class="holiday-completed">
											<td>2</td>
											<td>Good Friday</td>
											<td>14 Apr 2019</td>
											<td>Friday</td>
											<td></td>
										</tr>
										<tr class="holiday-completed">
											<td>3</td>
											<td>May Day</td>
											<td>1 May 2019</td>
											<td>Monday</td>
											<td class="text-center">
											</td>
										</tr>
										<tr class="holiday-completed">
											<td>4</td>
											<td>Memorial Day</td>
											<td>28 May 2019</td>
											<td>Monday</td>
											<td class="text-center">
											</td>
										</tr>
										<tr class="holiday-completed">
											<td>5</td>
											<td>Ramzon</td>
											<td>26 Jun 2019</td>
											<td>Monday</td>
											<td></td>
										</tr>
										<tr class="holiday-upcoming">
											<td>6</td>
											<td>Bakrid</td>
											<td>2 Sep 2019</td>
											<td>Saturday</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr class="holiday-upcoming">
											<td>7</td>
											<td>Deepavali</td>
											<td>18 Oct 2019</td>
											<td>Wednesday</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
										<tr class="holiday-upcoming">
											<td>8</td>
											<td>Christmas</td>
											<td>25 Dec 2019</td>
											<td>Monday</td>
											<td class="text-right">
												<div class="dropdown dropdown-action">
													<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_holiday"><i class="fa fa-pencil m-r-5"></i> Edit</a>
														<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_holiday"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
													</div>
												</div>
											</td>
										</tr>
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
								<form>
									<div class="form-group">
										<label>Holiday Name <span class="text-danger">*</span></label>
										<input class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Holiday Date <span class="text-danger">*</span></label>
										<div class="cal-icon"><input class="form-control datetimepicker" type="text"></div>
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

<%
}}
catch(Exception e){

}%>