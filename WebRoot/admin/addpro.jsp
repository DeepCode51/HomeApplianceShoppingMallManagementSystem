
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
    
</head>
<body>
 
<h3 align="center"><font color="#dc143c">添加商品</font></h3>   

<h3 align="center"><font color="red">${msg }</font></h3>   
<form id="form1" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/addProductServlet" enctype="multipart/form-data"  style="margin-left:5%;margin-right:5%;">

   
    <input type="text" placeholder="请输入商品名称" name="pname" class="form-control"/>

    <br>
    <input type="text" name="market_price" placeholder="请输入商品市场价格" class="form-control"/>

    <br>
     <input type="text" name="shop_price" placeholder="请输入商城团购价格" class="form-control"/>

    <br>
     <input type="text" name="count" placeholder="请输入商品库存数量" class="form-control"/>

    <br>  
   请选择商品发货规则：   
    <select class="form-control" style="width:30%" name="delivery_time">
     <option>随机发货</option>
    <option>拍单即发</option></select>
    
    
      请选择商品是否上下架状态：   
    <select class="form-control" style="width:30%" name="pflag">
     <option value="0">上架</option>    
    <option value="1">下架</option></select>
    
        请选择商品是否热门：   
    <select class="form-control" style="width:30%" name="is_new">
     <option value="1">热门</option>
    <option value="0">不热门</option></select>
    
    
   请输入商品摘要:
    <textarea rows="3" cols="50" name="summary"  class="form-control"></textarea>
    <br>

   请输入商品介绍:
    <textarea rows="3" cols="50" name="pdesc"  class="form-control"></textarea>
    <br>

   
   请输入商品特点:
    <textarea rows="3" cols="50"  class="form-control" name="characteristics"></textarea>
    <br>
        商品图片<input type="file" name="file1" id="ff" placeholder="请选择电脑图片" class="form-control"/>
    <br>

    <input type="button" onclick="javascript:sub();" value="增加商品" class="btn btn-success" style="margin-left:48%;"/>
</form>
    

</body>
<script>
    function ss() {
        document.getElementById("form1").submit();
    }     
     
    function checkImgType(ths){
        if (ths.value == "") {
            layer.msg("请选择商品图片");
            return false;
        } else {
            if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ths.value)) {
                layer.msg("图片类型必须是.gif,jpeg,jpg,png中的一种");
                ths.value = "";
                return false;
            }
        }
        return true;   
    }
    function sub() {
        if(checkImgType(document.getElementById("ff"))){

            document.getElementById("form1").submit();
        }

    }

    function sleep(numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
                return;
        }
    }

</script>
</html>
