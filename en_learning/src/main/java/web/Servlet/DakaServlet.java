package web.Servlet;

import domain.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/DakaServlet")
public class DakaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        User user =(User)session.getAttribute("user");

        int learn=Integer.parseInt(user.getUser_learn())+1;
        user.setUser_learn(Integer.toString(learn));
        user.setUser_learned(0);

        UserService service=new UserService();
        service.updateProfile(user);

        request.getRequestDispatcher("/ExitServlet").forward(request,response);
    }
}
