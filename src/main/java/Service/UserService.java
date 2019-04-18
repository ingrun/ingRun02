package Service;
import Po.User;

import java.util.List;

public interface UserService {
    public boolean isNamePassword(User user);
    public User findUserByName(String name);
    public int updUser(User user);
    public int addUser(User user);
    public int delUser(User user);
    public List<User> findAllUser();

}
