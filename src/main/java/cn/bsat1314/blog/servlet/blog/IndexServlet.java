package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
import cn.bsat1314.blog.service.blog.BlogServiceImpl;
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
        this.query(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    // 博客文章查询方法
    public void query(HttpServletRequest req, HttpServletResponse resp) {
        PageSupport pageSupport = new PageSupport();
        BlogServiceImpl blogService = new BlogServiceImpl();

        // 从前端加载数据
        String title = req.getParameter("title");
        String CategoryId = req.getParameter("CategoryId");
        String pageIndex = req.getParameter("pageIndex");

        // 默认的分类
        int queryCategoryId = 0;

        if (title == null) {
            title = "";
        }

        if (CategoryId != null && !CategoryId.equals("")) {
            queryCategoryId = Integer.parseInt(CategoryId); // 1,2,3
        }
        if (pageIndex != null && !pageIndex.equals("")) {
            pageSupport.setCurrentPageNo(Integer.parseInt(pageIndex));
        }

        // 第一次访问这个请求一定是第一页, 页面大小固定
        // 一页的大小  默认5
        int pageSize = pageSupport.getPageSize();
        // 当前页
        int currentPageNo = pageSupport.getCurrentPageNo();

        // 获取文章的总数
        int totalCount = blogService.getBlogCount(title, queryCategoryId);
        // 总页数支持
        // 当前页
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);

        int totalPageCount = pageSupport.getTotalPageCount();

        List<Blog> blogList = blogService.getBlogList(title, queryCategoryId, currentPageNo, pageSize);
        req.setAttribute("blogList", blogList);

        // 文章总数
        req.setAttribute("totalCount", pageSupport.getTotalCount());
        System.out.println("文章总数" +pageSupport.getTotalCount());
        // 用户搜索的文章名
        req.setAttribute("title", title);
        // 用户搜索的分类
        req.setAttribute("queryCategoryId", queryCategoryId);
        // 当前页数
        req.setAttribute("currentPageNo", currentPageNo);
        // 总页数
        req.setAttribute("totalPageCount", totalPageCount);
        try {
            req.getRequestDispatcher("/sy.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
