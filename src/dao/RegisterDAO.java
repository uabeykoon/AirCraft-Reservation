package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.DBconnection;

public class RegisterDAO {
	
	private Connection con = null;
	private String addsql = "insert into customers(name,email,phoneNo,password) values(?,?,?,?)";
			
	public boolean addUser(String name,String email,int phoneNumber,String password) throws Exception{
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(addsql);
		st.setString(1,name);
		st.setString(2, email);
		st.setInt(3, phoneNumber);
		st.setString(4, password);

		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
//		System.out.print(name+email+phoneNumber+password);
//		
//		return true;
		
	}
}
