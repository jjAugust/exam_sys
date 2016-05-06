<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
html, body {height: 100%;}
a{
text-decoration:none;
}
</style>

<html class=''>
<meta charset='UTF-8'>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath %>" />
    <script src="js/jquery.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  <script src="js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试系统</title>
</head>
<body>
<!-- <div style="width: 100%; height: 25%; text-align: center; background-color: #6BB2CE; font-size: 120px; ">智能考试系统</div>  -->
<div class="jumbotron" style="margin-bottom: 0;text-align:center">
  <h1>智能考试系统</h1>
  <p>This is a simple system, a simple jumbotron-style content for introduce exam or exam information.</p>
  <p><a class="btn btn-primary btn-lg"  role="button">Learn more</a></p>
</div>


<!-- <div style="line-height: 60px;width: 290px; height: 75%; font-size: 40px; background-color: #C3386D;  text-align: center; ">
    <div><a href="jsp/personal.jsp" target="main">个人信息</a></div>
<div><a href="jsp/exam.jsp" target="main">考试中心</a></div>
<div><a href="jsp/wrongCenter.jsp" target="main">错题中心</a></div>
<div><a href="jsp/wrongCenter.jsp" target="main">复习中心</a></div>
<div><a href="" >退出登录</a></div>
</div> -->

<div class="list-group" style="line-height: 60px;width: 290px; font-size: 40px;text-align: center; margin-bottom: 0;">
    <a href="jsp/personal.jsp" class="list-group-item list-group-item-success" target="main">个人信息</a>
    <a href="jsp/exam.jsp" class="list-group-item list-group-item-success" target="main">考试中心</a>
    <a href="jsp/wrongCenter.jsp" class="list-group-item list-group-item-success" target="main">错题中心</a>
    <a href="jsp/wrongCenter.jsp" class="list-group-item list-group-item-success" target="main">复习中心</a>
    <a href="" class="list-group-item list-group-item-success">退出登录</a>
</div>


<div style="
    position: relative;
    left: 290px;
    bottom: 62%;
    width: 79%;
    height: 62%;
">
<iframe id="main" name="main" src="jsp/personal.jsp"  style="
    width: 100%;
    height: 100%;
"></iframe>



</div>

<!-- <div class="embed-responsive embed-responsive-4by3" style="
    position: relative;
    left: 290px;
    bottom: 62%;
    width: 79%;
">
  <iframe class="embed-responsive-item" name="main" src="jsp/personal.jsp"></iframe>
</div> -->
</body>
</html>