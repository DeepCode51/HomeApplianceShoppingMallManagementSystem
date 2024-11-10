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

			<tr class="primary">
				<th>商品名称</th>
				<th>市场价格</th>
				<th>商店价格</th>
				<th>商品图片</th>
				<th>商品发布日期</th>
				<th>热门状态</th>
				<th>是否下架</th>
				<th>库存</th>
				<th>销售总数</th>
			</tr>
   

			<c:forEach varStatus="vs" var="v" items="${list}">
				<tr class="warning">

					<td>${v.product.pname }</td>
					<td>${v.product.market_price }</td>

					<td>${v.product.shop_price}</td>
					<td><img
						src="${pageContext.request.contextPath }/image/${v.product.pimage}"
						width="50px" height="50px" /></td>
					<td>${v.product.pdate }</td>
					<td><c:if test="${v.product.is_new eq '1' }">热门</c:if> <c:if
							test="${v.product.is_new eq '0' }">不热门</c:if></td>
					<td><c:if test="${v.product.pflag eq '0' }">上架</c:if> <c:if   
							test="${v.product.pflag eq '1' }">下架</c:if></td>
					<td>${v.product.count }</td>

  
					<td>${v.sum }</td>


     
				</tr>   

			</c:forEach>


		</table>


	</div>
</body>
</html>