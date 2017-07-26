<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.List"%>
<% 
	String empId=request.getParameter("empId");
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
		Employee empInfo=eoyeeDao.findEmpById(Integer.parseInt(empId));
		if(empInfo != null){
		    request.setAttribute("empInfo",empInfo);
		}
		request.getRequestDispatcher("test_update.jsp").forward(request,response);
%>