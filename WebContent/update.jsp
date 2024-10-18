<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改</title>

        <link href="css/update.css" rel="stylesheet">
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
        <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
               <h2 style="text-align: center;">修改</h2>
        <p>  
            <label for="id">学&nbsp;&nbsp;&nbsp;号：</label>
            <input class="input" type="text" id="id" name="id"  value="${student.id}"  placeholder="请输入学号" />
        </p>
         <p>
            <label for="name">姓&nbsp;&nbsp;&nbsp;名：</label>
            <input class="input" type="text"  id="name" name="name"  value="${student.name}"  placeholder="请输入姓名" />
         </p>
         <p>
           <label class="labler">性&nbsp;&nbsp;&nbsp;别：</label>
            <span  class="radio"> 
                   <input  type="radio" name="gender" value="男"/>男
                   <input type="radio" name="gender" value="女"/>女
            </span>
          </p>
          <p>
            <label for="age">年&nbsp;&nbsp;&nbsp;龄：</label>
            <input class="input" type="text" value="${student.age}" id="age"  name="age" placeholder="请输入年龄" />
          </p>

          <p>
            <label for="address">籍&nbsp;&nbsp;&nbsp;贯：</label>
             <input class="input" type="text"  value="${student.address}" id="address"  name="address" placeholder="请输入户籍" />
           
          </p>

          <p>
            <label for="phone">电&nbsp;&nbsp;&nbsp;话：</label>
            <input class="input" type="text" id="phone" value="${student.phone}" name="phone" placeholder="请输入电话号码"/>
          </p>

          <p>
            <label for="clas">班&nbsp;&nbsp;&nbsp;级：</label>
            <input class="input" type="text" value="${student.clas}" id="clas" name="clas" placeholder="请输入班级"/>
          </p>

             <p style="text-align: center">
                <input class="button" type="submit" value="提交" />
                <input class="button" id="back" type="button" value="返回"/>
             </p>
        </form>
      </div>   
     </div>
    </body>
</html>