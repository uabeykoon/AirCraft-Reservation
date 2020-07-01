

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AircraftDAO;

/**
 * Servlet implementation class Deleteaircraft
 */
@WebServlet("/Deleteaircraft")
public class Deleteaircraft extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AircraftDAO aircraft = new AircraftDAO();
		PrintWriter out = response.getWriter();
		//out.print(request.getParameter("aircraftID"));
		try {
			if(aircraft.deleteAircraft(request.getParameter("aircraftID"))) {
				response.sendRedirect("adminaircraft.jsp");
			}else {
				out.print("Deletion Failed");
			}
		} catch (SQLIntegrityConstraintViolationException e) {
			//e.printStackTrace();
			out.print("Some shedules contains this aircraft as a airplane please remove that shedule first and try again");
			
		}catch(Exception e){
			out.print(e);
		}
	}

}
