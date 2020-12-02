package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
import cn.bsat1314.blog.pojo.Category;
import cn.bsat1314.blog.service.blog.BlogServiceImpl;
import cn.bsat1314.blog.service.category.CategoryServiceImpl;
import cn.bsat1314.blog.util.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        blogUtil blogUtil = new blogUtil();
        String method = req.getParameter("method");
        if (method == null) {
            blogUtil.query(req, resp, "/sy.jsp");
        }else if (method != null && method.equals("getArticle")){
            blogUtil.getArticle(req, resp, "/article.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}
