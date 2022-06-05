package web.Servlet;

import domain.User;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//修改用户时回显
@WebServlet("/AdminUserDisplayServlet")
public class AdminUserDisplayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String user=request.getParameter("user");
        if(user==null){
            request.setAttribute("add_fail_msg","fail");
            request.getRequestDispatcher("/admin_user.jsp").forward(request, response);
        }
        else{
            AdminService service=new AdminService();
            User userr=service.findUser(user);

            request.setAttribute("user",userr);
            request.getRequestDispatcher("/admin_user_update.jsp").forward(request,response);
        }
    }
}
