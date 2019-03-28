<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-pills nav-stacked">
	<li style="height:100px; padding-top:20px;
			text-align:center; color:#ffffff; 
			background-color:#28B473; border-radius:10px;">
		<h3>현재메뉴명</h3>
	</li>
	<li><a href="../08Bbs/BoardList.jsp">회원제게시판</a></li>			
	<li><a href="../DataRoom/DataList">자료실</a></li>		
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" 
			data-toggle="dropdown">
			임시Menu<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="#">Sub1</a></li>
			<li><a href="#">Sub2</a></li>
			<li><a href="#">Sub3</a></li>
		</ul>			
	</li>
</ul>			