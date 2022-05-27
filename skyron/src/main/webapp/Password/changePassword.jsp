 <jsp:include page="/header"/>
 <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="robots" content="noindex, nofollow">
        <title>Change Password - Skyron</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/skyronImages/favicon.jpg">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
		<link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		
    </head>
    <body>
					<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
					<div class="row">
						<div class="col-md-6 offset-md-3">
						
							<!-- Page Header -->
							<div class="page-header">
								<div class="row">
									<div class="col-sm-12">
										<h3 class="page-title">Change Password</h3>
									</div>
								</div>
							</div>
							<!-- /Page Header -->
							
							<form action="<%=request.getContextPath() %>/passwordChangeDao">
								<div class="form-group">
									<label>Old password</label>
									<input type="password" class="form-control" name="oldPassword">
								</div>
								<div class="form-group">
									<label>New password</label>
									<input type="password" class="form-control" name="newPassword">
								</div>
								<div class="form-group">
									<label>Confirm password</label>
									<input type="password" class="form-control" name="confirmPassword">
								</div>
								<div class="submit-section">
									<button class="btn btn-primary submit-btn">Update Password</button>
								</div>
							</form>
						</div>
					</div>
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
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
				<link rel="stylesheet" href="https://www.jquery-az.com/javascript/alert/dist/sweetalert.css">
<script src ="https://www.jquery-az.com/javascript/alert/dist/sweetalert-dev.js"></script>
 
		<script type="text/javascript">
		
function JSalert(){
	swal({   title: "<%=request.getParameter("error")%>",   
    text: "",   	
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

<%if(request.getParameter("error")==null){
	}
	else{%>
	<body onLoad="javascript:JSalert()"/>
<%} %>

    </body>
</html>