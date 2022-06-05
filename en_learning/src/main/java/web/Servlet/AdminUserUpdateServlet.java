package web.Servlet;

import domain.User;
import domain.words;
import org.apache.commons.beanutils.BeanUtils;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/AdminUserUpdateServlet")
public class AdminUserUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();

        User user=new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        AdminService service=new AdminService();
        if(service.findUser(user.getUser_id())==null){
            //
        }
        else{
            service.updateUser(user);
        }
        request.setAttribute("user",user);
        request.setAttribute("profile_msg","Success");
        request.getRequestDispatcher("/admin_user_update.jsp").forward(request,response);
    }
}
