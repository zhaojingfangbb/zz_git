<%--
  Created by IntelliJ IDEA.
  User: wuligang
  Date: 2020/7/22
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录验证</title>
</head>
<body>
<%
    String user = (String)session.getAttribute("user");
    if(user == null){
        response.sendRedirect("../index.jsp");
        return;
    }
%>
</body>
</html>
