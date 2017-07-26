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
<style>
#body{
	width: 70%;
	height:550px;
	margin: 60px auto;
	background-color: #BACE96;
	padding: 25px;
	border-style: 1px #837878;
}
#display{
	width: 90%;
	height: 500px;
	margin: 10px auto;
	background-color: white;
	padding: 20px;                         
}
#search{
	width: 400px;
	height: 40px;
	padding: 20px;
	margin: 10px auto;
	background-color: ;
	position: relative;
}
#result{
	position: absolute;
	width: 830px;
	height: 400px;
	background-color: white;
	border: 2px solid #837878;
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
</script>
<body>
<jsp:include page="common.jsp"></jsp:include>
	<div id="body">
		<div id="display">
			<div id="search">
			<form action="dosearch.jsp" method="post" onsubmit="return checkForm()">
				<input type="text" id="text" name="Ename">
				<input type="submit" value="搜索" id="submit">
		    </form>
			</div>
			<div id="result">
	   <div id="content">
	      <div id="result">
			   <%
			   List<Employee> empList=(List<Employee>)request.getAttribute("empInfo");
			   if( empList != null) { 
			for(int i=0;i<empList.size();i++){
			Employee emp=empList.get(i);
		%>
	        <input type="text" value="<%=emp.getPayRoll() %>"/>
	        <input type="text" value="<%=emp.getEname() %>"/>
	        <input type="text" value="<%=emp.getDepartmentNum() %>"/>
	        <input type="text" value="<%=emp.getJobTittle() %>"/>
	        <input type="text" value="<%=emp.getTeNumber() %>"/>
			<% 
				}
			}%>
			<%Employee error=(Employee)request.getAttribute("error");
			if(error!=null){%>
           <% out.println("没有这个人!请重新输入！"); 
             %>  
			<%}%>
	        </div>
	   </div>
	   </div>
	   </div>
	   </div>
</body>
</html>