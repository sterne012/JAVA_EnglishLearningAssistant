package web.Servlet;

import domain.User;
import domain.userWord;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/List2Servlet")
public class List2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService service=new UserService();
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        List<userWord> words=service.List2words(user);

        request.setAttribute("words",words);
        request.getRequestDispatcher("list2.jsp").forward(request,response);
    }
}
