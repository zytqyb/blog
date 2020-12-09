package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
import cn.bsat1314.blog.service.blog.BlogServiceImpl;
import com.alibaba.fastjson.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
// 首页渲染等等Servlet
@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        blogUtil blogUtil = new blogUtil();
        String method = req.getParameter("method");
        if (method == null) {
            blogUtil.query(req, resp, "/sy.jsp");
        }else if (method.equals("getArticle")){
            blogUtil.getArticle(req, resp, "/article.jsp");
        }else if (method.equals("getNumberBLog")) {
            this.getNumberBLog(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void getNumberBLog(HttpServletRequest req, HttpServletResponse resp) {
        int number = Integer.parseInt(req.getParameter("number"));
        // 随机获取文章
        BlogServiceImpl blogService = new BlogServiceImpl();
        List<Blog> numberBLog = blogService.getNumberBLog(number);
        // 万能的Map : 结果集
        Map<String, List<Blog>> resultMap = new HashMap<>();
        resultMap.put("result", numberBLog);
        resp.setContentType("application/json"); // 设置返回的是json值
        try {
            PrintWriter writer = resp.getWriter();
            writer.write(JSONArray.toJSONString(resultMap));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
