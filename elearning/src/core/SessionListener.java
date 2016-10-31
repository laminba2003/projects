package core;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

	private static long counter = 0; 
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		counter = counter + 1;
		event.getSession().getServletContext().setAttribute("counter", counter);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		counter = counter - 1;
	}

}
