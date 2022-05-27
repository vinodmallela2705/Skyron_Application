<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
     import="java.sql.*"
     import="java.io.*,com.JdbcConnection.DbConn"%>

<%!
String employeeName;
String designation;
String bankName;
String bankAcNo;
String pan ;
int employee_id;
String month ;
String year ;
String basic ;
String hra ;
String lta;
String personalPay;
String providentFund;
String incomeTax ;
String professionTax ;
String employeePF  ;
String totalEarnings ;
String totalDeductions;
String netPay;
String PfNumber;
String Uan ;
String paybleDays ;
%>

<%employee_id = Integer.parseInt(request.getParameter("id"));
month = request.getParameter("m");
year =request.getParameter("y");
try{ 
Connection con=DbConn.getCon();
Statement statement=con.createStatement();
String sql1 ="SELECT * FROM salarySlips where employeeId=? and salaryMonth=? and salaryYear=?";
PreparedStatement st=con.prepareStatement(sql1);
st.setInt(1,employee_id);
st.setString(2,month);
st.setString(3, year);
ResultSet resultSet =st.executeQuery();

while(resultSet.next()){
 employeeName  = resultSet.getString("employeeName");
 designation = resultSet.getString("designation");
 bankAcNo = resultSet.getString("bankAcNo");
 bankName  = resultSet.getString("bankName");
 pan = resultSet.getString("pan");
 /*hra   = basic/2 ;
 lta = basic / 5;
 personalPay = basic /(int)3.333;
 providentFund = 2412 ;
 incomeTax = 0;
 employeePF = 2412 ;
 professionTax = 200;
 employeePF = 2412 ;
 totalEarnings = basic + hra + lta + personalPay + providentFund ;
 totalDeductions = providentFund + professionTax + incomeTax+employeePF ;
 netPay = totalEarnings - totalDeductions ;*/

 basic          = resultSet.getString("BASICSALARY");
 hra            = resultSet.getString("hra");
 lta            = resultSet.getString("lta");
 personalPay    = resultSet.getString("personalPay");
 providentFund  = resultSet.getString("providentFund");
 incomeTax      = resultSet.getString("professionalTax");
 employeePF     = resultSet.getString("employeePF");
 professionTax  = resultSet.getString("PROFESSIONALTAX");
 employeePF     = resultSet.getString("employeePF");
 totalEarnings  = resultSet.getString("totalEarnings");
 totalDeductions= resultSet.getString("totalDeductions");
 netPay         = resultSet.getString("netpayWords");
  Uan           = resultSet.getString("PAN");
  pan           = resultSet.getString("PAN");
  PfNumber      = resultSet.getString("PAN");
  paybleDays    = resultSet.getString("PAYBLEDAYS");
%>

<%}

} catch (Exception e) {
e.printStackTrace();
} %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>salarySlip</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
    
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<style type="text/css">

.salary-slip {
  margin: 15px;
    height:60px;
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
  height:3px;
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
  white-space:pre;
}
.salary-slip th, .salary-slip td {
  padding-left: 6px;
   white-space:pre;
}x</style>

</head>


<body onLoad="document.title='<%=employeeName+"_"+month+"_"+year %>';window.print();" onfocus="window.close()">
 <div  id="invoice">

