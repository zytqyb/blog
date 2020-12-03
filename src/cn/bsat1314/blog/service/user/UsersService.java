package cn.bsat1314.blog.service.user;

import cn.bsat1314.blog.pojo.User;

import java.util.List;


public interface UsersService {

    // 用户登录
    public User login(String usercode);

    // 添加用户
    public boolean addUser(String username, String usercode, String password, String role, String AvatarUrl);

    // 修改当前用户密码
    public boolean updatepwd(int id, String password);

    // 查询记录数量
    public int getUserCount(String username, int useRole);

    // 通过条件获取用户列表
    public List<User> getUserList(String username, int role, int currentPageNo, int pageSize);

    // 通过id对用户进行删除操作
    public int deleteUserList(int userId);

    // 通过id获取需要修改的用户
    public User getModifyUser(int id);

    // 通过前台传入的数据修改用户信息
    public boolean updateUser(String usercode, String username, int role);

}
