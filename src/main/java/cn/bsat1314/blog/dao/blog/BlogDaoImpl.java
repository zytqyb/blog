package cn.bsat1314.blog.dao.blog;

import cn.bsat1314.blog.dao.JdbcC3p0Utils;
import cn.bsat1314.blog.pojo.Blog;

import com.mysql.jdbc.StringUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDaoImpl implements BlogDao{

    // 添加一篇文章
    @Override
    public int addBlog(String title, String content, String photo, String category, String content100, String username) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "insert into `blog`(`title`, `content`, `photo`, `category`, content100, username) values (?, ?, ?, ?, ?, ?)";
        Object[] params = {title, content, photo, category, content100, username};
        return queryRunner.update(sql, params);
    }

    // 根据文章名或者分类查询文章总数
    @Override
    public int getBlogCount(String title, Integer categoryId) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        StringBuilder sql = new StringBuilder();

        sql.append("select count(1) as `count` from `blog` b, `category` c where b.category = c.id");
        ArrayList<Object> list = new ArrayList<>();// 存放我们的参数

        if (!StringUtils.isNullOrEmpty(title)) {
            sql.append(" and b.title like ?");
            list.add("%" + title + "%");// 数组下标0
        }
        if (categoryId!= null && categoryId > 0) {
            sql.append(" and c.id = ?");
            list.add(categoryId);// 数组下标1
        }
        Number count = queryRunner.query(sql.toString(), new ScalarHandler<>("count"), list.toArray());
        return count.intValue();
    }


    // 通过条件获取文章列表
    @Override
    public List<Blog> getBlogList(String title, Integer categoryId, int currentPageNo, int pageSize) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT b.*, c.name FROM blog b, category c WHERE b.category = c.id");
        ArrayList<Object> list = new ArrayList<>();// 存放我们的参数

        if (!StringUtils.isNullOrEmpty(title)) {
            sql.append(" and b.title like ?");
            list.add("%" + title + "%"); // 数组下标0
        }
        if (categoryId != null && categoryId > 0) {
            sql.append(" and c.id = ?");
            list.add(categoryId);// 数组下标1
        }
        // 分页功能 在数据库中分页使用Limit startIndex, pageSize; 总数
        // 当前页 (当前页-1) * 页面大小
        // 0->5 第一页  1 0 01234
        // 6->5 第二页  2 5 56789
        // 11->5 第三页
        sql.append(" ORDER BY b.uploadTime desc LIMIT ?,?");
        currentPageNo = (currentPageNo - 1) * pageSize;
        list.add(currentPageNo);
        list.add(pageSize);
        List<Blog> blogList = queryRunner.query(sql.toString(), new BeanListHandler<>(Blog.class), list.toArray());
        System.out.println("本次文章查询语句" + sql.toString()); // 输出最后完整的sql语句
        return blogList;
    }

    // 通过id查询文章内容
    @Override
    public Blog getBlog(Integer id) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "select * from blog where id = ?";
        return queryRunner.query(sql, new BeanHandler<>(Blog.class), id);
    }
}
