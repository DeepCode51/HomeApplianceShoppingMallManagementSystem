<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 头部 start -->
<script>
	
</script>
</head>
<body>
	<header id="header">
	<div class="shortcut">
		<c:if test="${empty username }">
			<!-- 未登录状态  -->
			<div class="login_out">
				<a href="login.jsp">登录</a> <a href="register.jsp">注册</a>
			</div>
		</c:if>
		<!-- 登录状态  -->
		<c:if test="${not empty username }">
			<div class="login">

				<span id="span_username">你好,${username }</span> <a
					href="${pageContext.request.contextPath}/ToMyOrderServlet"
					class="collection">我的订单</a> <a
					href="javascript:location.href='exitServlet';">退出</a>
			</div>
		</c:if>
	</div>
	<div class="header_wrap">
		<div class="topbar">
			<div class="logo">   
				<a href="${pageContext.request.contextPath}/index.jsp"><img src="images/logo.jpg" alt=""></a>
			</div>
			
			<div class="hottel">
				<div class="hot_pic">
					<img src="images/hot_tel.jpg" alt="">
				</div>
				<div class="hot_tel">
				  
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- 头部 end -->
	<!-- 首页导航 -->
	<div class="navitem">
		<ul class="nav">
			<li class="nav-active">
			
			<a
				href="${pageContext.request.contextPath }/IndexServlet">首页</a></li>
			<li>
			
			<c:if test="${not empty username }">
			<a   
				href="${pageContext.request.contextPath}/ToMyOrderCart"
				>购物篮</a>
			</c:if>
			<c:if test="${ empty username }">
			<a
				href="${pageContext.request.contextPath}/login.jsp"
				>购物篮</a>
			</c:if>
			</li>
		       
		</ul>
	</div>  

</body>
</html>