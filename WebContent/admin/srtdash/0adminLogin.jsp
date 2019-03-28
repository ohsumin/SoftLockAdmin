<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>adminLogin.jsp</title>
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
    <!-- 로그인ajax -->
   
    
</head>


<body>

    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- login area start -->
    <div class="login-area login-s2">
        <div class="container">
            <div class="login-box ptb--100">
                <form action="/AdminProj/admin/srtdash/0adminLoginAction.jsp" method="post">
                    <div class="login-form-head" style="text-align: center;">
                        <h2><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총괄관리자 로그인</strong></h2>
                        <p style="width: 400px; ">일반회원및 병원회원을 관리할 수 있는 총괄관리자 페이지입니다</p>
                    </div>
                    <div class="login-form-body" style="margin-left: 60px;">
                        <div class="form-gp">
                            <label for="exampleInputEmail1">총괄관리자아이디</label>
                            <input type="text" id="exampleInputEmail1" name="adm_id">
                            <i class="ti-email"></i>
                        </div>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">비밀번호</label>
                            <input type="password" id="exampleInputPassword1" name="adm_pw">
                            <i class="ti-lock"></i>
                        </div>
                        
                        <div class="submit-btn-area">
                            <button id="form_submit" type="submit" id="btnLogin2">로그인 <i class="ti-arrow-right"></i></button>
                        </div>
                       
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->

    <!-- jquery latest version -->
    <script src="./admin/srtdash/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="./admin/srtdash/assets/js/popper.min.js"></script>
    <script src="./admin/srtdash/assets/js/bootstrap.min.js"></script>
    <script src="./admin/srtdash/assets/js/owl.carousel.min.js"></script>
    <script src="./admin/srtdash/assets/js/metisMenu.min.js"></script>
    <script src="./admin/srtdash/assets/js/jquery.slimscroll.min.js"></script>
    <script src="./admin/srtdash/assets/js/jquery.slicknav.min.js"></script>
    
    <!-- others plugins -->
    <script src="./admin/srtdash/assets/js/plugins.js"></script>
    <script src="./admin/srtdash/assets/js/scripts.js"></script>
</body>
</html>