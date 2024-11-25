package firstweb.helloCont;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 

 
import firstweb.service.AuthenticationService;

@Controller
public class HelloConttroller {
	
	private AuthenticationService authenticationService;

	public HelloConttroller(AuthenticationService authenticationService) {
		super();
		this.authenticationService = authenticationService;
	}
	
	@RequestMapping("hello")
	//@ResponseBody //It will return as it is the method is returning on web page
	public String Hello() {
		return "This is My first web application";
	}
	@RequestMapping("say-hello")
	public String sayHello() {
		return "sayHello";
	}
	@RequestMapping(value="login",method = RequestMethod.GET)
	public String gotoLoginPage() {
		return "login";
	}
	@RequestMapping(value="login",method = RequestMethod.POST)
	//login?name= Ranga RequestParamdd
	public String gotoWelcomePage(@RequestParam String name, 
			@RequestParam String password, ModelMap model) {
		
		if(authenticationService.auth(name, password)) {
		
			model.put("name", name);
			//Authentication 
			//name - in28minutes
			//password - dummy
			
			return "welcome";
		}
		model.put("errorMessage","Invalid Credentials!, Please try again!");
		return "login";
	}
	
	
	
	

}
