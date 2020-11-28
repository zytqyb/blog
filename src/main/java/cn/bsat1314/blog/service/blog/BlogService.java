package cn.bsat1314.blog.service.blog;

import cn.bsat1314.blog.pojo.Blog;

import java.sql.SQLException;
import java.util.List;

public interface BlogService {

    // 博客文章发布方法
    public boolean addArticle(String title, String content, String photo, String category, String content100, String username);

    // 根据文章名或者分类查询文章总数
    public int getBlogCount(String title, Integer categoryId);

    // 通过条件获取文章列表
    public List<Blog> getBlogList(String title, Integer categoryId, int currentPageNo, int pageSize);

    // 通过id拿到文章数据
    public Blog getBlog(Integer id);
}
