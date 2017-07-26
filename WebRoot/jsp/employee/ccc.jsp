<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>displaAll</title>
</head>
<style type="text/css">

  body{
	    margin: 0px;
	    padding: 0px;
        background: url("../../img/24.jpg"); 
        background-repeat: no-repeat;
        background-size: cover;
    }
    #content{
        width:700px;
        height: 400px;
        background-color: #D2C9CF; 
        margin: 80px auto;
        border:3px solid black;
    }
    #result{
        width: 650px;
        height: 350px;
        margin: 25px auto;
        background-color: white;
        overflow: scroll;
        border:1px solid black;
        border-radius: 10px;
    }
    
    input{
        text-align: center;
        line-height: 30px;

    }
    tr:hover{
        background-color: #BAB4B4;
    }
    .lqq td{
        width:100px;
        height:30px;
    }
</style>
<script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
<script type="text/javascript">
     var pre;//原来的节点，假设原来的背景颜色为白色，点击变为#e6f0fc
        function selectArow(sObject) {
            $(sObject).attr("style", "background-color: yellow");
            if (pre != null && pre != sObject) $(pre).attr("style", "background-color: white");
                                pre = sObject;
        } 
</script>
<body>
 <%
    List<Employee> empList=(List<Employee>)request.getAttribute("empList");
 %>
       <div id="content">
          <div id="result">
            <table   border="1" cellspacing="0">
                        <%
                                for(int i=0;i<empList.size();i++){
                                Employee emp=empList.get(i);
                            %>
                <tr   class="lqq" onclick="selectArow(this);" >
                    <td> 
                     <a href="doupdate.jsp?empId=<%=emp.getPayRoll() %>"><%=emp.getPayRoll() %></a>
                    </td>
                    <td><%=emp.getTeNumber() %></td>
                    <td><%=emp.getEname() %></td>
                    <td><%=emp.getDepartmentNum() %></td>
                    <td><%=emp.getEmpDate() %></td>
                    <td><%=emp.getJobTittle() %></td>
                </tr>
           
        <% 
            }
        %>
            </table>
         
          </div>
       </div>
</body>
</html>