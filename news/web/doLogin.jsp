<%--
  Created by IntelliJ IDEA.
  User: hisoft-SX
  Date: 2020/7/22
  Time: 15:35
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
    <title>访问控制页</title>
</head>
<body>
<%
    String name=request.getParameter("uname");
    String pwd=request.getParameter("upwd");
    if ("admin".equals(name)&&"admin".equals(pwd)){
        session.setAttribute("user",name);
        session.setMaxInactiveInterval(60);
        response.sendRedirect("./newspages/admin.jsp");
    }else{
        response.sendRedirect("./index.jsp");
    }
%>
</body>
</html>
