package web.Servlet;

import dao.UserDao;
import domain.User;
import org.apache.commons.beanutils.BeanUtils;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

//        封装为beanUtils
//        String id = req.getParameter("id");
//        String password = req.getParameter("password");
//        User loginuser=new User();
//        loginuser.setUser_id(id);
//        loginuser.setUser_passwd(password);

        Map<String, String[]> map = req.getParameterMap();
        User loginuser=new User();
        try {
            BeanUtils.populate(loginuser,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        UserService service = new UserService();
        User user = service.login(loginuser);

        if(user==null){//登录失败
            req.setAttribute("login_msg","login failed, please check the name and password");
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }
        else{//登录成功
            HttpSession session= req.getSession();
            session.setAttribute("user",user);
            resp.sendRedirect(req.getContextPath()+"/home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
