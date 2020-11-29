package cn.bsat1314.blog.service.blog;

import cn.bsat1314.blog.dao.blog.BlogDao;
import cn.bsat1314.blog.dao.blog.BlogDaoImpl;
import cn.bsat1314.blog.dao.role.RoleDao;
import cn.bsat1314.blog.dao.role.RoleDaoImpl;
import cn.bsat1314.blog.pojo.Blog;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

public class BlogServiceImpl implements BlogService{

    // 获取BlogDao
    private BlogDao blogDao;
    public BlogServiceImpl() {
        blogDao = new BlogDaoImpl();
    }

    // 实现文章添加功能
    @Override
    public boolean addArticle(String title, String content, String photo, String category, String content100, String username) {
        boolean result = false;
        try {
            int i = blogDao.addBlog(title, content, photo, category, content100, username);
            if (i > 0) {
                result = true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    // 查询符合条件的文章数量
    @Override
    public int getBlogCount(String title, Integer categoryId) {
        int blogCount = 0;
        try {
            blogCount = blogDao.getBlogCount(title, categoryId);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return blogCount;
    }


    // 通过条件获取文章列表
    @Override
    public List<Blog> getBlogList(String title, Integer categoryId, int currentPageNo, int pageSize) {
        List<Blog> blogList= null;
        try {
            blogList = blogDao.getBlogList(title, categoryId, currentPageNo, pageSize);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return blogList;
    }

    // 通过id拿到文章数据
    @Override
    public Blog getBlog(Integer id) {
        Blog blog = null;
        try {
            blog = blogDao.getBlog(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return blog;
    }
}
