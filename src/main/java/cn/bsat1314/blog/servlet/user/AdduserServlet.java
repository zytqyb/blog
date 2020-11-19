//package cn.bsat1314.blog.servlet.user;
//
//import cn.bsat1314.blog.service.user.UsersServiceImpl;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Timestamp;
//
//
//public class AdduserServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // 获取注册用户的数据
//        String username = req.getParameter("username");
//        String usercode = req.getParameter("usercode");
//        String password = req.getParameter("password");
//        Timestamp creationDate = new Timestamp(System.currentTimeMillis());
//
//
//        UsersServiceImpl usersService = new UsersServiceImpl();
//        boolean result = usersService.adduser(username, usercode, password, creationDate, creationDate);
//
//
//        if (result){
//            // 登录成功后跳转重定向到后台页面
//            resp.sendRedirect("/index.jsp");
//        }else {
//            req.setAttribute("error", "注册失败,请稍后重试");
//            req.getRequestDispatcher("/home/register.jsp").forward(req, resp);
//        }
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//}
