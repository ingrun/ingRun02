package Interceptor;

import Po.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object o) throws Exception {



        String url = request.getRequestURI();
        // System.out.println(url);
        // URL:除了登录请求外，其他的URL都进行拦截控制
        if (url.indexOf("/login") >= 0 || url.indexOf("/index") >= 0) {
            return true;
        }
        if(url.contains(".css") || url.contains(".js")){
            return true;
        }
        // 获取Session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if (user != null) {
            return true;
        }
        // 不符合条件的给出提示信息，并转发到登录页面
        //request.setAttribute("msg", "您还没有登录，请先登录！");
        request.getRequestDispatcher("/WEB-INF/login.jsp")
                .forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //System.out.println("postHandle");

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //System.out.println("afterCompletion");
    }
}
