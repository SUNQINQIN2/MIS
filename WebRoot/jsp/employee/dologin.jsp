<%@page import="mis.common.EncoderMD5"%>
<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="mis.UserModel"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String username=request.getParameter("username");
	String password=request.getParameter("password");
	UserModel user=new UserModel();
	user.setUserName(username);
	password=EncoderMD5.str2md5(password);
	user.setPassword(password);
	EmployeeDao employeeDao=new EmployeeDaoJDBCImpl();
	String ee=employeeDao.login(user);
	request.setAttribute("msg", ee);
	request.getRequestDispatcher("login.jsp").forward(request, response);
%>


