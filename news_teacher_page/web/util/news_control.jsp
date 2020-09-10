<%@ page import="com.hisoft.news.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hisoft.news.entity.Topic" %>
<%@ page import="com.hisoft.news.dao.CommentsDao" %>
<%@ page import="com.hisoft.news.dao.impl.CommentsDaoImpl" %>
<%@ page import="com.hisoft.news.entity.Comment" %>
<%@ page import="com.hisoft.news.service.NewsService" %>
<%@ page import="com.hisoft.news.service.impl.NewsServiceImpl" %>
<%@ page import="com.hisoft.news.service.TopicService" %>
<%@ page import="com.hisoft.news.service.impl.TopicServiceImpl" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.hisoft.news.service.CommentsService" %>
<%@ page import="com.hisoft.news.service.impl.CommentsServiceImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: wuligang
  Date: 2020/7/27
  Time: 10:07
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
    <title>新闻控制页</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");

    NewsService newsService = new NewsServiceImpl();
    TopicService topicService = new TopicServiceImpl();
    CommentsService commentsService = new CommentsServiceImpl();
    if ("index".equals(action)) {
        //查询国内-list1，国际-list2，娱乐-list3新闻，所有主题-topiclist，所有新闻-newslist，某个主题下的新闻-newslist
        //存入作用域，转发到首页
        String tidstr = request.getParameter("tid");
        Integer tid = ((tidstr == null || tidstr.equals("null"))? null : Integer.parseInt(tidstr));
        String currPageNoStr=request.getParameter("currPageNo");
        if (currPageNoStr==null){
            currPageNoStr="1";
        }
        int currPageNo=Integer.parseInt(currPageNoStr);
        Map<String, Object> map = newsService.queryIndexList("国内", "国际", "娱乐", tid,currPageNo);
        request.setAttribute("map", map);
        request.getRequestDispatcher("../index.jsp").forward(request, response);

    } else if (action.equals("addComment")) {//添加评论
        String cauthor = request.getParameter("cauthor");
        String cnid = request.getParameter("nid");
        String cip = request.getParameter("cip");
        String ccontent = request.getParameter("ccontent");
        Comment comment = new Comment();
        comment.setCnid(Integer.parseInt(cnid));
        comment.setCcontent(ccontent);
        comment.setCdate(new java.util.Date());
        comment.setCip(cip);
        comment.setCauthor(cauthor);

        if (commentsService.addComment(comment) > 0) {%>
<script type="text/javascript">
    alert("评论成功，点击确认返回原来页面");
    location.href = "../news.html?action=readNew&nid=<%=cnid%>";
</script>
<%} else {%>
<script type="text/javascript">
    alert("评论添加失败！请联系管理员查找原因！点击确认返回原来页面");
    location.href = "../news.html?action=readNew&nid=<%=cnid%>";
</script>
<%
        }
    } else if ("readNew".equals(action)) {//读取某条新闻
        String nid = request.getParameter("nid");
        News news = newsService.getNewsByNid(Integer.parseInt(nid));

        Map<String, Object> map = newsService.queryIndexList("国内", "国际", "娱乐", null,1);
        request.setAttribute("news", news);
        request.setAttribute("map", map);//左侧固定栏新闻
        request.getRequestDispatcher("/newspages/news_read.jsp")
                .forward(request, response);
    }else if ("admin".equals(action)){
            String currPageNoStr=request.getParameter("currPageNo");
            if (currPageNoStr==null){
                currPageNoStr="1";
            }
            int currPageNo=Integer.parseInt(currPageNoStr);
            Map<String, Object> map = newsService.queryIndexList("国内", "国际", "娱乐", null,currPageNo);
            request.setAttribute("map", map);
            request.getRequestDispatcher("../newspages/admin.jsp").forward(request, response);
    }

%>
</body>
</html>
