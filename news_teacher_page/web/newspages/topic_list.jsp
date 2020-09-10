<%@ page import="com.hisoft.news.entity.Topic" %>
<%@ page import="java.util.List" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>编辑主题--管理后台</title>
    <script type="text/javascript">
        function check() {
            var tname = document.getElementById("tname");

            if (tname.value == "") {
                alert("请输入主题名称！！");
                tname.focus();
                return false;
                m
            }
            return true;
        }
    </script>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="main">
    <div>
<%--        <iframe src="newspages/console_element/top.html" scrolling="no" frameborder="0" width="947px"--%>
<%--                height="180px"></iframe>--%>
        <%@include file="console_element/top.html"%>
    </div>
    <div id="opt_list">
<%--        <iframe src="newspages/console_element/left.html" scrolling="no" frameborder="0" width="130px"></iframe>--%>
    <%@include file="console_element/left.html"%>
    </div>
    <div id="opt_area">
        <ul class="classlist">

            <%
                List<Topic> topiclist = (List<Topic>) request.getAttribute("topiclist");
                for (Topic topic : topiclist) {
            %>
            <li><%=topic.getTname()%>
                &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic.html?action=tomodify&tid=<%=topic.getTid()%>">修改</a>
                &nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:del(<%=topic.getTid()%>)">删除</a>
            </li>
            <%
                }
            %>


        </ul>
    </div>
<%--    <iframe src="newspages/console_element/bottom.html" scrolling="no" frameborder="0" width="947px"--%>
<%--            height="190px"></iframe>--%>
    <%@include file="console_element/bottom.html"%>
</div>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    function del(tid) {
        if (confirm("你确定要删除吗？")) {
            $.ajax({
                "url":"topic.html",
                "type":"get",
                "data":"action=delTopic&tid="+tid,
                "dataType":"json",
                "success":delTopic,
                "error":function () {
                    alert("请求失败！");
                }
            });
            function delTopic(data) {
                if (data.result=="error"){
                    alert(data.message);
                }else if (data.result=="success"){
                    alert(data.message);
                    $()
                }
            }
        }
    }

</script>
</body>
</html>	