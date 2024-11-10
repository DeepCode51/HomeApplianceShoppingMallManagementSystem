<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- 新 Bootstrap 核心 CSS 文件 -->

<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->

<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</head>
<body>
	<div style="width: 90%; margin-left: 5%">

		<table class="table">
   
			<tr class="danger">  
				<th>订单号</th>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>订单商品数</th>
				<th>订单总价格</th>
				
				<th>下单用户名</th>
				<th>下单收货地址</th>
				<th>订单时间</th>
			</tr>


			<c:forEach varStatus="vs" var="v" items="${list}">
				<tr class="primary">

					<td>${v.ordernum }</td>        
					<td>${v.pid }</td>
					<td>${v.pname }</td>
					
				    
					<td>${v.ocount }</td>
         
					<td>${v.oprice}</td>
					  
					<td>${v.username}</td>
					
					  
					<td>${v.address}</td>
					
				<td>${v.ordertime}</td> 

				</tr>

			</c:forEach>


		</table>


	</div>
</body>
</html>