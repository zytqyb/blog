package cn.bsat1314.blog.dao.blog;

import cn.bsat1314.blog.dao.JdbcC3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

public class BlogDaoImpl implements BlogDao{

    // 添加一篇文章
    @Override
    public int addBlog(String title, String content, String photo, String category) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "insert into `blog`(`title`, `content`, `photo`, `category` ) values (?, ?, ?, ?)";
        Object[] params = {title, content, photo, category};
        return queryRunner.update(sql, params);
    }
}
