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
month = "January";
year ="2022";
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
} %><!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - HTML to PDF</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'><link rel="stylesheet" href="./style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
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
<body>
<!-- partial:index.partial.html -->
<div id="customers">
<div id="company-logo">
S</div>
  
 <div class="update">
   <h2>Testing Update</h1>
   </div>

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

</div>
<button onclick="javascript:demoFromHTML();">PDF</button>
<canvas id="canvas" width="400" height="320"></canvas> 
      <button id="download">Download Pdf</button>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://mrrio.github.io/jsPDF/dist/jspdf.debug.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js'></script><script  src="./script.js"></script>
<script>$('#download').click(function() {  

html2canvas(document.body, {
            onrendered: function(canvas) {         
                var imgData = canvas.toDataURL(
                    'image/png');              
                var doc = new jsPDF('p', 'mm');
                doc.addImage(imgData, 'PNG', 10, 10);
                doc.save('sample-file.pdf');
            }
        });
  
  });


function demoFromHTML() {
 
    var pdf = new jsPDF('p', 'pt', 'letter');
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#customers')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 80,
        bottom: 60,
        left: 40,
        width: 522
    };
    
    
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },
		
    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        pdf.save('vinod.pdf');
    }, margins);
}</script>
</body>

</html>
