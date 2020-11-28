package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
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
        }else if(method != null && method.equals("getArticle")) {
            this.getArticle(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    // 添加博客文章方法
    public void addArticle(HttpServletRequest req, HttpServletResponse resp) {
        // 获取前端传入的数据
        String title = req.getParameter("title");
        String photo = req.getParameter("photo");
        String category = req.getParameter("category");
        String content100 = req.getParameter("content100");
        String username = req.getParameter("username");
        String content = req.getParameter("my-editormd-markdown-doc");

        if (title != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            boolean result = blogService.addArticle(title, content, photo, category, content100, username);
            if (result) {
                try {
                    req.getSession().setAttribute("result","添加成功");
                    resp.sendRedirect("/admin/addarticle.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                try {
                    resp.sendRedirect("/admin/addarticle.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 通过前端传入的id查找博客文章内容
    public void getArticle(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        if (id != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            Blog blog = blogService.getBlog(Integer.valueOf(id));
            req.setAttribute("blog", blog);
            try {
                req.getRequestDispatcher("/article.jsp").forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

}
