package com.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.JdbcConnection.DbConn;

public class DataModel {

		
	Connection con = DbConn.getCon();

	/*This Method is used for get All Employee Details
	 * 
	 */
	public ResultSet getAllEmployees () throws Exception {
		ResultSet rs = null;
		try {
			Statement statement = con.createStatement();
			String sql = "select * from employeeDetails";
			rs = statement.executeQuery(sql);
		} catch (Exception e) {
			throw e;
		}
		return rs;
	}
	/*This Method is used for Check Login Credentials
	 * return String EmployeeId
	 */
	public String checkLoginUser(String employeeEmail,String password) throws Exception{
		boolean retVal = false;
		String employeeId = null ;
		try {
			String sql="select * from employeeDetails where workEmail=? and password=? and employeeStatus = 'Active'";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,employeeEmail);
			st.setString(2,password);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				retVal = true;
				employeeId = rs.getString("employeeId");
			}
		} catch (Exception e) {
			throw e;
			//e.printStackTrace();
		}
		return employeeId;
	}
	/*This Method is used for get  Employee Details with Employee Email
	 * return ResultSet
	 */
	public ResultSet getEmployeeDetails(String employeeEmail) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from employeeDetails where workEmail=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeEmail);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			//throw e;
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for get  Employee Details with Employee Id
	 * return ResultSet
	 */
	public ResultSet getEmployeeDetailsWithId(String employeeId) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from employeeDetails where employeeId=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeId);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			//throw e;
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for get  Employee Details with Employee Id
	 * return ResultSet
	 */
	public ResultSet getEmployeeDetailsWithId(int employeeId) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from employeeDetails where employeeId=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1,employeeId);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for get  Used Leaves with Employee Id
	 * return ResultSet
	 */
	public int getEmployeeUsedLeaves(String employeeId) throws Exception {
		ResultSet resultSet = null;
		int sUsedLeaves = 0 ;
		try {
			String sql="select usedLeaves from employeeDetails where employeeId=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeId);
			resultSet = st.executeQuery();
			if(resultSet.next())
				sUsedLeaves = resultSet.getInt("usedLeaves");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sUsedLeaves;
	}
	/*This Method is used for get  Employee Leaves with Employee ID
	 * return ResultSet
	 */
	public ResultSet getEmployeeLeaves(String employeeId) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from employeeLeaves where employeeId=? ";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,employeeId);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			//throw e;
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for get  Employee leaves  with reporting Manager
	 * return ResultSet
	 */
	public ResultSet getemployeeLeaves(String approvedBy) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from employeeLeaves where approvedBy=? and status = 'New' or status = 'pending'";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,approvedBy);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for updating Password with old password
	 * return ResultSet
	 */
	public boolean changePassword(String employeeId,String newPassword,String oldPassword) throws Exception {
		boolean isChanged = false;
		try {
			String edit = "UPDATE employeeDetails set password=? where employeeId=? and password=?";
				 Connection con=DbConn.getCon();
    			 PreparedStatement st = con.prepareStatement(edit);
    			 st.setString(2, employeeId);
    			 st.setString(1, newPassword);
    			 st.setString(3, oldPassword);
    			 int i = st.executeUpdate();
    			if(i==1) {
    			 isChanged = true;
    			}
		} catch (Exception e) {
			//e.printStackTrace();
			throw e;
		}
		return isChanged;
	}
	/*This Method is used for updating Password with reset
	 * return ResultSet
	 */
	public boolean changePassword(String employeeId,String newPassword) throws Exception {
		boolean isChanged = false;
		try {
			String edit = "UPDATE employeeDetails set password = ? where employeeId=?";
				 Connection con=DbConn.getCon();
    			 PreparedStatement st = con.prepareStatement(edit);
    			 st.setString(2, employeeId);
    			 st.setString(1, newPassword);
    			 int i = st.executeUpdate();
    			if(i==1) {
    			 isChanged = true;
    			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isChanged;
	}
	/*This Method is used for get  Employee Payslips with Employee Id
	 * return ResultSet
	 */
	public ResultSet getEmployeePayslips(int employeeId) throws Exception {
		ResultSet resultSet = null;
		try {
			String sql="select * from salarySlips where employeeId=?";
			PreparedStatement st=con.prepareStatement(sql);
			st.setInt(1,employeeId);
			resultSet = st.executeQuery();
		} catch (Exception e) {
			//throw e;
			e.printStackTrace();
		}
		return resultSet;
	}
	/*This Method is used for get  Employee Payslips with Employee Id
	 * return ResultSet
	 */
	public ResultSet getAllEmployeePayslips() throws Exception {
		ResultSet resultSet = null;
		try {
			Statement statement=con.createStatement();
			String sql="select * from salaryslips";
		    resultSet= statement.executeQuery(sql);
		} catch (Exception e) {
			//throw e;
			e.printStackTrace();
		}
		return resultSet;
	}
}
