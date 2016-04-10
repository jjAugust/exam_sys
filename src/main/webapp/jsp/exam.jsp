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

   


var id = '<%=session.getAttribute("id")%>';

var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
	$http.get("userController/test.do")
	.success(function(response) {$scope.names = response.data;});
});

$scope.a = function($event, id){
	alert(id);
        //  var checkbox = $event.target;
        // var action = (checkbox.checked?'add':'remove');
        // updateSelected(action,id,checkbox.name);
   }
})();

</script>
<script type="text/javascript"> 
$(function(){ 

}); 
</script> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>考试系统</title>
</head>
<body ng-app="myApp" ng-controller="customersCtrl" style="    background-color: #488FAB;">
<div>
<li ng-repeat="x in names">
      <div  id="{{ x.id }}"> 
      	{{x.timu}}

   <br><input type="radio" ng-model="color.name" value="a">{{x.a}} 
   <br><input type="radio" ng-model="color.name" value="b">{{x.a}} 
   <br><input type="radio" ng-model="color.name" value="c">{{x.a}} 
   <br><input type="radio" ng-model="color.name" value="d">{{x.a}} 

<br><input type="checkbox" ng-model="a" value="111"> {{x.b}}
<br><input type="checkbox" ng-model="b"  ng-true-value="'a'"  ng-false-value="'b'"> {{x.b}}

 <tt>color = {{color.name | json}}</tt>
<br/>
   <tt>value1 = {{a | json}}</tt><br/>
  <tt>value2 = {{b}}</tt><br/>
<!--       	<br><input type="checkbox" name="{{x.id}}" id="cb1"  	  ng-click="a($event,x.id)"> {{x.a}} 
      	<br><input type="checkbox" name="{{x.id}}" id="cb2"> {{x.b}}
      	<br><input type="checkbox" name="{{x.id}}" id="cb3"> {{x.c}}
      	<br><input type="checkbox" name="{{x.id}}" id="cb4"> {{x.d}}  -->
      </div>
    </li>
</div>

</body>
</html>