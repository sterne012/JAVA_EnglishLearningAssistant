package web.Servlet;

import domain.Admin;
import org.apache.commons.beanutils.BeanUtils;
import service.AdminService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/AdminInfoServlet")
public class AdminInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();

        HttpSession session=request.getSession();
        Admin admin= (Admin) session.getAttribute("admin");

        Admin new_admin=new Admin();
        try {
            BeanUtils.populate(new_admin,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        admin.setAdmin_passwd(new_admin.getAdmin_passwd());


        //保存
        AdminService service=new AdminService();
        service.updateProfile(admin);

        //提示信息
        request.setAttribute("profile_msg","success");


        //更新admin
        admin = service.login(admin);
        request.setAttribute("admin",admin);

        session.setAttribute("admin",admin);
        request.getRequestDispatcher("/admin_profile.jsp").forward(request,response);
    }
}
