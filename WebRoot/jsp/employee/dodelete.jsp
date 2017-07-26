<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.List"%>
<% 
	String empId=request.getParameter("empId");//获取前台的值
	String employeeID=request.getParameter("employeeID");
	EmployeeDao eoyeeDao=new EmployeeDaoJDBCImpl();
	if(empId != null && empId != "") {
	    int emp=eoyeeDao.countEmpById(Integer.parseInt(empId));
        if(emp == 0) {
            request.setAttribute("msg","1");
            request.getRequestDispatcher("test_delete.jsp").forward(request,response);
        } else {
		Employee empInfo=eoyeeDao.findEmpById(Integer.parseInt(empId));
		request.setAttribute("empInfo",empInfo);//发送至前台
		request.getRequestDispatcher("test_delete.jsp").forward(request,response);
        }
	}
	if(employeeID != null && employeeID != "") {
			eoyeeDao.deleteEmployee(Integer.parseInt(employeeID)); 
	}
	if(employeeID != null && employeeID != "") {
	    Employee empInfo=eoyeeDao.findEmpById(Integer.parseInt(employeeID));
	    request.setAttribute("empInfo",empInfo);//发送至前台
		request.getRequestDispatcher("test_delete.jsp").forward(request,response);
    }
%>
