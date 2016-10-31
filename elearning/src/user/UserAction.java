package user;
import core.BaseAction;
import core.MailSender;

@SuppressWarnings("serial")
public class UserAction extends BaseAction {

	private User user = new User();
	private UserDao dao = new UserDao();

	public String execute() {
		user = dao.getUser((String) getSession().get("user"));
		return SUCCESS;
	}
	
	public String signIn() {
		user = dao.getUser(user.getLogin(),user.getPassword());
		if(user!=null) getSession().put("user",user.getLogin());
		return SUCCESS;
	}
	
	public String signOut() {
		getSession().clear();
		return SUCCESS;
	}
	
	public String register() {
		if(dao.getUser(user.getLogin())!=null) {
			user.setExist(true);
		} else {
		
			try {
				MailSender sender = new MailSender();
				sender.sendTextMessage("Bienvenue sur Developpez.sn",getRegisterTemplate(user),user.getEmail(),false);
				dao.saveUser(user);
			}catch(Exception es) {
				user = null;
			}
		}
		return SUCCESS;
	}
	
	public String recover() {
		user = dao.getUser(user.getLogin());
		if(user!=null) {
			try {
				MailSender sender = new MailSender();
				sender.sendTextMessage("Mot de passe oublié",getRecoverTemplate(user),user.getEmail(),false);
			}catch(Exception es) {
			}
		}
		return SUCCESS;
	}

	public String getRegisterTemplate(User user) {
		return "Bienvenue, "+user.getFirstName() + " "+user.getLastName()+"<br/><br/> "+
		"merci de vous être enregistré sur la plate-forme <b>Developpez.sn</b>. Voici vos informations de connexion.<br/><br/>"+
		"<b>Identifiant</b> : "+user.getLogin()+ "<br/>"+
		"<b>Mot de Passe</b> : " +user.getPassword()+"<br/><br/>"+
		 "Nous restons à votre disposition si vous avez des problemes, questions et suggestions.<br/><br/>"+
		 "Cordialement,<br/>"+
		 "L'equipe Developpez.sn";
	}
	
	public String getRecoverTemplate(User user) {
		return "Bonjour, "+user.getFirstName() + " "+user.getLastName()+"<br/><br/> "+
		"Voici vos informations de connexion.<br/><br/>"+
		"<b>Identifiant</b> : "+user.getLogin()+ "<br/>"+
		"<b>Mot de Passe</b> : " +user.getPassword()+"<br/><br/>"+
		 "Nous restons à votre disposition si vous avez des problemes, questions et suggestions.<br/><br/>"+
		 "Cordialement,<br/>"+
		 "L'equipe Developpez.sn";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
