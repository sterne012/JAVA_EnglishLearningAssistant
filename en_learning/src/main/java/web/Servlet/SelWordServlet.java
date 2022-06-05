package web.Servlet;

import domain.User;
import service.LibService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/SelWordServlet")
public class SelWordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user=(User)session.getAttribute("user");
        String[] words = request.getParameterValues("word");

        if(words==null){
            request.setAttribute("add_fail_msg","fail");
            request.getRequestDispatcher("/PageServlet").forward(request, response);
        }
        else {
            LibService service = new LibService();
            if(service.findWords(user,words)){
                service.addWords(user, words);
                request.setAttribute("add_msg", "Success!");
                request.getRequestDispatcher("/PageServlet").forward(request, response);
            }
            else{
                request.setAttribute("duplicate_msg","duplicate");
                request.getRequestDispatcher("/PageServlet").forward(request,response);
            }
        }
    }
}
