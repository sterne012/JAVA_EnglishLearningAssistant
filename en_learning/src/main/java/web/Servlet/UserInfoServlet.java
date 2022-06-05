package web.Servlet;

import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();

        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");

        User new_user=new User();
        try {
            BeanUtils.populate(new_user,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setUser_passwd(new_user.getUser_passwd());
        user.setUser_name(new_user.getUser_name());

        //保存
        UserService service=new UserService();
        service.updateProfile(user);

        //提示信息
        request.setAttribute("profile_msg","success");


        //更新user
        user = service.login(user);
        request.setAttribute("user",user);

        session.setAttribute("user",user);
        request.getRequestDispatcher("/profile.jsp").forward(request,response);
//        response.sendRedirect(request.getContextPath()+"profile.jsp");

    }
}
