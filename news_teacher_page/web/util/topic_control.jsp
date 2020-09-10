<%@ page import="com.hisoft.news.entity.Topic" %>
<%@ page import="com.hisoft.news.dao.TopicDao" %>
<%@ page import="com.hisoft.news.dao.impl.TopicDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hisoft.news.dao.NewsDao" %>
<%@ page import="com.hisoft.news.dao.impl.NewsDaoImpl" %>
<%@ page import="com.hisoft.news.entity.News" %>
<%@ page import="com.hisoft.news.service.TopicService" %>
<%@ page import="com.hisoft.news.service.impl.TopicServiceImpl" %>
<%@ page import="com.hisoft.news.util.JdbcUtil" %><%--
  Created by IntelliJ IDEA.
  User: wuligang
  Date: 2020/7/25
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../newspages/loginControl.jsp" %>
<html>
<head>
    <title>主题控制页</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    String action = request.getParameter("action");
    TopicService topicService = new TopicServiceImpl();
    if ("addtopic".equals(action)){//添加主题
        String tname = request.getParameter("tname").trim();//去掉前后空格
        if (tname.equals("")) {
            request.setAttribute("message","主题不能为空！！");
            request.getRequestDispatcher("newspages/topic_add.jsp").forward(request,response);
            return;
        }

        Topic topic = new Topic(tname);
        int result = topicService.addTopic(topic);

        if (result == -1) {
            request.setAttribute("message","该主题已存在，再想个名字吧！");
            request.getRequestDispatcher("newspages/topic_add.jsp").forward(request,response);
        }else{
            if(result == 1){
                out.print("<script>alert('添加主题成功！');location.href='topic.html?action=topiclist';</script>");
            }else{
                request.setAttribute("message","添加主题失败，请联系管理员！");
                request.getRequestDispatcher("newspages/topic_add.jsp").forward(request,response);
            }
        }
    }else if("topiclist".equals(action)){//显示所有主题
        //查询所有主题，存入request作用域，转发到topic_list.jsp
        List<Topic> allTopics = topicService.findAllTopics();
        request.setAttribute("topiclist",allTopics);
        if (request.getParameter("from")!=null){
            request.getRequestDispatcher("../newspages/news_add.jsp").forward(request,response);
            return;
        }
        request.getRequestDispatcher("../newspages/topic_list.jsp").forward(request,response);
    }else if("tomodify".equals(action)){//打开修改页面，准备修改
        //获取要修改的记录的信息
        String tidstr = request.getParameter("tid");
        int tid = (tidstr == null?-1:Integer.parseInt(tidstr));
        Topic topic = null;
        if(tid != -1){
           topic  = topicService.findTopicByTid(tid);
        }
        request.setAttribute("topic",topic);
        request.getRequestDispatcher("../newspages/topic_modify.jsp").forward(request,response);
    }else if("updatetopic".equals(action)){//修改操作
        String tname = request.getParameter("tname");
        int tid = Integer.parseInt(request.getParameter("tid"));
        Topic topic = new Topic(tid,tname);
        int updateTopic = topicService.updateTopic(topic);
        if(updateTopic == -1){
            request.setAttribute("message","主题已存在，不能修改");
            request.getRequestDispatcher("../newspages/topic_modify.jsp").forward(request,response);
        }

        if(updateTopic == 1){
            out.print("<script>alert('修改成功');location.href='topic.html?action=topiclist'</script>");
        }else{
            request.setAttribute("message","修改失败，联系管理员");
            request.getRequestDispatcher("../newspages/topic_modify.jsp").forward(request,response);
        }
    }else if("delete".equals(action)){
        //删除操作
        int tid = Integer.parseInt(request.getParameter("tid"));
        //判断该主题下有没有新闻
        int result = topicService.delTopicById(tid);
        if(result == -1){
            out.print("<script>alert('该主题下有新闻，不能删除');location.href='topic.html?action=topiclist'</script>");
        }
        if(result == 1){
            out.print("<script>alert('删除成功');location.href='topic.html?action=topiclist'</script>");
        }
        if(result == -2){
            out.print("<script>alert('删除失败,联系管理员');</script>");
        }
    }




%>
</body>
</html>
