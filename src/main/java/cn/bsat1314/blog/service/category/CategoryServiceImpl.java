package cn.bsat1314.blog.service.category;

import cn.bsat1314.blog.dao.blog.BlogDao;
import cn.bsat1314.blog.dao.blog.BlogDaoImpl;
import cn.bsat1314.blog.dao.category.CategoryDao;
import cn.bsat1314.blog.dao.category.CategoryImpl;
import cn.bsat1314.blog.pojo.Category;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements CategoryService{

    // 获取CategoryDao
    private CategoryDao categoryDao;
    public CategoryServiceImpl() {
        categoryDao = new CategoryImpl();
    }

    // 获取全部的文章分类
    @Override
    public List<Category> getCategory() {
        List<Category> category = null;
        try {
            category = categoryDao.getCategory();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return category;
    }


}
