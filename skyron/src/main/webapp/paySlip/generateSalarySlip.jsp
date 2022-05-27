<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"
	import="java.io.*,com.JdbcConnection.DbConn,java.text.NumberFormat,java.util.Calendar,java.util.Formatter"%>

<%!static int n;
	String employeeName;
	String designation;
	String bankName;
	String bankAcNo;
	String pan;
	String employee_id;
	String month;
	//String year;
	String workEmail;
	int basic;
	int hra;
	int lta;
	int personalPay;
	int providentFund;
	int incomeTax;
	int professionTax;
	int employeePF;
	int totalEarnings;
	int totalDeductions;
	static int netPay;
	int pfNUmber;
	String netPayWords;
	Formatter fmt ;
	 int year ;
	{
	Calendar cal = Calendar.getInstance();
    fmt = new Formatter();
    fmt.format("%tB", cal);
     year = Calendar.getInstance().get(Calendar.YEAR);}
      %>

<%
if (((String) session.getAttribute("employeeId")) == null) {
	response.sendRedirect(request.getContextPath() + "/login?error=session Expired Please Re-Login");
}
employee_id = request.getParameter("id");
month = fmt.toString();
//year = "2022";
Statement statement;
ResultSet resultSet;
try {
	Connection con = DbConn.getCon();
	statement = con.createStatement();
	String sql1 = "SELECT * FROM employeeDetails where employeeId=? ";
	PreparedStatement st = con.prepareStatement(sql1);
	st.setString(1, employee_id);
	resultSet = st.executeQuery();
	while (resultSet.next()) {

		employeeName = resultSet.getString("firstName") + " " + resultSet.getString("lastName");
		designation = resultSet.getString("designation");
		bankAcNo = resultSet.getString("bankAcNo");
		bankName = resultSet.getString("bankName");
		pan = resultSet.getString("panNumber");
		workEmail = resultSet.getString("workEmail");

		basic = resultSet.getInt("basicSalary");
		hra = basic / 2;
		lta = basic / 5;
		personalPay = basic / (int) 3.333;
		providentFund = 2412;
		incomeTax = 0;
		employeePF = 2412;
		professionTax = 200;
		employeePF = 2412;
		totalEarnings = basic + hra + lta + personalPay + providentFund;
		totalDeductions = providentFund + professionTax + incomeTax + employeePF;
		netPay = totalEarnings - totalDeductions;
%>

<%!public static final String[] units = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
		"Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };

public static final String[] tens = { "", // 0
		"", // 1
		"Twenty", // 2
		"Thirty", // 3
		"Forty", // 4
		"Fifty", // 5
		"Sixty", // 6
		"Seventy", // 7
		"Eighty", // 8
		"Ninety" // 9
};

public static String convert(final int n) {
	if (n < 0) {
		return "Minus " + convert(-n);
	}

	if (n < 20) {
		return units[n];
	}

	if (n < 100) {
		return tens[n / 10] + ((n % 10 != 0) ? " " : "") + units[n % 10];
	}

	if (n < 1000) {
		return units[n / 100] + " Hundred" + ((n % 100 != 0) ? " " : "") + convert(n % 100);
	}

	if (n < 100000) {
		return convert(n / 1000) + " Thousand" + ((n % 10000 != 0) ? " " : "") + convert(n % 1000);
	}

	if (n < 10000000) {
		return convert(n / 100000) + " Lakh" + ((n % 100000 != 0) ? " " : "") + convert(n % 100000);
	}

	return convert(n / 10000000) + " Crore" + ((n % 10000000 != 0) ? " " : "") + convert(n % 10000000);
}%>

<%
}
n = netPay;
netPayWords = NumberFormat.getInstance().format(n) + "(  " + convert(n) + " Rupees )";
session.setAttribute("we", workEmail);
} catch (Exception e) {
e.printStackTrace();
}
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

<meta name="robots" content="noindex, nofollow">
<title>Employees</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/skyronImages/favicon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- Lineawesome CSS -->
<link rel="stylesheet" href="assets/css/line-awesome.min.css">



<!-- Main CSS -->
<link rel="stylesheet" href="assets/css/style.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<style type="text/css">
.salary-slip {
	margin: 15px;
	height: 60px;
}

