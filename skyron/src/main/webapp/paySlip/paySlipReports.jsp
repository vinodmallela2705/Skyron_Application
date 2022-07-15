	<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn"%>
<%@page import="com.Database.DataModel" %>
     <%
     if (((String) session.getAttribute("employeeId")) == null || (String) session.getAttribute("workEmail") == null) {
    		out.println("<script type=\"text/javascript\">");
    		out.println("alert('Session Time Out Please Login');");
    		out.println("window.location.href = '" + request.getContextPath() + "/login';");
    		out.println("</script>");
    	}
	try{
		DataModel dmObj = new DataModel();
	   	ResultSet rs= dmObj.getAllEmployeePayslips();
		%>
     <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="skyron - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Reports-Skyron</title>
		
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
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
	
	<script type="text/javascript">
	function myFunction() {
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[1];
		    if (td) {
		      txtValue = td.textContent || td.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }       
		  }
		}
	</script>
    </head>
    <body><jsp:include page="/header"></jsp:include>
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Payslip Reports</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a >Dashboard</a></li>
									<li class="breadcrumb-item active">Payslip Reports</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
						<!-- Content Starts -->
						<!-- Search Filter -->
					<div class="row filter-row">
						
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<input type="text" class="form-control floating" id="myInput" onkeyup="myFunction()">
								<label class="focus-label">Employee Name</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<select class="form-control floating select">
										<option>
											Jan
										</option>
										<option>
											Feb
										</option>
										<option>
											Mar
										</option>
									</select>
								</div>
								<label class="focus-label">Month</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">  
							<div class="form-group form-focus">
								<div class="cal-icon">
									<select class="form-control floating select">
										<option>
											2018
										</option>
										<option>
											2019
										</option>
										<option>
											2020
										</option>
									</select>
								</div>
								<label class="focus-label">Year</label>
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
								<table class="table table-striped custom-table"  id="myTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Employee Name</th>
											<th>Paid Amount</th>
											<th>Payment Month</th>
											<th>Payment Year</th>
											<th class="text-center">Actions</th>
										</tr>
									</thead>
									<tbody > <%while (rs.next()){ %>
										<tr>
											<td><%=rs.getString("employeeId") %></td>
											<td>
												<h2 class="table-avatar">
													<a href="" class="avatar"><img alt="" src="assets/skyronImages/employeeIcon.png"></a>
													<a href=""> <%=rs.getString("employeeName") %><span><%=rs.getString("designation") %></span></a>
												</h2>
											
											<td><i  class="fa">&#xf156;</i>&nbsp<%=rs.getString("TOTALEARNINGS") %></td>
											<td><%=rs.getString("SALARYMONTH") %></td>
											<td><%=rs.getString("SALARYYEAR") %></td>
											<td class="text-center"> 
						     <a  href="<%=request.getContextPath()%>/paySlip?m=<%=rs.getString("salaryMonth")%>&y=<%=rs.getString("salaryYear") %>" target="popup" 
  onclick="window.open('<%=request.getContextPath()%>/paySlip?m=<%=rs.getString("salaryMonth")%>&y=<%=rs.getString("salaryYear") %>&id=<%=rs.getString("employeeId") %>','popup','width=1000,height=700'); return false;" class="btn btn-sm btn-primary">PDF</a></td>
										</tr>
									<%}}catch (Exception e){
											e.printStackTrace();
											}%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
                
					<!-- /Content End -->
					
                </div>
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