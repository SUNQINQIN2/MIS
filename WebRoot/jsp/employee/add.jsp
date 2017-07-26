
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mis.Employee"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>add</title>
	<script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
</head>
<style type="text/css">
#body{
	width: 60%;
	height:500px;
	background-color: #AACCA6;
	margin: 100px auto;
	padding-top: 100px;
	/* padding-left: 30px; */
}
#insert{
	width: 300px;
	height: 400px;
	margin: 0px auto;
	background-color: #E6E3E3;
	padding-left: 20px;
	padding-top: 50px;
	line-height: 40px;
}
#s{
    float: right;
    margin-top: 30px;
    margin-right: 230px;
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
                       if( this.value=="" || ( this.value!="" && !/^[a-zA-Z]*$/g.test(this.value) ) ){
                           var errorMsg = '请输入都是英文的职位名称';
                           $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                       }
                } 
            });
           //end blur
           
           //提交，最终验证。
            $('#su').click(function(){
                   $("form :input.required").trigger('blur');
                   var numError = $('form .onError').length;
                   if(numError){
                       return false;
                   } 
                   $(".formtips").remove();
                   $('#addForm').submit();
            });
    	   
       });
       
       /* function checkForm(){
    	    for(var i = 0;i < document.form1.elements.length-1;i++){
    	       if(document.form1.elements[i].value == ""){
    	    	    alert("当前表单不能有空项！");
    	    	    //document.form1.elements[i].focus();
    	    	    return false;
    	           }
    	        } 
    	     var ename=document.getElementById("Employee_Name").value;
    	     var re=/^[a-zA-Z]*$/g;
    	     if(!re.test(ename)) {
    	    	 alert(123123);
    	    	 return false;
    	     }
    	     var deptid=document.getElementById("Dept_id").value;
             if(isNaN(deptid)) {
                 alert('请输入数字');
                 return false;
             }
       } */

    window.onload = function(){
    	    afterSub();
    	    
    	    }

	 function afterSub(){
	    var msg=$("#msg").val();
	    if(msg == "1") {
	        alert("添加成功");
	        window.location.href="dodisplay.jsp";
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
<body>
   <div id="body">
   	  <input id="msg" type="hidden" value="${msg}"/>
   	<form action="doadd.jsp" id="addForm" method="post" name="form1">
   	  <div id="insert">
   	  <%
   	        Employee emp=(Employee)request.getAttribute("empInfo");
            if(emp != null ) { 
        %>
   	  	   <input type="hidden" name="Eid" id="Eid" maxlength="3" placeholder="请输入编号" value="<%=emp.getPayRoll() %>">	
   	  	   <input type="text" id="Employee_Name" name="Employee_Name" class="required" placeholder="请输入名称" value="<%=emp.getEname() %>">	
   	  	   <input type="text" id="Dept_id" name="Dept_id" class="required" placeholder="请输入部门编号" value="<%=emp.getDepartmentNum() %>">	
   	  	   <input type="text" id="Hire_date" name="Hire_date" class="required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入日期" value="<%=emp.getEmpDate() %>">	
   	  	   <input type="text" name="Tele_phone" id="Tele_phone" class="required" placeholder="请输入手机号码" value="<%=emp.getTeNumber() %>">	
   	  	   <input type="text" name="Job_name" id="Job_name" class="required" placeholder="请输入职位名称" value="<%=emp.getJobTittle() %>">	
   	  	   <%
            } else {
   	  	   %>
   	  	   <input type="hidden" name="Eid" id="Eid" maxlength="3"  placeholder="请输入编号" >  
           <input type="text" id="Employee_Name" name="Employee_Name" class="required" placeholder="请输入名称" >    
           <input type="text" id="Dept_id" name="Dept_id" class="required" placeholder="请输入部门编号" >    
           <input type="text" id="Hire_date" name="Hire_date" class="required" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入日期" >    
           <input type="text" name="Tele_phone" id="Tele_phone" class="required" placeholder="请输入手机号码" >  
           <input type="text" name="Job_name" id="Job_name" class="required" placeholder="请输入职位名称" > 
<%

            }
%>                
   	  	   <input type="button" value="提交" id="su" onclick="checkForm()">
   	  </div>
   	 </form>
   </div>
</body>
</html>