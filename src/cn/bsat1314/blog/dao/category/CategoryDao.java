package cn.bsat1314.blog.dao.category;

import cn.bsat1314.blog.pojo.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao {

    // 查询全部分类
    public List<Category> getCategory() throws SQLException;

}
