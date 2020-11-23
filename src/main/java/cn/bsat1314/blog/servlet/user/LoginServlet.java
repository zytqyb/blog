package cn.bsat1314.blog.servlet.user;

import cn.bsat1314.blog.pojo.User;
import cn.bsat1314.blog.service.user.UsersServiceImpl;
import cn.bsat1314.blog.util.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// 处理登录请求
public class LoginServlet extends HttpServlet {

    // Servlet: 控制层,调用业务层代码

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取用户名和密码
        String usercode = req.getParameter("usercode");
        String password = req.getParameter("password");

        // 和数据库中的密码进行对比, 调用业务层;
        UsersServiceImpl usersService = new UsersServiceImpl();
        User user = usersService.login(usercode);

        if (user != null) {
            HttpSession session = req.getSession();
            // 查有此人可以登录
            if (user.getUsercode().equals(usercode) && user.getPassword().equals(password)) {
                // 将用户的信息换号Session中;
                session.setAttribute(Constants.USER_SESSION, user);
                    // 登录成功后跳转重定向到后台页面
                    req.getSession().setAttribute("success", 0);
                // 把登录的昵称响应添加给session
                req.getSession().setAttribute("username", user.getUsername());
                resp.sendRedirect("/admin/admin.jsp");
            } else { // 查无此人, 无法登录
                req.setAttribute("error", "用户名或者密码不正确");
                req.getRequestDispatcher("/").forward(req, resp);
            }
        } else { // 查无此人, 无法登录
            // 请求转发回登录页面,并且提示用户名或者密码错误
            System.out.println("查无此人");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
