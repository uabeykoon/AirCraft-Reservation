package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBconnection;

public class AirportDAO {
	
	Connection con = null;
	private String sqlget = "select * from airports";

	public ResultSet getAirports() throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlget);
		ResultSet rs = st.executeQuery();
		return rs;
		
	}
}
