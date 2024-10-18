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
    <title>注册用户</title>

    <!-- 1. 导入CSS样式 -->
    <link href="css/register.css" rel="stylesheet">
    <script>
        //校验密码
        function checkPassword() {
            //1.获取密码值
            var password = $("#password").val();
            //2.定义正则
            var reg_password = /^\w{6,10}$/;

            //3.判断，给出提示信息
            var flag = reg_password.test(password);
            if(flag){
                $("#tishi2").html("");
                //密码合法
                $("#password").css("border","");
            }else{
                $("#tishi2").html("密码必须是6到10位");
                //密码非法,加一个红色边框
                $("#password").css("border","1px solid red");
            }

            return flag;
        }
        function checkPwd() {
            var flag=false;
            //1.获取密码值
            var password = $("#password").val();
            //2:
            var pwd = $("#pwd").val();
            if(password==pwd){
                $("#tishi").html("");
                $("#password").css("border","");
                flag=true;
            }else {

                $("#tishi").html("两次密码不相同");

                $("#password").css("border","1px solid red");

            }
            return flag;
        }
        $(function () {
            //当表单提交时，调用所有的校验方法
            $("#registerForm").submit(function(){
                //1.发送数据到服务器
                if(checkPassword() && checkPwd() ){
                    return true;
                }else{
                    //2.不让页面跳转
                    return false;
                    //如果这个方法没有返回值，或者返回为true，则表单提交，如果返回为false，则表单不提交
                }

            });

            //当某一个组件失去焦点是，调用对应的校验方法
            $("#password").blur(checkPassword);
            $("#pwd").blur(checkPwd);
        });
    </script>
    <script type="text/javascript">
        window.onload = function(){
            document.getElementById("back").onclick = function(){
                location = "index.jsp";
            };
        };
    </script>
    
</head>
<body>
<div class="container">
  <div class="register">
    <form id="registerForm" name="registerForm" action="${pageContext.request.contextPath}/registerUserServlet" method="post">
        <h2>注册</h2>
        <p>
            <label for="username">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="请输入姓名">
        </p>
        <p>
            <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
            <span id="tishi2"></span>
        </p>
        <p>
            <label for="pwd">确认密码：</label>
            <input type="text" class="form-control" id="pwd" name="pwd" placeholder="请输入确认密码"/>
            <span id="tishi"></span>
        </p>
        <p>
            <input class="button" type="submit" value="提交" />
            <input class="button" id="back" type="button" value="返回" />
        </p>
    </form>
   </div>
</div>
</body>
</html>