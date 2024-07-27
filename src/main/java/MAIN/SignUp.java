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

import DAO.UserDao;
import DTO.User;

@WebServlet("/signup")
public class SignUp extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		PrintWriter printWriter=resp.getWriter();
		
		String firstName=req.getParameter("firstname");
		String lastName=req.getParameter("lastname");
		long phoneNo=Long.parseLong(req.getParameter("phoneno"));
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String confirmPassword=req.getParameter("confirmpassword");
		
		User user=new User();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPhoneNo(phoneNo);
		user.setEmail(email);
		if (password.equals(confirmPassword)) {
			user.setPassword(password);
			user.setConfirmPassword(confirmPassword);
		}else {
			printWriter.print("Password & Confirm Password is not matching!");
		}
		
		UserDao dao=new UserDao();
		RequestDispatcher dispatcher;
		
		try {
			int result=dao.signUp(user);
			if (result!=0) {	
				req.setAttribute("message", "SignUp Successful!");
				dispatcher =req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req, resp);
				//printWriter.print("SignUp Successfully!");
			} 
		} catch (ClassNotFoundException | SQLException e) {
			req.setAttribute("message", "SignUp Failed!");
			dispatcher=req.getRequestDispatcher("signup.jsp");
			dispatcher.forward(req, resp);
			//printWriter.print("SignUp Failed!");
		}
		
		
		
	}
	
	
}
