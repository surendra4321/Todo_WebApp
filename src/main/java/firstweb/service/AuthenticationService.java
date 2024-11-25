package firstweb.service;

import org.springframework.stereotype.Service;

@Service 
public class AuthenticationService {
	public boolean auth(String uname, String upassword) {
		boolean isValidUname = uname.equalsIgnoreCase("surendra");
		boolean isValidPassword = upassword.equalsIgnoreCase("password@4321");
		
		return isValidUname && isValidPassword;
		
	}

}
