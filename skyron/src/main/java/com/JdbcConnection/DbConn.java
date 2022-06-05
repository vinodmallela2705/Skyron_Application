package com.JdbcConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConn {
	public static Connection con=null;
	public static Connection getCon()
	{                                                              //Actually Class.forName is used for connecting or registering with the "database driver" available in the system and when this is called then DriverManager is used to get connection from the "database"  mean the databases like mySql,oracle etc... created in the system,,we will create the database required for us inside the mysql,oracle or other....
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");    // we use DriverManager.getConnection() to get connection with the database using "URL" inside DriverManager we will have static object and in driver class we have drivermanager.getConnection ...  so on methods ----this is not a complete explanation about this concept to get clarity
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "skyron","skyron");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}return con;
	
		
	}
}
	     
	
	
	
	
	
	
	
	
	//DbConn-database connection


