

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AircraftDAO;
import dao.SheduleDAO;

/**
 * Servlet implementation class Deleteshedules
 */
@WebServlet("/Deleteshedules")
public class Deleteshedules extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SheduleDAO shedule = new SheduleDAO();
		PrintWriter out = response.getWriter();
		//out.print(request.getParameter("sheduleID"));
		try {
			if(shedule.deleteShedule(request.getParameter("sheduleID"))) {
				response.sendRedirect("adminschedule.jsp");
			}
			else {
				out.print("Deletion Failed");
			}
//			out.print(shedule.deleteShedule(request.getParameter("sheduleID")));
		} catch (SQLIntegrityConstraintViolationException e) {
			out.print("Some reservation contains this Flight , please Remove that reservation and TRY AGAIN..!");
			//e.printStackTrace();
			//out.print("Some shedules contains this aircraft as a airplane please remove that shedule first and try again");
			
		}catch(Exception e){
			out.print(e);
		}
	}

}
