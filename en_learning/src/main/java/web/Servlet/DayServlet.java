package web.Servlet;

import domain.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//开始学习按钮的跳转，自动根据计划添加单词
@WebServlet("/DayServlet")
public class DayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService service=new UserService();
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("user");
        service.BeginLearn(user);

        request.setAttribute("begin_msg","success");
        request.getRequestDispatcher("/List1Servlet").forward(request,response);
    }
}
