<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
       
        <title>Skyron</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
    </head>
   <% String error = request.getParameter("error");
    if(error==null){
    	%>  <body class="account-page"><% 
    }
    else{
    %>
    <body onLoad="javascript:JSalert()" class="account-page">
    <%} %>
	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
			<div class="account-content">
				<a href="" class="btn btn-primary apply-btn">Contact</a>
				<div class="container">
				
					<!-- Account Logo -->
				
						<img src="assets/skyronImages/skyronLogo.jpg" alt="Skyron" width="480" height="140">
					
					<!-- /Account Logo -->
					
					<div class="account-box">
						<div class="account-wrapper">
							<h3 class="account-title">Login</h3>
							<p class="account-subtitle">Access to our dashboard</p>
							
							<!-- Account Form -->
							<form action="lvalid" method="post" name="loginForm">
								<div class="form-group">
									<label>Employee Id</label>
									<input class="form-control" type="email" name="employeeEmail" required>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col">
											<label>Password</label>
										</div>
										<div class="col-auto">
											<a class="text-muted" href="<%=request.getContextPath()%>/forgetPassword">
												Forgot password?
											</a>
										</div>
									</div>
									<input class="form-control" type="password" name="password" id="myInput"required>
									<input type="checkbox" onclick="myFunction()">Show Password
								</div>
								<div class="form-group text-center">
									<button class="btn btn-primary account-btn" type="submit">Login</button>
								</div>
								<div class="account-footer">
									
								</div>
							</form>
							<!-- /Account Form -->
							
						</div>
					</div>
				</div>
			</div>
        </div>
		<!-- /Main Wrapper -->
		<script type="text/javascript">
		function myFunction() {
			  var x = document.getElementById("myInput");
			  if (x.type === "password") {
			    x.type = "text";
			  } else {
			    x.type = "password";
			  }
			}</script>
		<!-- jQuery -->
        <script src="assets/js/jquery-3.5.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
 
		<script type="text/javascript">
function JSalert(){
	var error = <%=error%>;
	if(error == 1)
	alert("Incorrect Email or Password!");
	if(error == 2)
		alert("Incorrect Email or Password!");
}
</script>
		
    </body></html>
  