<!-- partial:index.partial.html -->
	<div class="salary-slip">
	<div  id="htmlContent"></div>
		<table class="empDetail">
			<tr height="100px" style='background-color: white'>
				<td colspan='4'><img height="90px" src="assets/skyronImages/skyronLogo.jpg" /></td>
				<td colspan='30' class="companyName">Skyron Software Solutions Pvt Ltd <br><div style="font-size: 20px;">Hadapsar,Pune<br>Maharastra-412308</div></td>
				<td></td>
			</tr>
			</table>
			<br>
				<table class="empDet" style="height:10px" >
			<tr class="myBackground">
				<th colspan="3"></th>
				
				<th >Salary slip for <%=month+"  "+year %></th>
				<th colspan="3"></th>
				
				<th></th>
			</tr>
			</table>
			<table class="empDetail"  style="height:200px;">
			<tr >
				<th>Employee Id  </th>
				<td>:  <%=employee_id %> </td>
				<td></td>
				
				<td></td>
				<th >PF Number</th>
				<td>:  <%=PfNumber %></td>
			</tr>
			<tr>
				<th>Name</th>
				<td style="white-space:pre">:  <%=employeeName %></td>
				<td></td>
				
				<td></td>
				<th>UAN No</th>
				<td>:  XXXXXXXXXX</td>
			</tr>
			<tr>
				<th>Designation</th>
				<td>:  <%=designation %></td>
				<td></td>
				
				<td></td>
				<th>Payble Days</th>
				<td>:  <%=paybleDays %></td>
			</tr>
			<tr>
				<th>Bank Name</th>
				<td>:  <%=bankName %></td>
				<td></td>
				
				<td></td>
				<th>Location</th>
				<td>:  Hadapsur,Pune</td>
			</tr>
			<tr>
				<th>Bank AC No</th>
				<td>:  <%=bankAcNo %></td>
				<td></td>
				
				<td></td>
				<th>PAN No</th>
				<td>:  <%=pan %></td>
			</tr>
			</table>
					<table class="empDet" style="height:350px" >
			
			<tr class="myBackground">
				<th colspan="3">Earnings</th>
				
				<th class="table-border-right"></th>
				<th colspan="3">Deductions</th>
				
				<th></th>
			</tr>
			<tr>
				<th colspan="2">Basic Salary</th>
				<td>:</td>
				<td class="myAlign"><%=basic %></td>
				<th colspan="2">Provident Fund</th>
				<td>:</td>

				<td class="myAlign"><%=providentFund %></td>
				
			</tr>
			<tr>
				<th colspan="2">HRA</th>
				<td>:</td>

				<td class="myAlign"><%=hra %></td>
				<th colspan="2">Employee PF</th>
				<td>:</td>

				<td class="myAlign"><%=employeePF %></td>
			</tr>
			<tr>
				<th colspan="2">LTA </th>
				<td>:</td>

				<td class="myAlign"><%=lta %></td>
				<th colspan="2">Loan</th>
				<td>:</td>

				<td class="myAlign">00.00</td>
			</tr>
			<tr>
				<th colspan="2">Personal Pay</th>
				<td>:</td>
				<td class="myAlign"><%=personalPay %></td>
				<th colspan="2">Professional Tax</th>
				<td>:</td>
				<td class="myAlign"><%=professionTax %></td>
			</tr>
			<tr>
				<th colspan="2">Provident Fund</th>
				<td>:</td>

				<td class="myAlign"><%=providentFund %></td>
				<th colspan="2"></th>
				<td></td>

				<td class="myAlign"> </td>
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
				<th colspan="2"> </th>
				<td></td>
				<td class="myAlign"> </td>
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
			</tr>	<tr>
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
				<td class="myAlign"><%=totalEarnings %></td>
				<th colspan="2">Total Deductions</th>
					<td>:</td>
				<td class="myAlign"><%=totalDeductions %></td>
			</tr>
					</table>
					<table class="empDet" style="height:10px" >
			
			<tr class="myBackground">
				
				
			<th >Net Pay : <%=netPay %> </th>
				
				<th ></th>
				
				<th></th>
			</tr>
			</table>
				<h6>  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</a>	<a style="color: red"> 
					 Note: This is System generated pay slip and does not require signature</a>

	</div>


                                </div>
                          </div></body>

</html>

 <script language = "javascript">
   parent.window.location.href = parent.window.location.href;
   document.title='<%=employeeName+"_"+month+"_"+year %>';
  //document.type=pdf';
   window.print();
   window.close();
   </script>