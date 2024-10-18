<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询</title>
    <link href="css/check.css" rel="stylesheet">
    
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
        <div class="check">
         <form action="${pageContext.request.contextPath}/findUserByPageServlet" method="post"> 
          <h2>查询</h2>
          <p>
           <label for="exampleInputName1">学生姓名:</label>
           <input type="text" name="name" value="${condition.name[0]}" id="exampleInputName1" >
         </p>
         <p>  
           <label for="exampleInputName2">学生学号:</label>
           <input type="text" name="id" value="${condition.id[0]}" id="exampleInputName2" >         
         </p>
         <p>  
           <label for="exampleInputName4">学生班级:</label>
           <input type="text" name="clas" value="${condition.clas[0]}" id="exampleInputName4" >         
         </p>
         <p>  
           <label for="exampleInputName3">学生籍贯:</label>
           <input type="text" name="address" value="${condition.address[0]}" id="exampleInputName3" >         
         </p>
         <p>  
           <label for="exampleInputName5">学生性别:</label>
           <input type="text" name="gender" value="${condition.gender[0]}" id="exampleInputName5" >         
         </p>
         <p>  
           <label for="exampleInputName6">学生年龄:</label>
           <input type="text" name="age" value="${condition.age[0]}" id="exampleInputName6" >         
         </p>
         <p>
           <button type="submit" class="button">查询</button> 
         </p>      
         </form> 
        </div>
        
  
  </div>
</body>
</html>