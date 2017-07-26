<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>displaAll</title>
</head>
<link href="../..css/Common.css" rel="stylesheet" type="text/css">
<style type="text/css">
*{
    margin: 0px;
    padding: 0px;
   }
  body{
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
         border-radius: 10px;
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
    tr:hover{
        background-color: #BDB9B9;
    }
    tr{
        width: 650px;
        height: 30px;
    }
    .lqq td{
        width: 110px;
        height: 30px;
    }
</style>
<script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
<script type="text/javascript">
function initEvent() {
//获取id为tableColor的表格
var tableCol = document.getElementById("tableColor");
//获取表格中所有的行
var trs = tableCol.getElementsByTagName("tr");
//循环遍历所有行
 for (var i = 0; i < trs.length; i++) {
    var tr = trs[i];
    //动态给当前行注册点击事件
    tr.onclick = tronClick;
    //设置鼠标样式
    tr.style.cursor = "pointer";
  }
}
function tronClick() {
  var tableCol = document.getElementById("tableColor");
  var trs = tableCol.getElementsByTagName("tr");
  for (var i = 0; i < trs.length; i++) {
    //若点击当前行，则变为黄色
    if (trs[i] == this) {
      trs[i].style.background = "yellow";
    }
    //其他所有行变为白色
    else {
      trs[i].style.background = "white";
    }
  }
}
</script>                           
<body  onload="initEvent()">
<jsp:include page="common.jsp"></jsp:include>
 <%
    List<Employee> empList=(List<Employee>)request.getAttribute("empList");
 %>
       <div id="content">
          <div id="result">
            <table  border="1" cellspacing="0"  id="tableColor" >
            <tr>
                <td>员工号</td>
                <td>手机号码</td>
                <td>员工名</td>
                <td>部门号</td>
                <td>雇佣日期</td>
                <td>工作名称</td>
            </tr>
                        <%
                                for(Employee emp : empList){
                            %>
                  <tr   class="lqq"  >
                    <td > 
                     <a href="doupdate.jsp?empId=<%=emp.getPayRoll() %>"><%=emp.getPayRoll() %></a>
                    </td>
                    <td ><%=emp.getTeNumber() %></td>
                    <td ><%=emp.getEname() %></td>
                    <td ><%=emp.getDepartmentNum() %></td>
                    <td ><%=emp.getEmpDate() %></td>
                    <td ><%=emp.getJobTittle() %></td>
                </tr>
           
     <% 
         }
     %>
            </table>
         
          </div>
       </div>
</body>
</html>