<%@page import="model.MemDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemDAO"%>
<%@page import="utilMem.PagingUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
request.setCharacterEncoding("UTF-8");

//DAO에서 web.xml을 접근하기 위해 application객체를 전달함

//기존 JDBC 연결방식의 DAO사용
/* BbsDAO dao = new BbsDAO(application); */
//DBCP 사용

MemDAO dao = new MemDAO(application);
 
//검색추가부분s
//파라미터를 저장하기 위해 Map계열 컬렉션 선언
Map<String,Object> param = new HashMap<String,Object>();

//문자열 검색 파라미터를 페이지처리 메소드로 전달하기위한 변수선언
String queryStr = "";
//폼값받기(검색관련)
//String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
//검색어가 있는 경웅만 Map에 추가함
if(searchWord!=null){
	//param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	//페이지처리 메소드로 전달할 쿼리스트링 조립
	/* queryStr = String.format("searchColumn=%s&searchWord=%s&",
			searchColumn, searchWord); */
	queryStr = String.format("searchWord=%s&",
			searchWord);
	System.out.println("queryStr="+queryStr);
} 
//검색부분추가e
 
//bbs테이블의 전체 레코드가 몇개인지 카운트
int totalRecordCount = dao.getTotalRecordCount(param);

int pageSize = 5;
int blockPage = 10;
/* 
전체페이지수 계산하기
	: 전체레코드 갯수 125 / 한페이지 출력갯수 10 = 12.XXX
	=> ceil함수로 무조건 올림처리후 13 => 전체 13페이지
*/
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

//페이지 처리를 위한 로직 추가부분 s...
//web.xml에서 페이지처리를 위한 초기화 파라미터 가져오기
//현재 페이지번호 설정. 만약 페이지번호가 없다면 무조건 1로 설정
int nowPage = request.getParameter("nowPage")==null
	? 1 : Integer.parseInt(request.getParameter("nowPage"));

//가져올 레코드의 구간을 결정하기 위한 연산
/* 
	nowPage = 1 일때
		(1-1) * 10 + 1 = 1
		1 * 10 			= 10 => 즉 1~10까지 select
	nowPage = 2 일떄
		(2-1) * 10 + 1 = 11
		2 * 10 			= 20 => 11~20까지 select
*/
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//레코드의 구간을 Map에 저장(차후 DAO로 전달예정)
param.put("start", start);
param.put("end", end);
//페이지 처리를 위한 로직 추가부분 e...

//bbs테이블의 전체 레코드를 가져옴
List<MemDTO> mem = dao.selectList(param);

//자원반납
dao.close();


%>


