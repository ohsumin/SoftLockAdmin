<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/srtdash/assets/js/20adminStats.jsp" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>타이틀임</title>
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

<body>
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
                            <h4 class="page-title pull-left">대시보드</h4>
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
            <div class="main-content-inner">
             <div class="row">
                <!-- 메인내용s -->
                <!-- 총병원 개수 -->
                <div class="col-md-6 mt-5 mb-3" style="display: inline-block;">
                    <div class="card">
                        <div class="seo-fact sbg1">
                            <div class="p-4 d-flex justify-content-between align-items-center">
                                <div class="seofct-icon"><i class="ti-info-alt"></i> 똑닥똑닥에 등록한 병원</div>
                                <h2><%=totalHpNum%></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 총예약 개수 -->
                <div class="col-md-6 mt-md-5 mb-3" style="display: inline-block;">
                    <div class="card">
                        <div class="seo-fact sbg2">
                            <div class="p-4 d-flex justify-content-between align-items-center">
                                <div class="seofct-icon"><i class="ti-support"></i>전체병원 예약건수</div>
                                <h2><%=totlaResvNum%></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 병원타입에 따른 개수 -->
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                            <div style="text-align: center;"><h1>진료과에 따른 병원비율</h1></div>
                                <div id="ampiechart1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                            <div style="text-align: center;"><h1>월별 전체 예약건수</h1></div>
                                <div id="verview-shart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mt-5">
                        <div class="card">
                            <div class="card-body">
                            <div style="text-align: center;"><h1>일반회원 남녀비율</h1></div>
                                <div id="ampiechart2"></div>
                            </div>
                        </div>
                    </div>
            <!-- 메인내용e -->    
            </div>
        </div>
        
        <!-- footer area start-->
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
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <script src="https://www.amcharts.com/lib/3/serial.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <!-- all line chart activation -->
    <script src="./admin/srtdash/assets/js/line-chart.js"></script>
    <!-- all bar chart activation -->
    <script src="./admin/srtdash/assets/js/bar-chart.js"></script>
    <!-- all pie chart -->
   <!--  <script src="./admin/srtdash/assets/js/pie-chart.js"></script> -->
	<jsp:include page="/admin/srtdash/assets/js/20adminStats.jsp"/>
	<jsp:include page="/admin/srtdash/assets/js/02genderPercent.jsp"/>
	<jsp:include page="/admin/srtdash/assets/js/01monthData.jsp"/>
    <!-- others plugins -->
    <script src="./admin/srtdash/assets/js/plugins.js"></script>
    <script src="./admin/srtdash/assets/js/scripts.js"></script>

	<%} %>

</body>
</html>
