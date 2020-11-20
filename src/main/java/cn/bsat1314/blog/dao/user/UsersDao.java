package cn.bsat1314.blog.dao.user;

import cn.bsat1314.blog.pojo.User;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public interface UsersDao {

    // 得到登陆的用户
    public User getLoginUser(String usercode) throws SQLException;

    // 添加用户
    public int addUser(String username, String usercode, String password, Date creationDate, Date modifyDate) throws SQLException;

    // 修改当前用户密码
    public int updatepwd(int id, String password) throws SQLException;

    // 根据用户名或者角色查询用户总数
    public int getUserCount(String username, int role) throws SQLException;

    // 通过条件获取用户列表
    public List<User> getUserList(String username, int role, int currentPageNo, int pageSize) throws SQLException;

    // 通过id删除指定用户
    public int deleteUser(int userId) throws SQLException;

}
