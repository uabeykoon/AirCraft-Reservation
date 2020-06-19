package dao;

import java.sql.*;
import db.DBconnection;

public class LoginDAO {
	
	Connection con = null;
	private String sql = "select * from admins where userName=? and password=?";

	public boolean validate(String username,String password) throws Exception {
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
}
