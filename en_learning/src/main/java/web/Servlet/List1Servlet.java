package web.Servlet;

import domain.User;
import domain.userWord;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/List1Servlet")
public class List1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService service=new UserService();
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        List<userWord> words=service.List1words(user);

        request.setAttribute("words",words);
        request.getRequestDispatcher("list1.jsp").forward(request,response);
    }
}
