package cn.bsat1314.blog.dao.role;

import cn.bsat1314.blog.pojo.Role;

import java.sql.SQLException;
import java.util.List;

public interface RoleDao {
    // 获取用户等级列表
    public List<Role> getRoleList() throws SQLException;
}
