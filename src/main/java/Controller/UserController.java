package Controller;

import Po.User;
import Service.UserService;
import Shiro.IAuthorizingRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;


@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private DefaultWebSecurityManager securityManager;

    @RequestMapping(value = "home")
    public String main( ){

        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        Session session = subject.getSession();
        session.setAttribute("username",username);
        return "main";

    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String name, String password, HttpServletResponse response, HttpServletRequest httpServletRequest){
        User user = new User();
        user.setName(name);
        user.setPassword(password);

        SecurityUtils.setSecurityManager(securityManager);
        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token = new UsernamePasswordToken(name,password);
        token.setRememberMe(true);  //设置使用本地cookie

        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            return "403";
        }

        return "redirect:home";

    }

    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest httpServletRequest,HttpServletResponse response){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:home";
    }


    @RequestMapping(value = "user/updPassword", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updPassword(String name,String oldPassword,String newPassword){
        if (oldPassword.equals(newPassword)|| newPassword.equals(name))
            return "error";
        User user = userService.findUserByName(name);
        if (user!=null) {
           if (user.getPassword().equals(oldPassword)){
                user.setPassword(newPassword);
                if(userService.updUser(user)>0)
                    return "ok";
           }
        }
        return "error";
    }




}
