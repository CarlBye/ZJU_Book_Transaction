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

    <title>浙大旧书市场</title>
    <link rel="icon" href="../../img/favicon.ico" type="image/x-icon">

    <!--stylesheets-->
    <link rel="stylesheet" href="<%=basePath%>vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/css/animate.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/css/alertify.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/perfect-scrollbar/css/perfect-scrollbar.min.css">
    <link rel="stylesheet" href="<%=basePath%>vendor/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/app.css">
    <link rel="stylesheet" href="<%=basePath%>css/dashboard.css">
    <!--end stylesheets-->

    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Cairo%7CNosifer%7CPoppins%7CQuicksand:700%7CRaleway%7CTangerine%7CHind+Vadodara" rel="stylesheet">
    <!--end google fonts-->
</head>
<body class="dashboard">

<!--top navigation-->
<div class="top-nav">
    <i class="fa fa-bars toggle-dash-menu"></i>
    <ul class="list-inline">
    </ul>
</div>
<!--end top navigation-->

<!--side navigation-->
<div class="dash-side-nav-wrapper" id="dash-side-menu">
    <div class="dash-side-nav perfect-scroll">
        <div class="dash-logo">
            <h5><a href="<%=basePath%>books/homeBooks">浙大旧书市场</a></h5>
            <span>个人中心</span>
        </div>
        <div class="user-info">
            <div class="dash-user-img"><img src="../../img/user2.jpg" alt=""></div>
            <div class="dash-user-info">
                <strong>${cur_user.userName}</strong>
                <span>${cur_user.email}</span>
            </div>
        </div>
        <ul class="list-unstyled dash-menu">
            <li><a href="<%=basePath%>user/allBooks"><i class="fa fa-home"></i><span>我的闲置</span></a></li>
            <li><a href="<%=basePath%>user/allWants"><i class="fa fa-star-o"></i><span>我的求购</span></a></li>
            <li><a href="<%=basePath%>orders/myOrders" class="current"><i class="fa fa-money"></i><span>订单中心</span></a></li>
            <li><a href="<%=basePath%>books/addBooks"><i class="fa fa-history"></i><span>求购/出售</span></a></li>
            <li><a href="<%=basePath%>message/inbox/0"><i class="fa fa-envelope-o"></i><span>收件箱</span></a></li>
            <li><a href="<%=basePath%>message/sent/0"><i class="fa fa-envelope-o"></i><span>已发送</span></a></li>
            <li><a href="<%=basePath%>user/logout"><i class="fa fa-sign-out"></i><span>退出</span></a></li>
        </ul>
    </div>
</div>
<!--end side navigation-->

<!--content container-->
<div class="content-wrapper">

<!--sales records-->
<div class="sales-records">
    <div class="sort-search">
        <h6 class="st"><strong>购买 订单</strong></h6>
    </div>
    <hr>
    <c:forEach var="item" items="${orders}">
        <hr>
        <section>
            <div class="s-record"><span>${item.books.name}</span></div>
            <div class="s-record"><em>交易时间</em><span>${item.orders.date}</span></div>
            <div class="s-record"><em>金额</em><span>${item.books.price}</span></div>
        </section>
        <hr>
    </c:forEach>
</div>
<!--end sales records-->

<!--sales records-->
    <div class="sales-records">
        <div class="sort-search">
            <h6 class="st"><strong>出售 订单</strong></h6>
        </div>
        <hr>
        <c:forEach var="item" items="${ordersOfSell}">
            <hr>
            <section>
                <div class="s-record"><span>${item.books.name}</span></div>
                <div class="s-record"><em>交易时间</em><span>${item.orders.date}</span></div>
                <div class="s-record"><em>金额</em><span>${item.books.price}</span></div>
            </section>
            <hr>
        </c:forEach>
    </div>
<!--end sales records-->

</div>
<!--end content container-->

<!--page loader-->
<div class="page-loader">
    <div class="loader"><img src="../../img/logo.jpg" alt=""></div>
</div>
<!--end page loader-->

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
