package web.Servlet;


import domain.Admin;
import domain.words;
import service.AdminService;
import service.LibService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

//单词修改时的回显
@WebServlet("/AdminWordServlet")
public class AdminWordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String[] words = request.getParameterValues("word");

        if(words==null){
            request.setAttribute("add_fail_msg","fail");
            request.getRequestDispatcher("/PageServlet").forward(request, response);
        }
        else {
            AdminService service=new AdminService();
            words word=service.findWord(words[0]);

            String s=word.getTrans();
            word.setTrans(s.replace("\"","&quot;"));

            request.setAttribute("word",word);
            request.getRequestDispatcher("/admin_word_update.jsp").forward(request,response);
        }
    }
}
