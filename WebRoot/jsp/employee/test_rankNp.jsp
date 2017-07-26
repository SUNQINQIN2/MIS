<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>rankNp</title>
</head>
<link href="../..css/Common.css" rel="stylesheet" type="text/css">

<style type="text/css">
 *{
   	margin: 0px;
   	padding: 0px;
   }
  body{
	    background: url("../../img/24.jpg"); 
		background-repeat: no-repeat;
		background-size: cover;
	}
	#content{
		width:300px;
		height: 400px;
		background-color: #D2C9CF; 
		margin: 80px auto;
		border:3px black;
		border-style: solid;
		border:1px solid black;
		border-radius: 10px;
	}
	#result{
		width: 280px;
		height: 380px;
		background-color: white;
        overflow: scroll;
        border:1px solid black;
		border-radius: 10px; 
	}
	tr:hover{
		background-color: #A7A2A2;
	}
	.lqq{
		width: 280px;
		height: 30px;
		/* background-color: red; */
	}
	.lqq td{
		width: 140px;
		height: 30px;
	}
</style>
<script src="jquery-3.1.1.js" ></script>
<script type="text/javascript">
	function initEvent() {
//获取id为tableColor的表格
var tableCol = document.getElementById("tableColor");
//获取表格中所有的行
var trs = tableCol.getElementsByTagName("tr");
//循环遍历所有行
 for (var i = 0; i < trs.length; i++) {
    var tr = trs[i];
    //动态给当前行注册点击事件
    tr.onclick = tronClick;
    //设置鼠标样式
    tr.style.cursor = "pointer";
  }
}
function tronClick() {
  var tableCol = document.getElementById("tableColor");
  var trs = tableCol.getElementsByTagName("tr");
  for (var i = 0; i < trs.length; i++) {
    //若点击当前行，则变为黄色
    if (trs[i] == this) {
      trs[i].style.background = "yellow";
    }
    //其他所有行变为白色
    else {
      trs[i].style.background = "white";
    }
  }
  }                 
</script>
<body onload="initEvent()">
<jsp:include page="common.jsp"></jsp:include>
 <%
 	List<Employee> empList=(List<Employee>)request.getAttribute("empList");
 %>
	   <div id="content">
	      <div id="result">
            <table border="1" cellspacing="0" id="tableColor">
            <tr>
                <td>员工名</td>
                <td>电话号码</td>
            </tr>
	       <%
	     			for(Employee emp : empList){
	     		%>
            	<tr onclick="selectArow();" class="lqq">
            		<td><%=emp.getEname() %></td>
	                <td><%=emp.getTeNumber() %></td>

            	</tr>
	<% 
		}
	%>
            </table>
	      </div>
	   </div>
</body>
</html>