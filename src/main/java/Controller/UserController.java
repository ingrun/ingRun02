package Controller;

import Po.User;
import Service.UserService;
import net.sf.json.JSONArray;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private DefaultWebSecurityManager securityManager;

    //主页
    @RequestMapping(value = "home")
    public String main(){
        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();
        Session session = subject.getSession();
        session.setAttribute("username",username);

        return "main";

    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String name, String password, HttpServletResponse response,
                        HttpServletRequest httpServletRequest){
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
    public String logout(HttpServletRequest httpServletRequest,
                         HttpServletResponse response){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:home";
    }

    //更新自己密码，需要验证旧密码
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

    //重新设置用户密码，该控制器不验证旧密码
    @RequestMapping(value = "user/reSetPassword", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String reSetPassword(String name,String newPassword){
        Subject subject = SecurityUtils.getSubject();
        if (subject.hasRole("admin")){
            User user = userService.findUserByName(name);
            if (user != null){
                user.setPassword(newPassword);
                userService.updUser(user);
                return "ok";
            }
        }
        return "error";
    }

    //添加用户
    @RequestMapping(value = "user/addUser", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String addUser(String name,String newPassword,String newPassword_re){
        if (!newPassword_re.equals(newPassword)|| newPassword.equals(name))
            return "密码不符合规则";
        if (name!=null&&!name.equals("")) {
            if (newPassword.length()>=6){
                User user = new User();
                user.setName(name);
                user.setPassword(newPassword);
                userService.addUser(user);
                return "ok";
            }
        }
        return "未知错误";
    }

    //查找所用户 ，该功能用来重置用户密码
    @RequestMapping(value = "user/findAllUser", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAllUser(){
        List<User> users = userService.findAllUser();
        //移除管理员，管理员不可以直接重置密码
        for (User user:users) {
            if(user.getName().equals("admin")){
                users.remove(user);
                break;
            }
        }
        return JSONArray.fromObject(users).toString();
    }

    //删除用户
    @RequestMapping(value = "user/delUser", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delUser(String username){
        User user = userService.findUserByName(username);
        if (user==null){
            return "该用户不存在";
        }
        if (userService.delUser(user)<=0)
            return "删除失败";
        return "ok";
    }


}
