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
var num='';
var answer='';
   


var id = '<%=session.getAttribute("id")%>';

var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
	$http.get("userController/test.do")
	.success(function(response) {$scope.names = response.data;});

	 $scope.next = function(x,y) {
        num=num+";"+y.id;
        answer=answer+";"+x;
        console.log(num);
        console.log(answer);
var i= $("#t1").val()+$("#t2").val();
console.log(y.length);
        // var i= $("#t1").val();
// alert(a);
    }   ;
    $scope.next3 = function(x) {
    	console.log(x.id+"p");
    	if(x.id==''){
    		alert("考试完成");
    	}
    	for(var j=1;j<=x.id;j++){
    		$("#"+j).hide();
    	}
var i=x.id+1;
$("#"+i).show();
    }
});

})();

</script>
<script type="text/javascript"> 
function next4(){
$("#1").show();
    		$("#r5").hide();
}
</script> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>考试系统</title>
</head>
<body ng-app="myApp" ng-controller="customersCtrl" style="    background-color: #488FAB;">
<div>
	  <input style="display:none" id="yy" value="{{names.lenth}}">

<button id="r5" onclick="next4();">开始答题</button>

<li ng-repeat="x in names" style="list-style-type:none;">

      <div  id="{{ x.id }}" style="display:none"> 
      	{{x.timu}}

<br><input type="checkbox" ng-model="a"  ng-true-value="'a'"  ng-false-value="''"> {{x.a}}
<br><input type="checkbox" ng-model="b"  ng-true-value="'b'"  ng-false-value="''"> {{x.b}}
<br><input type="checkbox" ng-model="c"  ng-true-value="'c'"  ng-false-value="''"> {{x.c}}
<br><input type="checkbox" ng-model="d"  ng-true-value="'d'"  ng-false-value="''"> {{x.d}}
<br>
<button ng-click="next(a+b+c+d,x);next3(x);">下一题</button>

<br>
  <input style="display:none" id="t{{x.id}}" value="{{a}}{{b}}{{c}}{{d}}">你选择的答案 = {{a}}{{b}}{{c}}{{d}}</tt><br/>

      </div>
    </li>

</div>

</body>
</html>