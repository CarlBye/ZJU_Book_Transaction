<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>浙大旧书市场</title>
    <META HTTP-EQUIV="Refresh" CONTENT="0;URL=<%=basePath%>books/homeBooks">
</head>
<body>
</body>
</html>
