package Shiro;

import Po.User;
import Service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//自定义AuthorizingRealm  实现service提供认证数据。
@Component
public class IAuthorizingRealm extends AuthorizingRealm {

    @Autowired
    UserService userService;

    //获取权限信息
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String userName = (String) authenticationToken.getPrincipal();
        User user =  userService.findUserByName(userName);
        if (user != null){
            //            return new SimpleAuthenticationInfo(user,user.getPassword(),getName());   //第一个参数穿user对象会导致rememberme功能失效  一个奇怪的BUG
            return new SimpleAuthenticationInfo(user.getName(),user.getPassword(),getName());
        }
        return null;
    }
}
