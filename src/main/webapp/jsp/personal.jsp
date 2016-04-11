<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html><html class=''>
<meta charset='UTF-8'>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/angular.js"></script> 

<script>
(function() {
// var jp = getQueryString("id");
var id = '<%=session.getAttribute("id")%>';

var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
	$http.get("userController/showUser.do")
	.success(function(response) {$scope.names = response.data;});
});
})();

</script>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>考试系统</title>
</head>
<body ng-app="myApp" ng-controller="customersCtrl" style="    background-color: #488FAB;">
	<div style="    background-color: #4E59AF;
    width: 380px;
    font-size: 60px;
    text-align: left;
    position: relative;
    left: 35%;
    top: 100px;">
		<div>
			学号：{{names.id}}
		</div>
		<div>
			姓名：{{names.name}}
		</div>
		<div>
			生日：{{names.birthdate|  date:'yyyy-MM-dd '}}
		</div>
		<div>
			学院：{{names.occupation}}

		</div>
	</div>
</body>
</html>