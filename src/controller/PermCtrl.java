package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HospitalDAO;

@WebServlet("/Perm.do")
public class PermCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HospitalDAO dao = new HospitalDAO(application);
		
		String hp_id = req.getParameter("id");
		
		dao.updatePerm(hp_id);
		req.getRequestDispatcher("ReqList.do").forward(req, resp);
	}
}
