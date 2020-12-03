package cn.bsat1314.blog.servlet.blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        blogUtil blogUtil = new blogUtil();
        String method = req.getParameter("method");
        if (method == null) {
            blogUtil.query(req, resp, "/sy.jsp");
        }else if (method.equals("getArticle")){
            blogUtil.getArticle(req, resp, "/article.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}
