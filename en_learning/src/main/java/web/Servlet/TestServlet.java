package web.Servlet;

import domain.User;
import domain.userWord;
import domain.words;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        User user = (User) session.getAttribute("user");

        UserService service=new UserService();
        List<userWord> words=service.UserTest(user);


        request.setAttribute("words",words);
        request.getRequestDispatcher("/wordtest.jsp").forward(request,response);

    }
}
