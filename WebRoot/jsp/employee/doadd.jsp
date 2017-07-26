<%@page import="mis.EmployeeDaoJDBCImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="mis.Employee"%>
<%@page import="mis.EmployeeDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% //8
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String hireDate=request.getParameter("Hire_date");
	String empid=request.getParameter("Eid");
    Employee a=new Employee();
	EmployeeDao ed=new EmployeeDaoJDBCImpl();
	a.setEname(request.getParameter("Employee_Name"));
	a.setDepartmentNum(Integer.parseInt(request.getParameter("Dept_id")));	
	a.setTeNumber(request.getParameter("Tele_phone"));
	a.setJobTittle(request.getParameter("Job_name"));
	if(hireDate != "" && hireDate != null) {
		Date hereDate=sdf.parse(hireDate);
		a.setEmpDate(hereDate);
	}
	int emp=ed.countEmpByName(request.getParameter("Employee_Name"));
		if( empid == null || empid.equals(" ")  ) {//已经是添加功能
		    if(emp != 0) {
		        request.setAttribute("msg","3");
		        request.getRequestDispatcher("test_update.jsp").forward(request,response);
		    } else {
			    try{
					ed.addEmployee(a);
					request.setAttribute("msg","1");
			    }catch(Exception e){
			        e.printStackTrace();
			    }
			    request.getRequestDispatcher("test_update.jsp").forward(request,response);
		    }
		} else {
			a.setPayRoll(Integer.parseInt(empid));//添加员工id
			try{
			    ed.updateEmployee(a);
			    request.setAttribute("msg","2");
			} catch(Exception e){
		        e.printStackTrace();
		    }
		request.getRequestDispatcher("test_update.jsp").forward(request,response);
		}
%>