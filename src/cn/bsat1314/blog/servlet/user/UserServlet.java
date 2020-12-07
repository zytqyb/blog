package cn.bsat1314.blog.servlet.user;

import cn.bsat1314.blog.pojo.Role;
import cn.bsat1314.blog.pojo.User;
import cn.bsat1314.blog.service.role.RoleServiceImpl;
import cn.bsat1314.blog.service.user.UsersServiceImpl;
import cn.bsat1314.blog.util.Constants;
import cn.bsat1314.blog.util.PageSupport;
import com.alibaba.fastjson.JSONArray;
import com.mysql.jdbc.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 用户操作
@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 实现Servlet复用
        String method = req.getParameter("method");
        if (method != null && method.equals("savepwd")) {
            this.updatePwd(req, resp);
        } else if (method != null && method.equals("pwdmodify")) {
            this.pwdModify(req, resp);
        } else if (method != null && method.equals("query")) {
            this.query(req, resp);
        } else if (method != null && method.equals("deleteUser")) {
            this.deleteUser(req, resp);
        } else if (method != null && method.equals("codeAdd")) {
            this.codeAdd(req, resp);
        } else if (method != null && method.equals("addUser")) {
            this.addUser(req, resp);
        } else if (method != null && method.equals("getModifyUser")) {
            this.getModifyUser(req, resp);
        } else if (method != null && method.equals("modifyUser")) {
            this.modifyUser(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    // 修改密码
    public void updatePwd(HttpServletRequest req, HttpServletResponse resp) {
        // 从Session拿到ID;
        Object o = req.getSession().getAttribute(Constants.USER_SESSION);

        String password = req.getParameter("password");
        String newpassword = req.getParameter("newpassword");
        boolean flag = false;
        if (o != null && newpassword != null) {
            UsersServiceImpl usersService = new UsersServiceImpl();
            flag = usersService.updatepwd(((User) o).getId(), newpassword);
            if (flag) {
                req.setAttribute("message", "修改密码成功");
                // 密码修改成功删除Session
                req.getSession().removeAttribute(Constants.USER_SESSION);
                try {
                    req.getRequestDispatcher("modify.jsp").forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                req.setAttribute("rs", "修改密码失败,请重试");
            }
        } else {
            req.setAttribute("rs", "修改密码失败,请重试");
        }
    }

    // 验证旧密码
    public void pwdModify(HttpServletRequest req, HttpServletResponse resp) {
        Object o = req.getSession().getAttribute(Constants.USER_SESSION);
        String oldpassword = req.getParameter("oldpassword");

        // 万能的Map : 结果集
        Map<String, String> resultMap = new HashMap<String, String>();
        if (o == null) { // Session失效了, session过期了
            resultMap.put("result", "sessionerror");
        } else if (StringUtils.isNullOrEmpty(oldpassword)) { // 输入的密码为空
            resultMap.put("result", "error");
        } else {
            String password = ((User) o).getPassword(); // Session中用户的密码
            if (oldpassword.equals(password)) { // 如果用户输入的密码和Session中的密码一样这
                resultMap.put("result", "true");
            } else {
                resultMap.put("result", "false");
            }
        }
        try {
            resp.setContentType("application/json"); // 设置返回的是json值
            PrintWriter writer = resp.getWriter();
            // JSONArray阿里巴巴的JSON工具类, 转换格式
            /*
            resultMap = ["result","sessionerror","result", "error"]
            Json格式 = {key : value}
            */
            writer.write(JSONArray.toJSONString(resultMap));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 重点 难点
    public void query(HttpServletRequest req, HttpServletResponse resp) {
        PageSupport pageSupport = new PageSupport();
        UsersServiceImpl usersService = new UsersServiceImpl();

        // 从前端加载数据
        String queryname = req.getParameter("queryname");
        String role = req.getParameter("queryUserRole");
        String pageIndex = req.getParameter("pageIndex");
        // 默认的用户角色
        int queryUserRole = 0;

        if (queryname == null) {
            queryname = "";
        }
        if (role != null && !role.equals("")) {
            queryUserRole = Integer.parseInt(role); // 0,1,2,3
        }
        if (pageIndex != null) {
            pageSupport.setCurrentPageNo(Integer.parseInt(pageIndex));
        }

        // 第一次访问这个请求一定是第一页, 页面大小固定
        // 一页的大小  默认5
        int pageSize = pageSupport.getPageSize();
        // 当前页
        int currentPageNo = pageSupport.getCurrentPageNo();

        // 获取用户的总数
        int totalCount = usersService.getUserCount(queryname, queryUserRole);
        // 总页数支持
        // 当前页
        pageSupport.setCurrentPageNo(currentPageNo);
        pageSupport.setPageSize(pageSize);
        pageSupport.setTotalCount(totalCount);
        // 总页数
        int totalPageCount = pageSupport.getTotalPageCount();

        // 获取用户列表展示
        List<User> userList = usersService.getUserList(queryname, queryUserRole, currentPageNo, pageSize);
        req.setAttribute("userList", userList);
        // 用户角色列表
        RoleServiceImpl roleService = new RoleServiceImpl();
        List<Role> roleList = roleService.getRoleList();
        req.setAttribute("roleList", roleList);
        // 用户总数
        req.setAttribute("totalCount", pageSupport.getTotalCount());
        // 用户搜索的用户名
        req.setAttribute("queryname", queryname);
        // 用户搜索的用户角色
        req.setAttribute("queryUserRole", role);
        // 当前页数
        req.setAttribute("currentPageNo", currentPageNo);
        // 总页数
        req.setAttribute("totalPageCount", totalPageCount);

        // 返回前端
        try {
            req.getRequestDispatcher("userlist.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    // 删除用户
    public void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        // 获取前端传过来的id
        String[] userId = req.getParameterValues("userId");
        UsersServiceImpl usersService = new UsersServiceImpl();
        for (String s : userId) {
            int i = usersService.deleteUserList(Integer.parseInt(s));
            if (i < 0) {
                break;
            }
        }
        try {
            resp.sendRedirect("user?method=query");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 添加用户时验证输入的账户和数据库内是否有重复
    public void codeAdd(HttpServletRequest req, HttpServletResponse resp) {
        // 获取前端传入的账号 addUserCode
        String addUserCode = req.getParameter("addUserCode");
        if (addUserCode != null) {
            UsersServiceImpl usersService = new UsersServiceImpl();
            User user = usersService.login(addUserCode);
            Map<String, String> resultMap = new HashMap<String, String>();
            if (user == null) {
                resultMap.put("result", "yes");
            } else {
                resultMap.put("result", "no");
            }

            try {
                resp.setContentType("application/json"); // 设置返回的是json值
                PrintWriter writer = resp.getWriter();
                writer.write(JSONArray.toJSONString(resultMap));
                writer.flush();
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // 添加用户
    public void addUser(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("进入添加用户");
        // 获取前端表单数据
        String addUserName = req.getParameter("addUserName");
        if (addUserName != null) {
            String addUserCode = req.getParameter("addUserCode");
            String addPassword = req.getParameter("addPassword");
            String addRole = req.getParameter("addRole");
            String AvatarUrl = req.getParameter("AvatarUrl");
            UsersServiceImpl usersService = new UsersServiceImpl();
            boolean result = usersService.addUser(addUserName, addUserCode, addPassword, addRole, AvatarUrl);
            if (result) {
                try {
                    req.getSession().setAttribute("addResult", "true");
                    resp.sendRedirect("/admin/user?method=query");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 通过id获取需要修改的用户
    public void getModifyUser(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        if (id != null) {
            UsersServiceImpl usersService = new UsersServiceImpl();
            User modifyUser = usersService.getModifyUser(Integer.parseInt(id));
            Map<String, String> resultMap = new HashMap<String, String>();
            if (modifyUser != null) {
                resultMap.put("username", modifyUser.getUsername());
                resultMap.put("usercode", modifyUser.getUsercode());
                resultMap.put("password", modifyUser.getPassword());
                resultMap.put("role", String.valueOf(modifyUser.getRole()));
                try {
                    resp.setContentType("application/json"); // 设置返回的是json值
                    PrintWriter writer = resp.getWriter();
                    writer.write(JSONArray.toJSONString(resultMap));
                    writer.flush();
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println("没有传入id");
        }
    }

    // 修改用户信息
    public void modifyUser(HttpServletRequest req, HttpServletResponse resp) {
        String modifyUserCode = req.getParameter("modifyUserCode");
        String modifyUserName = req.getParameter("modifyUserName");
        String modifyRole = req.getParameter("modifyRole");
        if (modifyUserCode != null) {
            UsersServiceImpl usersService = new UsersServiceImpl();
            boolean b = usersService.updateUser(modifyUserCode, modifyUserName, Integer.parseInt(modifyRole));
            System.out.println(b);
            if (b) {
                try {
                    req.getSession().setAttribute("modifyResult", "true");
                    resp.sendRedirect("/admin/user?method=query");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("修改成功");
        }
        System.out.println("修改失败");
    }

}
