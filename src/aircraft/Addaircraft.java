package aircraft;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AircraftDAO;

@WebServlet("/Addaircraft")
public class Addaircraft extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regNumber = request.getParameter("regNumber");
		int seatCount = Integer.parseInt(request.getParameter("seatCount"));
		PrintWriter out = response.getWriter();
		AircraftDAO aircraftdao = new AircraftDAO();
		try {
			if(aircraftdao.addAircrafts(regNumber, seatCount)) {
				response.sendRedirect("adminaircraft.jsp");
			}
			else {
				response.sendRedirect("addaircraft.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		out.print(regNumber+seatCount);
	}

}
