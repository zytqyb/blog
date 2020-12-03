package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
import cn.bsat1314.blog.service.blog.BlogServiceImpl;
import com.alibaba.fastjson.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


public class BlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        blogUtil blogUtil = new blogUtil();
        // 实现Servlet的复用
        String method = req.getParameter("method");
        if (method != null && method.equals("addArticle")) {
            this.addArticle(req, resp);
        }else if(method != null && method.equals("ajaxArticle")) {
            this.ajaxArticle(req, resp);
        }else if(method != null && method.equals("query")) {
            blogUtil.query(req, resp, "/admin/articlelist.jsp");
        }else if (method != null && method.equals("deleteBlog")) {
            this.deleteBlog(req, resp);
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
                    req.getSession().setAttribute("result",true);
                    resp.sendRedirect("/admin/addarticle.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                try {
                    req.getSession().setAttribute("result",false);
                    resp.sendRedirect("/admin/addarticle.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }



    // 通过ajax刷新文章
    public void ajaxArticle(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        if (id != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            Blog blog = blogService.getBlog(Integer.valueOf(id));
            req.setAttribute("blog", blog);
            Map<String, Blog> resultMap = new HashMap<>();
            if (blog != null) {
                resultMap.put("blog", blog);
            }

            try {
                resp.setContentType("application/json"); // 设置返回的是json值
                PrintWriter writer = resp.getWriter();
                writer.write(JSONArray.toJSONString(resultMap));
                writer.flush();
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

            try {
                req.getRequestDispatcher("/article.jsp").forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteBlog(HttpServletRequest req, HttpServletResponse resp) {
        String[] blogId = req.getParameterValues("blogId");
        if (blogId != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            for (String s : blogId) {
                int i = blogService.deleteBlog(Integer.parseInt(s));
                if (i < 0) {
                    break;
                }
            }
            try {
                req.getSession().setAttribute("result", "删除成功!");
                resp.sendRedirect("/admin/blog?method=query");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                req.getSession().setAttribute("result", "删除失败!");
                resp.sendRedirect("/admin/blog?method=query");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }

}
