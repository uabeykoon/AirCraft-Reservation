package main;

import java.sql.*;

public class Validate {
	
	Connection con =null;
	
	public boolean checkValidation(String email,String pass) throws Exception{
		String query = "select * from admins";
		
//		try {
			con = DbConnectionProvider.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			
			
			
			String username = rs.getString("userName");
			String password = rs.getString("password");
			
			if(email.equals(username) && pass.equals(password))  {
				return true;
			}
			else {
				return false;
			}
			
			
//		}catch(Exception e){
//			return false;
//		}
		
		
	}

}
