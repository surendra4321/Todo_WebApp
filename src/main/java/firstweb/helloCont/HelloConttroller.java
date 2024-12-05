package firstweb.helloCont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
 
 
 

@Controller
public class HelloConttroller {
	
	
	
	@RequestMapping("hello")
	//@ResponseBody //It will return as it is the method is returning on web page()
	//Response Body we can use only when we wnat the return a string on the web page
	
	public String Hello() {
		return "This is My first web application";
	}
	@RequestMapping("say-hello")
	public String sayHello() {
		return "sayHello";
	}
	
	
	
	
	

}
