package web.Servlet;

import domain.words;
import service.LibService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/LibServlet")
public class LibServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LibService service=new LibService();
        List<words> words=service.findAll();

        request.setAttribute("words",words);
        request.getRequestDispatcher("/lib.jsp").forward(request,response);
    }
}
