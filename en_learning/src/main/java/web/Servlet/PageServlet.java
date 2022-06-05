package web.Servlet;

import domain.PageBean;
import domain.words;
import service.LibService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "PageServlet", value = "/PageServlet")
public class PageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String currentPage=request.getParameter("currentPage");//页码
        String rows=request.getParameter("rows");//条数

        if(currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if(rows==null||"".equals(rows)){
            rows="50";
        }

        LibService service=new LibService();
        PageBean<words> pb=new PageBean<>();

        //条件查询追加
        String query = request.getParameter("optionsRadios");
        String en = request.getParameter("EnInp");
        String ch = request.getParameter("ChInp");
        //建议重写


        if (query!=null&&!query.equals("")&&(query.equals("English")||query.equals("1"))&&en!=null&&!en.equals("")) {
            pb = service.findByPage(currentPage, rows, en, 1);
            request.setAttribute("en_query", en);//查询时回显
        }
        else if (query!=null&&!query.equals("")&&(query.equals("Chinese")||query.equals("1"))&&ch!=null&&!ch.equals("")) {
            pb = service.findByPage(currentPage, rows, ch, 2);
            request.setAttribute("ch_query", ch);//查询时回显
            request.setAttribute("ch_msg",query);
        }
        else{
            pb = service.findByPage(currentPage, rows);
        }


        request.setAttribute("pb",pb);
        request.getRequestDispatcher("lib.jsp").forward(request,response);
    }
}
