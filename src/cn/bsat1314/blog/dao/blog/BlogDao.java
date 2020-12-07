package cn.bsat1314.blog.dao.blog;

import cn.bsat1314.blog.pojo.Blog;

import java.sql.SQLException;
import java.util.List;

public interface BlogDao {

    // 添加一篇文章
    public int addBlog(String title, String content, String photo, String category, String content100, String username) throws SQLException;

    // 根据文章名或者分类查询文章总数
    public int getBlogCount(String title, Integer categoryId) throws SQLException;

    // 通过条件获取文章列表
    public List<Blog> getBlogList(String title, Integer categoryId, int currentPageNo, int pageSize) throws SQLException;

    // 通过id查询文章内容
    public Blog getBlog(Integer id) throws SQLException;

    // 通过id删除指定文章
    public int deleteBlog(int blogId) throws SQLException;

    // 随机返回n个文章
    public List<Blog> getNumberBLog(int number) throws SQLException;
}
