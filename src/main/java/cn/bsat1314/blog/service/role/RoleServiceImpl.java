package cn.bsat1314.blog.service.role;

import cn.bsat1314.blog.dao.role.RoleDao;
import cn.bsat1314.blog.dao.role.RoleDaoImpl;
import cn.bsat1314.blog.pojo.Role;

import java.sql.SQLException;
import java.util.List;

public class RoleServiceImpl implements RoleDao {

    // 获取RoleDao
    private RoleDao roleDao;
    public RoleServiceImpl() {
        roleDao = new RoleDaoImpl();
    }

    // 获取用户等级列表
    @Override
    public List<Role> getRoleList(){
        List<Role> roleList = null;
        try {
            roleList = roleDao.getRoleList();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return roleList;
    }
}
