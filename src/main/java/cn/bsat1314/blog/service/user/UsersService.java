package cn.bsat1314.blog.service.user;

import cn.bsat1314.blog.pojo.User;

import java.util.List;


public interface UsersService {

    // 用户登录
    public User login(String usercode);

    //// 用户注册
    //public boolean adduser(String username, String usercode, String password);

    // 修改当前用户密码
    public boolean updatepwd(int id, String password);

    // 查询记录数量
    public int getUserCount(String username, int useRole);

    // 通过条件获取用户列表
    public List<User> getUserList(String username, int role, int currentPageNo, int pageSize);

}
