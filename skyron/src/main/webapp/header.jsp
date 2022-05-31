		<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn"%>
     <%@ page errorPage="error.jsp" %> 
    <%!   int employeeId ;
    String employeeName ;
    String employeeImage ; 
    String employeeType ;
    %>
    <% 
 
    try{
    	if(((String)session.getAttribute("employeeId"))==null){
    		out.println("<script type=\"text/javascript\">");
			out.println("alert('Session Time Out Please Login');");
			out.println("window.location.href = '"+request.getContextPath()+"/login';");
			out.println("</script>");
    	}else{
    employeeId = Integer.parseInt((String)session.getAttribute("employeeId"));
    Connection con=DbConn.getCon();
	String sql_header="select * from employeeDetails where employeeId=?";
	PreparedStatement st=con.prepareStatement(sql_header);
	st.setInt(1,employeeId);
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		employeeName = rs.getString("firstName")+" "+rs.getString("lastName");
		employeeType = rs.getString("employeeType");
		//employeeImage = rs.getString("photo");
		session.setAttribute("employeeName", employeeName);
		session.setAttribute("workEmail",rs.getString("workEmail") );
		session.setAttribute("usedLeaves", rs.getString("usedLeaves"));
		
	}%>
    
	<html><head>
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
     <!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Loader -->
			<div id="loader-wrapper">
				<div id="loader">
					<div class="loader-ellips">
					  <span class="loader-ellips__dot"></span>
					  <span class="loader-ellips__dot"></span>
					  <span class="loader-ellips__dot"></span>
					  <span class="loader-ellips__dot"></span>
					</div>
				</div>
			</div>
			<!-- /Loader -->
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
               <div class="header-left">
                    <a  class="logo">
						<img src="assets/skyronImages/favicon.png" width="40" height="40" alt="">
					</a>
                </div>
			
				<!-- /Logo -->
				
				<a id="toggle_btn" href="javascript:void(0);">
					<span class="bar-icon">
					
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>
				
				<!-- Header Title -->
                <div class="page-title-box">
					<h3>Skyron Software Solutions</h3>
                </div>
           
				<!-- /Header Title -->
				
				<a id="mobile_btn" class="mobile_btn" href="#sidebar"><i class="fa fa-navicon"></i></a>
				
				<!-- Header Menu -->
				<ul class="nav user-menu">
				
					<!-- Search -->
					<li class="nav-item">
						<div class="top-nav-search">
							<a href="javascript:void(0);" class="responsive-search">
								<i class="fa fa-search"></i>
						   </a>
							
							<form action="<%=request.getContextPath()%>/search">
							<div class="autocomplete" >
  					<input class="form-control" type="text" id="myInput" placeholder="Search here" name="search">
								</div><button class="btn"  id="myBtn" type="submit"><i class="fa fa-search"></i></button>
							</form>
						</div>
					</li>
					<!-- /Search -->
				
					<!-- Flag 
					<button class="btn btn-white"><a href=""@click.prevent="printme" target="_blank">PDF</a></button>
					-->
					
					<li class="nav-item dropdown has-arrow flag-nav">
						<a  data-toggle="dropdown" href="#" role="button">
							<img src="assets/skyronImages/India-Flag.png" alt="" height="20"> <span>India</span>
						</a>
					</li>
					<!-- /Flag -->
				
					<!-- Notifications -->
					<li class="nav-item dropdown">
						<a href="https://mail.zauca.com:2096/" class="dropdown-toggle nav-link"   onclick="window.open('https://mail.zauca.com:2096/'); return false;">
							<i class="fa fa-envelope-o" style="font-size:25px"></i> <span class="badge badge-pill">..</span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Notifications</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="noti-content">
								<ul class="notification-list">
							
									<li class="notification-message">
									
									</li>
									</li>
								</ul>
							</div>
							<div class="topnav-dropdown-footer">
								<a href="">View all Notifications</a>
							</div>
						</div>
					</li>
					<!-- /Notifications -->
					
					<!-- Message Notifications -->
					<li class="nav-item dropdown">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<i class="fa fa-comment-o"></i> <span class="badge badge-pill">8</span>
						</a>
						<div class="dropdown-menu notifications">
							<div class="topnav-dropdown-header">
								<span class="notification-title">Messages</span>
								<a href="javascript:void(0)" class="clear-noti"> Clear All </a>
							</div>
							<div class="noti-content">
								<ul class="notification-list">	
								</ul>
							</div>
							<div class="topnav-dropdown-footer">
								<a href="">View all Messages</a>
							</div>
						</div>
					</li>
					<!-- /Message Notifications -->
	
					<li class="nav-item dropdown has-arrow main-drop">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							<span class="user-img"><img src="assets/skyronImages/vinod.jpg" height="30">
							<span class="status online"></span></span>
							<span><%=employeeName %></span>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/employeeProfile">My Profile</a>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/changePassword">Change Password</a>
							<a class="dropdown-item" href="" data-toggle="modal" data-target="#delete_employee">Logout</a>
						</div>
						
					</li>
				</ul>
				<!-- /Header Menu -->
				
				<!-- Mobile Menu -->
				<div class="dropdown mobile-user-menu">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/employeeProfile">My Profile</a>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/changePassword">Change Password</a>
							<a class="dropdown-item" href="" data-toggle="modal" data-target="#delete_employee">Logout</a>
					</div>
				</div>
				<!-- /Mobile Menu -->
				
            </div>
			<!-- /Header -->
			
			<!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
							
							<li><a href="<%=request.getContextPath()%>/employeeDashboard"><i class="la la-dashboard"></i> <span> Dashboard</span></a>
							</li>
								<li><a href="<%=request.getContextPath() %>/SalarySlips"> <i  class="fa">&#xf156;</i> <span> Pay Slips</span> </a></li>
							<li> 
								<a href="<%=request.getContextPath()%>/holidays"><i class="fa fa-calendar"></i> <span>Holidays</span></a>
							</li>
								<li> 
								<a href="<%=request.getContextPath()%>/calendar"><i class="fa fa-calendar-check-o" ></i> <span>Events</span></a>
							</li>
							<li> 
								<a href="<%=request.getContextPath()%>/changePassword"><i class="fa fa-key"></i> <span>Change Password</span></a>
							</li>
							<li><a href="<%=request.getContextPath()%>/employeeLeaves"><i class="fa fa-calendar-times-o"></i> <span>leaves</span></a>
							</li>
							<li > 
								<a href="<%=request.getContextPath()%>/policies"><i class="la la-file-pdf-o"></i> <span>Policies</span></a>
							</li>
							<%if(employeeType.equalsIgnoreCase("Admin")){ %>
							<li class="submenu">
								<a href="#"><i class="la la-user-secret"></i> <span> Adminstration</span> <span class="menu-arrow"></span></a>
								<ul style="display: none;">
								    <li><a href="<%=request.getContextPath()%>/allEmployees">All Employees</a>
							</li>
									<li><a href="<%=request.getContextPath()%>/adminEmployeeLeaves">Leave requests</a></li>
									<li><a href="<%=request.getContextPath() %>/manageSalarySlip"> Employee Salary </a></li>
									<li><a href="<%=request.getContextPath() %>/paySlipReports">Salary Reports</a></li>
								</ul>
							</li>
							<%} %>
						</ul>
					</div>
                </div>
            </div>
          
    		<div class="modal custom-modal fade" id="delete_employee" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Log Out</h3>
									<p>Are you sure want to LogOut?</p>
								</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<a href="<%=request.getContextPath() %>/logOut" class="btn btn-primary continue-btn">Log Out</a>
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
    </div></html>
   


    
  <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
</head>     
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = ["timeSheet","employeeDashboard","generateSalarySlips","employeeLeaves","PaySlip",
	"manageSalarySlip","calendar","holidays","paySlipReports","employeeLeaves","allemployees","SalarySlips","allEmployeesList","changePassword"];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);

var input = document.getElementById("myInput");
input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
   event.preventDefault();
   document.getElementById("myBtn").click();
  }
});
</script>

</body>
</html>
  
      <%
            
    	}
    
    	}catch (Exception e){
    		e.printStackTrace();
    		session.invalidate();
    	}%>