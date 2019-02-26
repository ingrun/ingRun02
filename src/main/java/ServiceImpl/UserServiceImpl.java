package ServiceImpl;

import Mapper.UserMapper;
import Po.User;
import Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
