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
            <li><a href="<%=basePath%>orders/myOrders"><i class="fa fa-money"></i><span>订单中心</span></a></li>
            <li><a href="<%=basePath%>books/addBooks"><i class="fa fa-history"></i><span>求购/出售</span></a></li>
            <li><a href="<%=basePath%>message/inbox/0" class="current"><i class="fa fa-envelope-o"></i><span>收件箱</span></a></li>
            <li><a href="<%=basePath%>message/sent/0"><i class="fa fa-envelope-o"></i><span>已发送</span></a></li>
            <li><a href="<%=basePath%>user/logout"><i class="fa fa-sign-out"></i><span>退出</span></a></li>
        </ul>
    </div>
</div>
<!--end side navigation-->

<!--content container-->
<div class="content-wrapper">

    <!--messages-->
    <div class="dash-messages list-page">
        <div class="messages-list">
            <ul class="list-unstyled msg-items">
                <c:forEach var="item" items="${messages}" varStatus="cnt">
                    <li class="msg-item">
                    <c:if test="${cnt.index==selectId}">
                        <a class="current" href="<%=basePath%>message/inbox/${cnt.index}">
                            <strong>${item.sender.userName}</strong>
                            <span>${item.books.name}</span>
                            <em>${item.message.time}</em>
                        </a>
                    </c:if>
                    <c:if test="${cnt.index!=selectId}">
                        <a href="<%=basePath%>message/inbox/${cnt.index}">
                            <strong>${item.sender.userName}</strong>
                            <span>${item.books.name}</span>
                            <em>${item.message.time}</em>
                        </a>
                    </c:if>
                </li>
                </c:forEach>
            </ul>
            <div class="load-more"><i class="fa fa-refresh"></i></div>
        </div>
        <div class="message-details">
            <div class="msg-top-strip">
                <div class="msg-actions">
                    <div class="icon-act">
                        <i title="Trash" class="fa fa-trash-o"></i>
                    </div>
                </div>
            </div>
            <div class="msg">
                <c:if test="${!empty messages}">
                    <div class="sender-info">
                        <div class="sender-img"><img src="../../img/user.jpg" alt=""></div>
                        <p><strong>${messages.get(selectId).sender.userName}</strong><span>${messages.get(selectId).message.time}</span></p>
                    </div>
                    <h5 class="msg-title">${messages.get(selectId).books.name}</h5>
                    <p class="message-info">
                        ${messages.get(selectId).message.content}
                    </p>
                    <form action="<%=basePath%>message/addMessage" method="post" class="reply-frm">
                        <div class="form-group">
                            <input name="receiverId" type="hidden" value="${messages.get(selectId).message.sendId}"/>
                            <input name="bookId" type="hidden" value="${messages.get(selectId).message.bookId}"/>
                            <textarea required name="content" rows="5" class="form-control" placeholder="Write something cool!"></textarea>
                        </div>
                        <div class="form-action">
                            <button type="submit"><i class="fa fa-send-o"></i> 回复</button>
                        </div>
                    </form>
                </c:if>
            </div>
        </div>
    </div>
    <!--end messages-->

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
