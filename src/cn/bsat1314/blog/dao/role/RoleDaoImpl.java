package cn.bsat1314.blog.dao.role;

import cn.bsat1314.blog.dao.JdbcC3p0Utils;
import cn.bsat1314.blog.pojo.Role;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class RoleDaoImpl implements RoleDao{
    // 获取用户等级列表
    @Override
    public List<Role> getRoleList() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "select * from role";
        List<Role> query = queryRunner.query(sql, new BeanListHandler<Role>(Role.class));
        return query;
    }

}
