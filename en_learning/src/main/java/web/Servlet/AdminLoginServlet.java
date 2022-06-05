package web.Servlet;

import domain.Admin;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.AdminService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();
        Admin login=new Admin();
        try {
            BeanUtils.populate(login,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        AdminService service=new AdminService();
        Admin admin=service.login(login);

        if(admin==null){//登录失败
            request.setAttribute("login_msg","login failed, please check the name and password");
            request.getRequestDispatcher("/admin_login.jsp").forward(request,response);
        }
        else{//登录成功
            HttpSession session= request.getSession();
            session.setAttribute("admin",admin);
            response.sendRedirect(request.getContextPath()+"/admin_home.jsp");
        }
    }
}
