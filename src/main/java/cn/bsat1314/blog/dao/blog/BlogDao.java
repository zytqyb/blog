package cn.bsat1314.blog.dao.blog;

import java.sql.SQLException;

public interface BlogDao {
    // 添加一篇文章
    public int addBlog(String title, String content, String photo, String category) throws SQLException;
}
