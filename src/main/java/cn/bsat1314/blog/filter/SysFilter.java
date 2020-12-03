package cn.bsat1314.blog.filter;

import cn.bsat1314.blog.pojo.User;
import cn.bsat1314.blog.util.Constants;
import sun.rmi.runtime.Log;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SysFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String servletPath = req.getServletPath();
        // 过滤器, 从Session中获取用户
        User user = (User) req.getSession().getAttribute(Constants.USER_SESSION);
        if (servletPath.equals("/admin/login.jsp") || servletPath.endsWith(".css") || servletPath.endsWith(".js") || servletPath.endsWith(".jpg") || servletPath.endsWith(".png")) {
            filterChain.doFilter(servletRequest, servletResponse);
        }else {
            // 没有登录或者被移除
            if (user == null) {
                resp.sendRedirect("/admin/login.jsp");
            } else {
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
