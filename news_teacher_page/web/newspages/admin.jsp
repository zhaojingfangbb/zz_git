<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.hisoft.news.dao.NewsDao" %>
<%@ page import="com.hisoft.news.dao.impl.NewsDaoImpl" %>
<%@ page import="com.hisoft.news.entity.News" %>
<%@ page import="com.hisoft.news.util.JdbcUtil" %>
<%@ page import="com.hisoft.news.service.NewsService" %>
<%@ page import="com.hisoft.news.service.impl.NewsServiceImpl" %>
<%@ page import="com.hisoft.news.util.Page" %>
<%@ include file="loginControl.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHT
ML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加主题--管理后台</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div id="main">
    <div>
        <iframe src="newspages/console_element/top.html" scrolling="no" frameborder="0" width="947px"
                height="180px"></iframe>
    </div>
    <div id="opt_list">
        <iframe src="newspages/console_element/left.html" scrolling="no" frameborder="0" width="130px"></iframe>
    </div>
    <div id="opt_area">
        <ul class="classlist">

            <%
                Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");

                if (map == null) {
                    request.getRequestDispatcher("news.html?action=index").forward(request, response);
                    return;
                }
                Page newsPage=(Page)map.get("page");
                for (int i = 0; i < newsPage.getNewsList().size(); i++) {
                    News news = newsPage.getNewsList().get(i);
            %>
            <li><%=news.getNtitle()%><span> 作者：
	        <%=news.getNauthor()%>
	        &#160;&#160;&#160;&#160; <a href='news_modify.jsp?nid=<%=news.getNid()%>'>修改</a> &#160;&#160;&#160;&#160; <a
                        href='#'>删除</a> </span></li>
            <%
                if ((i+1) % 5 == 0) {
            %>
            <li class='space'></li>
            <%
                    }

                }

            %>


            <p align="right"> 当前页数:[<%=newsPage.getCurrPageNo()%>/<%=newsPage.getTotalPageCount()%>]&nbsp;
                <a href="news.html?action=admin&tid=<%=request.getParameter("tid")%>&currPageNo=<%=1%>">首页</a>
                <%
                    if (newsPage.getCurrPageNo()>1){
                %>
                <a href="news.html?action=admin&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getCurrPageNo()-1%>">上一页</a>

                <%
                    }
                %>
                <%
                    if (newsPage.getCurrPageNo()!=newsPage.getTotalPageCount()){
                %>
                <a href="news.html?action=admin&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getCurrPageNo()+1%>">下一页</a>

                <%
                    }
                %>
                <a href="news.html?action=admin&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getTotalPageCount()%>">末页</a></p>        </ul>
    </div>
    <iframe src="newspages/console_element/bottom.html" scrolling="no" frameborder="0" width="947px"
            height="190px"></iframe>
</div>
</body>
</html>

	