<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.List"%>
<% 
	String empName=request.getParameter("Ename");
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
		List<Employee> empInfo=eoyeeDao.findEmpByName(empName);
		if(empInfo == null){Employee employeeString=new Employee();
		employeeString.setError("没有此人！");
		request.setAttribute("error",employeeString);
		}else{
		request.setAttribute("empInfo",empInfo);
		}
		request.getRequestDispatcher("test_search.jsp").forward(request,response);
%>