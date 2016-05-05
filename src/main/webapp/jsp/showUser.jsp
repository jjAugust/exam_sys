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


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试系统</title>
</head>
<body>
<div style="width: 100%; height: 25%; text-align: center; background-color: #6BB2CE; font-size: 120px; ">智能考试系统</div> 
<div style="line-height: 60px;width: 290px; height: 75%; font-size: 40px; background-color: #C3386D;  text-align: center; ">
    <div><a href="jsp/personal.jsp" target="main">个人信息</a></div>
<div><a href="jsp/exam.jsp" target="main">考试中心</a></div>
<div><a href="jsp/wrongCenter.jsp" target="main">错题中心</a></div>
<div><a href="jsp/wrongCenter.jsp" target="main">复习中心</a></div>
<div><a href="" >退出登录</a></div>
</div>
<div style="
    position: relative;
    left: 290px;
    bottom: 75%;
    width: 79%;
    height: 75%;
">
<iframe id="main" name="main" src="jsp/personal.jsp"  style="
    width: 100%;
    height: 100%;
"></iframe>
</div>
</body>
</html>