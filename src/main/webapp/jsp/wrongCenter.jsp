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
    var index=1;



    var id = '<%=session.getAttribute("id")%>';

    var app = angular.module('myApp', []);
    app.controller('customersCtrl', function($scope, $http) {
        $http.get("userController/wrongcenter.do")
        .success(function(response) {$scope.names = response.data;});
        $scope.next = function(x,y) {
            if(index==1){
                num=y.id;
                answer=x;
                index++;
            }
            else{
                num=num+";"+y.id;
                answer=answer+";"+x;
            }
            var i= $("#t1").val()+$("#t2").val();
        }   ;
        $scope.next3 = function(x,y,z) {
            if(y==true){


                alert("全部完成");

            }
            for(var j=1;j<=x.id;j++){
                $("#"+j).hide();
            }
            // z++;
            console.log(z);
            // var i=x.id+1;
            $("#"+z).show();
        }
    });

})();

</script>
<script type="text/javascript"> 
function next4(){
    $("#r5").hide();
    $("#"+$("#t33").val()).show();

}
</script> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>考试系统</title>
</head>
<body ng-app="myApp" ng-controller="customersCtrl" style="    background-color: #488FAB;">
    <div>


        <button id="r5" onclick="next4();">回顾错题</button>
        <!-- {{names.length}} -->
        <input id="t33" value="{{names[0].id}}" style="display:none">

        <li ng-repeat="x in names" style="list-style-type:none;">
          <div  id="{{ x.id }}" style="display:none"> 
            {{x.timu}}

            <br><input style="display:none" type="checkbox" ng-model="a"  ng-true-value="'A'"  ng-false-value="''"> {{x.a}}
            <br><input style="display:none" type="checkbox" ng-model="b"  ng-true-value="'B'"  ng-false-value="''"> {{x.b}}
            <br><input style="display:none" type="checkbox" ng-model="c"  ng-true-value="'C'"  ng-false-value="''"> {{x.c}}
            <br><input style="display:none" type="checkbox" ng-model="d"  ng-true-value="'D'"  ng-false-value="''"> {{x.d}}
            <br>
            正确答案：{{x.zhengque}}
            <br>
            <button ng-click="next(a+b+c+d,x);next3(x,$last,names[$index+1].id);">下一题{{}}</button>

            <br>
            <!--   <input style="display:none" id="t{{x.id}}" value="{{a}}{{b}}{{c}}{{d}}">你选择的答案 = {{a}}{{b}}{{c}}{{d}}</tt><br/> -->

        </div>
    </li>

</div>

</body>
</html>