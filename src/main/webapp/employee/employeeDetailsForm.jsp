<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
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
		String sql="select * from employeeDetails where employeeId=? ";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, employee_id);
	   	ResultSet rs= st.executeQuery();%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Employee Details</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favIcon.png">
		
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
		
    </head><jsp:include page="/header"/>
    <body>
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">Employee Details</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a >skyron</a></li>
									<li class="breadcrumb-item active">Employee Deatils</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title mb-0">Personal Information</h4>
								</div>
								<div class="card-body">
									<h4 class="card-title">Personal Information</h4>
									<%while (rs.next()){ %>
									<form action="<%=request.getContextPath()%>/edfDao" method="post">
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Employee  Id</label>
													<div class="col-lg-9">
														<input type="text" class="form-control"  value = "<%=employee_id%>"name="employeeId" readonly="readonly">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">First Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="firstName" value="<%=rs.getString("firstName")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Last Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="lastName" value=<%=rs.getString("lastName")%>>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Phone Number</label>
													<div class="col-lg-9">
														<input type="number" class="form-control" name="phoneNumber" value=<%=rs.getString("phoneNumber")%>>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Joining Date</label>
													<div class="col-lg-9"><div class="cal-icon">
											<input class="form-control datetimepicker" type="text" name="joiningDate" value=<%=rs.getString("joiningDate")%>>
										</div></div>
												</div>

												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Employee Status</label>
													<div class="col-lg-9">
															<select class="select" name="employeeStatus">
															<option value="<%=rs.getString("employeeStatus")%>"><%=rs.getString("employeeStatus")%></option>													
															<option value="Active">Yes</option>
															<option value="In-Active">No</option>
														</select>
													</div>
												</div>
													
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Work Email</label>
													<div class="col-lg-9">
														<input type="email" class="form-control" name="workEmail" value=<%=rs.getString("workEmail")%>>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Personal Email</label>
													<div class="col-lg-9">
														<input type="email" class="form-control" name="personalEmail" value=<%=rs.getString("personalEmail")%>>
													</div>
												</div>
																								
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Blood Group</label>
													<div class="col-lg-9">
														<select class="select" name="bloodGroup">
															<option value=<%=rs.getString("bloodGroup")%>><%=rs.getString("bloodGroup")%></option>
															<option value="A+">A+</option>
															<option value="O+">O+</option>
															<option value="B+">B+</option>
															<option value="AB+">AB+</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Reporting To</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="repotingTo" value=<%=rs.getString("reportingTo")%>>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Gender</label>
													<div class="col-lg-9">
														<select class="select" name="gender">
															<option value=<%=rs.getString("bloodGroup")%>><%=rs.getString("gender")%></option>
																												
															<option value="Male">Male</option>
															<option value="Female">Female</option>
															<option value="Others">Others</option>
															
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Martial Status</label>
													<div class="col-lg-9">
														<select class="select" name="martialStatus">
															<option value=<%=rs.getString("martialStatus")%>><%=rs.getString("martialStatus")%></option>													
															<option value="Married">Married</option>
															<option value="Single">Single</option>
															
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Religion</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="religion" value=<%=rs.getString("religion")%>>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Date Of Birth</label>
													<div class="col-lg-9">
														<input type="text" class="form-control datetimepicker" name="dateOfBirth"value="<%=rs.getString("dateofbirth")%>">
													</div>
												</div>
											</div>
										</div>
										<h4 class="card-title">Skyron / Emergency Details</h4>
										<div class="row">
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Designation</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="designation" value="<%=rs.getString("designation")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Islead</label>
													<div class="col-lg-9">
														<select class="select" name="isLead">
													        <option value="<%=rs.getString("isLead")%>"><%=rs.getString("isLead")%></option>
															<option value="Yes">Yes</option>
															<option value="No">No</option>
															
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Reporting Manager</label>
													<div class="col-lg-9">
														<select class="select" name="repotingManager">
															<option valu="<%=rs.getString("reportingManager")%>"><%=rs.getString("reportingManager")%></option>													
															<option value="Yes">Yes</option>
															<option value="No">No</option>
															
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Pan Number </label>
													<div class="col-lg-9">
												        <input type="text" class="form-control" name="panNumber" value="<%=rs.getString("panNumber")%>">	
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Passport Number </label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="passportNumber" value="<%=rs.getString("passportNumber")%>">	
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label"> Mother Name </label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="motherName" value="<%=rs.getString("motherName")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Bank Account number</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="bankAcno" value="<%=rs.getString("bankacno")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Bank Branch</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="bankBranch" value="<%=rs.getString("bankbranch")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Net Salary</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="netSalary" value="<%=rs.getString("netSalary")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Emergency Contact Number</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="emergencyContactnumber"value="<%=rs.getString("emergencyContactNumber")%>">
													</div>
												</div>
											</div>
											<div class="col-xl-6">
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Project</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="project" value="<%=rs.getString("project")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Department</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="department" value="<%=rs.getString("department")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Work Location</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="workLocation" value="<%=rs.getString("workLocation")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Aadhar Number</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="aadharNumber"value="<%=rs.getString("adharNumber")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Father Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="fatherName" value="<%=rs.getString("fatherName")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Bank Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="bankName"value="<%=rs.getString("bankName")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Bank Ifsc</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="bankIfsc" value="<%=rs.getString("bankifsc")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Basic Salary</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="basicSalary"value="<%=rs.getString("basicSalary")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Emergency Contact Name</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="emergencyContactname" value="<%=rs.getString("emergencyContactname")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-lg-3 col-form-label">Emergency Contact Relation</label>
													<div class="col-lg-9">
														<input type="text" class="form-control" name="emergencyContactRelation" value="<%=rs.getString("emergencyContactname")%>">
													</div>
												</div>
											</div>
										</div>
										<div class="text-right">
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</form><%}}catch(Exception e){
										System.out.println(e.getMessage());
									}%>
									
								</div>
							</div>
						</div>
					</div>
			<!-- /Main Wrapper -->
		
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