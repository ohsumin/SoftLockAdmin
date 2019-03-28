package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HospitalDAO;
import util.PagingUtil;

@WebServlet("/ReqList.do")
public class ReqListCtrl extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = this.getServletContext();
		HospitalDAO dao = new HospitalDAO(application);
		
		// 승인대기병원인지 승인완료병원인지 구분하기위해
		String page = req.getParameter("page");
		String search = req.getParameter("search");
		System.out.println("pageParam:"+page);
		
		Map param = new HashMap();
		String addQueryString = "";
		
		if(search != null) {
			addQueryString = "search="+search;
			param.put("search", search);
		}
		addQueryString = addQueryString + "page=" + page + "&";
		int totalRecordCount = dao.getTotalRecordCount(param, page);
		
		int pageSize = 5;
		int blockPage = 5;
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		System.out.println("전체레코드수 : " + totalRecordCount);
		System.out.println("전체페이지수 : " + totalPage);
		/*
		현재 페이지번호에 따라 파라미터를 받는다.
		단, 최초 접속시에는 페이지번호가 없으므로 이때는 1페이지로 설정한다.
		 */
		int nowPage = (req.getParameter("nowPage")==null 
				|| req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		param.put("start", start);
		param.put("end", end);
		
		param.put("totalPage", totalPage);	// 전체페이지수
		param.put("nowPage", nowPage);	// 현재페이지
		param.put("totalCount", totalRecordCount);	// 전체레코드개수
		param.put("pageSize", pageSize);	// 한페이지에 출력할 게시물 개수
		
		List<HospitalDAO> lists = dao.selectList(param, page);
		
		// 페이지 처리를 위한 문자열 생성
		String pagingImg = PagingUtil.pagingImg(
				totalRecordCount, pageSize, blockPage, nowPage,
				"./ReqList.do?" + addQueryString);
		
		// 자원 반납
		dao.close();
		
		// View로 데이터를 전달하기 위해 request객체에 속성 저장
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
		
		// 페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
	
		// 포워드(리퀘스트 영역이 공유됨)
		// 승인대기
		if(page.equals("0"))
			req.getRequestDispatcher("admin/srtdash/10hp_reqList.jsp").forward(req, resp);
		// 승인완료
		else if(page.equals("1"))
			req.getRequestDispatcher("admin/srtdash/10hp_permList.jsp").forward(req, resp);
	}
}
