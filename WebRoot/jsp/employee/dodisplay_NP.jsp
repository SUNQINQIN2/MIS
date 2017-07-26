<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.*"%>
<%
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
	List<Employee> empList=eoyeeDao.loadAll();
	request.setAttribute("empList",empList);
	//3
	request.getRequestDispatcher("display_NP.jsp").forward(request,response);
	
%>