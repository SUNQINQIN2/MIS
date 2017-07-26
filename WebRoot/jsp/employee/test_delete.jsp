<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
	<title>delete</title>
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
	#body{
    width: 700px;
	height:440px;
	background-color: #AACCA6;
	margin: 100px auto;
	border:1px solid white;
	border-radius: 10px;
	}
	#search{
		width: 300px;
		height: 50px;
		background-color: #E4E2E2;
		margin: 50px auto;
		text-align: center;
		word-spacing: 20px; 
		line-height: 50px;
		border-radius: 10px;
	}
	#result{
		width:560px;/* 560 */
		height: 200px;
		margin:0px auto;
		text-align: center;
		background-color: white;
		border:1px solid white;
	    border-radius: 10px;
	    overflow: scroll;
	}
	table{
		width: 540px;	
	}
	
	 tr:hover{
        background-color: #BBB8B8;
    }
    tr{ 
    	width: 540px;
      height: 30px;
      /* background-color: red; */
    }
    input{
    	width: 88.5px;
        height: 30px;
      }
    tr td{
        width: 90px;
        /* background-color: red; */
    }
    #deleteS{
    	margin-top: 20px;
    	margin-left: 310px;
    }
</style>
<script src="jquery-3.1.1.js" ></script>
<script type="text/javascript">
	 function checkForm()
	{	   
     /*var P=document.getElementsByTagName("nameE")[0].value;*/
     var P=document.getElementById("text").value;
     if(P== "" || P == null)
     {    
      alert("员工号不能为空！");
         //P.focus();
        return false;
     } 
     return true;
	}
	 function sub(){
		 document.getElementById("empForm").submit();
	 }
	 
	 window.onload = function(){
		    afterSub();
		}

		 function afterSub(){
		    var msg=$("#msg").val();
		    if(msg == "1") {
		        alert("编号不存在");
		        return false;
		    }
		}
	 
	 function deleteemp() {
	        if (confirm("确认删除吗 ？ ")) {
	            var employeeID=document.getElementById("employeeID").value;
	            window.location.href="dodelete.jsp?employeeID="+employeeID;
	        } else {
	            return false;
	        }
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
<body  onload="initEvent()">
<jsp:include page="common.jsp"></jsp:include>
	<div id="body">
	<input type="hidden" id="msg" value="${msg}"/>
		<form action="dodelete.jsp" id="empForm" method="post">
			<div id="search">
				<input type="text" name="empId" id="text" placeholder="请输入员工号"  maxlength="3" style="width:150px;"autofocus required>
			    <input type="button" value="确认"  style="width:50px;height=40px" onclick="sub()"/>
			</div>
			<div id="result">
			<table border="1" cellspacing="0" id="tableColor">	
			<tr>
			     <td>员工号</td>
			     <td>员工名</td>
			     <td>部门编号</td>
			     <td>雇佣日期</td>
			     <td>工作名称</td>
			     <td>电话号码</td>
			</tr>
				<%
							Employee emp=(Employee)request.getAttribute("empInfo");
							if(emp != null ) { 
						%>
				<tr   >
	       <td id="empId">
                <%=emp.getPayRoll() %>
	       </td>
	       	<td>
                <%=emp.getEname() %>
	       	</td>
	         <td>
	         	<%=emp.getDepartmentNum() %>
	         </td>
	       <td>
	       <%=emp.getEmpDate() %>
	       </td>
	       <td>
<%=emp.getJobTittle() %>
	       </td>
	         <td>  
           <%=emp.getTeNumber() %>
	         </td>
	        </tr>
			<% 
				}
			%>
	        </table>		
			</div>	
		 </form>
		 <form action="dodelete.jsp" method="post">
		 		<%
		 					Employee employee=(Employee)request.getAttribute("empInfo");
		 					if(employee != null ) { 
		 				%>
		 			<input id="employeeID" name="employeeID" type="hidden" value="<%=employee.getPayRoll() %>" />
		 				<%
		 					}
		 				%>   
		 	<div id="deleteS"><input type="button" value="删除" id="delete" onclick="deleteemp()" style="width:50px;height=30px" ></div>
		 </form>
	</div>
</body>
</html>