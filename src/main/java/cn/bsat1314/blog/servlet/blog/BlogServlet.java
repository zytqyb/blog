package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.service.blog.BlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 实现Servlet的复用
        String method = req.getParameter("method");
        if (method != null && method.equals("addArticle")) {
            this.addArticle(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void addArticle(HttpServletRequest req, HttpServletResponse resp) {
        // 获取前端传入的数据
        String title = req.getParameter("title");
        String photo = req.getParameter("photo");
        String category = req.getParameter("category");
        String content = req.getParameter("my-editormd-markdown-doc");

        if (title != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            boolean result = blogService.addArticle(title, content, photo, category);
            if (result) {
                System.out.println("添加成功");
            }else {
                System.out.println("添加失败");
            }
        }
    }
}
