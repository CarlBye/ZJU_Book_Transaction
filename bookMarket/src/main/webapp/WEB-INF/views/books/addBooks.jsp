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
            <li><a href="<%=basePath%>books/addBooks" class="current"><i class="fa fa-history"></i><span>求购/出售</span></a></li>
            <li><a href="<%=basePath%>message/inbox/0"><i class="fa fa-envelope-o"></i><span>收件箱</span></a></li>
            <li><a href="<%=basePath%>message/sent/0"><i class="fa fa-envelope-o"></i><span>已发送</span></a></li>
            <li><a href="<%=basePath%>user/logout"><i class="fa fa-sign-out"></i><span>退出</span></a></li>
        </ul>
    </div>
</div>
<!--end side navigation-->

<!--content container-->
<div class="content-wrapper">

<!--user profile-->
    <form:form action="../books/publishBooksSubmit" method="post" role="form" enctype="multipart/form-data" class="profile-wrapper">
        <div class="primary-info">
            <div class="form-group">
                <label for="name">书名</label>
                <input class="form-control" type="text" id="name" name="name" required="required">
            </div>
            <div class="form-group">
                <label for="status">出售/求购</label>
                <select class="form-control" id="status" name="status" title="">
                    <option value="1">出售</option>
                    <option value="2">求购</option>
                </select>
            </div>
            <div class="form-group">
                <label for="typeId">类别</label>
                <select class="form-control" id="typeId" name="typeId" title="">
                  <option value="1">小说 / 文学 / 语言文学</option>
                  <option value="2">历史 / 地理 / 艺术</option>
                  <option value="3">政治 / 法律 / 军事</option>
                  <option value="4">哲学 / 心理 / 宗教</option>
                  <option value="5">经济 / 社科 / 综合</option>
                </select>
              </div>
        </div>
        <div class="secondary-info">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="originalPrice">原价</label>
                        <input class="form-control" type="text" id="originalPrice" name="originalPrice" required="required">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="price">售价</label>
                        <input class="form-control" type="text" id="price" name="price" required="required">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="isbn">ISBN</label>
                        <input class="form-control" type="text" id="isbn" name="isbn" required="required">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label for="jdUrl">京东链接</label>
                        <input class="form-control" type="url" id="jdUrl" name="jdUrl" required="required">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="describe">内容介绍</label>
                <textarea id="describe" name = "describe" rows="5" class="form-control" ></textarea>
            </div>
            <div class="form-group">
                <label for="book_img" class="control-label">选择图片</label>
                <div class="">
                    <input type="file" class="form-control" id="book_img" name="uploadBookImg"/>
                </div>
            </div>
            <br>
            <hr>
            <div class="row">
                <div class="col-lg-8 col-md-6"></div>
                <div class="col-lg-4 col-md-6">
                    <button type="submit" class="ui-btn ui-btn-info">发布 <i class="fa fa-save"></i></button>
                </div>
            </div>
        </div>
    </form:form>
<!--end user profile-->

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
