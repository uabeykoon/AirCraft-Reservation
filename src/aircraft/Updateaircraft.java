package aircraft;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AircraftDAO;


@WebServlet("/Updateaircraft")
public class Updateaircraft extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regNumber = request.getParameter("regNumber");
		int seatCount = Integer.parseInt(request.getParameter("seatCount"));
		
		AircraftDAO aircraftdoa = new AircraftDAO();
		try {
			if(aircraftdoa.updateAircraft(regNumber, seatCount)) {
				response.sendRedirect("adminaircraft.jsp");
			}
			else {
				response.sendRedirect("editaircraft.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
