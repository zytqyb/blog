package cn.bsat1314.blog.service.blog;

import cn.bsat1314.blog.dao.blog.BlogDao;
import cn.bsat1314.blog.dao.blog.BlogDaoImpl;
import cn.bsat1314.blog.dao.role.RoleDao;
import cn.bsat1314.blog.dao.role.RoleDaoImpl;

import java.sql.SQLException;

public class BlogServiceImpl implements BlogService{

    // 获取BlogDao
    private BlogDao blogDao;
    public BlogServiceImpl() {
        blogDao = new BlogDaoImpl();
    }

    // 实现文章添加功能
    @Override
    public boolean addArticle(String title, String content, String photo, String category) {
        boolean result = false;
        try {
            int i = blogDao.addBlog(title, content, photo, category);
            if (i > 0) {
                result = true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }
}
