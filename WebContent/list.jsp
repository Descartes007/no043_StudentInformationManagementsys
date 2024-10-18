<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>学生信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/list.css" rel="stylesheet">
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script>
        function deleteUser(id){
            //用户安全提示
            if(confirm("您确定要删除该学生的信息吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }

        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){

                   var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }

                    if(flag){//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }

            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("sid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
  <div  class="nav">
        <div class="title"><p>学生信息管理系统</p> </div>
            <div class="navl"> 
              <a href="${pageContext.request.contextPath}/findUserByPageServlet">学生信息</a>
              <a href="check.jsp">查询学生</a>     
              <a href="${pageContext.request.contextPath}/add.jsp">添加学生</a>
              <a href="javascript:void(0);" id="delSelected">删除选中</a>
            </div>
             <div class="exit" ><a href="index.jsp">退出</a></div>
        </div>
  </div>
    <div class="info">
       <div class=“infol”>
         <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
            <table>
            <tr>
              <th><input type="checkbox" id="firstCb"></th>
              <th>学号</th>
              <th>姓名</th>
           	  <th>性别</th>
           	  <th>年龄</th>
          	  <th>籍贯</th>
           	  <th>电话号码</th>
              <th>班级</th>
              <th>操作</th>
            </tr>
		    <c:forEach items="${pb.list}" var="student" varStatus="s">
		            <tr>
		                <td><input type="checkbox" name="sid" value="${student.id}"></td>
		                <td>${student.id}</td>
		                <td>${student.name}</td>
		                <td>${student.gender}</td>
		                <td>${student.age}</td>
		                <td>${student.address}</td>
		                <td>${student.phone}</td>
		                <td>${student.clas}</td>
		                <td><a  href="${pageContext.request.contextPath}/findUserServlet?id=${student.id}">修改</a>&nbsp;
		                    <a  href="javascript:deleteUser(${student.id});">删除</a></td>
		            </tr>
	        </c:forEach>
           </table>
        </form>
       </div>
       
    </div>
    <div class="page">
        <nav aria-label="Page navigation">
            <ul>
                <c:if test="${pb.currentPage == 1}">
                    <li>
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条信息，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
          
        <div >       
       
        </div>
</div>
</body>
</html>
