package ServiceImpl;

import Mapper.UserMapper;
import Po.User;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public boolean isNamePassword(User user) {
        User user01 = userMapper.findUserByName(user.getName());
        if(user01 == null)
            return false;
        if(user01.getPassword().equals(user.getPassword()))
            return true;
        return false;
    }

    @Override
    public User findUserByName(String name) {
        return userMapper.findUserByName(name);
    }

    @Override
    public int updUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int delUser(User user) {
        return userMapper.delUserById(user.getId());
    }

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

}
