package cn.bsat1314.blog.dao.user;

import cn.bsat1314.blog.dao.JdbcC3p0Utils;
import cn.bsat1314.blog.pojo.User;
import com.mysql.jdbc.StringUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UsersDaoImpl implements UsersDao {
    // 查询单个用户是否存在
    @Override
    public User getLoginUser(String usercode) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "select * from users";
        return queryRunner.query(sql, new BeanHandler<>(User.class));
    }

    // 注册功能
    @Override
    public int addUser(String username, String usercode, String password, Date creationDate, Date modifyDate) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "insert into users(`username`, `usercode`, `password`) values(?,?,?,?,?)";
        Object[] params = {username, usercode, password, creationDate, modifyDate};
        return queryRunner.update(sql, params);
    }

    // 修改密码功能
    @Override
    public int updatepwd(int id, String password) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "update users set `password` = ? where id = ?";
        Object[] params = {password, id};
        return queryRunner.update(sql, params);
    }

    // 根据用户名或者角色查询用户总数
    @Override
    public int getUserCount(String username, int role) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());

        StringBuilder sql = new StringBuilder();
        sql.append("select count(1) as `count` from users u, role r where u.role = r.id");
        ArrayList<Object> list = new ArrayList<>();// 存放我们的参数

        if (!StringUtils.isNullOrEmpty(username)) {
            sql.append(" and u.username like ?");
            list.add("%" + username + "%");// 数组下标0
        }
        if (role > 0) {
            sql.append(" and u.role = ?");
            list.add(role);// 数组下标1
        }

        System.out.println("UserDaoImpl-> getUserCount:" + sql.toString()); // 输出最后完整的sql语句
        // 把list转换成数组 list.toArray()
        Number count = queryRunner.query(sql.toString(), new ScalarHandler<>("count"), list.toArray());
        return count.intValue();
    }

    // 通过条件获取用户列表
    @Override
    public List<User> getUserList(String username, int role, int currentPageNo, int pageSize) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT u.*, r.rolename AS userrolename FROM users u, role r WHERE u.role = r.id");
        ArrayList<Object> list = new ArrayList<>();// 存放我们的参数

        if (!StringUtils.isNullOrEmpty(username)) {
            sql.append(" and u.username like ?");
            list.add("%" + username + "%"); // 数组下标0
        }
        if (role > 0) {
            sql.append(" and u.role = ?");
            list.add(role);// 数组下标1
        }
        // 分页功能 在数据库中分页使用Limit startIndex, pageSize; 总数
        // 当前页 (当前页-1) * 页面大小
        // 0->5 第一页  1 0 01234
        // 6->5 第二页  2 5 56789
        // 11->5 第三页
        sql.append(" ORDER BY id LIMIT ?,?");
        currentPageNo = (currentPageNo - 1) * pageSize;
        list.add(currentPageNo);
        list.add(pageSize);
        List<User> userList = queryRunner.query(sql.toString(), new BeanListHandler<>(User.class), list.toArray());
        System.out.println("本次查询sql语句:" + sql.toString());
        return userList;
    }

    // 通过id删除指定用户
    @Override
    public int deleteUser(int userId) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(JdbcC3p0Utils.getDataSource());
        String sql = "delete from users where id = ?";
        return queryRunner.update(sql, userId);
    }

}
