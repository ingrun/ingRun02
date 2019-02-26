package Controller;

import Po.User;
import Service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(String name, String password, HttpServletResponse response, HttpServletRequest httpServletRequest){
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        if(userService.isNamePassword(user)){
            Cookie cookie = new Cookie("WarehouseUser","admin");
            cookie.setMaxAge(60*60*24*7);   //有效7天
            response.addCookie(cookie);
            httpServletRequest.getSession().setAttribute("user",user);
            return "main";
        }
        return "login";
    }

    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest httpServletRequest,HttpServletResponse response){
        httpServletRequest.getSession().removeAttribute("user");
        Cookie[] cookies = httpServletRequest.getCookies();
        for (Cookie cookie : cookies ){
            if(cookie.getName().equals("WarehouseUser")){
                cookie.setMaxAge(0);   //设置Cookie有效时间为0  相当于清除Cookie
                response.addCookie(cookie);
            }
        }
        return "login";
    }

    @RequestMapping(value = "index")
    public String Cookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("WarehouseUser")){
                    String name = cookie.getValue();
                    User user= userService.findUserByName(name);
                    request.getSession().setAttribute("user",user);
                    return "main";
                }
            }
        }
        return "login";
    }

    @RequestMapping(value = "user/updPassword", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updPassword(String name,String oldPassword,String newPassword){
        if (oldPassword != newPassword && newPassword != name)
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
