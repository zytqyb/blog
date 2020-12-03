package cn.bsat1314.blog.servlet.blog;

import cn.bsat1314.blog.pojo.Blog;
import cn.bsat1314.blog.pojo.Category;
import cn.bsat1314.blog.service.blog.BlogServiceImpl;
import cn.bsat1314.blog.service.category.CategoryServiceImpl;
import cn.bsat1314.blog.util.PageSupport;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class blogUtil {

    // 通过前端传入的id查找博客文章内容
    public void getArticle(HttpServletRequest req, HttpServletResponse resp, String url) {
        String id = req.getParameter("id");

        if (id != null) {
            BlogServiceImpl blogService = new BlogServiceImpl();
            CategoryServiceImpl categoryService = new CategoryServiceImpl();
            List<Category> categoryList = categoryService.getCategory();
            Blog blog = blogService.getBlog(Integer.valueOf(id));
            req.setAttribute("blog", blog);
            // 分类列表
            req.setAttribute("categoryList", categoryList);
            try {
                req.getRequestDispatcher(url).forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    // 博客文章列表查询方法
    public void query(HttpServletRequest req, HttpServletResponse resp, String url) {
        PageSupport pageSupport = new PageSupport();
        BlogServiceImpl blogService = new BlogServiceImpl();
        CategoryServiceImpl categoryService = new CategoryServiceImpl();
        List<Category> categoryList = categoryService.getCategory();
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
        // 分类列表
        req.setAttribute("categoryList", categoryList);
        try {
            req.getRequestDispatcher(url).forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
