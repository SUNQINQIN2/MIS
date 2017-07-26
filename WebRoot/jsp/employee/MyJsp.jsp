<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css">
  </head>
  <style>
   *{
	margin: 0px;
}
#title{
       width: 50%;
       height: 100px;
       background-color:white;
       margin: 10px auto;
       font-size: 40px;
       text-align: center;
       line-height:100px;
       text-shadow:5px 5px 2px #B2B5AC;        
	}
	#body{
		width: 80%;
		height:800px;
		background-color:#D9E8D1;
		margin:0px auto;
		padding: 20px;
	}
	
	#menu{
		width: 85%;
		height: 690px;
		margin:10px auto;
		background-color:#92C367; 
		position: relative;
		/* opacity: 0.5; */
	}
	table{
		position: absolute;
		width: 95%;
		height: 670px;
		margin: 10px 25px;
        background-color: white;
	}
	#d1,#d2,#d3,#d4,#d5,#d6,#d7{
		width: 50px;
		height: 50px;
		background-color: #E1C686;
		border-radius: 25px;
		margin: 10px auto; 
		font-size: 22px;
		line-height: 50px;
	}
    .option,.option1,.option2,.option3,.option4,.option5,.option6,.option7{
    	width: 100px;
    	font-size: 20px;
    }
    a{
      text-decoration: none;
    }
  </style>
  <body>
    <div id="body">
		<div id="title">人力资源管理系统主菜单</div>
		<div id="menu">
			<table border="1">
				<tr>
					<th class="option">选项</th>
					<th>描述</th>
					<th class="option">确定</th>
				</tr>
				<tr>
					<th class="option1"><div id="d1">1</div></th>
					<th>1.Displaying all current employee records on the screen.</th>
					<th><a href="dodisplayAll.jsp"><input type="button" value="确定" id="sure1"></a></th>
				</tr>
				<tr>
					<th class="option2"><div id="d2">2</div></th>
					<th>2.Displaying all current employee records (formatted and sorted) on the screen.</th>
					<th class="button2"><a href="dodisplay.jsp"><input type="button" value="确定" id="sure2"></a></th>
				</tr>
				<tr>
					<th class="option3"><div id="d3">3</div></th>
					<th>3.Displaying only names and phone numbers on the screen.</th>
					<th class="button3"><a href="dodisplay_NP.jsp"><input type="button" value="确定" id="sure3"></a></th>
				</tr>
				<tr>
					<th class="option4"><div id="d4">4</div></th>
					<th>4.Displaying only names and phone numbers (formatted and sorted) on the screen. （名字）</th>
					<th class="button4"><a href="dorankNP.jsp"><input type="button" value="确定" id="sure4"></a></th>
				</tr>
				<tr>
					<th class="option5"><div id="d5">5</div></th>
					<th>5.Searching for and displaying specific employee record(s).</th>
					<th class="button5"><a href="test_search.jsp"><input type="button" value="确定" id="sure5"></a></th>
				</tr>
				<tr>
					<th class="option6"><div id="d6">6</div></th>
					<th>6.Add new records to the records file.</th>
					<th class="button6"><a href="test_update.jsp"><input type="button" value="确定" id="sure6"></a></th>
				</tr>
				<tr>
					<th class="option7"><div id="d7">7</div></th>
					<th>7.Delete records from the records file.</th>
					<th class="button7"><a href="test_delete.jsp"><input type="button" value="确定" id="sure7"></a></th>
				</tr>
			</table>
		</div>
	</div>
  </body>
</html>
