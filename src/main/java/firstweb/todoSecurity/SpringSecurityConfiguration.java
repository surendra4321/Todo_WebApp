package firstweb.todoSecurity;

import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
public class SpringSecurityConfiguration {

//	@Bean
//	public InMemoryUserDetailsManager createUserDetailsManager() {
//		UserDetails userDetails1 = createNewUser("admin","password");
//		UserDetails userDetails2 = createNewUser("adminadmin", "pass");
//		
//		return new InMemoryUserDetailsManager(userDetails1,userDetails2);
//
//	}
//
//	private UserDetails createNewUser(String username, String password) {
//		Function<String, String> passwordEncoder = input -> passwordEncoder().encode(input);
//		UserDetails userDetails = User.builder().passwordEncoder(passwordEncoder).username("admin").password("password")
//				.roles("User", "Admin").build();
//		return userDetails;
//	}
//
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//
//		return new BCryptPasswordEncoder();
//	}

}