.salary-slip .empDetail {
	width: 100%;
	text-align: left;
	border: 2px solid black;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	font-family: Arial, Helvetica, sans-serif;
}

.salary-slip .empDet {
	width: 100%;
	height: 3px;
	text-align: left;
	border: 2px solid black;
	border-collapse: collapse;
	table-layout: fixed;
	margin-left: auto;
	margin-right: auto;
	font-family: Arial, Helvetica, sans-serif;
}

.salary-slip .head {
	margin: 10px;
	margin-bottom: 50px;
	width: 100%;
}

.salary-slip .companyName {
	text-align: right;
	font-size: 25px;
	font-weight: bold;
}

.salary-slip .salaryMonth {
	text-align: center;
}

.salary-slip .table-border-bottom {
	border-bottom: 1px solid;
}

.salary-slip .table-border-right {
	border-right: 1px solid;
}

.salary-slip .myBackground {
	padding-top: 10px;
	text-align: left;
	border: 1px solid black;
	height: 40px;
}

.salary-slip .myAlign {
	text-align: center;
	border-right: 1px solid black;
}

.salary-slip .myTotalBackground {
	padding-top: 10px;
	text-align: left;
	background-color: #EBF1DE;
	border-spacing: 0px;
}

.salary-slip .align-4 {
	width: 25%;
	float: left;
}

.salary-slip .tail {
	margin-top: 35px;
}

.salary-slip .align-2 {
	margin-top: 25px;
	width: 50%;
	float: left;
}

.salary-slip .border-center {
	text-align: center;
}

.salary-slip .border-center th, .salary-slip .border-center td {
	border: 1px solid black;
	white-space: pre;
}

.salary-slip th, .salary-slip td {
	padding-left: 6px;
	white-space: pre;
}
x
</style>

</head>


