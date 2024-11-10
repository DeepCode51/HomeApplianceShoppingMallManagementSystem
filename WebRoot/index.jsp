<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>家用电器商城购物网</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
       
</head>
<body>

   
     
<!--引入头部-->
<div id="header"></div>
    <!-- banner start-->
    <section id="banner">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2000">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->   
            <div class="carousel-inner" role="listbox">  
                <div class="item active">
                    <img src="images/banner_1.jpg" style="width:1920px;height:400px;" alt="">
                </div>
                <div class="item">
                    <img src="images/banner_2.jpg" style="width:1920px;height:400px;" alt="">
                </div>
                <div class="item">
                    <img src="images/banner_3.jpg" style="width:1920px;height:400px;" alt="">
                </div>
            </div>     
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
        </div>
    </section>
    <!-- banner end-->
    <!-- 商品 start-->
    <section id="content">
         <!-- 商城精选start-->
        <section class="jutuan_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="images/icon_5.jpg" alt="">
                    <span>商城精选</span>
                </div>
            </div>
        <div class="jutuan_gn">
                <div class="guonei_l">
                    <img src="${pageContext.request.contextPath}/image/index1.jpeg" alt="" width="400px" height="590px" />
                </div>
                <div class="guone_r">      
                    <div class="row">
                       
                    <c:forEach var="v" varStatus="vs" items="${newList }">     
                   
                    <div class="col-md-4">
                           <a href="${pageContext.request.contextPath}/FindDetailServlet?pid=${v.pid }">   
								<img src="${pageContext.request.contextPath}/image/${v.pimage}"alt="" width="100px" height="133px">
								<div class="has_border">
									<h3> ${v.pname }      
                          </h3>
									<div class="price">团购价<em>￥</em><strong>${v.shop_price }</strong><em>起</em></div>	
									<div class="price">抢购倒计时：<span id="divTime${vs.index+1 }"></span></div>									      
								</div>
								          
							</a>          
                        </div>             
                        
                    </c:forEach>     
                    
                    <c:forEach var="v" begin="0" end="${ newListOther}" step="1">   
                      <div class="col-md-4">
                           <a href="javascript:kkk();">   
								<img src="${pageContext.request.contextPath}/image/no.gif" alt="" width="110px" height="170px">
							<div class="has_border">
									<h3>  
                          </h3>
									<div class="price">商城购物</div>	
									<div class="price">等待商品上新哦~</div>									      
								</div>     
							</a>          
                        </div>             
                        
                    </c:forEach>   
                    
                        
                        
                    </div>            
                </div>          
            </div>           
        </section>        
        <!-- 商城精选end-->    
        <section class="jutuan_jx">
            <div class="jx_top">
                <div class="jx_tit">
                    <img src="images/icon_6.jpg" alt="" >
                    <span>昨日商品</span>
                </div>      
            </div>        
            <div class="jutuan_gn">           
                <div class="guonei_l">
                    <img src="${pageContext.request.contextPath}/image/index1.jpeg" alt="" width="400px" height="590px" />
                </div>
                <div class="guone_r">
                    <div class="row">
                    <c:forEach var="v" items="${yesterdayListPro }" >
                        <div class="col-md-4">       
                        
                       
                        
                            <a href="javascript:oldPro('${v.pid }');">
								<img src="${pageContext.request.contextPath}/image/${v.pimage}"alt="" width="110px" height="170px">
								<div class="has_border">
									<h3>${v.pname }   </h3>
									<div class="price">团购价<em>￥</em><strong>${v.shop_price }</strong><em>起</em></div>									
								</div>
							</a>        
                        </div>   
                        </c:forEach>
                           
                        
                           <c:forEach var="v" begin="0" end="${ yesterdayListProOther}" step="1">
                      <div class="col-md-4">
                           <a href="javascript:kkk();">   
								<img src="${pageContext.request.contextPath}/image/no.gif" alt="" width="110px" height="170px">
							
																	      
							<div class="has_border">
									<h3>           
                          </h3>
									<div class="price">商城购物</div>	
									<div class="price">等待商品上新哦~</div>			      						      
								</div>     
								          
							</a>          
                        </div>             
                        
                    </c:forEach>     
                        
                     </div>
                 </div>          
               </div>
           </section>     
    </section>
   <!--导入底部-->
    <div id="footer"></div>
    <script>   
    function kkk(){    
    	layer.msg('商城温馨提示:等待商品上新哦！')
    }
    function oldPro(pid){
    	layer.confirm('该商品昨日抢购，今日无法购买，是否继续查看详情?', {
    		title: false,
    		btn: ['确定','取消'] //按钮
    		}, function(ind){
    		layer.close(ind);  
    		window.location.href="${pageContext.request.contextPath}/FindDetailServlet?pid="+pid;
    		}, function(inds){
    		    
    		});
    }
    </script>
   
    <script type="text/javascript">   
      var endYear=new Date().getFullYear();
      var endMonth=new Date().getMonth()+1;
      var endDay=new Date().getDate();
      var endTime=new Date(endYear,endMonth,endDay);   
      var leftDiv=function(){
          var leftTime=endTime-(new Date().getTime());
          var leftHours=addNumber(Math.floor(leftTime/1000/60/60%24));
          var leftMinutes=addNumber(Math.floor(leftTime/1000/60%60));
          var leftSeconds=addNumber(Math.floor(leftTime/1000%60));
          
          
          var divTime1=document.getElementById("divTime1");
          var divTime2=document.getElementById("divTime2");
          var divTime3=document.getElementById("divTime3");
          var divTime4=document.getElementById("divTime4");
          var divTime5=document.getElementById("divTime5");
          var divTime6=document.getElementById("divTime6");
          if(divTime1!=null){
        	  divTime1.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";

          }
          if(divTime2!=null){
        	  divTime2.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";

          }
          if(divTime3!=null){
        	  divTime3.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";

          }
          if(divTime4!=null){
        	  divTime4.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";

          }   
          if(divTime5!=null){
        	  divTime5.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";
     
          }   
          if(divTime6!=null){
        	  divTime6.innerHTML="<font color='red'>"+leftHours+"</font>"+"时<font color='red'>"+leftMinutes+"</font>分<font color='red'>"+leftSeconds+"</font>秒";

          }   
          
          if(leftTime>0){
              setTimeout(function(){
                  leftDiv();
              },500);
          }else{     
              clearTimeout(leftDiv())    
          }
             
      }
      leftDiv();
   
      function addNumber(num){
          var num=(num>9)?num:('0'+num);
          return num;
      }
   
    
      </script>
</body>
</html>