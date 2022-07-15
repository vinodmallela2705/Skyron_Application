<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.io.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter,java.sql.*,java.util.Date" %>
<%@page import= "com.Database.DataModel" %>
<%! int usedLeaves ; %>
<%if (((String) session.getAttribute("employeeId")) == null || (String) session.getAttribute("workEmail") == null) {
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Session Time Out Please Login');");
	out.println("window.location.href = '" + request.getContextPath() + "/login';");
	out.println("</script>");
}
  try{	
	    DataModel dmObj = new DataModel();
		String employeeId = (String)session.getAttribute("employeeId");
		ResultSet rs = dmObj.getEmployeeLeaves(employeeId);
		usedLeaves = dmObj.getEmployeeUsedLeaves(employeeId);
        int remainingLeaves = 20-usedLeaves ;	
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

<title>Leaves</title>

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
</head>
<script>
	var toDateList = [];
	var fromDateList = [];
	</script>
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
						<h3 class="page-title">Leaves</h3>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="">Dashboard</a></li>
							<li class="breadcrumb-item active">Leaves</li>
						</ul>
					</div>
					<div class="col-auto float-right ml-auto">
						<a href="#" class="btn add-btn" data-toggle="modal"
							data-target="#add_leave"><i class="fa fa-plus"></i> Add Leave</a>
					</div>
				</div>
			</div>
			<!-- /Page Header -->

			<!-- Leave Statistics -->
			<div class="row">
				<div class="col-md-3">
					<div class="stats-info">
						<h6>Annual Leaves</h6>
						<h4>20</h4>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-info">
						<h6>Medical Leave</h6>
						<h4>6</h4>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-info">
						<h6>Used Leaves</h6>
						<h4><%=usedLeaves %></h4>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stats-info">
						<h6>Remaining Leave</h6>
						<h4><%=remainingLeaves %></h4>
					</div>
				</div>
			</div>
			<!-- /Leave Statistics -->

			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-striped custom-table ">
							<thead>
								<tr>
									<th>Leave Type</th>
									<th>From</th>
									<th>To</th>
									<th>No of Days</th>
									<th>Reason</th>
									<th class="text-center">Status</th>
									<th>Approved by</th>
								</tr>
							</thead>
							<tbody>
								<%  while(rs.next()){%>
								<tr>
									<td><%=rs.getString("leaveType") %></td>
									<td><%=rs.getString("fromDate") %></td>
									<td><%=rs.getString("toDate")  %></td>
									<td><%=rs.getString("days")  %></td>
									<td><%=rs.getString("leaveReason") %></td>
									<td class="text-center">
										<div class="action-label">
											<a class="btn btn-white btn-sm btn-rounded"
												href="javascript:void(0);"> <%! String i ;%> <%String s =rs.getString("status");
													
													if(s.equalsIgnoreCase("pending")||s.equalsIgnoreCase("New"))
														i="fa fa-dot-circle-o text-info";
													else if(s.equalsIgnoreCase("Approved"))
														i="fa fa-dot-circle-o text-success";
													else
														i = "fa fa-dot-circle-o text-danger";
													
														%> <i class="<%=i%>"></i> <%=rs.getString("status")%>
											</a>
										</div>
									</td>
									<td>
										<h2 class="table-avatar">
											<a href="#"><%=rs.getString("approvedBy")%></a>
										</h2>
									</td>
								</tr>

								<script>
										 toDateList.push('<%=rs.getString("toDate")%>');
										 fromDateList.push('<%=rs.getString("fromDate")%>');
									</script>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /Page Content -->

		<!-- Add Leave Modal -->
		<div id="add_leave" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Apply Leave</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="<%=request.getContextPath() %>/leaveDao"
							name="applyLeaveForm">
							<div class="form-group">
								<label>Leave Type <span class="text-danger">*</span></label> 
								<select	class="select" name="leaveType" required>
									<option>Select Leave Type</option>
									<option value="Casual Leave">Casual Leave</option>
									<option value="Medical Leave">Medical Leave</option>
									<option value="Loss of Pay">Loss of Pay</option>
								</select>
							</div>
							<div class="form-group">
								<label>From <span class="text-danger">*</span></label>
								<div class="cal-icon">
									<input class="form-control datetimepicker" name="fromDate"
										type="text" onclick="getAppliedDays()">
								</div>
							</div>
							<div class="form-group">
								<label>To <span class="text-danger">*</span></label>
								<div class="cal-icon">
									<input class="form-control datetimepicker" name="toDate"
										type="text" onclick="getAppliedDays()">
								</div>
							</div>

							<div class="form-group">
								<label>Days</label> <input class="form-control" readonly
									type="text" name="days">
							</div>
							<div class="form-group">
								<label>Remaining Leaves <span class="text-danger">*</span></label>
								<input class="form-control" readonly
									value="<%=remainingLeaves %>" type="text">

							</div>
							<div class="form-group">
								<label>Leave Reason <span class="text-danger">*</span></label>
								<textarea rows="4" class="form-control" name="leaveReason"
									onclick="getAppliedDays()"></textarea>
							</div>
							<div class="submit-section">
								<button class="btn btn-primary submit-btn">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /Add Leave Modal -->


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
<% }catch(Exception e){
		e.printStackTrace();
		}%>

<script type="text/javascript">
   	function getAppliedDays(){
   		var fromDate = document.applyLeaveForm.fromDate.value;
   		var toDate = document.applyLeaveForm.toDate.value;
   		const myArray  = fromDate.split("/");
   		const myArray1 = toDate.split("/");
   		if(toDate != "" && fromDate !== "" ){
   		let today = new Date().toISOString().slice(0, 10)
   		const endDate    = today;
   		const diffInMs   = new Date(myArray1[2],myArray1[1],myArray1[0]) - new Date(myArray[2],myArray[1],myArray[0])
   		const diffInDays = (diffInMs / (1000 * 60 * 60 * 24))+1;
   		document.applyLeaveForm.days.value = diffInDays;
   		}
   		if(fromDateList.includes(fromDate) && toDateList.includes(toDate)){
   			alert('Selected Dates  leave already Applied ');
   		    document.applyLeaveForm.fromDate.value = "";
    	    document.applyLeaveForm.toDate.value = "";
   		}
   	}
    
    
</script>