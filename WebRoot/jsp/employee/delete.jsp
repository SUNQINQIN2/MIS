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
	#body{
     width: 60%;
	height:440px;
	background-color: #AACCA6;
	margin: 100px auto;
	padding-top: 60px;
	}
	#search{
		width: 280px;
		height: 50px;
		background-color: #E4E2E2;
		margin: 0px auto;
		padding-left: 30px;
		word-spacing: 20px;
		line-height: 50px;
	}
	#result{
		width: 95%;
		height: 200px;
		margin: 10px auto;
		background-color: white;

	}
	#delete{
	margin-left: 360px;
	}
</style>
<script type="text/javascript">
	 function checkForm()
	{	   
     /*var P=document.getElementsByTagName("nameE")[0].value;*/
     var P=document.getElementById("text").value;
     if(P==""||P==null)
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
	            var employeeID=document.getElementById("empId").value;
	            window.location.href="dodelete.jsp?employeeID="+employeeID;
	        } else {
	            return false;
	        }
	    }
	 
</script>
<body>
	<div id="body">
	<input type="hidden" id="msg" value="${msg}"/>
		<form action="dodelete.jsp" id="empForm" method="post">
			<div id="search">
				<input type="text" name="empId" id="text"  maxlength="3" autofocus required>
			    <input type="button" value="确认"  onclick="sub()"/>
			</div>
			<div id="result">
				<%
			Employee emp=(Employee)request.getAttribute("empInfo");
			if(emp != null ) { 
		%>
	        <input type="text" id="empId" value="<%=emp.getPayRoll() %>"/>
	        <input type="text" value="<%=emp.getEname() %>"/>
	        <input type="text" value="<%=emp.getDepartmentNum() %>"/>
	        <input type="text" value="<%=emp.getEmpDate() %>"/>
	        <input type="text" value="<%=emp.getJobTittle() %>"/>
	         <input type="text" value="<%=emp.getTeNumber() %>"/>
			<% 
				}
%>  
			</div>	
		 </form>
		 <form action="dodelete.jsp" method="post">
		 <%-- <%
			Employee employee=(Employee)request.getAttribute("empInfo");
			if(employee != null ) { 
		%>
		 	<input name="employeeID" type="hidden" value="<%=employee.getPayRoll() %>" />
			<%
				}
%>   --%>
		 	<input type="button" value="删除" id="delete" onclick="deleteemp()"/>
		 </form>
	</div>
</body>
</html>