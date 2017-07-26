<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title>displaAll</title>
</head>
<style type="text/css">
	#content{
		width:70%;
		height: 400px;
		background-color: #D2C9CF; 
		margin: 80px auto;
		border:3px black;
		border-style: solid;
		padding:30px;
	}
	#result{
		width: 95%;
		height: 380px;
		background-color: white;
        overflow: scroll;
        padding-left:40px;
        
	}
</style>
<body>
 <%
	List<Employee> empList=(List<Employee>)request.getAttribute("empList");
%>  
	   <div id="content">
	      <div id="result">
	      <%
			for(int i=0;i<empList.size();i++){
			Employee emp=empList.get(i);
		%>
	        <a href="doupdate.jsp?empId=<%=emp.getPayRoll() %>"><input value="<%=emp.getPayRoll() %>"/></a>
	        <input value="<%=emp.getTeNumber() %>"/>
	        <input value="<%=emp.getEname() %>"/>
	        <input value="<%=emp.getDepartmentNum() %>"/>
	        <input value="<%=emp.getEmpDate() %>"/>
	        <input value="<%=emp.getJobTittle() %>"/>
		   <% 
	}
		   %>
	      </div>
	   </div>
</body>
</html>