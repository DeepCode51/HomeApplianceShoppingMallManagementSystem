<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>    
<meta charset="utf-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="css/register.css">
<!--导入jquery-->
<script src="js/jquery-3.3.1.js"></script>
<script src="//cdn.bootcss.com/layer/3.0.1/layer.min.js"></script>
<link href="//cdn.bootcss.com/layer/3.0.1/skin/default/layer.css" rel="stylesheet">     
<script>
			/*
				表单校验：
					1.用户名：单词字符，长度8到20位
					2.密码：单词字符，长度8到20位
					3.email：邮件格式
					4.姓名：非空
					5.手机号：手机号格式
					6.出生日期：非空
					7.验证码：非空
			 */

			//校验用户名
			//单词字符，长度8到20位
			function checkUsername() {
                //1.获取用户名值
				var username = $("#username").val();
				//2.定义正则
				var reg_username = /^\w{8,20}$/;
				
				//3.判断，给出提示信息
			    var flag = reg_username.test(username);
			    if(flag){
			        //用户名合法
                    $("#username").css("border","");
				}else{
			        //用户名非法,加一个红色边框
					$("#username").css("border","1px solid red");
			        layer.msg('请输入合法用户名,单词字符，长度8到20位');     
				}          
			    
                return flag;
            }

            //校验密码
            function checkPassword() {
                //1.获取密码值
                var password = $("#password").val();
                //2.定义正则
                var reg_password = /^\w{8,20}$/;

                //3.判断，给出提示信息
                var flag = reg_password.test(password);
                if(flag){
                    //密码合法
                    $("#password").css("border","");
                }else{
                    //密码非法,加一个红色边框
                    $("#password").css("border","1px solid red");
			        layer.msg('请输入合法密码,单词字符，长度8到20位');     

                }

                return flag;
            }

            //校验邮箱
			function checkEmail(){
			    //1.获取邮箱
				var email = $("#email").val();
				//2.定义正则		
				var reg_email = /^\w+@\w+\.\w+$/;

				//3.判断
				var flag = reg_email.test(email);
				if(flag){
                    $("#email").css("border","");
				}else{
                    $("#email").css("border","1px solid red");
			        layer.msg('请输入合法邮箱');     

				}

				return flag;
			}
			//校验手机
			function checkPhone(){
			    //1.获取手机
				var telephone = $("#telephone").val();
				//2.定义正则		itcast@163.com
				var reg_telephone = /^(13[0-9]|19[0-9]|15[0-9]|18[0-9]|14[3|6|7|8])\d{8}$/;

				//3.判断
				var flag = reg_telephone.test(telephone);
				if(flag){
                    $("#telephone").css("border","");
				}else{
                    $("#telephone").css("border","1px solid red");
			        layer.msg('请输入合法手机号');     

				}

				return flag;
			}

			$(function () {				
				 //当表单提交时，调用所有的校验方法
				$("#registerForm").submit(function(){
					//1.发送数据到服务器
					if(checkUsername() && checkPassword() && checkEmail() && checkPhone()){
					    //校验通过,发送ajax请求，提交表单的数据   
							//第二个属性是指将表单的属性序列化 username=zhangsan&password=123 的形式
						$.post("register",$("#registerForm").serialize(),function(data){
							//处理服务器响应的数据  data  {flag:true,errorMsg:"注册失败"}
							
							if(data.flag){
							    //注册成功，跳转成功页面
								location.href="login.jsp";
							}else{
							    //注册失败,给errorMsg添加提示信息
								$("#errorMsg").html(data.errorMsg);
							}
						});    
					}
					//2.不让页面跳转
                    return false;
                    //如果这个方法没有返回值，或者返回为true，则表单提交，如果返回为false，则表单不提交
				});
               
                //当某一个组件失去焦点是，调用对应的校验方法
				$("#username").blur(checkUsername);
                $("#password").blur(checkPassword);
                $("#email").blur(checkEmail);
                $("#telephone").blur(checkPhone);

            });
		</script>
</head>
<body>
	<!--引入头部-->
	<div id="header"></div>
	<!-- 头部 end -->
	<div class="rg_layout">
		<div class="rg_form clearfix">
			<div class="rg_form_left">
				<p>新用户注册</p>
				<p>USER REGISTER</p>
			</div>
			<div class="rg_form_center">
			  
				<div id="errorMsg" style="color: red; text-align: center"></div>
				
				<!--注册表单-->
				<form id="registerForm" action="register" method="post">
					<!--提交处理请求的标识符-->
					<input type="hidden" name="action" value="register">
					<table style="margin-top: 25px;">
						<tr>
							<td class="td_left"><label for="username">用户名</label></td>
							<td class="td_right"><input type="text" id="username"
								name="username" placeholder="请输入账号">
								</span>
								</td>
						</tr>
						<tr>
							<td class="td_left"><label for="password">密码</label></td>
							<td class="td_right"><input type="text" id="password"
								name="password" placeholder="请输入密码"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="email">Email</label></td>
							<td class="td_right"><input type="text" id="email"
								name="email" placeholder="请输入Email"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="name">姓名</label></td>
							<td class="td_right"><input type="text" id="name"
								name="name" placeholder="请输入真实姓名"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="telephone">手机号</label></td>
							<td class="td_right"><input type="text" id="telephone"
								name="telephone" placeholder="请输入您的手机号"></td>
						</tr>
						<tr>
							<td class="td_left"><label for="sex">性别</label></td>
							<td class="td_right gender"><input type="radio" id="sex"
								name="sex" value="男" checked> 男 <input type="radio"
								name="sex" value="女"> 女</td>
						</tr>
						<tr>
							<td class="td_left"><label for="birthday">出生日期</label></td>
							<td class="td_right"><input type="date" id="birthday"
								name="birthday" placeholder="年/月/日"></td>
						</tr>
						
    						<tr>
    							<td class="td_left">
    								<label for="check">验证码</label>
    							</td>
    							<td class="td_right check">
    								<input type="text" id="check" name="check" class="check">
    								<img src="checkCode" height="32px" alt=""  onclick="changeCheckCode(this)">
									<script type="text/javascript">
										//图片点击事件
										function changeCheckCode(img) {       
											img.src="checkCode?"+new Date().getTime();
                                        }
									</script>
    							</td>
    						</tr>
    		
						<tr>
							<td class="td_left"></td>
							<td class="td_right check"><input type="submit"
								class="submit" value="注册"> <span id="msg"
								style="color: red;"></span></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="rg_form_right">
				<p>
					已有账号？ <a href="login.jsp">立即登录</a>
				</p>
			</div>
		</div>
	</div>
	<!--引入尾部-->
	<div id="footer"></div>
	<!--导入布局js，共享header和footer-->
	<script type="text/javascript" src="js/include.js"></script>

</body>
</html>