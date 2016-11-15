package chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chat/{room}/{user}", encoders = ChatMessageEncoder.class, decoders = ChatMessageDecoder.class)
public class ChatEndpoint {
	
	private final Logger log = Logger.getLogger(getClass().getName());
 
	@OnOpen
	public void open(final Session session, @PathParam("room") final String room,@PathParam("user") final String user) {
		session.getUserProperties().put("room", room);
		session.getUserProperties().put("user", user);
	}
 
	@OnMessage
	public void onMessage(final Session session, final ChatMessage chatMessage) {
		String room = (String) session.getUserProperties().get("room");
		String text = chatMessage.getMessage();
		boolean found;
		if(text.equals("users")) {
			List<Object> users = new ArrayList<Object>();
			try {
				for (Session s : session.getOpenSessions()) {
					if (s.isOpen()
							&& room.equals(s.getUserProperties().get("room"))) {
						Object value = s.getUserProperties().get("user");
						found = false;
						for(Object user : users) {
							if(user.toString().equalsIgnoreCase(value.toString())) {
								found = true;
								break;
							}
						}
						if(!found)users.add(value);
					}
				}
				session.getBasicRemote().sendObject(users);
			} catch (IOException e) {
				log.log(Level.WARNING, "onMessage failed", e);
			}
			
			catch (EncodeException es) {
				
			}
		} else {
			try {
				for (Session s : session.getOpenSessions()) {
					if (s.isOpen()
							&& room.equals(s.getUserProperties().get("room"))) {
						s.getBasicRemote().sendObject(chatMessage);
					}
				}
			} catch (IOException e) {
				log.log(Level.WARNING, "onMessage failed", e);
			}
			
			catch (EncodeException es) {
				
			}
		}
	}
}