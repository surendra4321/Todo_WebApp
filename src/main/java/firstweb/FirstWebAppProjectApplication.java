package firstweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FirstWebAppProjectApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(FirstWebAppProjectApplication.class, args);
		System.out.println("THIS IS MY FIRST WEB APPLICATION");
	}

}
