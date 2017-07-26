<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>search</title>
</head>
<link href="../..css/Common.css" rel="stylesheet" type="text/css">
<style>
*{
    margin: 0px;
    padding: 0px;
   }
  body{
        background: url("../../img/24.jpg"); 
        background-repeat: no-repeat;
        background-size: cover;
    }
#body{
	width: 70%;
	height:550px;
	margin: 60px auto;
	background-color: #BACE96;
	padding: 25px;
	border-style: 1px #837878;
	border-radius: 10px;
}
#display{
	width: 90%;
	height: 500px;
	margin: 10px auto;
	background-color: white;
	padding: 20px; 
	border-radius: 10px;                       
}
#search{
	width: 400px;
	height: 40px;
	padding: 20px;
	margin: 10px auto;
	position: relative;
}
#result{
	position: absolute;
	width: 830px;
	height: 400px;
	background-color: white;
	border: 2px solid #837878;
	border-radius: 10px;

}
#text{
	margin-left: 20px;
	width: 200px;
	height: 30px;
}
#submit{
	width: 60px;
	height: 40px;
	margin-left: 20px;
}
tr:hover{
	background-color: #A39F9F;
}
tr{
	width: 829px;
	height: 30px;
	/* background-color: red; */
}
td{
	width: 164.5px;
	height: 30px;
}
</style>
<script type="text/javascript">
	 function checkForm()
	{	   
     /*var P=document.getElementsByTagName("nameE")[0].value;*/
     var P=document.getElementById("text").value;
     if(P==""||P==null)
     {    
      alert("名字不能为空！");
         //P.focus();
        return false;
     } 
     return true;
	}
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
	<div id="body">
		<div id="display">
			<div id="search">
			<form action="dosearch.jsp" method="post" onsubmit="return checkForm()">
				<input type="text" id="text" name="Ename" placeholder="请输入员工名">
				<input type="submit" value="搜索" id="submit">
		    </form>
			</div>
			   <div id="content">
			      <div id="result">
			      
					 		<table border="1" cellspacing="0"  id="tableColor">
					 		<tr>
					 		    <td>员工号</td>
					 		    <td>员工名</td>
					 		    <td>部门编号</td>
					 		    <td>工作名称</td>
					 		    <td>电话号码</td>
					 		    <td>雇佣日期</td>
					 		</tr>
					    <%
					 List<Employee> empList=(List<Employee>)request.getAttribute("empInfo");
					 if( empList != null) { 
					 			for(Employee emp : empList){
					 		%> 
					 			<tr class="lqq">
			         <td> <%=emp.getPayRoll() %> </td>
			         <td> <%=emp.getEname() %> </td>
			         <td> <%=emp.getDepartmentNum() %> </td>
			          <td> <%=emp.getJobTittle() %> </td>
			          <td> <%=emp.getTeNumber() %> </td>
			          <td> <%=emp.getEmpDate() %> </td>
			        </tr>
					 <% 
						}
					}%>
			        </table>
					<%Employee error=(Employee)request.getAttribute("error");
					if(error!=null){%>
					           <% out.println("没有这个人!请重新输入！"); 
					             %>  
					<%}%> 
			        </div>
			   </div>
	   </div>
	   </div>
</body>
</html>