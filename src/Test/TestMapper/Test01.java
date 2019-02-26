package TestMapper;

import Mapper.UserMapper;
import Po.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class Test01 {
    @Autowired
    private UserMapper userMapper;

//    @Test
//    public void testfindUserById(){
//        User user = userMapper.findUserById(1);
//        System.out.println(user.toString());
//    }
//    @Test
//    public void testfindUserByName(){
//        User user = userMapper.findUserByName("ad");
//        System.out.println(user.toString());
//    }
//
//    @Test
//    public void testaddUser(){
//        User user = new User();
//        user.setName("ingRun");
//        user.setPassword("123456");
//        int i = userMapper.addUser(user);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testUpdateUser(){
//        User user = new User();
//        user.setId(2);
//        user.setName("admin");
//        user.setPassword("123456");
//        int i = userMapper.updateUser(user);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testDelUser(){
//        int i = userMapper.delUserById(3);
//        System.out.println(i);
//    }

}
