package cn.bsat1314.blog.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String servletPath = req.getServletPath();
        if ( servletPath.endsWith(".css") || servletPath.endsWith(".js") || servletPath.endsWith(".jpg") || servletPath.endsWith(".png"))
        {
            filterChain.doFilter(servletRequest, servletResponse);
        }else {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");
            filterChain.doFilter(servletRequest, servletResponse);

        }

    }

    @Override
    public void destroy() {

    }
}
