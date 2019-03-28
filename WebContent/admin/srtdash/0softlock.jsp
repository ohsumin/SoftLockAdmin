<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>타이틀임</title>
 <%@ include file="./adminCommon/0adminTopSc.jsp" %>
<body>
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- 좌측메뉴s -->
         <%@ include file="./adminCommon/0adminLeft.jsp" %>
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
             <%@ include file="./adminCommon/0adminTop.jsp" %>
            <!-- page title area end -->
            <div class="main-content-inner" style="width: 60%; float:none; margin:0 auto" >
                <!-- 메인내용s -->
                내용을 담을 공간입니다
            </div>
        </div>
        <!-- 메인내용e -->
        <!-- footer area start-->
        	  <%@ include file="./adminCommon/0adminFooter.jsp" %>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area start -->
		     <%@ include file="./adminCommon/0adminFooterSc.jsp" %>
    <!-- offset area end -->
    


</body>
</html>