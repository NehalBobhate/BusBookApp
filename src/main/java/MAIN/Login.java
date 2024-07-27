package MAIN;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDao;
import DTO.User;

@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter printWriter=resp.getWriter();
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDao dao=new UserDao();
		RequestDispatcher dispatcher;
		try {
			String dbPassword=dao.login(email);
			if (dbPassword!=null ) {
				if (dbPassword.equals(password)) {
					HttpSession httpSession=req.getSession();
					httpSession.setAttribute("email",email);
					//dispatcher=req.getRequestDispatcher("homepage.html");
					//dispatcher.forward(req, resp);
					resp.sendRedirect("homepage.jsp");
				}else {
					req.setAttribute("message","Wrong Password");
					dispatcher=req.getRequestDispatcher("login.jsp");
					dispatcher.forward(req, resp);;
					
					//printWriter.print("Wrong Pasword");
					
				}
			} else {
				req.setAttribute("message", "You are not registered with us please register first!");
				dispatcher=req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req, resp);
				//printWriter.print("Email Not Found!");

			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
