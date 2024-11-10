<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" rev="stylesheet"
	href="${pageContext.request.contextPath }/css/detail.css"
	type="text/css" media="all" />
<link rel="stylesheet" id="font-awesome-four-css"
	href="${pageContext.request.contextPath }/css/fontawesome-all.css"
	type='text/css' media='all' />
<title>选择地址</title>
<!--导入布局js，共享header和footer-->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/index.css">
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<!--导入布局js，共享header和footer-->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/address.js"></script>


<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>

</head>
<body>

	<c:if test="${not empty msg }">

		<script>
			layer.alert('${msg}');
		</script>
	</c:if>
	<!--引入头部-->
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
				<a href="/"><img src="images/logo.jpg" alt=""></a>
			</div>
			<div class="search">
				<input name="" type="text" placeholder="请输入路线名称"
					class="search_input" autocomplete="off"> <a
					href="javascript:;" class="search-button">搜索</a>
			</div>
			<div class="hottel">
				<div class="hot_pic">
					<img src="images/hot_tel.jpg" alt="">
				</div>
				<div class="hot_tel">
					<p class="hot_time">客服热线(9:00-6:00)</p>
					<p class="hot_num">400-618-9090</p>
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
<%--			<li><a href="route_list.html">酒店</a></li>--%>
<%--			<li><a href="route_list.html">香港车票</a></li>--%>
<%--			<li><a href="route_list.html">出境游</a></li>--%>
<%--			<li><a href="route_list.html">国内游</a></li>--%>
<%--			<li><a href="route_list.html">港澳游</a></li>--%>
<%--			<li><a href="route_list.html">抱团定制</a></li>--%>
<%--			<li><a href="route_list.html">全球自由行</a></li>--%>
<%--			<li><a href="favoriterank.html">收藏排行榜</a></li>--%>
		</ul>
	</div>

	<article id="post-622"
		class="post-622 post type-post status-publish format-standard hentry category-everygo">

	<header class="entry-header">

	<h1 class="entry-title">${v.pname }</h1>

	<div class="single_info">

		<div align="right">
			<input type="button" class="btn btn-success" value="新增收货地址"
				onclick="javascript:addAddress();" />
		</div>


		</span> <a href="#" rel="nofollow" target="_blank">请选择下列地址</a>&nbsp; <br />

		<div class="entry-content"></div>
		<div class="clear"></div>
		<c:if test="${not empty address }">
			<form action="${pageContext.request.contextPath}/SubmitOrderServlet"
				method="post">
				<input type="hidden" name="pid" value="${pid }" /> <input
					type="hidden" name="sum" value="${sum}" />
				<ul>
					<c:forEach var="v" items="${address }">
						<li><input type="radio" name="address" required="required"
							value="${v }" />${v }</li>
						<br />
					</c:forEach>
				</ul>
				<input type="submit" value="确定地址，提交购物" class="btn btn-warning" />
			</form>
		</c:if>
		<br />
		<c:if test="${empty address }">
			<h4 align="center">
				<font color="red">你暂无历史收货地址，请新增加收货地址</font>
			</h4>
		</c:if>
		<br />
		<div align="center" id="kk" style="display: none">
			<form action="${pageContext.request.contextPath}/AddAddressServlet" id="addre"
				method="post">
				<input type="hidden" name="pid" value="${pid }" /> <input
					type="hidden" name="sum" value="${sum}" /> 请输入新增的收货地址： <select
					id="cmbProvince" name="cmbProvince" ></select> <select
					id="cmbCity" name="cmbCity" ></select> <select
					id="cmbArea" name="cmbArea" ></select> <input
					type="text" name="add" placeholder="请输入详细地址" required="required"
					id="address4" style="width: 230px; height: 27px;"><br>

<input type="hidden" name="address" id="address"  />
         
     
				<input type="button" onclick="javascript:submitAdd()"
					style="width: 80px; height: 25px;" value="确定增加"
					class="btn btn-success" onclick="javascript:addAddress();" />
			</form>
			<br /> <br />
		</div>

		<script type="text/javascript">
			addressInit('cmbProvince', 'cmbCity', 'cmbArea');
		</script>

		<script>
			function addAddress() {
				$("#kk").show();
			}    
			function submitAdd() {
				var address1 = $("#cmbProvince").val();
				var address2 = $("#cmbCity").val();
				var address3 = $("#cmbArea").val();
				var address4 = $("#address4").val();

				if (address1.indexOf("请选择") != -1) {
					layer.msg('请选择省份');
					return;
				} else {
					
				}
				if (address2.indexOf("请选择") != -1) {
					layer.msg('请选择市或者区');
					return;
				} else {
					
				}
				if (address3.indexOf("请选择") != -1) {
					layer.msg('请选择区或者县');
					return;     
				} else {
					
				}
				
				if(address4===''){
					layer.alert('请输入详细地址');
					return;
				}
				
				$("#address").val(address1+address2+address3+address4);
				    
				$("#addre").submit();

			}
		</script>
		<c:if test="${not empty adderror }">
			<script>
				layer.alert('${adderror}');
			</script>
		</c:if>
</body>