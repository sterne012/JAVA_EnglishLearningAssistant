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

@WebServlet(name = "SignServlet", value = "/SignServlet")
public class SignServlet extends HttpServlet {
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

        UserService service=new UserService();
        if(service.CheckLogin(user)){
            service.sign(user);

            request.setAttribute("sign_msg","success");
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
        }
        else{
            request.setAttribute("fail_msg","failed");
            request.getRequestDispatcher("/signup.jsp").forward(request,response);
        }

    }
}
