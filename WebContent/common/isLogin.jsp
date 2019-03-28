<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 
if(session.getAttribute("USER_ID")==null){
	// 로그인 정보가 세션영역에 없다면 로그인페이지로 이동한다.
	String returnPage = request.getRequestURI();
	System.out.println(returnPage);
	returnPage = URLEncoder.encode(returnPage);	// returnPage의 문자를 컴퓨터가 읽을 수 있도록 변수처리 해줌
	System.out.println(returnPage);
	
	if(returnPage.indexOf("WriteProc")!=-1){
		// 글쓰기 처리 페이지라면 폼값이 소멸되었으므로 글쓰기폼으로 돌아가게 처리한다.
		returnPage = 
				URLEncoder.encode("/K06JSPSevlet/08Board/BoardWrite.jsp", 
						"UTF-8");
		System.out.println(returnPage);
	}
%>
	<script>
		alert("로그인 후 이용해주십시오.");
		location.href="../06Session/Login.jsp?returnPage=<%=returnPage%>";
	</script>
	
<%
	return;/*
		해당 if문 아래에 JSP코드가 있는경우 JS코드보다 먼저 실행되어 오류가 발생하는 경우가 있을 수 있다. 
		그러므로 if블록안에 return문으로 아래 JSP코드가 실행되지 않도록 처리해야 한다.
	*/
}
%>