<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/add.css" rel="stylesheet">
    <script type="text/javascript">
        window.onload = function(){
            document.getElementById("back").onclick = function(){
                location = "list.jsp";
            };
        };
    </script>
</head>
<body>
<div class="container">
  <div class="cona">
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <center><h2>添加</h2></center>
         <p>
            <label for="id">学&nbsp;&nbsp;&nbsp;号：</label>
            <input class="input" type="text"  id="id" name="id" placeholder="请输入学号">
        </p>
        <p>
            <label for="name">姓&nbsp;&nbsp;&nbsp;名：</label>
            <input class="input" type="text"  id="name" name="name" placeholder="请输入姓名">
        </p>
        <p>
            <label class="labler">性&nbsp;&nbsp;&nbsp;别：</label>
            <span  class="radio"> 
                   <input  type="radio" name="gender" value="男" checked="checked"/>男
                   <input type="radio" name="gender" value="女"/>女
            </span>
        </p>
        <p>
            <label for="age">年&nbsp;&nbsp;&nbsp;龄：</label>
            <input class="input" type="text" id="age" name="age" placeholder="请输入年龄">
        </p>

        <p>
            <label for="address">籍&nbsp;&nbsp;&nbsp;贯：</label>
            <input class="input" type="text" id="address" name="address" placeholder="请输入籍贯">  
        </p>

        <p>
            <label for="phone">电&nbsp;&nbsp;&nbsp;话：</label>
            <input class="input" type="text" id="phone" name="phone" placeholder="请输入电话号码"/>
        </p>

        <p>
            <label for="clas">班&nbsp;&nbsp;&nbsp;级：</label>
            <input class="input" type="text" id="clas" name="clas" placeholder="请输入班级"/>
        </p>

        <div>
            <input class="button" type="submit" value="提交" />
            <input class="button" id="back" type="button" value="返回" />
        </div>
   </div>
    </form>
</div>
</body>
</html>