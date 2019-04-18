package Mapper;
import Po.User;

import java.util.List;

public interface UserMapper {
    public User findUserById(Integer id);
    public List<User> findAllUser();
    public User findUserByName(String name);
    public int addUser(User user);
    public int delUserById(int id);
    public int updateUser(User user);
}
