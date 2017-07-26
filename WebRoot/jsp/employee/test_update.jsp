<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>update or add</title>
<script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
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
#body{
    width:30%;
    height:550px;
    background-color: #AACCA6;
    margin: 100px auto;
    border: 1px solid #AACCA6;
    border-radius: 10px;
}
#info{
    width: 300px;
    height: 400px;
    margin: 50px auto;
    background-color: white;
    border: 1px solid white;
     border-radius: 10px;
}
#update{
    margin: 30px 125px;
    width: 50px;
}
#title{
    margin: 10px auto;
    width: 100px;
    
}
tr{
  width: 300px;
  height: 30px;
  text-align: center;
  line-height: 30px;
  /* background-color: red; */
}
td{
  width: 150px;
  height: 30px;
}
input{
  width: 150px;
  height: 30px;
}
</style>

<script type="text/javascript">

        $(function(){
           
           //文本框失去焦点后
           $('#Employee_Name').blur(function(){
                 var $parent = $(this).parent();
                 $parent.find(".formtips").remove();
                //验证名称
                if( $(this).is('#Employee_Name') ){
                       if( this.value=="" || ( this.value!="" && !/^[A-Za-z][A-Za-z\s]*[A-Za-z]$/.test(this.value) ) ){
                           var errorMsg = '请输入都是英文的名称';
                           $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                       }
                }
           });
            $('#Dept_id').blur(function(){
                var $parent =$(this).parent();
                $parent.find(".formtips").remove();
                //验证部门编号
                if( $(this).is('#Dept_id') ){
                   if( this.value=="" || ( this.value!="" && !/^[0-9]*$/.test(this.value) ) ){
                         var errorMsg = '请输入部门编号为数字';
                         $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                   }
                }
            });
            $('#Hire_date').blur(function(){
                var $parent = $(this).parent();
                $parent.find(".formtips").remove();
                //验证部门编号
                if( $(this).is('#Hire_date') ){
                   if( this.value == "" ){
                         var errorMsg = '请选择日期';
                         $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                   }
                }
            });
            $('#Tele_phone').blur(function(){
                var $parent =$(this).parent();
                $parent.find(".formtips").remove();
                //验证电话号码
                if( $(this).is('#Tele_phone') ){
                   if( this.value=="" || ( this.value!="" && !/^1[34578]\d{9}$/.test(this.value) ) ){
                         var errorMsg = '请输入正确的手机号码格式';
                         $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                   }
                }
            });
            $('#Job_name').blur(function(){
                var $parent =$(this).parent();
                $parent.find(".formtips").remove();
                //验证职位名称
                if( $(this).is('#Job_name') ){
                       if( this.value=="" || ( this.value!="" && !/^[A-Za-z][A-Za-z\s]*[A-Za-z]$/.test(this.value) ) ){
                           var errorMsg = '请输入都是英文的职位名称';
                           $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                       }
                } 
            });
           //end blur
           
           //提交，最终验证。
            $('#update').click(function(){
                   $("form :input.required").trigger('blur');
                   var numError = $('form .onError').length;
                   if(numError){
                       return false;
                   } 
                   $(".formtips").remove();
                   $('#addForm').submit();
            });
           
       });
       
    window.onload = function(){
            afterSub();
            
    }

     function afterSub(){
        var msg=$("#msg").val();
        if(msg == "1") {
            alert("添加成功");
            window.location.href="dodisplay.jsp";//重新请求数据库
        }
        else if(msg == "2") {
            alert("修改成功");
            window.location.href="dodisplay.jsp";
        } else if(msg == "3") {
            alert("名称已存在，请重新输入！！！");
            return false;
        }
    }

</script>

</head>
<body>
<jsp:include page="common.jsp"></jsp:include>
    <div id="body">
             <div id="info">
                <input id="msg" type="hidden" value="${msg}"/>
    <form action="doadd.jsp" id="addForm" method="post" name="form1">
          <table border="1" cellspacing="0" >
                  <%
     Employee emp=(Employee)request.getAttribute("empInfo");
            if(emp != null ) { 
        %>
                    <tr>
                      <td>员工名：</td>
                      <td>
                        <input type="hidden" name="Eid" id="Eid" size="3" value="<%=emp.getPayRoll() %>" />
                        <input type="text" name="Employee_Name" id="Employee_Name" class="required" value="<%=emp.getEname() %>" ></td>
                    </tr>
                    <tr>
                      <td>部门号：</td>
                      <td> <input type="text" maxlength="3" name="Dept_id" id="Dept_id" class="required" value="<%=emp.getDepartmentNum() %>" ></td>
                    </tr>
                    <tr>
                      <td>雇佣日期：</td>
                      <td><input type="text" name="Hire_date" id="Hire_date" class="required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<%=emp.getEmpDate() %>" ></td>
                    </tr>
                    <tr>
                      <td>电话号码：</td>
                      <td><input type="text" name="Tele_phone" id="Tele_phone" class="required" value="<%=emp.getTeNumber() %>" ></td>
                    </tr>
                    <tr>
                      <td>工作名称：</td>
                      <td><input type="text" name="Job_name" id="Job_name" class="required" value="<%=emp.getJobTittle() %>"></td>
                    </tr>
        <%
            } else {
           %>
                    <tr>
                      <td>员工名：</td>
                      <td><input type="text" name="Employee_Name" id="Employee_Name" class="required"  ></td>
                    </tr>
                    <tr>
                      <td>部门号：</td>
                      <td> <input type="text" name="Dept_id" id="Dept_id" class="required"  ></td>
                    </tr>
                    <tr>
                      <td>雇佣日期：</td>
                      <td><input type="text" name="Hire_date" id="Hire_date" class="required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  ></td>
                    </tr>
                    <tr>
                      <td>电话号码：</td>
                      <td><input type="text" name="Tele_phone" id="Tele_phone" class="required"  ></td>
                    </tr>
                    <tr>
                      <td>工作名称：</td>
                      <td><input type="text" name="Job_name" id="Job_name" class="required" ></td>
                    </tr>
           <%
            }
            %>
                  </table>
                <div>
                <input type="button" value="提交" id="update" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>