package cn.bsat1314.blog.dao.category;

import cn.bsat1314.blog.dao.JdbcC3p0Utils;
import cn.bsat1314.blog.pojo.Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryImpl implements CategoryDao{

    // 查询所有分类的方法
    @Override
    public List<Category> getCategory() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "select * from category;";
        return queryRunner.query(sql, new BeanListHandler<Category>(Category.class));
    }

}
