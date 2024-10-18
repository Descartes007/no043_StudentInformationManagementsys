<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS样式 -->
    <link href="css/index.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script type="text/javascript">
        //切换验证码
        function refreshCode(){
            //1.获取验证码图片对象
            var vcode = document.getElementById("vcode");

            //2.设置其src属性，加时间戳
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container">
  </div class="login">
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <h2>管理员登录</h2>
           <p>
            <label for="student">用户名：</label>
            <input type="text" name="username" id="student" placeholder="请输入用户名" />
           </p>
           <p>
            <label for="password">密&nbsp;&nbsp;&nbsp;码：</label>
            <input type="password" name="password" id="password" placeholder="请输入密码" />
          </p>
          <p>
            <label for="vcode">验证码：</label>
            <input type="text" name="verifycode" id="verifycode" placeholder="请输入验证码"/>
            </p>
            <p>
            <a href="javascript:refreshCode();">
                <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"/>
            </a>
            </p>
        <p>
            <input class="button" type="submit" value="登录">
            <a class="register" href="${pageContext.request.contextPath}/register.jsp">注册</a>
        </p>
     </div>
        
    <!-- 出错显示的信息框 -->
    <div class="alert alert-warning alert-dismissible" role="alert">

        <strong>${login_msg}</strong>
    </div>
    </form>

</div>
</body>
</html>