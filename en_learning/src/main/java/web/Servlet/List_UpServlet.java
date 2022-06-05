package web.Servlet;

import domain.User;
import service.ListService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/List_UpServlet")
public class List_UpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word = request.getParameter("word");
        HttpSession session= request.getSession();
        User user = (User) session.getAttribute("user");

        ListService service=new ListService();
        service.rank_up(user,word);

        request.setAttribute("rank_up","success");
//        response.sendRedirect(request.getContextPath()+"/List1Servlet");
        request.getRequestDispatcher("/List1Servlet").forward(request,response);
    }
}
