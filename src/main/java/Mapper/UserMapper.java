package Mapper;
import Po.User;
public interface UserMapper {
    public User findUserById(Integer id);
    public User findUserByName(String name);
    public int addUser(User user);
    public int delUserById(int id);
    public int updateUser(User user);
}