<body>
	<jsp:include page="/header"></jsp:include>
	<!-- Main Wrapper -->
	<div class="main-wrapper">


		<!-- Page Wrapper -->
		<div class="page-wrapper">

			<!-- Page Content -->
			<div class="content container-fluid">

				<!-- Page Header -->
				<div class="page-header">
					<div class="row align-items-center">
						<div class="col">
							<h3 class="page-title">Employee</h3>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="">Dashboard</a></li>
								<li class="breadcrumb-item active">Pay Slips</li>
							</ul>
						</div>

					</div>
				</div>
				<!-- /Page Header -->
				<!-- partial:index.partial.html -->
				<div class="salary-slip">
					<div id="htmlContent"></div>
					<table class="empDetail">
						<tr height="100px" style='background-color: white'>
							<td colspan='4'><img height="90px"
								src="assets/skyronImages/skyronLogo.jpg" /></td>
							<td colspan='30' class="companyName">Skyron Software
								Solutions Pvt Ltd <br>
								<div style="font-size: 20px;">
									Hadapsar,Pune<br>Maharastra-412308
								</div>
							</td>
							<td></td>
						</tr>
					</table>
					<br>
					<table class="empDet" style="height: 10px">
						<form action="<%=request.getContextPath()%>/generateSalarySlipDao">
							<tr class="myBackground">
								<th colspan="3"></th>

								<th>Salary slip for <input type="text" value="<%=month%>"
									name="salaryMonth" size="6">&nbsp<input size="4"
									type="text" value="<%=year%>" name="salaryYear">
								</th>

								<th colspan="3"></th>
								<th></th>
							</tr>
					</table>
					<table class="empDetail" style="height: 200px;">
						<tr>
							<th>Employee Id</th>
							<td>: <input type="text" value="<%=employee_id%> "
								name="employeeId" size="8"></td>
							<td></td>

							<td></td>
							<th>PF Number</th>
							<td>: <input type="text" value="<%=pfNUmber%>"
								name="pfNumber"></td>
						</tr>
						<tr>
							<th>Name</th>
							<td style="white-space: pre">: <input type="text"
								value="<%=employeeName%>" name="employeeName"></td>
							<td></td>

							<td></td>
							<th>UAN No</th>
							<td>: <input type="text" value="<%=pfNUmber%>"
								name="pfNumber"></td>
						</tr>
						<tr>
							<th>Designation</th>
							<td>: <input type="text" value="<%=designation%>"
								name="designation"></td>
							<td></td>

							<td></td>
							<th>Payble Days</th>
							<td>: <input type="text" value="30" name="paybleDays"></td>
						</tr>
						<tr>
							<th>Bank Name</th>
							<td>: <input type="text" value="<%=bankName%>"
								name="bankName"></td>
							<td></td>

							<td></td>
							<th>Location</th>
							<td>: <input type="text" value="Hadapsur,Pune"
								name="location"></td>
						</tr>
						<tr>
							<th>Bank AC No</th>
							<td>: <input type="text" value="<%=bankAcNo%>"
								name="bankAcNo"></td>
							<td></td>

							<td></td>
							<th>PAN No</th>
							<td>: <input type="text" value="<%=pan%>" name="pan"></td>
						</tr>
					</table>
					<table class="empDet" style="height: 350px">

						<tr class="myBackground">
							<th colspan="3">Earnings</th>

							<th class="table-border-right"></th>
							<th colspan="3">Deductions</th>

							<th></th>
						</tr>
						<tr>
							<th colspan="2">Basic Salary</th>
							<td>:</td>
							<td class="myAlign"><input type="text" value="<%=basic%>"
								name="basicSalary" size="10"></td>
							</td>
							<th colspan="2">Provident Fund</th>
							<td>:</td>

							<td class="myAlign"><input type="text"
								value="<%=providentFund%>" name="providentFund" size="10"></td>
							</td>

						</tr>
						<tr>
							<th colspan="2">HRA</th>
							<td>:</td>

							<td class="myAlign"><input type="text" value="<%=hra%>"
								name="hra" size="10"></td>
							<th colspan="2">Employee PF</th>
							<td>:</td>

							<td class="myAlign"><input type="text"
								value="<%=employeePF%>" name="employeePF" size="10"></td>
						</tr>
						<tr>
							<th colspan="2">LTA</th>
							<td>:</td>

							<td class="myAlign"><input type="text" value="<%=lta%>"
								name="lta" size="10"></td>
							<th colspan="2">Loan</th>
							<td>:</td>

							<td class="myAlign"><input type="text" value="0.0"
								name="loan" size="10"></td>
						</tr>
						<tr>
							<th colspan="2">Personal Pay</th>
							<td>:</td>
							<td class="myAlign"><input type="text"
								value="<%=personalPay%>" name="personalPay" size="10"></td>
							<th colspan="2">Professional Tax</th>
							<td>:</td>
							<td class="myAlign"><input type="text"
								value="<%=professionTax%>" name="professionTax" size="10"></td>
						</tr>
						<tr>
							<th colspan="2">Provident Fund</th>
							<td>:</td>

							<td class="myAlign"><input type="text"
								value="<%=providentFund%>" name="providentFund" size="10"></td>
							<th colspan="2"></th>
							<td></td>

							<td class="myAlign"></td>
						</tr>
						<tr>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
						</tr>
						<tr>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
						</tr>
						<tr>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
						</tr>
						<tr>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
						</tr>
						<tr>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
							<th colspan="2"></th>
							<td></td>
							<td class="myAlign"></td>
						</tr>
						<tr class="myBackground">
							<th colspan="2">Total Earnings</th>
							<td>:</td>
							<td class="myAlign"><input type="text"
								value="<%=totalEarnings%>" name="totalEarnings" size="10"></td>
							<th colspan="2">Total Deductions</th>
							<td>:</td>
							<td class="myAlign"><input type="text"
								value="<%=totalDeductions%>" name="totalDeductions" size="10"></td>
						</tr>
					</table>
					<table class="empDet" style="height: 10px">
						<th>Net Pay : <textarea name="netPayWords" rows="1"
								cols="100"><%=netPayWords%></textarea>
						</th>
						<th></th>

						<th></th>
						</tr>
					</table>
					<input type="submit" value="Save" />
					</form>
					<h6>
						&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</a> <a
							style="color: red"> Note: This is System generated pay slip
							and does not require signature</a>
				</div>
			</div>
		</div>


	</div>
	<!-- /Page Wrapper -->

	</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="assets/js/jquery-3.5.1.min.js"></script>


	<!-- Slimscroll JS -->
	<script src="assets/js/jquery.slimscroll.min.js"></script>



	<!-- Custom JS -->
	<script src="assets/js/app.js"></script>




</body>

</html>

