
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="mis.Employee"%>
<html>
  <head>
    <title>My JSP 'www.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%Employee emp=(Employee)request.getAttribute("emp"); %>    
		<input  name="empId" value="<%=emp.getEname() %>"/>
		<input  name="empId" value="<%=emp.getJobTittle() %>"/>
  </body>
</html>