<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>타이틀임</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>softlock-총괄페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script type="text/javascript">
function isDelete() {
	var ans = confirm("정말로 삭제하시겠습니까?");
	if(ans==true){
		//삭제처리페이지로 전송
		var f = document.MemFrm;
		f.action="0MemDeleteProc.jsp";
		f.method="post"
		f.submit();
	}
}
</script>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<% if(session.getAttribute("adm_id")==null){ %>
	<%@ include file="../../index.jsp" %>
	<% }else{ 
	System.out.println("ssesso :"+ session.getAttribute("adm_id"));
	%>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- 좌측메뉴s -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo" style="font-size: 2em;">
                    <a href="#"><span style="color: white; font-weight:900;">똑닥똑닥</span></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                        	<li><a href="/AdminProj/index.jsp"><i class="ti-map-alt"></i><span>대시보드</span></a></li>
                        	<li><a href="/AdminProj/admin/srtdash/11mem_list.jsp"><i class="ti-map-alt"></i><span>일반회원관리</span></a></li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="fa fa-align-left"></i>
                                    <span>병원회원관리</span></a>
                                <ul class="collapse">
                                    <li><a href="/AdminProj/ReqList.do?page=0">대기병원리스트</a></li>
                                    <li><a href="/AdminProj/ReqList.do?page=1">허가병원리스트</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!--좌측메뉴e -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    
                    <!-- profile info & task notification -->
                    <div class="col-md-6 col-sm-4 clearfix">
                       
                    </div>
                </div>
            </div>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">일반회원 리스트입니다</h4>
                            <!-- <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span>Dashboard</span></li>
                            </ul> -->
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="./assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">총괄관리자 <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="./0adminlogout.jsp">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner" style="width: 80%; margin-left:240px;" >
                <!-- 메인내용s -->
                <br /><br />
                  <!-- table primary start -->
                  <div class="col-lg-6 mt-5">
                      <div class="card" style="width: 900px;">
                          <div class="card-body">
                              <h4 class="header-title">일반회원 리스트</h4>
                                <form method="get">    
                                <div class="row">
								  <div class="form-group col-sm-3"><input name="searchWord"  class="form-control" type="text" id="example-text-input" placeholder="ID로검색"></div>
								  <div class="col-sm-4">
								  	<button type="submit" class="btn btn-warning" style="margin-right:10px;">검색하기</button>
								  	<button type="button" class="btn btn-secondary" onclick="location.href='11mem_list.jsp?nowPage=1'">전체보기</button>
								  </div>
								</div>
                                </form>
                                <!-- 
					   			<div class="form-group">
                                    
                                </div>
					   			<input type="submit" name="검색하기" />
					   			 -->
					   			
                              <div class="single-table">
                                  <div class="table-responsive">
                              		  <form name="MemFrm">
                                      <table class="table text-center" >
                                      
                                          <thead class="text-uppercase bg-primary">
                                              <tr class="text-white">
                                                  <th scope="col">번호</th>
                                                  <th scope="col">아이디</th>
                                                  <th scope="col">이름</th>
                                                  <th scope="col">전화번호</th>
                                                  <th scope="col">이메일</th>
                                                  <th scope="col">탈퇴</th>
                                              </tr>
                                          </thead>
<%
if(mem.isEmpty()){ 
      //컬렉션에 저장된 데이터가 없는경우
%>
      <tr>
         <td colspan="5" align="center">
            등록된 게시물이 없습니다.
         </td>
      </tr>
      
<% 
}
else
{
      //컬렉션에 저장된 데이터가 있으면 for~each문을 통해 내용출력.
      int vNum=0;
      int countNum=0;
      for(MemDTO dto : mem){
         //게시물의 번호를 순서대로 출력하기 위한 가상번호수를 기준
         
         //페이지처리 없을때 가상번호 계산
         //vNum = totalRecordCount--;
		
         /* 
         전체게시물수 : 129개
         pageSize : 10
         
         1페이지일때
         	1번게시물 : 129 - (((1-1) * 10) + 0) => 129
         	2번게시물 : 129 - (((1-1) * 10) + 1) => 128
         2페이지일때
         	1번게시물 : 129 - (((2-1) * 10) + 0) => 119
         	2번게시물 : 129 - (((2-1) * 10) + 1) => 118
         	
         */
         vNum = totalRecordCount - (((nowPage-1) * pageSize) + countNum++);
%> 													
                                          <tbody>
                                              <tr>
                                                  <th scope="row"><%=vNum %></th>
                                                  <td><%=dto.getMem_id() %></td>
                                                  <td><%=dto.getMem_name() %></td>
                                                  <td><%=dto.getMem_phone1() %>-<%=dto.getMem_phone2() %>-<%=dto.getMem_phone3() %></td>
                                                  <td><%=dto.getMem_email1() %>@<%=dto.getMem_email2() %></td>
                                                  <td><i class="ti-trash" onclick="isDelete();"></td><input type="hidden" name="mem_id" value="<%=dto.getMem_id() %>" /></i></td>
                                              </tr>
                                              <!-- <tr>
                                                  <th scope="row">1</th>
                                                  <td>jone</td>
                                                  <td>09 / 07 / 2018</td>
                                                  <td>$150</td>
                                                  <td><i class="ti-trash"></i></td>
                                              </tr>
                                              <tr>
                                                  <th scope="row">1</th>
                                                  <td>Mark</td>
                                                  <td>09 / 07 / 2018</td>
                                                  <td>$120</td>
                                                  <td><i class="ti-trash"></i></td>
                                              </tr>
                                              <tr>
                                                  <th scope="row">1</th>
                                                  <td>jone</td>
                                                  <td>09 / 07 / 2018</td>
                                                  <td>$150</td>
                                                  <td><i class="ti-trash"></i></td>
                                              </tr> -->
                                          </tbody>
<% 
   }//for~ each문 끝
}//if문 끝
%> 
                                      </table>
                                      </form> 
<br /><br />
<div style="margin-left: 35%; margin-top:2%;"><!-- 페이지처리 -->          
  <nav aria-label="Page navigation example">   
      <ul class="pagination">

          
          <%=PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, "11mem_list.jsp?"+queryStr)%>
          
         <!--  <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                  <span class="sr-only">Next</span>
              </a>
          </li> -->
      </ul>
  </nav>
</div>  
                                      
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!-- table primary end -->                 
        </div>
        <!-- footer area start-->
        </div>
        <footer>
            <div class="footer-area">
                <p>© Copyright 2018. All right reserved. Template by <a href="https://colorlib.com/wp/">Colorlib</a>.</p>
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area start -->

    <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- start amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <!-- all line chart activation -->
    <script src="assets/js/line-chart.js"></script>
    <!-- all bar chart activation -->
    <script src="assets/js/bar-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
	<%} %>


</body>
</html>
