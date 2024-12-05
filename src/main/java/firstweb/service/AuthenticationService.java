package firstweb.service;

import org.springframework.stereotype.Service;

@Service 
public class AuthenticationService {
	public boolean auth(String username, String password) {
		boolean isValidUname = username.equalsIgnoreCase("surendra");
		boolean isValidPassword = password.equalsIgnoreCase("surendra123");
		return isValidUname&&isValidPassword;
		
	}

}
