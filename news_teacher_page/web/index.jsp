<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page import="com.hisoft.news.entity.News" %>
<%@ page import="com.hisoft.news.entity.Topic" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.hisoft.news.util.Page" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新闻中国</title>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
%>
<div id="header">
    <div id="top_login">
        <form action="doLogin.jsp" method="post" autocomplete="off">
            <label> 登录名 </label>
            <input type="text" id="uname" name="uname"
                   value='<%=request.getParameter("uname") == null?"":request.getParameter("uname")%>'
                   class="login_input"/>
            <label> 密&#160;&#160;码 </label>
            <input type="password" id="upwd" name="upwd"
                   value='<%=request.getParameter("upwd") == null?"":request.getParameter("upwd")%>'
                   class="login_input"/>
            <input type="submit" class="login_sub" value="登录" onclick="login()"/>
            <label id="error"><%=message == null ? "" : message%>
            </label>
            <img src="images/friend_logo.gif" alt="Google" id="friend_logo"/>
        </form>
    </div>
    <div id="nav">
        <div id="logo"><img src="images/logo.jpg" alt="新闻中国"/></div>
        <div id="a_b01"><img src="images/a_b01.gif" alt=""/></div>
        <!--mainnav end-->
    </div>
</div>
<div id="container">

    <%
        Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");

        if (map == null) {
            request.getRequestDispatcher("news.html?action=index").forward(request, response);
            return;
        }
        Page newsPage=(Page)map.get("page");
        //List<News> newsList = (List<News>) map.get("newsList");
        List<News> list1 = (List<News>) map.get("list1");
        List<News> list2 = (List<News>) map.get("list2");
        List<News> list3 = (List<News>) map.get("list3");
        List<Topic> topiclist = (List<Topic>) map.get("topicList");

    %>


    <div class="sidebar">
        <h1><img src="images/title_1.gif" alt="国内新闻"/></h1>
        <div class="side_list">
            <ul>
                <%
                    for (News news : list1) {
                %>
                <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle()%>
                </b></a></li>
                <%
                    }
                %>

            </ul>
        </div>
        <h1><img src="images/title_2.gif" alt="国际新闻"/></h1>
        <div class="side_list">
            <ul>
                <%
                    for (News news : list2) {
                %>
                <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle()%>
                </b></a></li>
                <%
                    }
                %>
            </ul>
        </div>
        <h1><img src="images/title_3.gif" alt="娱乐新闻"/></h1>
        <div class="side_list">
            <ul>
                <%
                    for (News news : list3) {
                %>
                <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle()%>
                </b></a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
    <div class="main">
        <div class="class_type"><img src="images/class_type.gif" alt="新闻中心"/></div>
        <div class="content">
            <ul class="class_date">
                <li id='class_month'>
                    <%
                        for (Topic topic : topiclist) {
                    %>
                    <a href='news.html?action=index&tid=<%=topic.getTid()%>'><b><%=topic.getTname()%>
                    </b></a>
                    <%
                        }
                    %>
                </li>

            </ul>
            <ul class="classlist">

                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    for (int i = 0; i < newsPage.getNewsList().size(); i++) {
                        News news = newsPage.getNewsList().get(i);
                %>
                <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><%=news.getNtitle()%>
                </a><span> <%=sdf.format(news.getNcreateDate())%> </span></li>
                <%

                    if ((i + 1) % 5 == 0) {
                %>
                <li class='space'></li>
                <%
                        }
                    }
                %>

                <p align="right"> 当前页数:[<%=newsPage.getCurrPageNo()%>/<%=newsPage.getTotalPageCount()%>]&nbsp;
                    <a href="news.html?action=index&tid=<%=request.getParameter("tid")%>&currPageNo=<%=1%>">首页</a>
                    <%
                        if (newsPage.getCurrPageNo()>1){
                            %>
                    <a href="news.html?action=index&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getCurrPageNo()-1%>">上一页</a>

                    <%
                        }
                    %>
                    <%
                        if (newsPage.getCurrPageNo()!=newsPage.getTotalPageCount()){
                            %>
                    <a href="news.html?action=index&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getCurrPageNo()+1%>">下一页</a>

                    <%
                        }
                    %>
                    <a href="news.html?action=index&tid=<%=request.getParameter("tid")%>&currPageNo=<%=newsPage.getTotalPageCount()%>">末页</a></p>
            </ul>
        </div>
        <div class="picnews">
            <ul>
                <li><a href="#"><img src="images/Picture1.jpg" width="249" alt=""/> </a><a href="#">幻想中穿越时空</a></li>
                <li><a href="#"><img src="images/Picture2.jpg" width="249" alt=""/> </a><a href="#">国庆多变的发型</a></li>
                <li><a href="#"><img src="images/Picture3.jpg" width="249" alt=""/> </a><a href="#">新技术照亮都市</a></li>
                <li><a href="#"><img src="images/Picture4.jpg" width="249" alt=""/> </a><a href="#">群星闪耀红地毯</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="footer">
    <iframe src="index-elements/index_bottom.html" scrolling="no" frameborder="0" width="947px" height="190px"></iframe>
</div>
</body>
</html>
	