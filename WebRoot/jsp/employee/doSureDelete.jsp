<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.List"%>
<% 
	int empId=Integer.parseInt(request.getParameter("empId"));
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
		eoyeeDao.deleteEmployee(empId);
		//request.setAttribute("empInfo",empInfo);
		request.getRequestDispatcher("delete.jsp").forward(request,response);
%>