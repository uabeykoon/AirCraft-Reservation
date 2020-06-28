package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import db.DBconnection;

public class SheduleDAO {
	
	Connection con = null;
	private String sqlget = "select * from shedule";
	private String sqlGetDetailsShedule = "SELECT s.*,a1.name AS a1name,a2.name AS a2Name FROM shedule AS s LEFT JOIN airports AS a1 ON s.departureAirport=a1.airportID LEFT JOIN airports AS a2 ON s.arivalAirport=a2.airportID";
	private String sqlGetOneShedule= "SELECT s.*,a1.name AS a1name,a2.name AS a2Name FROM shedule AS s LEFT JOIN airports AS a1 ON s.departureAirport=a1.airportID LEFT JOIN airports AS a2 ON s.arivalAirport=a2.airportID WHERE s.sheduleID=?";
	private String aaaaaa = "insert into shedule(departureDate,departureTime,departureAirport,arrivalDate,arrivalTime,arivalAirport,aircraftID,pricePerHead) values(?,?,?,?,?,?,?,?)";
	private String update ="UPDATE shedule SET departureDate =?,departureTime=?,departureAirport=?,arrivalDate=?,arrivalTime=?,arivalAirport=?,aircraftID=?,pricePerHead=? WHERE sheduleID = ?";
	private String seatCountsql = "SELECT acf.seatCount as seat FROM shedule AS s LEFT JOIN aircrafts as acf ON acf.regNumber=s.aircraftID WHERE s.sheduleID=?";
	
	//private String searchShedulesql="SELECT s.*,a1.name AS a1name,a2.name AS a2Name FROM shedule AS s LEFT JOIN airports AS a1 ON s.departureAirport=a1.airportID LEFT JOIN airports AS a2 ON s.arivalAirport=a2.airportID WHERE s.departureAirport=? AND arivalAirport=? AND departureDate =?";
	private String searchsql = "SELECT s.*,a1.name AS a1name,a2.name AS a2Name FROM shedule AS s LEFT JOIN airports AS a1 ON s.departureAirport=a1.airportID LEFT JOIN airports AS a2 ON s.arivalAirport=a2.airportID WHERE s.departureAirport=? AND s.arivalAirport=? AND s.arrivalDate=?";
	private String addReservationsql ="insert into reservation(sheduleID,userName) values(?,?)";
	public boolean addShedule(String dDate,String dTime ,int dAirport,String aDate,String aTime,int aAirport,String aID, int price ) throws Exception {
		System.out.print(dDate+dTime);
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(aaaaaa);
		st.setString(1,dDate);
		st.setString(2, dTime);
		st.setInt(3, dAirport);
		st.setString(4, aDate);
		st.setString(5, aTime);
		st.setInt(6, aAirport);
		st.setString(7, aID);
		st.setInt(8, price);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public ResultSet getShedules() throws Exception{
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlGetDetailsShedule);
		ResultSet rs = st.executeQuery();
		return rs;
	}
	public ResultSet getOneShedule(int sheduleID) throws Exception{
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(sqlGetOneShedule);
		st.setInt(1, sheduleID);
		ResultSet rs = st.executeQuery();
		return rs;
	}
//	String dDate,String dTime ,int dAirport,String aDate,String aTime,int aAirport,String aID, int price,int sheduleID
	
	public boolean updateShedule(String dDate,String dTime ,int dAirport,String aDate,String aTime,int aAirport,String aID, int price,int sheduleID) throws Exception {
		System.out.print(sheduleID);
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(update);
		st.setString(1,dDate);
		st.setString(2, dTime);
		st.setInt(3, dAirport);
		st.setString(4, aDate);
		st.setString(5, aTime);
		st.setInt(6, aAirport);
		st.setString(7, aID);
		st.setInt(8, price);
		st.setInt(9, sheduleID);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}

	}
	
	public ResultSet searchShedule(String dAirport,String aAirport,String date) throws Exception{
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(searchsql);
		st.setInt(1, Integer.parseInt(dAirport));
		st.setInt(2, Integer.parseInt(aAirport));
		st.setString(3, date);
		ResultSet rs = st.executeQuery();
		return rs;
	}
	
	public boolean addReservation(String userName , int sheduleID) throws Exception {
		con = DBconnection.getConnection();
		PreparedStatement st = con.prepareStatement(addReservationsql);
		st.setInt(1, sheduleID);
		st.setString(2, userName);
		int rs = st.executeUpdate();
		if(rs>0) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
