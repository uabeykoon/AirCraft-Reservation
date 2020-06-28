

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SheduleDAO;

/**
 * Servlet implementation class Addres
 */
@WebServlet("/Addres")
public class Addres extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		SheduleDAO shedule = new SheduleDAO();
		try {
			if(shedule.addReservation(session.getAttribute("userName").toString(), Integer.parseInt(request.getParameter("sheduleID")))) {
				response.sendRedirect("searchflight.jsp");
			}else {
				response.sendRedirect("searchflightresult.jsp");
			}
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
