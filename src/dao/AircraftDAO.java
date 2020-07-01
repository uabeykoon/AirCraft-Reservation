package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBconnection;

public class AircraftDAO {
	
	Connection con = null;
	private String sqlget = "select * from aircrafts";
	private String sqladd = "insert into aircrafts values(?,?)";
	private String sqlupdate = "UPDATE aircrafts SET seatCount = ? WHERE regNumber = ?";
	
	private String deletesql = "DELETE FROM aircrafts WHERE regNumber=?";

	public ResultSet getAircrafts() throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlget);
		ResultSet rs = st.executeQuery();
		return rs;
		
	}
	
	public boolean addAircrafts(String regNumber,int seatCount) throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqladd);
		st.setString(1, regNumber);
		st.setInt(2, seatCount);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public ResultSet getAircraft(String regNumber) throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlget+" where regNumber=?");
		st.setString(1, regNumber);
		ResultSet rs = st.executeQuery();
		return rs;
		
	}
	
	public boolean updateAircraft(String regNumber,int seatCount) throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlupdate);
		st.setInt(1, seatCount);
		st.setString(2, regNumber);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public boolean deleteAircraft(String aircraftReg) throws Exception{
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(deletesql);
		st.setString(1, aircraftReg);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
		
//		if(aircraftReg.equals("001")) {
//			return true;
//		}else {
//			return false;
//		}
		
	}

}
