package forum;

import java.util.ArrayList;
import java.util.List;

public class ForumDao {

	private static List<Message> messages = new ArrayList<Message>();
	
	public void saveMessage(Message message) {
		
		message.setId(new Long(messages.size()+1));
		messages.add(message);
	}
	
	public void saveAnswer(Answer answer) {
		
		for(Message message : messages) {
			if(message.getId().equals(answer.getMessageId())) {
				message.getAnswers().add(answer);
				message.setAnswerCount(message.getAnswerCount()+1);
			}
		}
	}
	
	public List<Message> getMessages(String forum) {
		
		List<Message> list = new ArrayList<Message>();
		for(Message message : messages) {
			if(message.getForum().equals(forum)) {
				list.add(message);
			}
		}
		return list;
	}
	
	public Message getMessage(Long id) {
		for(Message message : messages) {
			if(message.getId().equals(id)) {
				return message;
			}
		}
		return null;
	}
}
