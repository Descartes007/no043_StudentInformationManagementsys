package cn.itcast.web.servlet;

import cn.itcast.domain.Student;
import cn.itcast.service.StudentService;
import cn.itcast.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findUserServlet")
public class FindUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取id
        String id = request.getParameter("id");
        //2.调用Service查询
        StudentService service = new StudentServiceImpl();
        Student student = service.findUserById(id);

        //3.将user存入request
        request.setAttribute("student", student);
        //4.转发到update.jsp
        request.getRequestDispatcher("/update.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
