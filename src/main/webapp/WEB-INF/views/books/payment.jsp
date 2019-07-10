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

<!--cart section-->
<div class="cart-wrapper">
    <div class="cart">   
        <table class="table table-responsive cart-table">
            <thead>
                <tr>
                    <th></th>
                    <th><span class="ui-text-success">书名</span></th>
                    <th><span class="ui-text-success">卖家</span></th>
                    <th><span class="ui-text-success">价格</span></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div>
                            <div class="item-img"><img src="<%=basePath%>upload/${booksExtend.books.imgUrl}" alt=""></div>
                        </div>
                    </td>
                    <td>
                        <strong>${booksExtend.books.name}</strong>
                    </td>
                    <td>
                        <strong><span class="total">${booksExtend.user.userName}</span></strong>
                    </td>
                    <td>
                        <div class="price-control">
                            <strong class="unit-price">￥ <span data-price="72">${booksExtend.books.price}</span></strong>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="cart-bottom">
            <form action="<%=basePath%>orders/addOrders" method="post">
                <div class="form-group">
                    <input name="booksId" type="hidden" value="${booksExtend.books.id}"/>
                    <select class="form-control" id="state" name="state" title="">
                        <option value="1">寄送</option>
                        <option value="2">线下交易</option>
                    </select>
                </div>
                <p class="cart-bt-act">
                    <a href="items.html"><i class="fa fa-angle-left"></i> Continue Shopping</a>
                    <button type="submit" class="continue">生成订单<i class="fa fa-angle-right"></i></button>
                </p>
            </form>
        </div>
    </div>
</div>
<!--end cart section-->

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
