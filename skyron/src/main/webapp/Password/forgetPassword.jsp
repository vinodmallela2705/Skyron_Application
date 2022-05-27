<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">

        <meta name="robots" content="noindex, nofollow">
        <title>Forgot Password </title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
	
    </head>  <% String error = request.getParameter("error");
    System.out.println(error);
    if(error==null){
    	%>    <body class="account-page" oncontextmenu="return false"><% 
    }
    else{
    %>
    <body onLoad="javascript:JSalert()" class="account-page" oncontextmenu="return false">
    <%} %>
	

	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<div class="account-content">
				<a href="" class="btn btn-primary apply-btn">Contact</a>
				<div class="container">
				
					<!-- Account Logo -->
					
						<a href=""><img src="assets/skyronImages/skyronLogo.jpg" alt="Skyron" width="480" height="140"></a>
					
					<!-- /Account Logo -->
					
					<div class="account-box">
						<div class="account-wrapper">
							<h3 class="account-title">Forgot Password?</h3>
							<p class="account-subtitle">Enter Correct Details to reset Password</p>
							
							<!-- Account Form -->
							<form action="<%=request.getContextPath()%>/fpd">
							<div class="form-group">
									<label>Employee Id</label><span class="text-danger">*</span>
									<input class="form-control" type="text" name="employeeId" required="required">
								</div>
								<div class="form-group">
									<label>Email Address</label><span class="text-danger">*</span>
									<input class="form-control" type="email" name="email" required>
								</div>
								<div class="form-group">
									<label>Date of Birth</label><span class="text-danger">*</span>
									<div class="cal-icon">
											<input class="form-control datetimepicker  type="text" name="dob">
										</div>
								</div>
								<div class="form-group text-center">
									<button class="btn btn-primary account-btn" type="submit">Reset Password</button>
								</div>
								<div class="account-footer">
									<p>Remember your password? <a href="login.jsp">Login</a></p>
								</div>
							</form>
							<!-- /Account Form -->
							
						</div>
					</div>
				</div>
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
				<link rel="stylesheet" href="https://www.jquery-az.com/javascript/alert/dist/sweetalert.css">
               <script src ="https://www.jquery-az.com/javascript/alert/dist/sweetalert-dev.js"></script>
 
		<script type="text/javascript">
function JSalert(){
	swal({   title: "<%=request.getParameter("error")%>",   
    text: "Thank You!",   	
    type: "warning", 
    showconfirmButton:false,	
    CancelButtonColor: "#DD6B55",   
    CancelButtonText: "OK!",    
    closeOnConfirm: true,   
    closeOnCancel: true }, 
    function(isConfirm){   
        
        });
}
</script>
    </body>
</html>

      
  
  