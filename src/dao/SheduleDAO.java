package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBconnection;

public class SheduleDAO {
	
	Connection con = null;
	private String sqladd = "insert into shedule(departureDate,departureTime,departureAirport,arrivalDate,arrivalTime,arivalAirport,aircraftID,pricePerHead) values(?,?,?,?,?,?,?,?)";
	private String aaaaaa = "insert into shedule(departureDate,departureTime,departureAirport,arrivalDate,arrivalTime,arivalAirport,aircraftID,pricePerHead) values(?,?,?,?,?,?,?,?)";
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
}
