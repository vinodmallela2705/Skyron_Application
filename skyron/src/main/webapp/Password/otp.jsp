<!DOCTYPE html>
<html lang="en" oncontextmenu="return false">


    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
      
        <meta name="robots" content="noindex, nofollow">
        <title>OTP -Skyron</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.jpg">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
	
    </head>
    <body class="account-page">
	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
			<div class="account-content">
				<a href="" class="btn btn-primary apply-btn"> Contact</a>
				<div class="container">
				
					<!-- Account Logo -->
					<img src="assets/skyronImages/skyronLogo.jpg" alt="Skyron" width="480" height="140">
					<!-- /Account Logo -->
					
					<div class="account-box">
						<div class="account-wrapper">
							<h3 class="account-title">Verification of your account</h3>
							<p class="account-subtitle"></p>
							
							<!-- Account Form -->
							<form action="<%=request.getContextPath() %>/passwordChangeDao">
								<div class="form-group">
								<label>Enter OTP</label>
									<input type="text" placeholder="Enter Otp" maxlength="6" class="form-control" id="otp" required>
									
								</div>
								<div class="form-group">
									<label>New Password</label>
									<input class="form-control" type="password" name="newPassword" id ="newPassword" required>
								</div>
								<div class="form-group">
									<label>Confirm Password</label>
									<input class="form-control" type="password" name="confirmPassword" id="confirmPassword" required>
								</div>
								<div class="form-group text-center">
									<button class="btn btn-primary account-btn" type="submit" onclick="return Validate()">Change Password</button>
								</div>
								<div class="account-footer">
									<p>Not yet received? <a href="<%=request.getContextPath()%>/resetPassword">Resend OTP</a></p>
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
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
    </body>
    
     <script type="text/javascript">
        function Validate() {
        	var otp = document.getElementById("otp").value;
        	var actualotp = <%=session.getAttribute("otp")%>;
        	if(actualotp == null){
        		window.alert("Otp is Expired,Please try again");
        		return false;
        	}else if(otp != actualotp){
        		
        		alert("Incorrect otp,please try again");
        		return false;
        	}
            var password = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (password != confirmPassword) {
                alert("You first Passwords is not similar with second password. Please enter same password in both");
                return false;
            }
            return true;
        }
    </script>
</html>