package web.Servlet;


import domain.User;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService service=new AdminService();
        List<User> userList=service.findUsers();

        request.setAttribute("users",userList);
        request.getRequestDispatcher("/admin_user.jsp").forward(request,response);
    }
}
