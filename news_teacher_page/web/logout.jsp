<%--
  Created by IntelliJ IDEA.
  User: wuligang
  Date: 2020/7/22
  Time: 17:03
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
    <title>退出登录</title>
</head>
<body>
<%
    session.invalidate();
    out.print("<script>window.top.location=\"index.jsp\";</script>");
%>


</body>
</html>
