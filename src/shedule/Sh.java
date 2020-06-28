package shedule;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SheduleDAO;

/**
 * Servlet implementation class Sh
 */
@WebServlet("/Shedule")
public class Sh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SheduleDAO sheduledao = new SheduleDAO();
		PrintWriter out = response.getWriter();
//		response.sendRedirect("adminschedule.jsp");
//		
//		out.print(request.getParameter("sheduleID"));
//		out.print(request.getParameter("dDate")+ request.getParameter("dTime")+ Integer.parseInt(request.getParameter("dAirport"))+ request.getParameter("aDate")+ request.getParameter("aTime")+ Integer.parseInt(request.getParameter("aAirport"))+request.getParameter("aID")+Integer.parseInt(request.getParameter("price")));
//		System.out.print(sheduleID);
		
		
		try {
//			if(sheduledao.updateShedule(request.getParameter("dDate"), request.getParameter("dTime"), Integer.parseInt(request.getParameter("dAirport")), request.getParameter("aDate"), request.getParameter("aTime"), Integer.parseInt(request.getParameter("aAirport")), request.getParameter("aID"), Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("sheduleID")))) {
//				response.sendRedirect("adminschedule.jsp");
//			}
//			else {
//				response.sendRedirect("editshedule.jsp");
//			}
//			
			//sheduledao.updateShedule(request.getParameter("dDate"), request.getParameter("dTime"), Integer.parseInt(request.getParameter("dAirport")), request.getParameter("aDate"), request.getParameter("aTime"), Integer.parseInt(request.getParameter("aAirport")), request.getParameter("aID"), Integer.parseInt(request.getParameter("price")),Integer.parseInt(sheduleID));
			if(sheduledao.updateShedule(request.getParameter("dDate"), request.getParameter("dTime"), Integer.parseInt(request.getParameter("dAirport")), request.getParameter("aDate"), request.getParameter("aTime"), Integer.parseInt(request.getParameter("aAirport")), request.getParameter("aID"), Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("sheduleID")))) {
				response.sendRedirect("adminschedule.jsp");
			}
			else {
				response.sendRedirect("editshedule.jsp");
			}
			//out.print(sheduledao.updateShedule(request.getParameter("dDate"),request.getParameter("dTime"),Integer.parseInt(request.getParameter("dAirport")),request.getParameter("aDate"), request.getParameter("aTime"), Integer.parseInt(request.getParameter("aAirport")), request.getParameter("aID"), Integer.parseInt(request.getParameter("price")),1));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
}
