<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <script type="text/javascript" src="../../js/jquery-1.9.1.js"></script>
    <title>login</title>
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
    #login{
        position: absolute;
        left: 40%;
        top: 0px;
        width:272px;
        height: 300px;
        background: rgba(0,0,0,.5);
        border-radius: 10px;
        font-family: "微软雅黑";}
    .title{
        font-size: 30px;
        font-weight: bold;
        color: #fff;
        text-align: center;
        margin-bottom: 30px;
        cursor: Move;/* 鼠标样式Auto，Crosshair，Default，Pointer，Move，e-resize，ne-resize，nw-resize，n-resize，se-resize，sw-resize，s-resize，w-resize，text，wait，help */
    }
    #login input.txt{
     width: 270px;
     height: 42px;
     color: #fff;
     border-radius: 6px;
     background: rgba(45,45,45,0.15);
     margin-bottom: 15px;
     border:1px solid rgba(255,255,255,.15);
     box-shadow: 0 2px 3px rgba(0,0,0,.1) inset;
 }
 #login input.btn{
    width: 272px;
    height: 44px;
    /* background: #ef4300; */
    background: #AACCA6;
    border:0;
    border-radius: 6px;
    box-shadow: 0 15px 30px rgba(255,255,255,0.25) inset;
    color: #fff;
    font-size: 20px;
 }
 #login input:focus{
    outline: none;
    box-shadow: 0 2px 3px rgba(0,0,0,.1) inset,0 2px 7px rgba(0,0,0,.2);/* 内外阴影 */
 }
 input::-webkit-input-placeholder{
    color: #fff;
 }
    </style>
</head>
<body>
    <div id="login">
        <h3 class="title">Login</h3>
        <input id="msg" type="hidden" value="${msg}"/>
        <form action="dologin.jsp" method="post" id="loginForm">
            <input type="text" id="em_Name" name="username" class="txt" placeholder="Username" required/><!-- placeholder表单初始内容，required检测表单内容
             -->
            <input type="password" id="em_Pass" name="password" class="txt" placeholder="Password" required/>
            <input type="button" class="btn" value="Sign in" onclick="test()" />
        </form>
    </div>
      <script type="text/javascript">
     var oLogin=document.getElementById('login');
     /*通过id名获取元素节点*/
       var timer=null,speedX=0,speedY=0;
       function startMove(){
        clearInterval(timer);//惯性速度，慢慢变小
         timer=setInterval(function () {
            speedX*=0.98;
            speedY+=3;
            var T=oLogin.offsetTop+speedY;
            var t=document.documentElement.clientHeight-oLogin.offsetHeight;
            /*clientHeight是可视屏幕高度，offsetHeight是合子自己的高度*/
            var L=oLogin.offsetLeft+speedX;
            var l=document.documentElement.clientWidth-oLogin.offsetWidth;
            if(T>t){
                T=t;
                speedY*=-1;
                speedY*=0.75;
                //反弹后速度变慢
            }else if(T<0){
                T=0;
                speedY*=-1;
                speedY*=0.75;
            }
            if(L>l){
                L=l;
                speedX*=-1;
            }else if(L<0){
                L=0;
                speedX*=-1;
            }
            oLogin.style.top=T+"px";
            oLogin.style.left=L+"px";
        },13);/*定时器*/
       }
       startMove();
     oLogin.onmousedown=function(e) {
        clearInterval(timer);
        /*鼠标点击*/
        /*移动是在整个页面上移动，所以对应的是document*/
        var e=e;
          var x=e.clientX;
          var y=e.clientY;
          disX=x-oLogin.offsetLeft;
          disY=y-oLogin.offsetTop;
          console.log(x,y);
        document.onmousemove=function(e){
          var e=e;
          oLogin.style.left=e.clientX-disX+"px";
          oLogin.style.top=e.clientY-disY+"px";
          speedY=e.clientY-y;
          speedX=e.clientX-x;
          y=e.clientY;
          x=e.clientX;
        }
        document.onmouseup=function(){
            document.onmousemove=null;
            document.onmouseup=null;
            startMove();
        }
     }   
     
     function test(){
         var uname=document.getElementById("em_Name").value;
         var pwd=document.getElementById("em_Pass").value;
         if(uname == "" ) {
             alert("请输入用户名");
             return false;
         }
         if(pwd == "" ) {
             alert("请输入密码");
             return false;
         }
         document.getElementById("loginForm").submit();
         
     } 
     
     window.onload = function(){
         afterSub();
     }
     
      function afterSub(){
         var msg=$("#msg").val();
         if(msg == "1") {
             alert("用户名不存在");
             return false;
         }
         else if(msg == "2") {
             alert("密码错误");
             return false;
         } else if(msg =="3") {
             alert("登录成功！！！");
             window.location.href="MyJsp.jsp";
         }
     } 
     
     
     </script>
</body>
</html>