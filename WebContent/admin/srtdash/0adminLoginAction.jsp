<%@page import="model.AdminDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0adminLoginAction.jsp</title>
</head>
<body>

<%
String adm_id = request.getParameter("adm_id");
String adm_pw = request.getParameter("adm_pw");

String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

AdminDAO dao = new AdminDAO(application);

Map<String,String> memInfo = dao.getMemberMap(adm_id, adm_pw);


if(memInfo.get("adm_pw")!=null){
	
	session.setAttribute("adm_id", adm_id);
	session.setAttribute("adm_pw", adm_pw);
	
	System.out.println("login Action" + adm_pw);
	
	response.sendRedirect("../../index.do");
			
}
else{
	out.println("<script>alert('아이디와 비밀번호를 확인해주세요');</script>");
	out.println("<script>location.href='../../login.do';</script>");
	System.out.println("로그인 실패");
}
%>

</body>
</html>