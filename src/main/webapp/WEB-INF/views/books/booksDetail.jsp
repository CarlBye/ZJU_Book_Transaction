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


<!--item-->
<div class="detail-wrapper">
    <!--item details-->
    <div class="item-details">
        <img src="<%=basePath%>upload/${booksExtend.books.imgUrl}" alt="" style="width: 150px" >
        <div class="title-price">
            <a href="${booksExtend.books.jdUrl}">
            <strong class="titlet">${booksExtend.books.name}</strong>
            </a>
            <span><strong class="price">￥${booksExtend.books.price}</strong></span>
        </div>

        <div class="item-status">
            <div class="status-box">
                <strong>类别</strong>
                <span>${type.name}</span>
            </div>
            <div class="status-box">
                <strong>上架时间</strong>
                <span>${booksExtend.books.startTime}</span>
            </div>
            <div class="status-box">
                <strong>位置</strong>
                <span><i class="fa fa-map-marker"></i> 浙江大学</span>
            </div>
            <div class="status-box">
                <strong>原价</strong>
                <span>￥${booksExtend.books.originalPrice}</span>
            </div>
            <c:if test="${booksExtend.books.status==1&&!cur_user.id.equals(seller.id)}">
                <div class="status-box">
                    <strong><a href="<%=basePath%>books/buyId/${booksExtend.books.id}" class="add-to-cart">购买 </a></strong>
                    <span><i class="fa fa-cart-plus"></i></span>
                </div>
            </c:if>
        </div>
        <p class="description">
            <strong>内容介绍</strong>
            ${booksExtend.books.describe}
            <a href="#" class="show-more"><i class="fa fa-angle-double-down"></i></a>
        </p>
        <div class="owner-msg">
            <strong>ISBN</strong>
            <p>
                <i class="fa fa-quote-left ui-text-success"></i>
                <a href="https://item.jd.com/12135337.html">
                <span>
                    ${booksExtend.books.isbn}
                </span>
                </a>
                <i class="fa fa-quote-right ui-text-success"></i>
            </p>
        </div>
    </div>
    <!--end item details-->

    <!--item aside details-->
    <div class="item-detail-aside">
        <div class="listed-by">
            <strong>卖家</strong>
            <div class="lister">
                <img src="../../img/lister.jpg" alt="">
            </div>
        </div>
        <div class="lister-info">
            <strong>Megan Scarlett</strong>
            <hr>
            <span><i class="fa fa-globe ui-text-info"></i> ${seller.userName}</span>
            <span><i class="fa fa-map-marker ui-text-success"></i> <em>浙江大学</em></span>
            <span><i class="fa fa-envelope-o ui-text-danger"></i> <a href="mailto:${seller.email}">${seller.email}</a></span>
            <hr>
        </div>
        <c:if test="${!cur_user.id.equals(seller.id)}">
            <div class="contact-lister">
                <strong>联系卖家</strong>
                <form action="<%=basePath%>message/addMessage" method="post">
                    <div class="form-group">
                        <label for="email">收件人:</label>
                        <input id="email" type="email" placeholder="${seller.email}" class="form-control" disabled>
                        <input name="receiverId" type="hidden" value="${seller.id}"/>
                    </div>
                    <div class="form-group">
                        <label for="sub">主题:</label>
                        <input id="sub" type="text" placeholder="${booksExtend.books.name}" class="form-control" disabled>
                        <input name="bookId" type="hidden" value="${booksExtend.books.id}"/>
                    </div>
                    <div class="form-group">
                        <label for="content">Message:</label>
                        <textarea id="content" name="content" required="required" placeholder="在这儿填写消息" rows="6" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <button class="ui-btn ui-btn-info form-control" type="submit">发送 消息 <i class="fa fa-send-o"></i></button>
                    </div>
                </form>
            </div>
        </c:if>
    </div>
    <!--end item aside details-->

</div>
<!--end item-->

<!--page loader-->
<div class="page-loader">
    <div class="loader"><img src="../../img/logo.jpg" alt=""></div>
</div>
<!--end page loader-->

<!--footer section-->
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
