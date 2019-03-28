<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
<script>
<%
//세션영역에 데이터가 없는경우(로그아웃인 경우)
if(session.getAttribute("adm_id")==null){
%>
 location.href="login.do";
<%
} else{
%>
 location.href="index.do";
<%
}
%>
</script>
</body>
</html>