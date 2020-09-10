<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.entity.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<title>编辑主题--管理后台</title>
   <script type="text/javascript">
		function check(){
			var tname = document.getElementById("tname");
	
			if(tname.value == ""){
				alert("请输入主题名称！！");
				tname.focus();
				return false;m
			}		
			return true;
		}
	</script>
    <link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div id="main">
      <div>
	    <iframe src="console_element/top.html" scrolling="no" frameborder="0" width="947px" height="180px"></iframe>
	  </div> 
      <div id="opt_list">
      	<iframe src="console_element/left.html" scrolling="no" frameborder="0" width="130px"></iframe>
      </div> 
	  <div id="opt_area">
	    <ul class="classlist"> 
			
			<li> 国内
			    &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			    &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a>    
			</li> 
			<li> 国际
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 军事
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 体育
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 娱乐
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 社会
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 财经
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 科技
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 健康
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 汽车
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 教育
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 房产
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 家居
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			          &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 旅游
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 文化
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			<li> 其他
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="topic_modify.jsp">修改</a> 
			   &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">删除</a> 
			    
			</li>
			</ul>
	  </div>
	  <iframe src="console_element/bottom.html" scrolling="no" frameborder="0" width="947px" height="190px"></iframe>
  </div>
</body>
</html>	