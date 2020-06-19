package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginDAO logindao;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		logindao = new LoginDAO();
		
		
		
		try {
			if(logindao.validate(username, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("userName", username);
				response.sendRedirect("adminhome.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			PrintWriter out = response.getWriter();
			out.println(e);
		}
		
	}

}
