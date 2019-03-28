<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="./admin/srtdash/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/themify-icons.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/metisMenu.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="./admin/srtdash/assets/css/typography.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/default-css.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/styles.css">
    <link rel="stylesheet" href="./admin/srtdash/assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="./admin/srtdash/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
 
 <!-- 뒤로가기버튼 막기 -->
 <script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<% if(session.getAttribute("adm_id")==null){ %>
	<%@ include file="../../index.jsp" %>
	<% }else{ %>
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
                    <a href="#"><span style="color: white; font-weight: 900;">똑닥똑닥</span></a>
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
                            <h4 class="page-title pull-left">가입 대기중인 병원 리스트입니다</h4>
                            <!-- <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span>Dashboard</span></li>
                            </ul> -->
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="./admin/srtdash/assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">총괄관리자 <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="admin/srtdash/0adminlogout.jsp">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner" style="width: 80%; float:none; margin:0 auto" >
                <!-- 메인내용s -->
                <br /><br /><br />
                  <!-- table primary start -->
                  <div class="col-lg-6 mt-5">
                      <div class="card" style="width: 1100px;" >
                          <div class="card-body" >
                              <h4 class="header-title">대기병원 리스트</h4><br />
                              <div class="single-table">
                                  <div class="table-responsive">                                   
                                      <table class="table text-center" >
                                      
                                          <thead class="text-uppercase bg-primary">
                                              <tr class="text-white">
                                                  <th scope="col">일련번호</th>
                                                  <th scope="col">병원이름</th>                                                  
                                                  <th scope="col">요양기관기호</th>
                                                  <th scope="col">신청날짜</th>
                                                  <th scope="col">이메일</th>
                                                  <th scope="col">담당자</th>
                                                  <th scope="col">승인</th>
                                                  <th scope="col">거절</th>
                                              </tr>
                                          </thead>
                                          <tbody>
                                          <c:choose>
                                 <c:when test="${empty lists }">
                                    <tr>
                                       <td colspan="8">
                                          해당 아이디 없음
                                       </td>
                                    </tr>
                                 </c:when>
                                 <c:otherwise>
                                 <c:forEach items="${lists }" var="row" varStatus="loop">
                                              <tr>
                                                  <td>${row.index }</td>
                                                  <td>${row.hp_name }</td>                                                  
                                                  <td>${row.hp_num }</td>
                                                  <td>${row.hp_regiDate }</td>
                                                  <td>${row.hp_email }</td>
                                                  <td>${row.hp_username}</td>
                                                  <td><button class="btn btn-success btn-xs" onclick="location.href='Perm.do?id=${row.hp_id}&page=0'; alert('승인처리되었습니다.');">승인</button></td>
                                        <td><button class="btn btn-warning btn-xs" onclick="location.href='Del.do?id=${row.hp_id}&page=0'; alert('거절처리되었습니다.');">거절</button>
                                                                                                  
                                              </tr>  
                                              </c:forEach>
                                            </c:otherwise>
                                          </c:choose>                                            
                                          </tbody>
                                      </table><br /><br />
                                      <ul class="pagination" style="margin-left:42%;">   
										      ${pagingImg }
									  </ul>
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
    <script src="./admin/srtdash/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="./admin/srtdash/assets/js/popper.min.js"></script>
    <script src="./admin/srtdash/assets/js/bootstrap.min.js"></script>
    <script src="./admin/srtdash/assets/js/owl.carousel.min.js"></script>
    <script src="./admin/srtdash/assets/js/metisMenu.min.js"></script>
    <script src="./admin/srtdash/assets/js/jquery.slimscroll.min.js"></script>
    <script src="./admin/srtdash/assets/js/jquery.slicknav.min.js"></script>
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
    <script src="./admin/srtdash/assets/js/line-chart.js"></script>
    <!-- all bar chart activation -->
    <script src="./admin/srtdash/assets/js/bar-chart.js"></script>
    <!-- all pie chart -->
    <script src="./admin/srtdash/assets/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="./admin/srtdash/assets/js/plugins.js"></script>
    <script src="./admin/srtdash/assets/js/scripts.js"></script>


	<%} %>
</body>
</html>
