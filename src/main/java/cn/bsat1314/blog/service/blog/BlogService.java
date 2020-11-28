package cn.bsat1314.blog.service.blog;

import java.sql.SQLException;

public interface BlogService {

    // 博客文章发布方法
    public boolean addArticle(String title, String content, String photo, String category);


}
