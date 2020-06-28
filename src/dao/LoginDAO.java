package dao;

import java.sql.*;
import db.DBconnection;

public class LoginDAO {
	
	Connection con = null;
	private String sql = "select * from admins where userName=? and password=?";
	private String sql2 = "select * from customers where email=? and password=?";

	public boolean validateAdmin(String username,String password) throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, username);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		else {
			return false;
		}
	}
		
		public boolean validateCustomer(String username,String password) throws Exception {
			con = DBconnection.getConnection();
			PreparedStatement st = con.prepareStatement(sql2);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
		
		
		
		
	}
}
