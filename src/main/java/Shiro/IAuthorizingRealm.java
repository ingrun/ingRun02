package Shiro;

import Po.User;
import Service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

//自定义AuthorizingRealm  实现service提供认证数据。
@Component
public class IAuthorizingRealm extends AuthorizingRealm {

    @Autowired
    UserService userService;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principalCollection) {
        String username = (String)principalCollection.getPrimaryPrincipal();
        Set<String> roles = new HashSet<>();
        roles.add("user");
        if (username.equals("admin")){
            roles.add("admin");
        }
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo(roles);
        return simpleAuthorizationInfo;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        String userName = (String) authenticationToken.getPrincipal();
        User user =  userService.findUserByName(userName);
        if (user != null){
            return new SimpleAuthenticationInfo(user.getName(),user.getPassword(),getName());
        }
        return null;
    }
}
