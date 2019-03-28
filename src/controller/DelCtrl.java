package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HospitalDAO;

@WebServlet("/Del.do")
public class DelCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HospitalDAO dao = new HospitalDAO(application);
		
		String hp_id = req.getParameter("id");
		
		dao.delete(hp_id);
		req.getRequestDispatcher("ReqList.do").forward(req, resp);
	}
}
