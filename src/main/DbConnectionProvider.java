package main;

import java.sql.*;

public class DbConnectionProvider {
	
	private static Connection con= null;
	
	static String url = "jdbc:mysql://localhost:3306/aircraft";
	private static String userName = "root";
	private static String password = "admin";
	
	public static Connection getConnection() throws Exception{
//		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,password);
			
//		}catch(Exception e){
//			//System.out.print(e);
//		}
		return con;
	}

}
