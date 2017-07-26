<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>displayNP</title>
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
<body>
<jsp:include page="common.jsp"></jsp:include>
 <!-- <%
 	List<Employee> empList=(List<Employee>)request.getAttribute("empList");
 %>   -->
	   <div id="content">
	      <div id="result">
	         <table border="1" cellspacing="0" id="tableColor">
            <tr>
                <td>员工名</td>
                <td>电话号码</td>
            </tr>
	    <!--   <%
	    			for(int i=0;i<empList.size();i++){
	    			Employee emp=empList.get(i);
	    		%> -->
	    		<tr onclick="selectArow();" class="lqq">
            		<td><%=emp.getEname() %></td>
	                <td><%=emp.getTeNumber() %></td>

            	</tr>
	    <!--     
	    		   <% 
	    	}
	    		   %> -->
	     </table>
	      </div>
	   </div>
</body>