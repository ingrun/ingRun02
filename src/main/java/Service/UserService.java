package Service;
import Po.User;
public interface UserService {
    public boolean isNamePassword(User user);
    public User findUserByName(String name);
    public int updUser(User user);
}
