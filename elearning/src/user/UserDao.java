package user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {

	private static List<User> users;
	
	public UserDao() {
		if(users == null) {
			users = new ArrayList<User>();
			User user = new User();
			user.setLogin("admin");
			user.setPassword("passer");
			users.add(user);
		}
	}
	
	public User getUser(String login,String password) {
		for(User user : users) {
			if(login.equals(user.getLogin()) && password.equals(user.getPassword())) {
				return user;
			}
		}
		return null;
	}
	
	public User getUser(String login) {
		for(User user : users) {
			if(login.equals(user.getLogin())) {
				return user;
			}
		}
		return null;
	}
	
	public void saveUser(User user) {
		user.setCreationDate(new Date());
		users.add(user);
	}
	
}
