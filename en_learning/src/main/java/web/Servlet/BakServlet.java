package web.Servlet;

import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/BakServlet")
public class BakServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String dateNowStr = sdf.format(date);


        AdminService service=new AdminService();
        service.bak(dateNowStr);


        request.setAttribute("succ_msg",dateNowStr);
        request.getRequestDispatcher("/admin_home.jsp").forward(request,response);
    }
}
