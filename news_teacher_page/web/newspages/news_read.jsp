<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.hisoft.news.entity.News" %>
<%@ page import="com.hisoft.news.entity.Comment" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻中国</title>
<link href="css/read.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	  		function check(){
	  			var cauthor = document.getElementById("cauthor");
	  			var content = document.getElementById("ccontent");
	  			if(cauthor.value == ""){
	  				alert("用户名不能为空！！");
	  				return false;
	  			}else if(content.value == ""){
	  				alert("评论内容不能为空！！");
	  				return false;
	  			}
	  			return true;
	  		}
	  	</script>
</head>
<body>
<div id="header">
  <div id="top_login">
    <label> 登录名 </label>
    <input type="text" id="uname" value="" class="login_input" />
    <label> 密&#160;&#160;码 </label>
    <input type="password" id="upwd" value="" class="login_input" />
    <input type="button" class="login_sub" value="登录" onclick="login()"/>
    <label id="error"> </label>
    <a href="../index.jsp" class="login_link">返回首页</a> <img src="images/friend_logo.gif" alt="Google" id="friend_logo" /> </div>
  <div id="nav">
    <div id="logo"> <img src="images/logo.jpg" alt="新闻中国" /> </div>
    <div id="a_b01"> <img src="images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>
<%
  News n = (News) request.getAttribute("news");
  List<Comment> comments= (List<Comment>) n.getComments();
  Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
  List<News> list1 = (List<News>) map.get("list1");
  List<News> list2 = (List<News>) map.get("list2");
  List<News> list3 = (List<News>) map.get("list3");
%>
<div id="container">
  <div class="sidebar">
    <h1> <img src="images/title_1.gif" alt="国内新闻" /> </h1>
    <div class="side_list">
      <ul>
        <%
          for (News news : list1) {//包含于index.jsp中，引用index.jsp中的list1变量
        %>
        <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle() %></b></a></li>
        <%  } %>
      </ul>
    </div>
    <h1> <img src="images/title_2.gif" alt="国际新闻" /> </h1>
    <div class="side_list">
      <ul>
        <%
          for (News news : list2) {//包含于index.jsp中，引用index.jsp中的list2变量
        %>
        <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle() %></b></a></li>
        <%  } %>
      </ul>
    </div>
    <h1> <img src="images/title_3.gif" alt="娱乐新闻" /> </h1>
    <div class="side_list">
      <ul>
        <%
          for (News news : list3) {//包含于index.jsp中，引用index.jsp中的list3变量
        %>
        <li><a href='news.html?action=readNew&nid=<%=news.getNid() %>'><b><%=news.getNtitle() %></b></a></li>
        <%  } %>
      </ul>
    </div>
  </div>

  <div class="main">
    <div class="class_type"> <img src="images/class_type.gif" alt="新闻中心" /> </div>
    <div class="content">
      <ul class="classlist">
        <table width="80%" align="center">
          <tr width="100%">
            <td colspan="2" align="center"><%=n.getNtitle() %></td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
          <tr>
            <td align="center">作者：<%=n.getNauthor() %></td>
            <td align="left">发布时间：<%=n.getNcreateDate() %> </td>
          </tr>
          <tr>
            <td colspan="2" align="center"></td>
          </tr>
          <tr>
            <td colspan="2"> 　<%=n.getNcontent() %> </td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
        </table>
      </ul>
      <ul class="classlist">
        <table width="80%" align="center">
          <%
            if (comments.size() <= 0) {%>
          <tr><td colspan="6"> 暂无评论！ </td></tr>
          <tr>
            <td colspan="6"><hr />
            </td>
          </tr>
          <%} else {
            for (Comment comment : comments) { %>
          <tr>
            <td> 留言人： </td>
            <td><%=comment.getCauthor()%></td>
            <td> IP： </td>
            <td><%=comment.getCip()%></td>
            <td> 留言时间： </td>
            <td><%=comment.getCdate()%></td>
          </tr>
          <tr>
            <td colspan="6"><%=comment.getCcontent()%></td>
          </tr>
          <tr>
            <td colspan="6"><hr />
            </td>
          </tr>
          <%   }
          }
          %>
        </table>
      </ul>
      <ul class="classlist">
        <form action="news.html?action=addComment" method="post" onSubmit="return checkComment()">
          <input type="hidden" name="nid" value="<%=n.getNid() %>" />
          <table width="80%" align="center">
            <tr>
              <td> 评 论 </td>
            </tr>
            <tr>
              <td> 用户名： </td>
              <td>
                <%if(session.getAttribute("admin")!=null&&session.getAttribute("admin").toString().length()>0){%>
                <input id="cauthor" name="cauthor" value="<%=session.getAttribute("admin") %>" readonly="readonly" style="border:0px;"/>
                <%}else{%>
                <input id="cauthor" name="cauthor" value="这家伙很懒什么也没留下"/>
                <%} %>
                IP：
                <input name="cip" id="cip" value="<%=request.getRemoteAddr() %>" readonly="readonly" style="border:0px;"/>
              </td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="ccontent" id="ccontent" cols="70" rows="10"></textarea>
              </td>
            </tr>
            <tr><td><input name="submit" value="发  表" type="submit"/>
            </td></tr>
          </table>
        </form>

      </ul>
    </div>
  </div>
</div>
<div id="footer">  
 <iframe src="index-elements/index_bottom.html" scrolling="no" frameborder="0" width="947px" height="190px"></iframe>
</div>
</body>
</html>
