package register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RegisterDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
		String password = request.getParameter("password");
		
		RegisterDAO register = new RegisterDAO();		
		PrintWriter out = response.getWriter();
		try {
			if(register.addUser(name,email,phoneNumber,password)) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("userregistration.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
