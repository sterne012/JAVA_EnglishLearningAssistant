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


//修改学习计划按钮的跳转，保存相关信息
@WebServlet("/DayPlanServlet")
public class DayPlanServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();

        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");

        User new_user=new User();
        try {
            BeanUtils.populate(new_user,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setUser_words_num(new_user.getUser_words_num());
        user.setUser_sel(new_user.getUser_sel());

        UserService service=new UserService();
        service.updateProfile(user);

        request.setAttribute("msg","success");
        request.getRequestDispatcher("/learn.jsp").forward(request,response);

    }
}
