<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@page import="java.util.*"%>
<%-- <%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragrma","no-cache");
response.setDateHeader("Expires",0);
%> --%>
<%
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
	List<Employee> empList=eoyeeDao.loadAll();
	request.setAttribute("empList",empList);
	request.getRequestDispatcher("test_displayAll.jsp").forward(request,response);
%>
