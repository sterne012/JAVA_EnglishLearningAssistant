package web.Servlet;

import domain.User;
import service.ListService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/List_ReServlet")//熟词表中单词放回
public class List_ReServlet extends HttpServlet {
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
        service.rank_re(user,word);

        request.setAttribute("rank_re","success");
//        response.sendRedirect(request.getContextPath()+"/List2Servlet");
        request.getRequestDispatcher("/List2Servlet").forward(request,response);
    }
}
