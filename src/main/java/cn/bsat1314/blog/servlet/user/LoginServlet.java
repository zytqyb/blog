package cn.bsat1314.blog.servlet.user;

import cn.bsat1314.blog.pojo.User;
import cn.bsat1314.blog.service.user.UsersServiceImpl;
import cn.bsat1314.blog.util.Constants;
import com.alibaba.fastjson.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * @author bsat
 */
public class LoginServlet extends HttpServlet {
    // 处理登录请求
    // Servlet: 控制层,调用业务层代码

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if (method == null) {
            this.login(req, resp);
        }else if(method != null && method.equals("ajaxLogin")) {
            this.ajaxLogin(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


    public void login(HttpServletRequest req, HttpServletResponse resp) {
        // 获取用户名和密码
        String usercode = req.getParameter("usercode");
        String password = req.getParameter("password");

        // 和数据库中的密码进行对比, 调用业务层;
        UsersServiceImpl usersService = new UsersServiceImpl();
        User user = usersService.login(usercode);

        if (user != null) {
            HttpSession session = req.getSession();
            // 格式化时间
            SimpleDateFormat sdf = new SimpleDateFormat();
            // a为am/pm的标记
            sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
            // 获取当前时间
            Date time = new Date();
            // 查有此人可以登录
            if (user.getUsercode().equals(usercode) && user.getPassword().equals(password)) {
                // 将用户的信息换号Session中;
                session.setAttribute(Constants.USER_SESSION, user);
                session.setAttribute("time", sdf.format(time));
                // 登录成功后跳转重定向到后台页面
                req.getSession().setAttribute("success", 0);
                // 把登录的昵称响应添加给session
                req.getSession().setAttribute("username", user.getUsername());
                try {
                    resp.sendRedirect("/admin/admin.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else { // 查无此人, 无法登录
                req.setAttribute("error", "用户名或者密码不正确!");
                try {
                    try {
                        req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else { // 查无此人, 无法登录
            // 请求转发回登录页面,并且提示用户名或者密码错误
            req.setAttribute("error", "该账号未注册,请注册后再登录!");
            try {
                req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    // ajax方法登录
    public void ajaxLogin(HttpServletRequest req, HttpServletResponse resp){
        // 获取用户名和密码
        String usercode = req.getParameter("usercode");
        String password = req.getParameter("password");

        // 和数据库中的密码进行对比, 调用业务层;
        UsersServiceImpl usersService = new UsersServiceImpl();
        User user = usersService.login(usercode);
        // 万能的Map : 结果集
        Map<String, String> resultMap = new HashMap<String, String>();
        if (user != null) {
            HttpSession session = req.getSession();
            // 格式化时间
            SimpleDateFormat sdf = new SimpleDateFormat();
            // a为am/pm的标记
            sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
            // 获取当前时间
            Date time = new Date();
            // 查有此人可以登录
            if (user.getUsercode().equals(usercode) && user.getPassword().equals(password)) {
                // 将用户的信息换号Session中;
                session.setAttribute(Constants.USER_SESSION, user);
                session.setAttribute("time", sdf.format(time));
                // 登录成功后跳转重定向到后台页面
                req.getSession().setAttribute("success", 0);
                // 把登录的昵称响应添加给session
                req.getSession().setAttribute("username", user.getUsername());
                resultMap.put("result", "success");
                resultMap.put("username", user.getUsername());
            } else { // 密码错误, 无法登录
                resultMap.put("result", "error");
            }
        } else { // 查无此人, 无法登录
            // 请求转发回登录页面,并且提示用户名或者密码错误
            resultMap.put("result", "errors");
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
