package cn.bsat1314.blog.service.user;

import cn.bsat1314.blog.dao.user.UsersDao;
import cn.bsat1314.blog.dao.user.UsersDaoImpl;
import cn.bsat1314.blog.pojo.User;

import java.sql.SQLException;
import java.util.List;

public class UsersServiceImpl implements UsersService{

    // 业务层都会调用dao层, 所以我们要引入Dao层;
    private UsersDao usersDao;
    public UsersServiceImpl() {
        usersDao = new UsersDaoImpl();
    }
    // 实现用户登录功能
    @Override
    public User login(String usercode) {
        User user = null;
        try {
            user = usersDao.getLoginUser(usercode);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    // 实现用户注册
    //@Override
    //public boolean adduser(String username, String usercode, String password) {
    //    boolean result = false;
    //    try {
    //        int i = usersDao.addUser(username, usercode, password);
    //        if (i > 0) {
    //            result = false;
    //        }
    //    } catch (SQLException throwables) {
    //        throwables.printStackTrace();
    //    }
    //    return result;
    //}

    // 实现用户修改密码
    @Override
    public boolean updatepwd(int id, String password) {
        boolean result = false;
        try {
            int i = usersDao.updatepwd(id, password);
            if (i > 0) {
                result = true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

    // 查询记录数量
    @Override
    public int getUserCount(String username, int useRole) {
        int userCount = 0;
        try {
            userCount = usersDao.getUserCount(username, useRole);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userCount;
    }

    // 通过条件获取用户列表
    @Override
    public List<User> getUserList(String username, int role, int currentPageNo, int pageSize) {
        List<User> userList = null;
        System.out.println("本次查询用户昵称 --- > " + username);
        System.out.println("本次查询用户角色 --- > " + role);
        System.out.println("当前页码 --- > " + currentPageNo);
        System.out.println("一页存放几条数据 --- > " + pageSize);
        try {
            userList = usersDao.getUserList(username, role, currentPageNo, pageSize);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public int deleteUserList(int userId) {
        int i = 0;
        try {
            i = usersDao.deleteUser(userId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return i;
    }
}
