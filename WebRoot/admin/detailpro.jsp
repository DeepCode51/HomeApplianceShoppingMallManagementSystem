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
<title>商品详情</title>
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
		      
		</ul>
	</div>

	<article id="post-622"
		class="post-622 post type-post status-publish format-standard hentry category-everygo">

	<header class="entry-header">

	<h1 class="entry-title">${v.pname }</h1>

	<div class="single_info">


		<span class="leixing"> <span class="yclx">原创</span>


		</span> <a href="http://wpa.qq.com/msgrd?v=3&uin=1156936612&site=qq&menu=yes" target="_blank">商城购物客服</a>&nbsp; <span
			class="date">${v.pdate }&nbsp;</span> <span class="views"> 阅读
			${sum } 次 </span>


	</div>            

	</header><!-- .entry-header -->




	<div class="entry-content">

		<div class="single-content">



			<fieldset>
				<legend>
					<strong>摘要：</strong>
				</legend>
				<p></p>
				<p>${v.summary }~</p>
				<p></p>
			</fieldset>




			<div id="post-body-622">
				<h2 style="text-align: center;">${v.pname }怎么样</h2>
				<c:forEach varStatus="vs" var="v" items="${listStr }">

					<p style="text-align: center;">${v }。</p>
				</c:forEach>

				<br>



				<p style="text-align: center;">
					<img src="${pageContext.request.contextPath }/image/${v.pimage}"
						title="${v.pname }.jpg" alt="${v.pname }.jpg"
						class="box-hide box-show">
				</p>
				<p>
					<br>
				</p>
				<h2 style="text-align: center;">
					<span style="color: #FF0000;">❥商城出品：${v.pname }</span>
				</h2>
				<p style="text-align: center;">▼【市场零售价格】¥${v.market_price }</p>
				<p style="text-align: center;">
					<span style="font-size: 18px;"><strong><span
							style="color: #FF0000;">▲【商城团购价格】¥${v.shop_price }</span></strong></span>
				</p>

				<p style="text-align: center;">【发货时间】${v.delivery_time }</p>
				<p style="text-align: center;">【售后】7天内享受无理由退换货服务，15天质量问题包退换，超时不予处理望谅解！~</p>
				<p style="text-align: center;">【特点】${v.characteristics }等~~</p>
			
				<div id="dpajax" style="display: none;"></div>
				<div align="center">
					数量&nbsp;&nbsp;<input type="button" value="-" class="btn btn-info"
						onclick="decrease();"></input> <input type="text" value="1"
						classd="form-control" style="width: 80px" id="num"
						onblur="checkSum()"></input> <input type="button" value="+"
						class="btn btn-info" onclick="increment()"></input> (库存${v.count }件)
					<input type="button" value="加入购物篮" class="btn btn-success"
						onclick="submitOrder();"></input>
				</div>
			</div>
			<script src="${pageContext.request.contextPath }/js/get_content.js"
				type="text/javascript"></script>

		</div>
		<script>
         
    
          function isRealNum(val){
            
          　　if(val === "" || val ==null){
                  return false;
          　　}
             if(!isNaN(val)){　　　　
          　
          　　　 return true; 
          　　}

          　else{ 
          　　　　return false; 
          　　} 
          }
          
            
          function decrease(){   
        	  var num=$("#num").val();
        	  if(num>1){
        		  $("#num").val(--num);
        	  }else{
        		  layer.msg('最少加入购物篮1件');
        	  }
          }
          function increment(){
        	  var num=$("#num").val();
        	  if(num<${v.count}){     
        		  $("#num").val(++num);
        	  }else{  
        		  layer.msg('加入购物篮超过最大库存');     
        	  }
          }
          function checkSum(){
        	  var num=$("#num").val();
        	  if(!isRealNum(num)){   
        		  $("#num").val(1);   
        		  layer.msg('请正确输入购买的数量');
        		  return;
        	  }
        	  if(num>${v.count}){
        		  layer.msg('加入购物篮超过最大库存');
        		  $("#num").val(${v.count});   
        		  return; 
        	  }
        	  
        	  if(num<=0){ layer.msg('最少加入购物篮1件');  $("#num").val(1);   
        		  return;
        	  }    
        	     
          }                      
          function address(){
        	  window.location.href="${pageContext.request.contextPath }/ToAddAddressServlet?pid=${v.pid}&sum="+$("#num").val();  

          }
          
          function submitOrder(){     
        	  var num=$("#num").val();
        	  if(!isRealNum(num)){   
        		  $("#num").val(1);   
        		  layer.msg('请正确输入加入购物篮的数量');
        		  return;
        	  }
        	  if(num>${v.count}){
        		  layer.msg('加入购物篮超过最大库存');
        		  $("#num").val(${v.count});   
        		  return; 
        	  }     
        	  if(num<=0){ layer.msg('最少加入购物篮1件');  $("#num").val(1);   
        		  return;
        	  }   
        	  
        	       
        	  <c:if test="${empty user}">
        	  layer.msg('请登录');
              window.location.href="${pageContext.request.contextPath }/login.jsp";
              return;        
        	  </c:if>
        	     
        	  if('${canby}'==='no'){      
        		  layer.msg('非今日抢购商品无法加入购物篮。');            
        		  return; 
        	  }
        	  
        	  /***
        	  
        	  发ajax加入购物篮
        	  
        	  **/
        	  
        	  
        	  $.ajax({
        		    url:'${pageContext.request.contextPath }/AddToCartServlet?pid=${v.pid}&sum='+num, //请求的url地址
        		    dataType:"text", //返回格式为json
        		    async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        		    
        		    type:"GET", //请求方式
        		    beforeSend:function(){
        		        //请求前的处理
        		    },
        		    success:function(req){
        		        //请求成功时处理        
        		    	 layer.msg('加入购物篮成功');
        		    },
        		    complete:function(){
        		        //请求完成的处理
        		    },
        		    error:function(){
        		        //请求出错处理
        		        alert("error");
        		    }
        		});
        	  
        	        
        	  
        	/*   $.ajax('${pageContext.request.contextPath }/AddToCartServlet?pid=${v.pid}&sum='+num,function(data){
        		  
        		  
        		  alert(data);      
        		 layer.msg('加入购物篮成功');     
        	  });
        	            */  
        	/*   var html="<img style='height: 300px;width: 300px;' src='${pageContext.request.contextPath }/image/pain.png?"+"&t=" + Math.random()+"'><br/><div align='center'><input class='btn btn-success' onclick='javascript:address();' type='button' value='已付款,点击下一步' /></div>";
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
        	
                   */     

             
          }    
           
          
          </script>
		<div class="clear"></div>

		<div class="clear"></div>

		<div class="social-main">


			<div class="clear"></div>

		</div>

		<div class="clear"></div>

		<div class="post-navigation"></div>

		<nav class="nav-single-c"> <nav
			class="navigation post-navigation" role="navigation">

		<h2 class="screen-reader-text">文章导航</h2>

		<div class="nav-links"></div>

		</nav> </nav>

	</div>
	<!-- .entry-content --> </article>

</body>