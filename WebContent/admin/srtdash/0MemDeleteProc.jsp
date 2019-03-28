<%@page import="model.MemDAO"%>
<%@page import="model.MemDTO"%>
<%@page import="utilMem.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@ include file="../common/isLogin.jsp" %> --%> 
<% 
request.setCharacterEncoding("UTF-8");
String mem_id = request.getParameter("mem_id");
System.out.println("mem_id="+mem_id);
/* MemDTO dto = new MemDTO();*/
MemDAO dao = new MemDAO(application);

//작성자 본인확인을 위해 기존 게시물을 가져온다.
/* dto = dao.selectView(num); */

//세션영역에 저장된 로그인 아이디 가져오기
/* String session_id = session.getAttribute("USER_ID").toString(); */

//삭제된 행의 갯수를 저장하기 위한 변수
int affected=0;

affected = dao.delete(mem_id);

/* 
//로그인아이디와 작성자아이디를 비교
if(session_id.equals(dto.getId())){
	 dto.setNum(num);  
	
}
else{
	 문자열 출력까지 처리하는 static타입의 메소드 호출. 출력까지
	JAVA영역에서 처리하기 위해서 out 내장객체를 전달한다. 
	JavascriptUtil.jsAlertBack("본인만 삭제가능합니다.", out);
	return;
} 
*/

if(affected==1){
	JavascriptUtil.jsAlertLocation("삭제되었습니다.",
			"11mem_list.jsp", out);
}
else {
	/* 
	JS부분을 문자열 형태로 만들어서 반환만 해주는 메소드 호출
	*/
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다."));
}
%>