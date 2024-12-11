package firstweb.service;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
	private static final String STATIC_USERNAME = "admin";
	private static final String STATIC_PASSWORD = "password";

	public boolean auth(String name, String password) {

		return STATIC_USERNAME.equals(name) && STATIC_PASSWORD.equals(password);

	}

}
