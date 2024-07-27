package MAIN;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class JourneyDetails extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession httpSession=req.getSession();
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		System.out.println(from);
		System.out.println(to);
		
		
		
		double price = 0;
		double cgstSgst = 0;
		double totalCost = 0;
		ServletConfig config = getServletConfig();
		PrintWriter printWriter = resp.getWriter();
		if (from.equalsIgnoreCase("Pune") && to.equalsIgnoreCase("Mumbai")) {
			price = Double.parseDouble(config.getInitParameter("PuneToMumbai"));
			cgstSgst = price + (price * 18 / 100);
		}else if (from.equalsIgnoreCase("Pune") && to.equalsIgnoreCase("Banglore")) {
			price = Double.parseDouble(config.getInitParameter("PuneToBanglore"));
			cgstSgst = price + (price * 18 / 100);
		}else if (from.equalsIgnoreCase("Pune") && to.equalsIgnoreCase("Chennai")) {
			price = Double.parseDouble(config.getInitParameter("PuneToChennai"));
			cgstSgst = price + (price * 18 / 100);
		}else if (from.equalsIgnoreCase("Pune") && to.equalsIgnoreCase("Nagpur")) {
			price = Double.parseDouble(config.getInitParameter("PuneToNagpur"));
			cgstSgst = price + (price * 18 / 100);
		}
		req.setAttribute("from", from);
		req.setAttribute("to", to);
		RequestDispatcher dispatcher=req.getRequestDispatcher("TicketDetails.jsp");
		dispatcher.forward(req, resp);

	}
}
