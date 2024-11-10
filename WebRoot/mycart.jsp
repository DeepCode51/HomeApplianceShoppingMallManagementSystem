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
<title>我的订单</title>
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
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
            </div>
            </c:if>
            <!-- 登录状态  -->
             <c:if test="${not empty username }">
            <div class="login">
            	
                <span id="span_username">你好,${username }</span>
                <a href="${pageContext.request.contextPath}/ToMyOrderServlet" class="collection">我的订单</a>
                <a href="javascript:location.href='exitServlet';">退出</a>
            </div>
            </c:if>    
	</div>
	<div class="header_wrap">
		<div class="topbar">
			<div class="logo">
				<a href="/"><img src="images/logo.jpg" alt=""></a>
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

	<article id="post-622"
		class="post-622 post type-post status-publish format-standard hentry category-everygo">

	<header class="entry-header">
      
	<h1  class="entry-title"><font color="green">我的购物篮</font></h1>

   <div align="center">
             
   <c:if test="${empty cartMap }">
   <script>
   layer.msg('您的购物篮为空，去挑选您的商品吧');   
   </script>
   </c:if>   
    <c:if test="${not empty cartMap }">
    <table class="table">
   
			<tr class="danger">  
				<th>商品名称</th>
				
				<th>商品数</th>
				<th>总价格</th>
				   
			
			</tr>
			 
			              
             
            <c:forEach items="${cartMap}" var="mymap">
			 
				<tr class="primary">     

					<td>${mymap.value.product.pname }</td>        
					
					<td>${mymap.value.sum }</td>
                 
					    
                    <td>${mymap.value.sum * mymap.value.product.shop_price  }</td>

				</tr>
         
			</c:forEach>
			 
			

		</table>     
		       
			<input type="button" value="提交购买" class="btn btn-success"
						onclick="submitOrder();"></input>
		 
		</c:if>
   </div>
   
   <c:if test="${not empty subOrder }">
   <script>
   layer.alert('购买成功');     
   </script>
   </c:if>
   <script>
   
   function submitOrder(){     
 	 
 	  
 	       
 	  <c:if test="${empty user}">
 	  layer.msg('请登录');
       window.location.href="${pageContext.request.contextPath }/login.jsp";
       return;        
 	  </c:if>
 	  
 	  
 	  
 	  
 	  
 	 var html="<img style='height: 300px;width: 300px;' src='${pageContext.request.contextPath }/image/pain.png?"+"&t=" + Math.random()+"'><br/><div align='center'><input class='btn btn-success' onclick='javascript:address();' type='button' value='已付款,点击下一步' /></div>";
	  layer.open({
	  type : 1,
	  title : '<font color="red">商城购物温馨提示:请扫码购物</font>',   
	  closeBtn : 0,    
	  shade: [0.001, '#393D49'],   
	  area : '300px',
	  skin : 'white', //沒有背景色
	  shadeClose : true,
	  content : html  
	  });
	        
	  
   }
     
   
   function address(){       
 	  window.location.href="${pageContext.request.contextPath }/ToAddAddressServlet";   

   }            
 	
 
      

   </script>
</body>