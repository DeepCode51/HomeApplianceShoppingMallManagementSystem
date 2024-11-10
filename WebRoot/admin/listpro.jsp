<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<th>商品名称</th>
				<th>市场价格</th>
				<th>商店价格</th>
				<th>商品图片</th>
				<th>商品发布日期</th>
				<th>热门状态</th>
				<th>是否下架</th>
				<th>库存</th>
				<th>发货时间</th>
				<th>商品摘要</th>
				<th>商品特点</th>
				<th>商品简介</th>
				<th>商品删除</th>
			</tr>


			<c:forEach varStatus="vs" var="v" items="${list}">
				<tr class="info">

					<td>${v.pname }</td>
					<td>${v.market_price }</td>

					<td>${v.shop_price}</td>
					<td><img
						src="${pageContext.request.contextPath }/image/${v.pimage}"
						width="50px" height="50px" /></td>
					<td>${v.pdate }</td>
					<td><c:if test="${v.is_new eq '1' }">热门</c:if> <c:if
							test="${v.is_new eq '0' }">不热门</c:if></td>
					<td><c:if test="${v.pflag eq '0' }">上架</c:if> <c:if
							test="${v.pflag eq '1' }">下架</c:if></td>
					<td>${v.count }</td>
					<td>${v.delivery_time }</td>
					<td><c:choose>  


							<c:when test="${fn:length(v.summary ) >= 10}">
 
       ${fn:substring(v.summary,0,12)}<a
									href="JavaScript:summary('${v.summary }')">……</a>
							</c:when>
							<c:otherwise>   
   
       ${v.summary  }
    </c:otherwise>
						</c:choose></td>
					<td><c:choose>


							<c:when test="${fn:length(v.characteristics ) >= 10}">
 
       ${fn:substring(v.characteristics,0,12)}<a
									href="JavaScript:characteristics('${v.characteristics }')">……</a>
							</c:when>
							<c:otherwise>   
   
       ${v.characteristics  }
    </c:otherwise>
						</c:choose></td>
					<td><c:choose>

   
							<c:when test="${fn:length(v.pdesc ) >= 10}"> 
 
       ${fn:substring(v.pdesc,0,12)}<a
									href="JavaScript:pdesc('${v.pdesc} }')">……</a>
							</c:when>
							<c:otherwise>   
      
       ${v.pdesc  }
    </c:otherwise>
						</c:choose></td>
                    <td><button class="layui-btn layui-btn-danger layui-btn-sm"
                                onclick="javascript:edit('${v.pid}')">修改</button></td>
						<td><button class="layui-btn layui-btn-danger layui-btn-sm"
							onclick="javascript:del('${v.pid}')">删除</button></td>
						         
         

				</tr>

			</c:forEach>


		</table>

		<script>
			function summary(v) {
				layer.open({
					  type: 1,
					  skin: 'layui-layer-demo', //样式类名
					  closeBtn: 0, //不显示关闭按钮
					  anim: 2,
					  shadeClose: true, //开启遮罩关闭
					  content: "     "+v,
					  title:'商品摘要详细'
					});     
			}   
			function characteristics(v) {
				layer.open({
					  type: 1,
					  skin: 'layui-layer-demo', //样式类名
					  closeBtn: 0, //不显示关闭按钮
					  anim: 2,
					  shadeClose: true, //开启遮罩关闭
					  content: "     "+v,
					  title:'商品特点详细'
					});    
			}
			function pdesc(v) {
				layer.open({
					  type: 1,
					  skin: 'layui-layer-demo', //样式类名
					  closeBtn: 0, //不显示关闭按钮
					  anim: 2,
					  shadeClose: true, //开启遮罩关闭
					  content: "     "+v,
					  title:'商品简介详细'
					});       
			}
		</script>
		<script>
	
	function del(id){
		layer.confirm('确定删除此商品？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
			  layer.msg('已删除');      
			  window.location.href='${pageContext.request.contextPath}/DelProductServlet?pid='+id;
			}, function(){
			 layer.msg('已取消删除');   
			});
	}

    function edit(id){

        layer.open({
            type: 2,
            skin: 'layui-layer-demo', //样式类名
            area: ['800px', '500px'],
            maxmin: true,
            content:'${pageContext.request.contextPath}/EditProductServlet?pid='+id,
            title:'编辑商品'
        });

    }
	
	</script>


	</div>
</body>
</html>