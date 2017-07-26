<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改</title>
<style type="text/css">
*{
    margin: 0px;
    padding: 0px;
}
#body{
    width:30%;
    height:550px;
    background-color: #AACCA6;
    margin: 100px auto;
    border: 1px solid #AACCA6;
}
#info{
    width: 300px;
    height: 400px;
    margin: 50px auto;
    background-color: white;
    border: 1px solid white;
}
#t_id,#t_name,#t_no,#t_date,#t_phone,#t_job
{
    width: 150px;
     height:20px; 
     margin: 10px 30px;
}
#update{
    margin: 30px 200px;
    width: 50px;
}
#title{
    margin: 10px auto;
    width: 100px;
    
}
</style>
</head>
<body>
<jsp:include page="common.jsp"></jsp:include>
    <div id="body">
             <div id="info">
              <div id="title"><h3>修改信息</h3></div>
                <form method="post">
                <div>
                  <span>员工号：</span>
                  <input type="text" name="T_id" id="t_id" size="3">
                </div>
                <div>
                  <span>员工名：</span>
                  <input type="text" name="T_name" id="t_name">
                </div>
                <div>
                  <span>部门号：</span>
                  <input type="text" name="T_no" id="t_no">
                </div>
                <div>
                  <span>雇佣日：</span>
                  <input type="text" name="T_date" id="t_date">
                </div>
                <div>
                  <span>电话号：</span>
                  <input type="text" name="T_phone" id="t_phone">
                </div>
                <div>
                  <span>工作名：</span>
                  <input type="text" name="T_job" id="t_job">
                </div>
                <div>
                <input type="submit" value="修改" id="update">
                </div>
            </form>
        </div>
    </div>
</body>
</html>