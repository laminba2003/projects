package forum;

import java.util.Date;
import java.util.List;
import core.BaseAction;
import core.MailSender;
import user.User;
import user.UserDao;

@SuppressWarnings("serial")
public class ForumAction extends BaseAction {

	private Message message = new Message();
	private Answer answer = new Answer();
	private ForumDao dao = new ForumDao();
	private String forum;
	private Long id;
	
	public String createMessage() {
		message.setCreationDate(new Date());
		dao.saveMessage(message);
		return SUCCESS;
	}
	
	public String createAnswer() {
		answer.setCreationDate(new Date());
		dao.saveAnswer(answer);
		String user = (String) getSession().get("user");
		try {
			MailSender sender = new MailSender();
			Message message = dao.getMessage(answer.getMessageId());
			UserDao userDao = new UserDao();
			User author = userDao.getUser(message.getAuthor());
			sender.sendTextMessage("réponse de "+user +" : "+message.getTitle(), getTemplate(answer), author.getEmail(), false);
		}catch(Exception es) {
		}
		return SUCCESS;
	}
	
	public String getTemplate(Answer answer) {
		String content = answer.getContent()+"<br/><br/>";
		String url = "http://localhost:8080/elearning/forums/message?id="+answer.getMessageId();
		content += "répondre : "+"<a href='"+url+"' target='_blank'>"+url+"</a>";
		return content;
	}
	
	public String viewMessage() {
		message = dao.getMessage(id);
		if(message == null) {
			return ERROR;
		} else {
			message.setViewCount(message.getViewCount()+1);
			return SUCCESS;
		}
	}
	
	public String viewMessages() {
		getSession().put("forum",forum);
		return SUCCESS;	
	}
	
	public List<Message> getMessages(String forum) {
		return dao.getMessages(forum);
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	public Answer getAnswer() {
		return answer;
	}

	public void setAnswer(Answer answer) {
		this.answer = answer;
	}

	public void setForum(String forum) {
		this.forum = forum;
	}

	public String getForum() {
		return  forum;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
