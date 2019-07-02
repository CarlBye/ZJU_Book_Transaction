<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>

    <!--meta tags-->

    <meta charset="UTF-8">
    <meta name="description" content="Services Listing HTML5 CSS3 template">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript, services, listing">
    <meta name="author" content="Ui-DesignLab">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--end meta tags-->

    <title> 浙大旧书市场 </title>
    <link rel="icon" href="../../img/favicon.ico" type="image/x-icon">
    <!--stylesheets-->
    <link rel="stylesheet" href="<%=basePath%>vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/css/animate.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/perfect-scrollbar/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/app.css">
    <!--end stylesheets-->

    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Cairo%7CNosifer%7CPoppins%7CQuicksand:700%7CRaleway%7CTangerine%7CHind+Vadodara" rel="stylesheet">
    <!--end google fonts-->
</head>
<body>

<!--navigation bars-->

<nav class="site-top-nav">
    <div class="logo">
        <a href="<%=basePath%>books/homeBooks">
            <img src="../../img/logo.jpg" alt="">
            <strong>浙大旧书市场</strong>
        </a>
    </div>
    <ul class="site-menu">
        <li><a href="<%=basePath%>books/search">买卖市场</a></li>
        <c:if test="${empty cur_user}">
            <li><a href="<%=basePath%>user/loginRegister" class="ui-btn ui-btn-info">登录/注册</a></li>
        </c:if>
        <c:if test="${!empty cur_user}">
            <li><a href="<%=basePath%>user/allBooks">${cur_user.userName} 个人中心</a></li>
            <li><a href="<%=basePath%>user/logout" class="ui-btn ui-btn-info">退出</a></li>
        </c:if>
    </ul>
    <i class="nav-toggle fa fa-bars"></i>
</nav>

<div id="side-nav" class="side-nav">
    <div class="side-nav-menu perfect-scroll">
        <div class="text-logo">
            <a href="index.html"><h3>浙大旧书市场</h3></a>
        </div>
        <ul class="menu">
            <li><a href="<%=basePath%>books/search">买卖市场</a></li>
            <c:if test="${empty cur_user}">
                <li><a href="<%=basePath%>user/loginRegister" class="ui-btn ui-btn-info">登录/注册</a></li>
            </c:if>
            <c:if test="${!empty cur_user}">
                <li><a href="<%=basePath%>user/allBooks">${cur_user.userName} 个人中心</a></li>
                <li><a href="<%=basePath%>user/logout" class="logout">退出</a></li>
            </c:if>
        </ul>
    </div>
</div>
<!--end navigation bars-->

<!--banner-->
<div class="items-banner back-img">
    <form action="<%=basePath%>books/search" method="post">
        <div class="mega-search">
            <input class="form-control" type="text" name="str" placeholder="在这儿搜索...">
            <i class="fa fa-search"></i>
        </div>
        <button type="submit" class="ui-btn ui-btn-info btn-shadow"><strong>搜索</strong></button>
    </form>
</div>
<!--end banner-->


<!--items wrapper-->
<div class="items-wrapper">
    <div class="items-sort">
        <strong>最新发布</strong>
    </div>
    <div class="items">
        <c:forEach var="item" items="${newlyBooks}">
            <div class="sale-item">
                <div class="sale-item-img">
                    <img src="<%=basePath%>upload/${item.books.imgUrl}" alt="">
                    <div class="sale-info">
                        <strong>${item.books.name}</strong>
                        <span class="sale-price">${item.books.price}</span>
                    </div>
                </div>
                <div class="sale-lister">
                    <div class="lister-pic">
                        <div>
                            <strong>${item.user.userName}</strong>
                            <span><i class="fa fa-map-marker"></i><em>浙江大学</em></span>
                        </div>
                    </div>
                    <a href="<%=basePath%>books/booksId/${item.books.id}"><i class="fa fa-angle-right fa-2x"></i></a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--end items wrapper-->

<!--site pagination-->
<div class="site-pagination">
    <a class="current"><span><i>1</i></span></a>
</div>
<!--end site pagination-->

<!--page loader-->
<div class="page-loader">
    <div class="loader"><img src="../../img/logo.jpg" alt=""></div>
</div>
<!--end page loader-->

<div class="bottom-strip">
    <div class="copyright"><i class="fa fa-copyright"></i> <span>浙大旧书市场. All Rights Reserved</span></div>
</div>
<!--end footer section-->

<!--scripts-->
<script src="<%=basePath%>vendor/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>vendor/js/popper.js"></script>
<script src="<%=basePath%>vendor/js/bootstrap.min.js"></script>
<script src="<%=basePath%>vendor/js/alertify.js"></script>
<script src="<%=basePath%>vendor/js/jquery.knob.min.js"></script>
<!--[if IE]><script type="text/javascript" src="<%=basePath%>vendor/js/excanvas.js"></script><![endif]-->
<script src="<%=basePath%>vendor/js/summernote-bs4.min.js"></script>
<script src="<%=basePath%>vendor/js/dropzone.js"></script>
<script src="<%=basePath%>vendor/OwlCarousel2-2.2.1/owl.carousel.min.js"></script>
<script src="<%=basePath%>vendor/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"></script>
<script src="<%=basePath%>vendor/js/typed.js"></script>
<script src="<%=basePath%>js/app.js"></script>
<!--end scripts-->

</body>
</html>
