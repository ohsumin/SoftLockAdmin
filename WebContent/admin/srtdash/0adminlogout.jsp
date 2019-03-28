<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Logout.jsp --%>
<%
//영역의 속성 지우기

session.removeAttribute("adm_id");

//세션영역 비우기(위에서 속성을 지웠으므로 없어도 무방)
//session.invalidate();

response.sendRedirect("../../index.do");

%>