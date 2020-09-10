<%@ page import="com.hisoft.news.dao.UserDao" %>
<%@ page import="com.hisoft.news.dao.impl.UserDaoImpl" %>
<%@ page import="com.hisoft.news.entity.NewsUser" %>
<%@ page import="com.hisoft.news.service.UserService" %>
<%@ page import="com.hisoft.news.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: wuligang
  Date: 2020/7/22
  Time: 16:34
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
    <title>登录控制</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String uname = request.getParameter("uname");
    String upwd = request.getParameter("upwd");

    //服务器端验证
    if(uname.equals("")){
        request.setAttribute("message","用户名不能为空");
        request.getRequestDispatcher("index.jsp").forward(request,response);
        return;
    }
    if(upwd.equals("")){
        request.setAttribute("message","密码不能为空");
        request.getRequestDispatcher("index.jsp").forward(request,response);
        return;
    }


    NewsUser user = new NewsUser(uname,upwd);
    UserService userService = new UserServiceImpl();
    NewsUser findUser = userService.toLogin(user);
    if(findUser != null){
        session.setAttribute("user",uname);
        request.getRequestDispatcher("news.html?action=admin").forward(request,response);
    }else{
//        response.sendRedirect("index.jsp");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
%>
</body>
</html>
