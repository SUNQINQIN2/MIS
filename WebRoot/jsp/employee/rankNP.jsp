<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>displaAll</title>
</head>
<link href="../..css/Common.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#content{
		width:30%;
		height: 400px;
		background-color: #D2C9CF; 
		margin: 80px auto;
		border:3px black;
		border-style: solid;
		padding:30px;
	}
	#result{
		width: 80%;
		height: 380px;
		background-color: white;
        overflow: scroll;
        padding-left:30px;
        
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
		    <input type="text" value="<%=emp.getEname() %>"/>
	        <input type="text" value="<%=emp.getTeNumber() %>"/>
	        
		   <% 
	}
		   %>
	      </div>
	   </div>
</body>
</html>