<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<script src="js/jquery-3.3.1.js"></script>

	<script>

		$(function () {
            //1.给登录按钮绑定单击事件
			$("#btn_sub").click(function () {
				
				var username=$("#usernameid").val();
				if(username.trim().length===0){
					$("#errorMsg").html("请输入登录用户名");
					$("#usernameid").focus();    
					return;      
				}    
				var password=$("#passwordid").val();
				if(password.trim().length===0){
					$("#errorMsg").html("请输入登录密码");
					$("#passwordid").focus(); 
					return;      
				}       
				
                //2.发送ajax请求，提交表单数据
				$.post("loginServlet",$("#loginForm").serialize(),function (data) {
					//data : {flag:false,errorMsg:''}
					if(data.flag){
					    //登录成功
					    if(data.role == 2)    
					    	{
					    		location.href="${pageContext.request.contextPath}/IndexServlet";
					    	}
					    if(data.role == 1)
					    	{       
					    		location.href="admin/admin.jsp";
					    	}
						
					}else{
					    //登录失败
						$("#errorMsg").html(data.errorMsg);
					}
                });
            });
        });

	</script>
</head>
<body>
<!--引入头部-->
<div id="header"></div>
    <!-- 头部 end -->
    <section id="login_wrap">
        <div class="fullscreen-bg" style="background: url(images/login_bg.png);height: 532px;">
        	
        </div>
        <div class="login-box">
        	<div class="title">
        		<img src="images/login_logo.jpg" alt="">
        		<span>欢迎登录商城账户</span>
        	</div>	 
        	<div class="login_inner">
				
				<!--登录错误提示消息-->
        		<div id="errorMsg" class="alert alert-danger" ></div>
				<form id="loginForm" action="" method="post" accept-charset="utf-8">
        			<input type="hidden" name="action" value="login"/>
					<input name="username" type="text" id="usernameid" placeholder="请输入账号" autocomplete="off">
        			<input name="password" type="password" id="passwordid" placeholder="请输入密码" autocomplete="off">
        			 
        			<div class="verify">
					<input name="check" type="text" placeholder="请输入验证码" autocomplete="off">
					<span><img src="checkCode" alt="" onclick="changeCheckCode(this)"></span>
					<script type="text/javascript">
						//图片点击事件
						function changeCheckCode(img) {
							img.src="checkCode?"+new Date().getTime();
						}
					</script>
			</div>
			<div class="submit_btn">
        				<button type="button"  id="btn_sub">登录</button>
        				<div class="auto_login">
        					<input type="checkbox" name="" class="checkbox">
        					<span>自动登录</span>
        				</div>        				
        			</div>        			       		
        		</form>
        		<div class="reg">没有账户？<a href="register.jsp">立即注册</a></div>
        	</div>
        </div>
    </section>
    <!--引入尾部-->
    <div id="footer"></div>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>
</body>
</html>