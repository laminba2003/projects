package core;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ContactAction extends ActionSupport {

	private Mail contact;
	
	
	public String execute() {
		
		try {
		MailSender sender = new MailSender();
		sender.sendTextMessage(contact.getSubject(), contact.getMessage(),
				contact.getName()+"<"+contact.getEmail()+">",true);
		} catch(Exception e){
			contact = null;
		}
		return SUCCESS;
		
	}


	public Mail getContact() {
		return contact;
	}


	public void setContact(Mail contact) {
		this.contact = contact;
	}

	
}
